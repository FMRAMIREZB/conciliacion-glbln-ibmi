#!/usr/bin/env python3
"""Genera copia de GLCONC_DEMO.sql con lineas <= 80 columnas (IBM i QSQLSRC)."""
from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src" / "rpg" / "GLCONC_DEMO.sql"
OUT = ROOT / "src" / "rpg" / "GLCONC_DEMO_80.sql"

HEADER = """-- GLCONC_DEMO_80.sql
-- Db2 for i V7R4+ | Taller Conciliacion GLBLN
-- Copia formateada de GLCONC_DEMO.sql (lineas <= 80 columnas).
-- Miembro QSQLSRC sugerido: GLCONCDMO (max 10 caracteres IBM i).
-- Funcionalidad equivalente al script original; no editar GLCONC_DEMO.sql.
-- Generado por scripts/formatear_glconc_demo_80.py
-- Prerequisito: ESTRUCBD80 ejecutado y GLCONJRN journalizado.
-- Proyecto: Conciliacion GLBLN - Taller IBM i
"""

# Reutiliza formateador probado del DDL
sys.path.insert(0, str(ROOT / "scripts"))
from formatear_estructura_bd_80 import (  # noqa: E402
    MAX_COL,
    col_width,
    format_line,
    normalize_statements,
)


def sql_body(text: str) -> str:
    lines = []
    started = False
    for ln in text.splitlines():
        if ln.startswith("SET SCHEMA"):
            started = True
        if started:
            s = ln.strip()
            if s and not s.startswith("--"):
                lines.append(s)
    return " ".join(lines)


def main() -> int:
    src_path = Path(sys.argv[1]) if len(sys.argv) > 1 else SRC
    out_path = Path(sys.argv[2]) if len(sys.argv) > 2 else OUT
    raw_lines = src_path.read_text(encoding="utf-8").splitlines()

    result: list[str] = HEADER.strip().splitlines() + [""]
    started = False
    for line in raw_lines:
        if line.startswith("SET SCHEMA"):
            started = True
        if not started:
            continue
        result.extend(format_line(line))

    over = [
        (i + 1, col_width(l), l[:70])
        for i, l in enumerate(result)
        if col_width(l) > MAX_COL
    ]
    if over:
        print(f"ERROR: {len(over)} lineas > {MAX_COL} cols (UTF-8 bytes)", file=sys.stderr)
        for ln, ln_len, preview in over[:25]:
            print(f"  {ln}: {ln_len} | {preview}", file=sys.stderr)
        return 1

    out_path.write_text("\n".join(result) + "\n", encoding="utf-8")

    orig_body = sql_body(src_path.read_text(encoding="utf-8"))
    new_body = sql_body(out_path.read_text(encoding="utf-8"))
    if normalize_statements(orig_body) != normalize_statements(new_body):
        print("ERROR: SQL normalizado difiere del original", file=sys.stderr)
        return 1

    print(f"OK: {out_path}")
    print(f"    lineas: {len(result)}")
    print(f"    max col: {max(col_width(l) for l in result)} (UTF-8 bytes)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
