#!/usr/bin/env python3
"""Genera src/Estructura_BD_2.sql en formato Db2 for i V7R4+."""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MD_PATH = ROOT / "Documentacion_IBMi/Base_Datos/estructura_bd.md"
OUT_PATH = ROOT / "src/Estructura_BD_2.sql"

# Limites LABEL ON en Db2 for i (SQL0107)
LABEL_TABLE_MAX = 50
LABEL_COLUMN_HEAD_MAX = 60
LABEL_COLUMN_TEXT_MAX = 50
PROYECTO = "Conciliacion GLBLN - Taller IBM i"
SCHEMA = "FMRAMIREZ1"
EQUIPO = "Fernando Ramirez, mediante Agentes de IA"
FECHA = "2026-06-08"

# Columnas de negocio adicionales requeridas para integridad referencial
EXTRA_COLUMNS: dict[str, list[dict]] = {
    "ACMST": [
        {
            "name": "numero_cuenta",
            "sql_type": "VARCHAR(24) NOT NULL",
            "comment": "Numero de cuenta de detalle para referencias cruzadas del modulo",
        },
    ],
    "DEALS": [
        {
            "name": "numero_prestamo",
            "sql_type": "VARCHAR(30) NOT NULL",
            "comment": "Numero de prestamo u operacion para referencias cruzadas del modulo",
        },
    ],
    "LCMST": [
        {
            "name": "numero_carta_credito",
            "sql_type": "VARCHAR(30) NOT NULL",
            "comment": "Numero de carta de credito para referencias cruzadas del modulo",
        },
    ],
}

INSERT_AFTER: dict[str, str] = {
    "ACMST": "id",
    "DEALS": "id",
    "LCMST": "id",
}

TABLE_META: dict[str, dict[str, str]] = {}
MODULE_TYPES = {
    "TRANS": "Transaccional",
    "TTRAN": "Transaccional",
    "TRDSC": "Transaccional",
    "GLBLN": "Maestro",
    "GLMST": "Maestro",
    "INPUT": "Transaccional",
    "INPT2": "Transaccional",
    "NXINP": "Transaccional",
    "HSNOT": "Historico",
    "HLHIS": "Historico",
    "RTRNS": "Historico",
    "BAHIS": "Historico",
    "FIWRT": "Historico",
    "SWITF": "Historico",
    "PBTRN": "Transaccional",
    "AUDIT": "Transaccional",
    "CNTRL": "Control",
}

