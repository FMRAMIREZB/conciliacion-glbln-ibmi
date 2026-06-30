==============================================================================
 README.txt - Conciliacion GLBLN (IBM i / PUB400)
 Objetivo: Documentar fuentes, objetos y comandos de despliegue en PUB400.
 Miembro sugerido: README (tipo TXT) en QTALLERCP1.
 Reemplazar FMRAMIREZ1 = libreria SQL/objetos | FMRAMIREZ = perfil/home IFS.
 Proyecto: Conciliacion GLBLN - Taller IBM i | Db2 for i V7R4+
==============================================================================

1. DESCRIPCION
--------------
Proceso batch ILE que concilia cuentas mayores (GLBLN) contra movimientos
(TRANS, TTRAN, TRDSC), aplica reglas de negocio con tolerancia parametrizable
y genera JSON UTF-8 en IFS mas bitacora .log por ejecucion.

Arquitectura:
  GLCONRUN (CL) --> GLRPT001 (*PGM orquestador)
                        |
      +-----------------+------------------+----------------+
      v                 v                  v                v
  GLDAT001          GLNEG001           GLOUT001         GLUTIL001
  (SRVPGM)          (SRVPGM)           (*MODULE)        (SRVPGM)
  acceso BD         reglas negocio     JSON + IFS       utilidades

2. CONVENCIONES PUB400
----------------------
  Libreria objetos Db2/RPG/CL : FMRAMIREZ1  (ejemplo asignado por PUB400)
  Perfil IBM i (home IFS)       : FMRAMIREZ   (sin el "1" final)
  Archivo fuente                : FMRAMIREZ1/QTALLERCP1
  Salida IFS                    : /home/FMRAMIREZ/salida/
  Solo tablas SQL (no PF/LF). Fuentes en lineas <= 80 columnas.

3. MIEMBROS FUENTE EN QTALLERCP1
--------------------------------
 SQL (scripts Db2):
   ESTRUCBD80  SQL   DDL tablas (Estructura_BD_2_80.sql)
   GLCONCDMO   SQL   Datos demo 3 escenarios (GLCONC_DEMO_80.sql)

 Copybooks (no compilan solos; /COPY en modulos):
   GLCONH      RPGLE  Plantillas T_* y constantes C_*
   GLCONPR     RPGLE  Prototipos ExtProc DAT/NEG/OUT
   GLCONPRU    RPGLE  Prototipos servicio GLUTIL001

 Modulos y programas RPG:
   GLUTIL001   SQLRPGLE  Utilidades IFS, log, id ejecucion -> SRVPGM
   GLDAT001    SQLRPGLE  Acceso datos GLBLN, SESSION wrk -> SRVPGM
   GLNEG001    RPGLE     Reglas conciliacion -> SRVPGM
   GLNEGUT1    RPGLE     Pruebas unitarias GLNEG001 -> *PGM
   GLOUT001    SQLRPGLE  Salida JSON (*MODULE, enlaza en GLRPT001)
   GLRPT001    SQLRPGLE  Orquestador batch -> *PGM

 Programas CL:
   GLCONC_JRN  CLLE  Fuente de GLCONJRN (journal tablas)
   GLCONC_IFS  CLLE  Fuente de GLCONIFS (mkdir IFS salida)
   GLCONBUI    CLLE  Build ILE completo (compila modulos y SRVPGM)
   GLCONRUN    CLLE  Invocador demo GLRPT001 (tolerancia 1.00)
   GLCONUTS    CLLE  Ejecutor pruebas unitarias GLNEGUT1

 Referencia opcional (no leido por programas):
   GLCONCFG    TXT   Parametros sugeridos de ejecucion

4. OBJETOS COMPILADOS ESPERADOS
-------------------------------
 SRVPGM : GLUTIL001  GLDAT001  GLNEG001
 *MODULE: GLOUT001 (enlazado en GLRPT001)
 *PGM   : GLRPT001  GLNEGUT1  GLCONJRN  GLCONIFS  GLCONBUI  GLCONRUN  GLCONUTS

5. ESCENARIOS DEMO (GLCONCDMO + GLCONRUN)
-----------------------------------------
 Fecha proceso : 2026-05-19    Tolerancia : 1.00    Modo : PRUEBA
 Cuenta 11010101 -> PARCIAL        (dif 0.50, WARN-GL-002)
 Cuenta 11020101 -> CONCILIADA     (sin partidas pendientes)
 Cuenta 11030101 -> NO_CONCILIADA  (dif -5000.00, ERR-GL-001)

