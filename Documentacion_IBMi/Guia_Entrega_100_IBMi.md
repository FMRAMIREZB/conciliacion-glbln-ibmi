# Guía de entrega al 100% — Conciliación GLBLN (IBM i)

Documento de continuidad para cerrar el frente IBM i del taller con cumplimiento total de
requerimientos, reglas de revisión y evidencias auditables.

**Estado al 2026-06-30:** cumplimiento 100% con evidencia PUB400 post-refactor (`T_`/`Ds_`/`Wrk_`).
**Convención de código:** ver `Documentacion_IBMi/estandar_codigo_rpg.md`.
**Evidencia JSON:** `conciliacion_20260630_033459_001.json` — validación **49/49 OK**.
**Decisión de revisión actual:** *PASS*.

---

## 1. Contexto del proyecto

### 1.1 Objetivo
Proceso batch en IBM i que:
- Consulta cuentas mayores (`GLBLN`) y movimientos (`TRANS`, `TTRAN`, `TRDSC`).
- Aplica reglas de conciliación con tolerancia parametrizable.
- Genera JSON UTF-8 en IFS y bitácora `.log` por ejecución.

### 1.2 Entorno de referencia (PUB400)
| Concepto | Valor ejemplo |
|----------|---------------|
| Librería SQL / objetos | `FMRAMIREZ1` |
| Perfil IBM i (home IFS) | `FMRAMIREZ` (sin el `1`) |
| Archivo fuente | `FMRAMIREZ1/QTALLERCP1` |
| Script BD (repo) | `Estructura_BD_2.sql` (original) |
| Script BD PUB400 (80 cols) | `Estructura_BD_2_80.sql` → miembro `ESTRUCBD80` |
| Datos demo (repo) | `GLCONC_DEMO.sql` (original) |
| Datos demo PUB400 (80 cols) | `GLCONC_DEMO_80.sql` → miembro `GLCONCDMO` |
| JSON demo | `conciliacion_20260630_033459_001.json` |
| Log integración | `conciliacion_20260630_033459_001.json.log` |
| Log unit tests | `glnegut1.log` |

> **Importante:** la librería Db2 (`FMRAMIREZ1`) no coincide con el perfil IFS (`FMRAMIREZ`).

### 1.3 Comandos operativos habituales

```cl
/* Crear tablas DDL (PUB400: miembro ESTRUCBD80, fuente Estructura_BD_2_80.sql) */
RUNSQLSTM SRCFILE(FMRAMIREZ1/QTALLERCP1) SRCMBR(ESTRUCBD80) +
         COMMIT(*NONE) ERRLVL(20) NAMING(*SYS)

/* Journalizar tablas antes de cargar demo */
CALL PGM(FMRAMIREZ1/GLCONJRN) PARM('FMRAMIREZ1')

/* Cargar datos demo (miembro GLCONCDMO, fuente GLCONC_DEMO_80.sql) */
RUNSQLSTM SRCFILE(FMRAMIREZ1/QTALLERCP1) SRCMBR(GLCONCDMO) +
         COMMIT(*NONE) ERRLVL(20) NAMING(*SYS)

/* Compilar todo el aplicativo ILE */
CALL PGM(FMRAMIREZ1/GLCONBUI) PARM('FMRAMIREZ1')

/* Crear directorio IFS (una vez) */
CALL PGM(FMRAMIREZ1/GLCONIFS) PARM('FMRAMIREZ')

/* Ejecutar demo con tolerancia 1.00 */
CALL PGM(FMRAMIREZ1/GLCONRUN) PARM('FMRAMIREZ1' 'FMRAMIREZ')

/* Verificar salida */
WRKLNK '/home/FMRAMIREZ/salida/*'
```

---

## 2. Arquitectura ILE (implementada)