COLUMN_LABELS: dict[str, tuple[str, str]] = {
    "id": ("Id", "Identificador tecnico surrogate del registro"),
    "codigo_banco": ("Cod Banco", "Codigo identificador del banco"),
    "codigo_sucursal": ("Cod Sucursal", "Codigo identificador de la sucursal"),
    "codigo_moneda": ("Cod Moneda", "Codigo identificador de la moneda"),
    "cuenta_contable": ("Cta Contable", "Numero de cuenta contable mayor"),
    "numero_cuenta": ("Num Cuenta", "Numero de cuenta de detalle o cliente"),
    "id_cliente": ("Id Cliente", "Identificador del cliente"),
    "descripcion_cuenta": ("Desc Cuenta", "Descripcion de la cuenta contable"),
    "naturaleza_cuenta": ("Naturaleza", "Naturaleza de la cuenta: deudora o acreedora"),
    "nivel_cuenta": ("Nivel Cuenta", "Nivel jerarquico de la cuenta contable"),
    "saldo_actual": ("Saldo Actual", "Saldo actual de la cuenta o registro"),
    "fecha_proceso_sistema": ("Fecha Proceso", "Fecha y hora de procesamiento en el sistema"),
    "debito_credito": ("Deb/Cred", "Indicador de debito (D) o credito (C)"),
    "monto": ("Monto", "Monto monetario de la transaccion o partida"),
    "fecha_operacion": ("Fecha Oper", "Fecha de la operacion transaccional"),
    "fecha_valor": ("Fecha Valor", "Fecha valor contable de la operacion"),
    "hora_operacion": ("Hora Oper", "Hora de la operacion transaccional"),
    "referencia_externa": ("Ref Externa", "Referencia externa del documento o movimiento"),
    "numero_registro_relativo": ("Num Reg Rel", "Numero de registro relativo en archivo fuente"),
    "tipo_descripcion": ("Tipo Desc", "Tipo de descripcion adicional de transaccion"),
    "texto_descripcion": ("Texto Desc", "Texto descriptivo de la partida o transaccion"),
    "created_at": ("Creado", "Marca de tiempo de creacion del registro"),
    "updated_at": ("Actualizado", "Marca de tiempo de ultima actualizacion"),
    "usuario_creacion": ("Usr Creacion", "Usuario que creo el registro"),
    "usuario_actualizacion": ("Usr Actualiz", "Usuario que actualizo el registro"),
    "version_registro": ("Version", "Version del registro para control de concurrencia"),
    "observaciones": ("Observaciones", "Observaciones adicionales del registro"),
    "estado_registro": ("Estado Reg", "Estado del registro: A=activo, I=inactivo"),
    "tipo_entidad": ("Tipo Entidad", "C=cliente CUMST, A=cuenta ACMST"),
    "obligatorio": ("Obligatorio", "Indicador Y/N de campo obligatorio"),
    "permite_consulta": ("Perm Consulta", "Indicador Y/N de permiso de consulta"),
    "permite_creacion": ("Perm Creacion", "Indicador Y/N de permiso de creacion"),
    "permite_actualizacion": ("Perm Actualiz", "Indicador Y/N de permiso de actualizacion"),
    "permite_aprobacion": ("Perm Aprob", "Indicador Y/N de permiso de aprobacion"),
}

# Claves UNIQUE requeridas por FKs (indice solo no basta en Db2 for i)
UNIQUE_CONSTRAINTS: list[tuple[str, str, list[str]]] = [
    ("ACMST", "uq_acmst_numero_cuenta", ["numero_cuenta"]),
    ("DEALS", "uq_deals_numero_prestamo", ["numero_prestamo"]),
    ("LCMST", "uq_lcmst_numero_carta", ["numero_carta_credito"]),
    ("TRANS", "uq_trans_num_reg_rel", ["numero_registro_relativo"]),
]