6. DESPLIEGUE INICIAL (ORDEN OBLIGATORIO)
-----------------------------------------
 Paso 0 - Subir todos los miembros fuente listados en seccion 3 a QTALLERCP1.
          Verificar SET SCHEMA en ESTRUCBD80 y GLCONCDMO si la libreria
          asignada no es FMRAMIREZ1.

 Paso 1 - Crear tablas (DDL, una vez o tras cambio de estructura):
          RUNSQLSTM SRCFILE(FMRAMIREZ1/QTALLERCP1) SRCMBR(ESTRUCBD80) +
                   COMMIT(*NONE) ERRLVL(20) NAMING(*SYS)

 Paso 2 - Compilar y ejecutar journal (evita SQL7008 en demo):
          CRTCLPGM PGM(FMRAMIREZ1/GLCONJRN) +
                   SRCFILE(FMRAMIREZ1/QTALLERCP1) SRCMBR(GLCONC_JRN)
          CALL PGM(FMRAMIREZ1/GLCONJRN) PARM('FMRAMIREZ1')

 Paso 3 - Cargar datos demo (tres escenarios):
          RUNSQLSTM SRCFILE(FMRAMIREZ1/QTALLERCP1) SRCMBR(GLCONCDMO) +
                   COMMIT(*NONE) ERRLVL(20) NAMING(*SYS)

 Paso 4 - Crear directorio IFS de salida (una vez):
          CRTCLPGM PGM(FMRAMIREZ1/GLCONIFS) +
                   SRCFILE(FMRAMIREZ1/QTALLERCP1) SRCMBR(GLCONC_IFS)
          CALL PGM(FMRAMIREZ1/GLCONIFS) PARM('FMRAMIREZ')

 Paso 5 - Compilar aplicativo ILE completo:
          CRTCLPGM PGM(FMRAMIREZ1/GLCONBUI) +
                   SRCFILE(FMRAMIREZ1/QTALLERCP1) SRCMBR(GLCONBUI)
          CALL PGM(FMRAMIREZ1/GLCONBUI) PARM('FMRAMIREZ1')
          (GLCONBUI compila GLUTIL001, GLDAT001, GLNEG001, GLNEGUT1,
           GLOUT001, GLRPT001 y GLCONUTS; revisar spool si hay error)

 Paso 6 - Compilar invocador demo (una vez):
          CRTCLPGM PGM(FMRAMIREZ1/GLCONRUN) +
                   SRCFILE(FMRAMIREZ1/QTALLERCP1) SRCMBR(GLCONRUN)

7. EJECUCION Y EVALUACION
-------------------------
 Paso 7 - Ejecutar conciliacion demo:
          CALL PGM(FMRAMIREZ1/GLCONRUN) PARM('FMRAMIREZ1' 'FMRAMIREZ')

 Paso 8 - Verificar salida integracion en IFS:
          WRKLNK '/home/FMRAMIREZ/salida/conciliacion_*'
          Debe existir conciliacion_<idEjecucion>.json y su .json.log
          Validar JSON: metadata, ejecucion, contexto, cuentas[],
          controlTotales, incidentes[]; 3 cuentas con estados del paso 5.

 Paso 9 - Pruebas unitarias de negocio (sin BD):
          CALL PGM(FMRAMIREZ1/GLCONUTS) PARM('FMRAMIREZ1' 'FMRAMIREZ')

 Paso 10 - Evaluar log unitario:
          WRKLNK '/home/FMRAMIREZ/salida/glnegut1.log'
          Criterio OK: ultima linea ESTADO OK y RESULTADO pass=25 fail=0

8. RECOMPILACION TRAS CAMBIO DE FUENTES
---------------------------------------
 Solo repetir paso 5 (CALL GLCONBUI). No requiere repetir DDL ni demo salvo
 que cambien tablas o datos de prueba.

9. VALIDACION RAPIDA EN 5250
----------------------------
 DSPFD TYPE(*TABLE) FILE(FMRAMIREZ1/*ALL)     Tablas creadas
 WRKOBJ OBJ(FMRAMIREZ1/GLRPT001) OBJTYPE(*PGM) Programa principal
 WRKOBJ OBJ(FMRAMIREZ1/GLUTIL001) OBJTYPE(*SRVPGM)
 WRKOBJ OBJ(FMRAMIREZ1/GLDAT001) OBJTYPE(*SRVPGM)
 WRKOBJ OBJ(FMRAMIREZ1/GLNEG001) OBJTYPE(*SRVPGM)

10. REFERENCIA REPOSITORIO (no requerida en PUB400)
---------------------------------------------------
 Documentacion extendida, validador JSON Python y evidencias de referencia
 estan en el repositorio Git del taller (README.md, COMPILAR_GLCONC.txt,
 Guia_Entrega_100_IBMi.md).

Fin README.txt
