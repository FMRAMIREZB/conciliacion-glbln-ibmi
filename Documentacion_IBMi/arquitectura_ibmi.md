# Arquitectura IBM i — Conciliación GLBLN

Diagrama de componentes del proceso batch de conciliación (§15.2 requerimientos del taller).

## Vista de componentes

```mermaid
flowchart TB
  subgraph invocacion["Invocación"]
    GLCONRUN["GLCONRUN (CL)"]
    GLCONBUI["GLCONBUI (CL)"]
  end

  subgraph orquestador["Orquestador"]
    GLRPT001["GLRPT001 (*PGM)"]
  end

  subgraph capas["Capas ILE"]
    GLDAT001["GLDAT001 (SRVPGM)\nDatos / SESSION"]
    GLNEG001["GLNEG001 (SRVPGM)\nReglas negocio"]
    GLOUT001["GLOUT001 (*MODULE)\nJSON + IFS"]
    GLUTIL001["GLUTIL001 (SRVPGM)\nUtilidades"]
  end

  subgraph copybooks["Copybooks"]
    GLCONH["GLCONH — plantillas DS"]
    GLCONPR["GLCONPR — prototipos"]
    GLCONPRU["GLCONPRU — util"]
  end

  subgraph bd["Db2 for i"]
    GLBLN[(GLBLN)]
    TRANS[(TRANS)]
    TTRAN[(TTRAN)]
    TRDSC[(TRDSC)]
    CCDSC[(CCDSC)]
    SESSION[(SESSION.* wrk)]
  end

  subgraph salida["Salida"]
    IFS["IFS UTF-8\nconciliacion_idEjecucion.json"]
    LOG["Bitácora .log"]
  end

  GLCONRUN --> GLRPT001
  GLCONBUI -. compila .-> GLRPT001
  GLRPT001 --> GLDAT001
  GLRPT001 --> GLNEG001
  GLRPT001 --> GLOUT001
  GLRPT001 --> GLUTIL001
  GLOUT001 --> GLUTIL001

  GLRPT001 --- GLCONH
  GLRPT001 --- GLCONPR
  GLDAT001 --- GLCONH
  GLNEG001 --- GLCONH
  GLOUT001 --- GLCONH
  GLUTIL001 --- GLCONPRU

  GLDAT001 --> GLBLN
  GLDAT001 --> TRANS
  GLDAT001 --> TTRAN
  GLDAT001 --> TRDSC
  GLDAT001 --> CCDSC
  GLDAT001 --> SESSION

  GLOUT001 --> SESSION
  GLOUT001 --> IFS
  GLUTIL001 --> LOG
```

## Flujo de ejecución

1. **GLCONRUN** invoca **GLRPT001** con parámetros demo (banco, rango cuentas, fecha, ruta IFS base, tolerancia, modo).
2. **GLRPT001** genera `idEjecucion`, resuelve librería del programa, deriva ruta IFS trazable y abre bitácora.
3. **GLDAT001** inicializa tablas SESSION, abre cursor GLBLN y por cada cuenta carga movimientos, partidas y centro de costo.
4. **GLNEG001** calcula saldos, evalúa tolerancia, estado e incidentes de negocio.
5. **GLOUT001** arma el documento JSON (6 secciones raíz) y **GLUTIL001** lo escribe en IFS (CCSID 1208).
6. Errores tempranos o de IFS generan incidentes `CRITICA` (`ERR-TEC-001` … `003`) y JSON de error o reintento según el caso.

**Pruebas unitarias (batch aparte):** **GLCONUTS** invoca **GLNEGUT1**, que valida reglas de **GLNEG001** sin acceso a BD; escribe `glnegut1.log` en IFS.

## Referencias

- [Guia_Entrega_100_IBMi.md](Guia_Entrega_100_IBMi.md)
- [Requerimientos/requerimientos_taller.md](Requerimientos/requerimientos_taller.md)
- Fuentes: `src/rpg/`