FOREIGN_KEYS: list[tuple[str, str, list[str], str, list[str]]] = [
    ("GLBLN", "fk_glbln_glmst", ["codigo_banco", "codigo_moneda", "cuenta_contable"], "GLMST", ["codigo_banco", "codigo_moneda", "cuenta_contable"]),
    ("TRANS", "fk_trans_glmst", ["codigo_banco", "codigo_moneda", "cuenta_contable"], "GLMST", ["codigo_banco", "codigo_moneda", "cuenta_contable"]),
    ("TRANS", "fk_trans_cumst", ["id_cliente"], "CUMST", ["id_cliente"]),
    ("TRANS", "fk_trans_acmst", ["numero_cuenta"], "ACMST", ["numero_cuenta"]),
    ("TRDSC", "fk_trdsc_trans", ["numero_registro_relativo"], "TRANS", ["numero_registro_relativo"]),
    ("TTRAN", "fk_ttran_trans", ["numero_registro_relativo"], "TRANS", ["numero_registro_relativo"]),
    ("TTRAN", "fk_ttran_glmst", ["codigo_banco", "codigo_moneda", "cuenta_contable"], "GLMST", ["codigo_banco", "codigo_moneda", "cuenta_contable"]),
    ("TTRAN", "fk_ttran_cumst", ["id_cliente"], "CUMST", ["id_cliente"]),
    ("TTRAN", "fk_ttran_acmst", ["numero_cuenta"], "ACMST", ["numero_cuenta"]),
    ("CUMAD", "fk_cumad_cumst", ["id_cliente_operacion"], "CUMST", ["id_cliente"]),
    ("CUMSD", "fk_cumsd_cumst", ["id_cliente"], "CUMST", ["id_cliente"]),
    ("STPMT", "fk_stpmt_acmst", ["numero_cuenta"], "ACMST", ["numero_cuenta"]),
    ("PBTRN", "fk_pbtrn_acmst", ["numero_cuenta"], "ACMST", ["numero_cuenta"]),
    ("RCLNB", "fk_rclnb_acmst", ["numero_cuenta"], "ACMST", ["numero_cuenta"]),
    ("CHMST", "fk_chmst_acmst", ["numero_cuenta"], "ACMST", ["numero_cuenta"]),
    ("CMRIN", "fk_cmrin_acmst", ["numero_cuenta"], "ACMST", ["numero_cuenta"]),
    ("DLPMT", "fk_dlpmt_deals", ["numero_prestamo"], "DEALS", ["numero_prestamo"]),
    ("DLDRF", "fk_dldrf_deals", ["numero_prestamo"], "DEALS", ["numero_prestamo"]),
    ("DLSDE", "fk_dlsde_deals", ["numero_prestamo"], "DEALS", ["numero_prestamo"]),
    ("DDCPN", "fk_ddcpn_deals", ["numero_prestamo"], "DEALS", ["numero_prestamo"]),
    ("DLITP", "fk_dlitp_deals", ["numero_prestamo"], "DEALS", ["numero_prestamo"]),
    ("LCDOC", "fk_lcdoc_lcmst", ["numero_carta_credito"], "LCMST", ["numero_carta_credito"]),
    ("LCADM", "fk_lcadm_lcmst", ["numero_carta_credito"], "LCMST", ["numero_carta_credito"]),
    ("LCCOV", "fk_lccov_lcmst", ["numero_carta_credito"], "LCMST", ["numero_carta_credito"]),
    ("LCDIN", "fk_lcdin_lcmst", ["numero_carta_credito"], "LCMST", ["numero_carta_credito"]),
    ("APPRV", "fk_apprv_lcmst", ["numero_carta_credito"], "LCMST", ["numero_carta_credito"]),
    ("LCFEE", "fk_lcfee_lcmst", ["numero_carta_credito"], "LCMST", ["numero_carta_credito"]),
    ("DLCLP", "fk_dlclp_cumst", ["id_cliente"], "CUMST", ["id_cliente"]),
    ("ROCOL", "fk_rocol_cumst", ["id_cliente"], "CUMST", ["id_cliente"]),
    ("LNECR", "fk_lnecr_cumst", ["id_cliente"], "CUMST", ["id_cliente"]),
    ("BAPRC", "fk_baprc_cumst", ["id_cliente"], "CUMST", ["id_cliente"]),
    ("BAMOR", "fk_bamor_baprc", ["codigo_banco", "codigo_sucursal", "origen_cuenta", "tipo_cuenta", "id_cliente", "numero_referencia", "tipo_registro"], "BAPRC", ["codigo_banco", "codigo_sucursal", "origen_cuenta", "tipo_cuenta", "id_cliente", "numero_referencia", "tipo_registro"]),
    ("PLPRD", "fk_plprd_plpcr", ["numero_propuesta"], "PLPCR", ["numero_propuesta"]),
    ("PLGRT", "fk_plgrt_plpcr", ["numero_propuesta"], "PLPCR", ["numero_propuesta"]),
    ("DPDTL", "fk_dpdtl_dpmst", ["id_cliente", "secuencia"], "DPMST", ["id_cliente", "secuencia"]),
    ("IFDTL", "fk_ifdtl_ifmst", ["id_cliente", "anio", "mes", "formato_balance"], "IFMST", ["id_cliente", "anio", "mes", "formato_balance"]),
    ("DIMST", "fk_dimst_ditbl", ["numero_tabla", "secuencia"], "DITBL", ["numero_tabla", "secuencia"]),
    ("SPINS", "fk_spins_cumst", ["id_cliente"], "CUMST", ["id_cliente"]),
    ("SPINS", "fk_spins_acmst", ["numero_cuenta"], "ACMST", ["numero_cuenta"]),
    ("CHPER", "fk_chper_acmst", ["numero_cuenta"], "ACMST", ["numero_cuenta"]),
    (
        "BAHIS",
        "fk_bahis_baprc",
        [
            "codigo_banco",
            "codigo_sucursal",
            "origen_cuenta",
            "tipo_cuenta",
            "id_cliente",
            "numero_referencia",
            "tipo_registro",
        ],
        "BAPRC",
        [
            "codigo_banco",
            "codigo_sucursal",
            "origen_cuenta",
            "tipo_cuenta",
            "id_cliente",
            "numero_referencia",
            "tipo_registro",
        ],
    ),
]