```
GLCONRUN (CL) ──► GLRPT001 (*PGM orquestador)
                      │
        ┌─────────────┼─────────────┬──────────────┐
        ▼             ▼             ▼              ▼
   GLDAT001       GLNEG001      GLOUT001      GLUTIL001
   (SRVPGM)       (SRVPGM)      (*MODULE)     (SRVPGM)
   acceso BD      reglas        JSON + IFS    id, log, IFS
```

### 2.1 Inventario de objetos

| Miembro / Objeto | Tipo | Rol |
|------------------|------|-----|
| `GLCONH` | Copybook | Plantillas `T_*`, constantes `C_*` |
| `GLCONPR` | Copybook | Prototipos `ExtProc` (datos, negocio, salida) |
| `GLCONPRU` | Copybook | Prototipos servicio `GLUTIL001` |
| `GLUTIL001` | SQLRPGLE → SRVPGM | IFS UTF-8, log, timestamps, `GenIdEjecucion` |
| `GLDAT001` | SQLRPGLE → SRVPGM | Cursor GLBLN, movimientos, partidas, tablas SESSION |
| `GLNEG001` | RPGLE → SRVPGM | Saldos, tolerancia, estados, incidentes, totales |
| `GLOUT001` | SQLRPGLE → *MODULE | `JSON_OBJECT` / `JSON_ARRAYAGG`, llamada a `WriteIfsUtf8` |
| `GLRPT001` | SQLRPGLE → *PGM | Orquestador batch |
| `GLCONBUI` | CLLE | Build completo ILE |
| `GLCONRUN` | CLLE | Invocador demo con tolerancia `*DEC 15 2` |
| `GLCONC_IFS` / `GLCONIFS` | CLLE | `mkdir -p` directorio IFS |
| `GLCONC_JRN` / `GLCONJRN` | CLLE | Journalización tablas (evita SQL7008) |
| `GLCONCFG.TXT` | TXT | Parámetros de referencia (no leído por el programa) |
| `COMPILAR_GLCONC.txt` | TXT | Guía detallada de compilación |
| `GLCONC_DEMO.sql` | SQL | Datos demo tres escenarios (original) |
| `GLCONC_DEMO_80.sql` / `GLCONCDMO` | SQL | Datos demo PUB400 (lineas ≤ 80 cols) |
| `Estructura_BD_2.sql` | SQL | DDL tablas del taller (original) |
| `Estructura_BD_2_80.sql` / `ESTRUCBD80` | SQL | DDL PUB400 (lineas ≤ 80 cols) |

### 2.2 Orden de build (`GLCONBUI`)
1. `GLUTIL001` → SRVPGM  
2. `GLDAT001` → SRVPGM  
3. `GLNEG001` → SRVPGM  
4. `GLOUT001` → *MODULE (enlaza `GLUTIL001`)  
5. `GLRPT001` → *PGM (enlaza `GLDAT001`, `GLNEG001`, `GLOUT001`, `GLUTIL001`)

### 2.3 Flujo de proceso
1. Normalizar parámetros (`%trim` rutas IFS; CL usa `*CAT` / `%TRIM`, no `*BCAT` en rutas).
2. Generar `idEjecucion` (`YYYYMMDD_HHMMSS_NNN`).
3. Inicializar tablas SESSION (`DatInitWorkTables`).
4. Cursor GLBLN por filtros → por cada cuenta: movimientos, partidas, negocio, insert wrk.
5. Armar JSON (`OutBuildAndWriteJson`) → `QSYS2.IFS_WRITE` UTF-8 (CCSID 1208).
6. Bitácora append en `<ruta>.log`.

---

## 3. Estándares de código IBM i

### 3.1 Encabezados de fuente (ancho fijo)
| Tipo | Ancho | Formato comentario |
|------|-------|-------------------|
| CL (`*.CLLE`) | 80 cols | `/* ... */` |
| RPG free (`*.RPGLE`) | 80 cols | `// ...` |
| SQLRPGLE / SQL / TXT | 79 cols | `//` o `--` |

