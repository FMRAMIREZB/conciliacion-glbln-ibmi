# Estándar de código RPG — Conciliación GLBLN

Convención de nombres y comentarios para fuentes compilados por `GLCONBUI`.

## Prefijos

| Elemento | Prefijo | Ejemplo |
|----------|---------|---------|
| Constante | `C_` + UPPER_SNAKE | `C_MAX_PARTIDAS` |
| Template `Dcl-ds` | `T_` | `T_CuentaGlbln` |
| Instancia `likeds` | `Ds_` + `qualified` | `Ds_CuentaGlbln` |
| Variable trabajo | `Wrk_` | `Wrk_LogPath` |
| Parámetro interno | `Par_` | `Par_Codigo` |
| Contador | — | `i`, `j` |

## API exportada (estable)

No renombrar procedimientos exportados ni cadenas `ExtProc(...)`:

- Capa negocio: `NegCalcSaldos`, `NegGenHashCuenta`, …
- Capa datos: `DatInitWorkTables`, `DatFetchGlbln`, …
- Capa salida: `OutBuildAndWriteJson`, `OutWriteErrorJson`
- Utilidades: `GenIdEjecucion`, `WriteIfsUtf8`, `UtilHashMd5Hex`, …

Parámetros exportados mantienen prefijo `p` (`pParms`, `pCuenta`, …).

## Templates en GLCONH

| Template | Uso |
|----------|-----|
| `T_ParmsConc` | Parámetros de ejecución |
| `T_EjecCtx` | Contexto de corrida |
| `T_CuentaGlbln` | Cuenta mayor |
| `T_SaldosCuenta` | Saldos calculados |
| `T_ResumenMov` | Resumen movimientos |
| `T_PartidaConc` | Partida conciliatoria |
| `T_DifConc` | Diferencias |
| `T_EstadoConc` | Estado conciliación |
| `T_Incidente` | Incidente / alerta |
| `T_ControlTot` | Totales de control |

Campos internos de templates (camelCase) no cambian: contrato JSON.

## Comentarios

- Encabezado obligatorio a **80 columnas** (`// ===` … `// ===`).
- Separadores de procedimiento: `// ---` + guiones hasta col 77 + ` ---`.
- Cuerpo: solo lógica de negocio; sin meta PUB400, §taller o notas de fix.
- Campo `Exporta:` del encabezado debe listar exports reales del módulo.

## Exclusiones

- **`GLNEGUT1`**: sin refactor de nombres/comentarios; solo `likeds(T_*)`.
- Objetos IBM i (10 chars), columnas SESSION, claves JSON.

## Regresión PUB400

```cl
CALL PGM(MILIB/GLCONBUI) PARM('MILIB')
CALL PGM(MILIB/GLCONRUN) PARM('MILIB' 'USUARIO')
CALL PGM(MILIB/GLCONUTS) PARM('MILIB' 'USUARIO')
```

Validar JSON demo con `scripts/validar_json_conciliacion.py` (49/49).