TABLE_CHECKS: dict[str, list[str]] = {
    "SPINS": [
        "CONSTRAINT chk_spins_tipo_ent CHECK (tipo_entidad IN ('C', 'A'))",
        (
            "CONSTRAINT chk_spins_refs CHECK ("
            "(tipo_entidad = 'C' AND id_cliente IS NOT NULL AND numero_cuenta IS NULL "
            "AND cuenta_o_cliente = id_cliente) OR "
            "(tipo_entidad = 'A' AND numero_cuenta IS NOT NULL AND id_cliente IS NULL "
            "AND cuenta_o_cliente = numero_cuenta))"
        ),
    ],
}

COLUMN_SQL_OVERRIDES: dict[str, dict[str, str]] = {
    "SPINS": {
        "tipo_entidad": "CHAR(1) NOT NULL DEFAULT 'C'",
    },
}


def parse_summary_tables(md: str) -> dict[str, dict[str, str]]:
    meta: dict[str, dict[str, str]] = {}
    for line in md.splitlines():
        m = re.match(r"^\| `([A-Z0-9]+)` \| ([^|]+) \| ([^|]+) \|", line)
        if m:
            meta[m.group(1)] = {
                "descripcion": m.group(2).strip(),
                "clave": m.group(3).strip(),
            }
    return meta


def parse_md_tables(md: str) -> dict[str, dict]:
    tables: dict[str, dict] = {}
    current = None
    in_table = False
    for line in md.splitlines():
        m = re.match(r"^#### ([A-Z0-9]+)\s*$", line)
        if m:
            current = m.group(1)
            tables[current] = {"cols": [], "pk": [], "indices": []}
            in_table = False
            continue
        if current and line.startswith("| Campo |"):
            in_table = True
            continue
        if current and in_table:
            if not line.startswith("|"):
                in_table = False
                continue
            if re.match(r"^\|[\s\-:|]+\|$", line):
                continue
            parts = [p.strip() for p in line.strip("|").split("|")]
            if len(parts) >= 6:
                col, tipo, tam, pk, fk, ref = parts[:6]
                tables[current]["cols"].append(
                    {
                        "name": col,
                        "type": tipo,
                        "size": tam,
                        "pk": pk.upper() == "SI",
                        "fk": fk.upper() == "SI",
                        "ref": ref,
                    }
                )
                if pk.upper() == "SI":
                    tables[current]["pk"].append(col)
        if current and line.strip().startswith("- `idx_"):
            idx = re.search(r"`(idx_[^`]+)`:\s*\(([^)]+)\)", line)
            if idx:
                tables[current]["indices"].append((idx.group(1), idx.group(2)))
    return tables


def escape_sql(text: str) -> str:
    return text.replace("'", "''")


def truncate_label(text: str, max_len: int) -> str:
    text = text.strip()
    if len(text) <= max_len:
        return text
    return text[:max_len].rstrip()


def table_label(name: str, desc: str) -> str:
    return truncate_label(f"{name} - {desc}", LABEL_TABLE_MAX)


def implicit_sys_name(sql_name: str) -> str:
    """Nombre de sistema que Db2 for i asignaria sin FOR COLUMN (<=10 chars)."""
    return sql_name.upper()[:10]