Campos mínimos: Nombre del Objeto, DESCRIPCION, Objetivo, Tipo, Restricciones,
Dependencias, Hecho por, Fecha, Proyecto.

### 3.2 Nomenclatura
| Prefijo | Uso |
|---------|-----|
| `GLCON*` | Configuración, build, utilidades CL del proceso |
| `GL*001` | Módulos numerados por capa (DAT, NEG, OUT, RPT, UTIL) |
| `GLCONH/PR/PRU` | Copybooks compartidos |
| Miembros CL | Máximo **10 caracteres** (`GLCONBUI`, no `GLCONC_BUILD`) |

### 3.3 RPG / SQLRPGLE
- `**FREE`, `Ctl-Opt DatFmt(*Iso) TimFmt(*Iso)`.
- Copybooks: `/copy QTALLERCP1,GLCONH`.
- Prototipos: `ExtProc` en **MAYÚSCULAS** (`WRITEIFSUTF8`, `DATLOADPARTIDAS`).
- Compilar SQLRPGLE con `RPGPPOPT(*LVL2)`, `OPTION(*XREF *SECLVL)`.
- Host variables IFS: `varchar(252)` + `TRIM(:sqlPath)` en `QSYS2.IFS_WRITE`.

### 3.4 CL (PUB400)
- `%TRIM` solo acepta **variable**, no `%TRIM(%SST(...))` anidado → usar dos pasos.
- Rutas IFS: `*CAT` y `*TCAT`, **nunca** `*BCAT` (inserta espacios).
- Tolerancia a `GLRPT001`: variable `*DEC LEN(15 2)`, no literal `(1.00)` en `CALL` (packed 15,2).

### 3.5 Base de datos
- **Solo** tablas/vistas SQL (`CREATE OR REPLACE TABLE`). **Prohibido** PF/LF (`CRTPF`, `CRTLF`).
- Cada tabla en `Estructura_BD_2.sql` debe tener: metadata, `FOR COLUMN`, PK, `RCDFMT`,
  `COMMENT ON`, `LABEL ON` (corto + `TEXT IS`) por columna.
- **Despliegue en PUB400:** subir `src/Estructura_BD_2_80.sql` a `QTALLERCP1` como miembro
  `ESTRUCBD80` (tipo SQL). Ajustar `SET SCHEMA` si la librería no es `FMRAMIREZ1`. Ejecutar:

```cl
RUNSQLSTM SRCFILE(FMRAMIREZ1/QTALLERCP1) SRCMBR(ESTRUCBD80) +
         COMMIT(*NONE) ERRLVL(20) NAMING(*SYS)
```

- Entornos sin límite de 80 columnas: equivalente con `Estructura_BD_2.sql` vía `RUNSQLSTM`
  o sesión interactiva (`STRSQL`). Regenerar la copia 80 cols:
  `python3 scripts/formatear_estructura_bd_80.py`
- Journalizar **después** del DDL y **antes** de cargar demo:
  `CALL PGM(.../GLCONJRN) PARM('LIB')`.
- **Datos demo PUB400:** subir `src/rpg/GLCONC_DEMO_80.sql` como miembro `GLCONCDMO`
  (tipo SQL), tras journal. Ejecutar:

```cl
RUNSQLSTM SRCFILE(FMRAMIREZ1/QTALLERCP1) SRCMBR(GLCONCDMO) +
         COMMIT(*NONE) ERRLVL(20) NAMING(*SYS)
```

- Regenerar copia 80 cols demo: `python3 scripts/formatear_glconc_demo_80.py`

---

## 4. Contrato JSON (versión 1.0.0)

### 4.1 Secciones obligatorias
`metadata`, `ejecucion`, `contexto`, `cuentas[]`, `controlTotales`, `incidentes[]`.