def for_column(name: str, used: set[str]) -> str:
    """Genera alias FOR COLUMN unico y distinto del nombre de sistema implicito."""
    implicit = implicit_sys_name(name)
    parts = name.split("_")

    if len(parts) > 1:
        base = "".join(p[:2] for p in parts).upper()
    else:
        # Una sola palabra: no usar el nombre completo (colisiona con nombre SQL)
        base = ("S" + name.replace("_", "")).upper()

    base = base[:6]
    candidate = base
    n = 1
    while candidate in used or candidate == implicit:
        candidate = (base[: max(1, 9 - len(str(n)))] + str(n)).upper()[:10]
        n += 1
    used.add(candidate)
    return candidate


def sql_type(col: dict) -> str:
    tipo = col["type"].upper()
    tam = col["size"]
    if tipo == "BOOLEAN":
        return "CHAR(1) NOT NULL DEFAULT 'N'"
    if tipo == "VARCHAR":
        return f"VARCHAR({tam})"
    if tipo == "CHAR":
        return f"CHAR({tam})"
    if tipo == "DECIMAL":
        return f"DECIMAL({tam.replace(' ', '')})"
    if tipo in {"INT", "BIGINT", "DATE", "TIME", "TIMESTAMP"}:
        return tipo
    return tipo


BOOL_COL_ABBREV = {
    "obligatorio": "oblig",
    "permite_consulta": "perm_con",
    "permite_creacion": "perm_cre",
    "permite_actualizacion": "perm_act",
    "permite_aprobacion": "perm_apr",
}


def bool_check(name: str, table: str) -> str | None:
    if name in BOOL_COL_ABBREV:
        cname = f"chk_{table.lower()}_{BOOL_COL_ABBREV[name]}"
        return f"CONSTRAINT {cname} CHECK ({name} IN ('Y', 'N'))"
    return None


def humanize(name: str) -> str:
    return name.replace("_", " ").capitalize()


def col_comment(col: dict, table: str, summary: dict[str, dict[str, str]]) -> str:
    if col["pk"]:
        return "Parte de la clave primaria del registro"
    if col["fk"] and col["ref"] != "-":
        return f"Clave foranea hacia {col['ref']}"
    if col["name"] in COLUMN_LABELS:
        return COLUMN_LABELS[col["name"]][1]
    desc = summary.get(table, {}).get("descripcion", table)
    return f"Campo {humanize(col['name'])} de {desc.lower().rstrip('.')}"


def col_short_label(col: dict) -> str:
    if col["name"] in COLUMN_LABELS:
        return COLUMN_LABELS[col["name"]][0][:20]
    label = humanize(col["name"])
    return label[:20]


def table_tipo(name: str) -> str:
    for prefix, tipo in MODULE_TYPES.items():
        if name.startswith(prefix) or name == prefix:
            return tipo
    if name.startswith("CNTRL"):
        return "Control"
    if name.endswith("MST") or name.endswith("MS"):
        return "Maestro"
    if name.startswith("HS") or name.endswith("HIS"):
        return "Historico"
    return "Maestro"


def table_objetivo(name: str, desc: str) -> str:
    core = {
        "GLBLN": "Soportar consulta de balances generales y conciliacion de cuentas mayores para reporteria JSON.",
        "GLMST": "Mantener el catalogo de cuentas contables usado en conciliacion y estados financieros.",
        "TRANS": "Almacenar el historico de transacciones contables para calculo de saldos y partidas conciliatorias.",
        "TTRAN": "Registrar transacciones del dia para conciliacion operativa y cuadre con GLBLN.",
        "TRDSC": "Proveer descripciones adicionales de transacciones para auditoria y JSON de conciliacion.",
    }
    if name in core:
        return core[name]
    return f"Persistir informacion funcional de {desc.lower().rstrip('.')} en el entorno IBM i del taller."