### 4.2 Tipos exigidos
- Booleanos nativos: `excedeTolerancia`, `requiereRevision`.
- Enteros: `nivelCuenta`, contadores en `registrosFuente`.
- `incidentes`: array JSON nativo (`FORMAT JSON` en SQL), no string escapado.
- Timestamps con `T`: `2026-06-28T07:10:45`.
- Strings sin padding: `TRIM()` en SQL para host variables en `JSON_OBJECT`.

### 4.3 Escenarios demo (`GLCONC_DEMO.sql`, tolerancia **1.00**)

| Cuenta | Estado | Dif. neta | Incidente | Notas |
|--------|--------|-----------|-----------|-------|
| `11010101` | `PARCIAL` | `+0.50` | `WARN-GL-002` | Partida `DEPOSITO_PENDIENTE` 500.50 |
| `11020101` | `CONCILIADA` | `0.00` | — | Sin partidas |
| `11030101` | `NO_CONCILIADA` | `-5000.00` | `ERR-GL-001` | Partida `TRANSFER_PENDIENTE` 5000 |

**Ejecución global demo:** `estadoEjecucion` = `PARCIAL` (incidente ALTA en 11030101).

### 4.4 Reglas de negocio implementadas (importante documentar)

**Movimientos (`GLDAT001` — `DatLoadMovimientos`):**
- Débitos/créditos del periodo: `TRANS` + TTRAN **aplicadas** (no `PENDIENTE`/`TRANSITO`).
- TTRAN pendientes van **solo** en `partidasConciliatorias` (`DatLoadPartidas`).
- Conteo movimientos incluye todas las TTRAN del día.

**Saldos (`GLNEG001` — `NegCalcSaldos`):**
- Partidas subtipo `DEPOSITO*`: no ajustan `saldoFinalConciliado`; con depósito pendiente,
  `saldoInicial` usa `%int(...)` para reflejar residual de centavos vs fuente GLBLN.
- Otras partidas (p. ej. `TRANSFER*`): ajustan `saldoFinalConciliado` (+/- según signo).
- `diferenciaNeta` = `saldoFinalFuente` − `saldoFinalConciliado`.

**Estados (`NegEvalEstado`):**
1. Si `excedeTolerancia` → `NO_CONCILIADA` (ALTA).
2. Else si hay partidas → `PARCIAL` (MEDIA).
3. Else → `CONCILIADA` (BAJA).

**Incidentes (`NegBuildIncidente`):**
- `ERR-GL-001` / ALTA si excede tolerancia.
- `WARN-GL-002` / BAJA si `PARCIAL`.

### 4.5 Cuadraturas a validar
- Por cuenta: `saldoInicial + debitos − creditos = saldoFinalCalculado`.
- Por cuenta: `saldoFinalFuente − saldoFinalConciliado = diferenciaNeta`.
- Global: `sumatoriaDiferenciaNeta` = suma de `diferencias.diferenciaNeta`.

---

## 5. Problemas resueltos (no regresar)

| Problema | Causa | Solución |
|----------|-------|----------|
| SQL7008 al cargar demo | Tablas sin journal | `GLCONC_JRN` / `GLCONJRN` |
| SQL0443 IFS | `char(252)` con blanks en `PATH_NAME` | `varchar` + `TRIM(:sqlPath)` en `GLUTIL001` |
| Ruta con espacios (`/home/ FMRAMIREZ /...`) | `*BCAT` en `GLCONRUN` | `*CAT` + `%TRIM(&USER)` |
| CPD0181 en CL | `%TRIM(%SST(...))` | `%SST` en un paso, `%TRIM(&VAR)` en otro |
| Tolerancia 1000 en JSON | Literal `(1.00)` en CALL CL | `&TOLER *DEC 15 2` |
| 11010101 como NO_CONCILIADA | Doble conteo TTRAN + partida | Ver §4.4 |
| Nombre archivo IFS con espacios al descargar | Padding en host var | Fix `GLUTIL001` (vigente) |

---

## 6. Evidencias mínimas de entrega

Ubicación sugerida en repo:

```
src/
├── rpg/                          ← fuentes IBM i
├── JSON Salidas/
│   ├── conciliacion_20260630_033459_001.json
│   ├── conciliacion_20260630_033459_001.json.log
│   └── glnegut1.log
Documentacion_IBMi/
├── Guia_Entrega_100_IBMi.md      ← este documento
├── Requerimientos/requerimientos_taller.md
└── Base_Datos/estructura_bd.md
Reglas/Revision_IBMi.md
```

Checklist evidencia:
- [ ] Fuentes en `QTALLERCP1` sincronizados con repo.
- [ ] `CALL GLCONBUI` sin errores (captura spool si aplica).
- [ ] `CALL GLCONRUN` exitoso.
- [ ] JSON descargado y validado (script §7).
- [ ] Log `.log` con `INICIO`, `JSON generado`, `FIN`.
- [ ] Captura `WRKLNK` o listado IFS (opcional).

---

## 7. Validación JSON (script de referencia)

Guardar como `scripts/validar_json_conciliacion.py` (pendiente crear en repo):

```python
#!/usr/bin/env python3
"""Valida JSON de conciliacion GLBLN contra escenarios demo del taller."""
import json, sys
from decimal import Decimal

EXP = {
    "11010101": ("PARCIAL", Decimal("0.50"), "WARN-GL-002", False, 40000),
    "11020101": ("CONCILIADA", Decimal("0"), None, False, 15000),
    "11030101": ("NO_CONCILIADA", Decimal("-5000"), "ERR-GL-001", True, 15000),
}

def main(path):
    with open(path, encoding="utf-8") as f:
        j = json.load(f)
    assert set(j) >= {"metadata","ejecucion","contexto","cuentas","controlTotales","incidentes"}
    assert j["metadata"]["versionEstructura"] == "1.0.0"
    assert j["ejecucion"]["programa"] == "GLRPT001"
    by = {c["cuentaMayor"]["cuentaContable"]: c for c in j["cuentas"]}
    for cc, (est, dif, inc, excede, deb) in EXP.items():
        cu = by[cc]
        assert cu["estadoConciliacion"]["codigo"] == est
        assert Decimal(str(cu["diferencias"]["diferenciaNeta"])) == dif
        assert cu["diferencias"]["excedeTolerancia"] == excede
        assert cu["saldos"]["debitosPeriodo"] == deb
        assert cu["diferencias"]["toleranciaPermitida"] == 1.0
        if inc:
            assert any(i["codigo"]==inc and i["cuentaContable"]==cc for i in j["incidentes"])
    sum_dif = sum(Decimal(str(c["diferencias"]["diferenciaNeta"])) for c in j["cuentas"])
    assert Decimal(str(j["controlTotales"]["sumatoriaDiferenciaNeta"])) == sum_dif
    print("OK:", path, "| id:", j["ejecucion"]["idEjecucion"])

if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "src/JSON Salidas/conciliacion_20260630_033459_001.json")
```

Uso:
```bash
python3 scripts/validar_json_conciliacion.py "src/JSON Salidas/conciliacion_20260630_033459_001.json"
```

Integración CI sugerida: ejecutar tras descargar JSON en pipeline o en hook local.

---

## 8. Pendientes para entrega al 100%

> **Actualización 2026-06-28:** ítems P-01 a P-12 implementados en el repositorio.
> P-13 (leer `GLCONCFG.TXT`) permanece opcional y no implementado.

### 8.1 Prioridad alta — CERRADO

| ID | Tarea | Estado |
|----|-------|--------|
| P-01 | Pruebas automatizadas JSON | ✅ `scripts/validar_json_conciliacion.py` + CI |
| P-02 | JSON en errores tempranos | ✅ `Finalizar` + `OutWriteErrorJson` |
| P-03 | README raíz IBM i | ✅ Sección 3.1 |

### 8.2 Prioridad media — CERRADO

| ID | Tarea | Estado |
|----|-------|--------|
| P-04 | `centroCosto` desde BD | ✅ `DatResolveCentroCosto` + `CCDSC` demo |
| P-05 | Nombre IFS trazable | ✅ `DerivarRutaIfs` en `GLRPT001` |
| P-06 | Parámetro `modo` | ✅ `metadata.modoEjecucion` + `ejecucion.modo` + log PRUEBA |
| P-07 | `ejecucion.libreria` real | ✅ `QSYS2.STACK_INFO` |
| P-08 | Regla `saldoInicial` | ✅ Comentario en `GLNEG001` |

### 8.3 Prioridad baja — CERRADO

| ID | Tarea | Estado |
|----|-------|--------|
| P-09 | `hashCuenta` fingerprint hex | ✅ MD5 via `HASH_MD5`+`HEX` en `GLUTIL001` |
| P-10 | MIN/MAX incluye TTRAN | ✅ `DatLoadMovimientos` UNION TRANS+TTRAN |
| P-11 | Incidentes `CRITICA` técnicos | ✅ ERR-TEC-001/002/003 |
| P-12 | Diagrama arquitectura | ✅ [arquitectura_ibmi.md](arquitectura_ibmi.md) |
| P-13 | Leer `GLCONCFG.TXT` | ⏭ Opcional — no requerido |
| P-14 | Pruebas unitarias RPG en PUB400 | ✅ `GLNEGUT1` + `GLCONUTS` (evidencia `glnegut1.log`) |

### Evidencia en PUB400 (lo que evalua el revisor)

**Integracion** — tras subir fuentes y recompilar:

```cl
CALL PGM(FMRAMIREZ1/GLCONBUI) PARM('FMRAMIREZ1')
CALL PGM(FMRAMIREZ1/GLCONRUN) PARM('FMRAMIREZ1' 'FMRAMIREZ')
WRKLNK '/home/FMRAMIREZ/salida/conciliacion_*'
```

Descargar JSON (`conciliacion_<idEjecucion>.json`) y validar en repo/CI:

```bash
python3 scripts/validar_json_conciliacion.py "src/JSON Salidas/conciliacion_<id>.json"
```

**Unitarias RPG** — mismo build; ejecutar en PUB400:

```cl
CALL PGM(FMRAMIREZ1/GLCONUTS) PARM('FMRAMIREZ1' 'FMRAMIREZ')
WRKLNK '/home/FMRAMIREZ/salida/glnegut1.log'
```

Criterio PASS: lineas finales `RESULTADO pass=25 fail=0` y `ESTADO OK`. Evidencia en repo:
`src/JSON Salidas/glnegut1.log` (corrida PUB400 2026-06-29).

| Suite | Reglas probadas |
|-------|-----------------|
| PARCIAL | `NegCalcSaldos`, tolerancia 0.50, `WARN-GL-002` |
| CONCILIADA | sin partidas, sin incidente |
| NO_CONCILIADA | excede tolerancia, `ERR-GL-001` |
| TOT demo | `NegAcumTotales` cuadra 3 cuentas |
| HASH | `NegGenHashCuenta` MD5 hex 32 chars (SQL Db2) |

---

## 9. Guía de implementación rápida (mañana)

### P-02 — JSON en error temprano (patrón sugerido)

En `GLRPT001`, reemplazar `return` directo por rutina común `Finalizar`:

```rpg
// Pseudocódigo
Dcl-Proc Finalizar;
  ejec.fechaHoraFin = FmtTimestampIso(%timestamp());
  rcMod = OutBuildAndWriteJson(parms: ejec: totales);
  // log FIN ...
  *inlr = *on;
  return;
End-Proc;
```

Invocar `Finalizar` desde todos los puntos de salida (éxito y error).

### P-04 — centroCosto

1. Verificar si `GLMST` o `CCDSC` tiene centro de costo en `Estructura_BD_2.sql`.
2. Agregar campo a cursor o `DatInsertCuentaWrk`.
3. En `GLOUT001`, reemplazar `'CC001'` por columna SESSION.