def inject_extra_columns(table: str, cols: list[dict]) -> list[dict]:
    extras = EXTRA_COLUMNS.get(table, [])
    if not extras:
        return cols
    result = []
    after = INSERT_AFTER.get(table)
    inserted = False
    for col in cols:
        result.append(col)
        if col["name"] == after:
            for extra in extras:
                result.append(
                    {
                        "name": extra["name"],
                        "type": "EXTRA",
                        "size": "-",
                        "pk": False,
                        "fk": False,
                        "ref": "-",
                        "extra": True,
                        "sql_type": extra["sql_type"],
                        "comment": extra["comment"],
                    }
                )
            inserted = True
    if not inserted:
        for extra in extras:
            result.append(
                {
                    "name": extra["name"],
                    "type": "EXTRA",
                    "size": "-",
                    "pk": False,
                    "fk": False,
                    "ref": "-",
                    "extra": True,
                    "sql_type": extra["sql_type"],
                    "comment": extra["comment"],
                }
            )
    return result


def render_table(name: str, data: dict, summary: dict[str, dict[str, str]]) -> list[str]:
    desc = summary.get(name, {}).get("descripcion", name)
    clave = summary.get(name, {}).get("clave", "Segun diccionario normalizado")
    lines: list[str] = []
    lines.append("--==============================================================================")
    lines.append(f"-- Nombre de la Tabla: {name}")
    lines.append(f"-- DESCRIPCION: {desc}")
    lines.append(f"-- Objetivo: {table_objetivo(name, desc)}")
    lines.append(f"-- Tipo de Tabla: {table_tipo(name)}")
    lines.append("-- Origen de los Datos: Sistema IBS / proceso batch del taller")
    lines.append("-- Permanencia de Datos: Permanente")
    lines.append(f"-- Uso de los datos: Consulta, conciliacion y reporteria de {desc.lower().rstrip('.')}")
    lines.append(f"-- Restricciones: Clave reportada: {clave}")
    lines.append(f"-- Hecho por: {EQUIPO}")
    lines.append(f"-- Fecha: {FECHA}")
    lines.append(f"-- Proyecto: {PROYECTO}")
    lines.append("--==============================================================================")
    lines.append("")

    cols = inject_extra_columns(name, data["cols"])
    used_aliases: set[str] = set()
    col_lines = []
    checks = []
    for col in cols:
        alias = for_column(col["name"], used_aliases)
        if col.get("extra"):
            stype = col["sql_type"]
        else:
            stype = COLUMN_SQL_OVERRIDES.get(name, {}).get(col["name"]) or sql_type(col)
        # Db2 for i: FOR COLUMN va ENTRE nombre SQL y tipo de dato
        col_lines.append(f"{col['name']} FOR COLUMN {alias} {stype}")
        chk = bool_check(col["name"], name)
        if chk:
            checks.append(chk)
    checks.extend(TABLE_CHECKS.get(name, []))

    pk_cols = data["pk"]
    pk_name = f"pk_{name.lower()}"
    ddl_parts = col_lines + [f"CONSTRAINT {pk_name} PRIMARY KEY ({', '.join(pk_cols)})"] + checks

    rcdfmt = (name + "R")[:10]
    lines.append(f"CREATE OR REPLACE TABLE {name} (")
    lines.append("    " + ",\n    ".join(ddl_parts))
    lines.append(f") RCDFMT {rcdfmt};")
    lines.append("")

    lines.append(f"COMMENT ON TABLE {name} IS '{escape_sql(desc)}';")
    lines.append(f"LABEL ON TABLE {name} IS '{escape_sql(table_label(name, desc))}';")
    for col in cols:
        if col.get("extra"):
            comment = col["comment"]
        else:
            comment = col_comment(col, name, summary)
        short = truncate_label(col_short_label(col), LABEL_COLUMN_HEAD_MAX)
        long_text = truncate_label(comment, LABEL_COLUMN_TEXT_MAX)
        lines.append(f"COMMENT ON COLUMN {name}.{col['name']} IS '{escape_sql(comment)}';")
        lines.append(f"LABEL ON COLUMN {name}.{col['name']} IS '{escape_sql(short)}';")
        lines.append(f"LABEL ON COLUMN {name}.{col['name']} TEXT IS '{escape_sql(long_text)}';")
    lines.append("")

    for idx_name, idx_cols in data["indices"]:
        cols_sql = ", ".join(c.strip() for c in idx_cols.split(","))
        lines.append(f"DROP INDEX IF EXISTS {idx_name};")
        lines.append(f"CREATE INDEX {idx_name} ON {name} ({cols_sql});")

    lines.append("")
    return lines