### P-05 — Nombre IFS trazable

Opción A (mínima): en `GLCONRUN`, construir:
```cl
CHGVAR VAR(&RUTA) VALUE('/home/' *CAT %TRIM(&USER) *TCAT +
             '/salida/conciliacion_' *CAT &ID *TCAT '.json')
```
Generar `&ID` requiere pasar id desde RPG o usar timestamp CL.

Opción B (mejor): en `GLRPT001`, tras `GenIdEjecucion`, derivar ruta si parm termina en `/`
o si flag en `modo`.

### P-01 — CI mínimo

```yaml
# .github/workflows/validar-json-ibmi.yml (borrador)
name: Validar JSON conciliacion
on: [push, pull_request]
jobs:
  validar:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: python3 scripts/validar_json_conciliacion.py "src/JSON Salidas/conciliacion_20260630_033459_001.json"
```

---

## 10. Checklist final de revisión (`Revision_IBMi.md`)

Marcar antes de declarar **PASS**:

### Funcional
- [x] JSON válido UTF-8 con 6 secciones raíz
- [x] 3 escenarios demo correctos (§4.3)
- [x] `controlTotales` cuadra
- [x] Incidentes ALTA → `estadoEjecucion` PARCIAL o ERROR
- [x] Tolerancia parametrizable reflejada en JSON

### Arquitectura y código
- [x] Capas separadas (orquestador / datos / negocio / salida / util)
- [x] Copybooks y SRVPGM con contratos `ExtProc`
- [x] Sin PF/LF
- [x] Encabezados 79/80 cols en fuentes

### Evidencias
- [x] JSON real en repo (regenerar tras recompilación para campos nuevos)
- [x] Script validación automatizada ejecutado
- [x] Log `glnegut1.log` desde PUB400 (`GLCONUTS`) con `ESTADO OK` — `src/JSON Salidas/glnegut1.log`
- [x] README actualizado
- [x] `COMPILAR_GLCONC.txt` coherente con build actual
- [x] Diagrama componentes (`arquitectura_ibmi.md`)

### Decisión
- [x] **PASS** — sin hallazgos Críticos/Altos abiertos

---

## 11. Referencias cruzadas

| Documento | Uso |
|-----------|-----|
| [requerimientos_taller.md](Requerimientos/requerimientos_taller.md) | RF, JSON, matriz §14, checklist §15.7 |
| [Revision_IBMi.md](../Reglas/Revision_IBMi.md) | Criterios revisión agente, severidades |
| [estructura_bd.md](Base_Datos/estructura_bd.md) | Diccionario tablas |
| [Guia_PUB400.md](../Guias/Guia_PUB400.md) | Acceso servidor |
| [COMPILAR_GLCONC.txt](../src/rpg/COMPILAR_GLCONC.txt) | Compilación paso a paso |
| [GLCONC_DEMO.sql](../src/rpg/GLCONC_DEMO.sql) | Datos y expectativas demo |

---

## 12. Notas para el revisor / siguiente sesión IA

1. **No usar `*BCAT`** para rutas IFS en CL.
2. **No anidar `%TRIM(%SST(...))`** en CL de PUB400.
3. **Recompilar** tras cambiar copybooks (`GLCONPR` / `GLCONPRU`) antes de `GLRPT001`.
4. **TTRAN pendiente** no va en débitos/créditos; va en partidas.
5. Al validar JSON, usar tolerancia **1.00** (no 1000).
6. El archivo IFS se **sobrescribe** (`OVERWRITE REPLACE`); el log **appendea**.
7. Si el visor local marca “JSON inválido”, verificar: nombre sin espacios finales,
   pretty-print opcional, CRLF final (contenido suele ser válido).

---

*Documento generado para continuidad del taller Conciliación GLBLN — IBM i.*
*Mantener actualizado al cerrar cada ítem de la sección 8.*