def main() -> None:
    md = MD_PATH.read_text(encoding="utf-8")
    summary = parse_summary_tables(md)
    tables = parse_md_tables(md)

    out: list[str] = []
    out.append("-- Estructura_BD_2.sql")
    out.append("-- Db2 for i V7R4+ | Taller Conciliacion GLBLN")
    out.append(f"-- Generado: {FECHA}")
    out.append(f"-- Proyecto: {PROYECTO}")
    out.append("-- Objetos: tablas SQL con metadata, indices y claves foraneas")
    out.append("-- Re-ejecucion: CREATE OR REPLACE TABLE e DROP INDEX IF EXISTS en indices.")
    out.append("--   UNIQUE y FK al final: requieren ambiente limpio (sin FKs previas).")
    out.append("")
    out.append(f"SET SCHEMA {SCHEMA};")
    out.append("")

    for name in tables:
        out.extend(render_table(name, tables[name], summary))

    out.append("--==============================================================================")
    out.append("-- CLAVES UNICAS Y FORANEAS")
    out.append("--==============================================================================")
    out.append("")
    out.append("-- Crear UNIQUE (parent keys para FKs)")
    for table, cname, cols in UNIQUE_CONSTRAINTS:
        col_list = ", ".join(cols)
        out.append(
            f"ALTER TABLE {table} ADD CONSTRAINT {cname} UNIQUE ({col_list});"
        )
    out.append("")
    out.append("-- Crear FKs")
    for table, cname, cols, ref_table, ref_cols in FOREIGN_KEYS:
        child = ", ".join(cols)
        parent = ", ".join(ref_cols)
        out.append(
            f"ALTER TABLE {table} ADD CONSTRAINT {cname} "
            f"FOREIGN KEY ({child}) REFERENCES {ref_table} ({parent});"
        )

    out.append("")
    out.append("")

    content = "\n".join(out) + "\n"
    validate_for_column_names(content)
    OUT_PATH.write_text(content, encoding="utf-8")
    print(f"Generado: {OUT_PATH} ({len(out)} lineas, {len(tables)} tablas)")


def validate_for_column_names(content: str) -> None:
    """Valida FOR COLUMN y longitudes de LABEL ON para Db2 for i."""
    import re

    errors = []
    for m in re.finditer(r"^\s+(\w+)\s+FOR COLUMN (\w+)", content, re.M):
        col, alias = m.group(1), m.group(2)
        if alias.upper() == implicit_sys_name(col):
            errors.append(f"FOR COLUMN: {col} -> {alias}")
    for pat, lim, label in [
        (r"LABEL ON TABLE \w+ IS '([^']*)'", LABEL_TABLE_MAX, "LABEL TABLE"),
        (r"LABEL ON COLUMN \S+\.\S+ IS '([^']*)'", LABEL_COLUMN_HEAD_MAX, "LABEL COL"),
        (r"LABEL ON COLUMN \S+\.\S+ TEXT IS '([^']*)'", LABEL_COLUMN_TEXT_MAX, "LABEL TEXT"),
    ]:
        for m in re.finditer(pat, content):
            if len(m.group(1)) > lim:
                errors.append(f"{label} ({len(m.group(1))}>{lim}): {m.group(1)[:40]}...")
    if errors:
        raise ValueError(
            "Validacion Db2 for i fallida:\n" + "\n".join(errors[:25])
        )


if __name__ == "__main__":
    main()
