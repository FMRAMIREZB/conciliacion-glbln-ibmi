#!/usr/bin/env python3
"""Genera copia de Estructura_BD_2.sql con lineas <= 80 columnas (IBM i QSQLSRC)."""
from __future__ import annotations

import re
import sys
from pathlib import Path

MAX_COL = 80
ROOT = Path(__file__).resolve().parents[1]


def col_width(text: str) -> int:
    """Ancho en columnas IBM i: bytes UTF-8 (acentos ocupan 2 bytes)."""
    return len(text.encode("utf-8"))


def fits(text: str, limit: int = MAX_COL) -> bool:
    return col_width(text) <= limit


def trim_to_width(text: str, limit: int = MAX_COL) -> str:
    if fits(text, limit):
        return text
    lo, hi = 0, len(text)
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if col_width(text[:mid]) <= limit:
            lo = mid
        else:
            hi = mid - 1
    return text[:lo].rstrip()
SRC = ROOT / "src" / "Estructura_BD_2.sql"
OUT = ROOT / "src" / "Estructura_BD_2_80.sql"

HEADER = """-- Estructura_BD_2_80.sql
-- Db2 for i V7R4+ | Taller Conciliacion GLBLN
-- Copia formateada de Estructura_BD_2.sql (lineas <= 80 columnas).
-- Miembro QSQLSRC sugerido: ESTRUCBD80 (max 10 caracteres IBM i).
-- Funcionalidad equivalente al script original; no editar Estructura_BD_2.sql.
-- Generado por scripts/formatear_estructura_bd_80.py
-- Proyecto: Conciliacion GLBLN - Taller IBM i
"""


def split_outside_quotes(text: str, sep: str) -> list[str]:
    parts: list[str] = []
    buf: list[str] = []
    in_quote = False
    i = 0
    while i < len(text):
        ch = text[i]
        if ch == "'":
            buf.append(ch)
            if in_quote and i + 1 < len(text) and text[i + 1] == "'":
                buf.append(text[i + 1])
                i += 2
                continue
            in_quote = not in_quote
            i += 1
            continue
        if not in_quote and text.startswith(sep, i):
            parts.append("".join(buf))
            buf = []
            i += len(sep)
            continue
        buf.append(ch)
        i += 1
    parts.append("".join(buf))
    return parts


def wrap_comment(line: str) -> list[str]:
    indent = line[: len(line) - len(line.lstrip())]
    body = line.lstrip()[2:]
    if body.startswith(" "):
        body = body[1:]
    prefix = indent + "-- "
    cont_prefix = indent + "-- "
    words = body.split()
    out: list[str] = []
    cur = prefix
    for word in words:
        trial = cur + (" " if cur != prefix else "") + word
        if fits(trial):
            cur = trial
        else:
            if cur.strip() != "--":
                out.append(cur.rstrip())
            cur = cont_prefix + word
            if not fits(cur):
                cur = trim_to_width(cur)
    if cur.strip() != "--":
        out.append(cur.rstrip())
    return out or [trim_to_width(line)]


def split_string_literal(
    literal: str, max_line: int, indent: str, semi: str = ""
) -> list[str]:
    """Parte 'texto largo' en 'parte1' 'parte2' (concatenacion Db2)."""
    if not literal.startswith("'") or not literal.endswith("'"):
        return [indent + literal + semi]
    inner = literal[1:-1]
    full = indent + literal + semi
    if fits(full, max_line):
        return [full]

    chunks: list[str] = []
    pos = 0
    while pos < len(inner):
        tail = inner[pos:]
        take = len(tail)
        while take > 0:
            line = indent + "'" + tail[:take] + "'" + (semi if take == len(tail) else "")
            if fits(line, max_line):
                chunks.append(line)
                pos += take
                break
            take -= 1
        else:
            chunks.append(indent + "'" + tail[:1] + "'")
            pos += 1
    return chunks


def wrap_is_literal(line: str) -> list[str] | None:
    stripped = line.strip()
    m = re.match(
        r"^(COMMENT ON .+? IS )('(?:''|[^'])*')\s*;?\s*$",
        stripped,
        re.IGNORECASE,
    )
    if not m:
        m = re.match(
            r"^(LABEL ON .+? (?:TEXT )?IS )('(?:''|[^'])*')\s*;?\s*$",
            stripped,
            re.IGNORECASE,
        )
    if not m:
        return None
    indent = line[: len(line) - len(line.lstrip())]
    prefix, literal = m.group(1), m.group(2)
    semi = ";" if stripped.rstrip().endswith(";") else ""
    first = indent + prefix.rstrip()
    if not fits(first):
        first = trim_to_width(first)
    lit_indent = indent + "  "
    lit_lines = split_string_literal(literal, MAX_COL, lit_indent, semi)
    one_line = indent + prefix.rstrip() + literal + semi
    if fits(one_line) and fits(line):
        return [line]
    return [first] + lit_lines


def wrap_alter_fk(line: str) -> list[str] | None:
    stripped = line.strip()
    if not stripped.upper().startswith("ALTER TABLE"):
        return None
    if " REFERENCES " not in stripped.upper():
        return wrap_by_commas(line)
    parts = re.split(r"\s+REFERENCES\s+", stripped, maxsplit=1, flags=re.IGNORECASE)
    if len(parts) != 2:
        return None
    indent = line[: len(line) - len(line.lstrip())]
    left, right = parts[0], "REFERENCES " + parts[1]
    rows = [indent + left]
    cont = indent + "  " + right
    if fits(cont):
        rows.append(cont)
        return rows
    return wrap_by_commas(line)


def wrap_by_commas(line: str) -> list[str]:
    indent = line[: len(line) - len(line.lstrip())]
    stripped = line.strip()
    if fits(line):
        return [line]
    chunks = split_outside_quotes(stripped, ", ")
    if len(chunks) <= 1:
        return wrap_by_words(line)
    rows: list[str] = []
    cur = indent + chunks[0]
    for chunk in chunks[1:]:
        piece = ", " + chunk
        if fits(cur + piece):
            cur += piece
        else:
            rows.append(cur.rstrip())
            cur = indent + "  " + piece.lstrip()
            if not cur.lstrip().startswith(","):
                cur = indent + "  , " + chunk
            if not fits(cur):
                sub = wrap_by_words(cur)
                rows.extend(sub[:-1])
                cur = sub[-1]
    rows.append(cur.rstrip())
    return rows


def wrap_by_words(line: str) -> list[str]:
    indent = line[: len(line) - len(line.lstrip())]
    stripped = line.strip()
    if fits(line):
        return [line]
    words = split_outside_quotes(stripped, " ")
    rows: list[str] = []
    cur = indent
    for w in words:
        if not w:
            continue
        trial = cur + ("" if cur == indent else " ") + w
        if fits(trial):
            cur = trial
        else:
            if cur.strip():
                rows.append(cur.rstrip())
            cur = indent + "  " + w
            if not fits(cur):
                rows.append(trim_to_width(cur))
                cur = indent + "  "
    if cur.strip():
        rows.append(cur.rstrip())
    return rows or [trim_to_width(line)]


def format_line(line: str) -> list[str]:
    if fits(line):
        return [line]
    stripped = line.lstrip()
    if stripped.startswith("--"):
        return wrap_comment(line)
    if re.search(r"\bIS\s+'", stripped, re.IGNORECASE) and (
        stripped.upper().startswith("COMMENT ON")
        or stripped.upper().startswith("LABEL ON")
    ):
        rows = wrap_is_literal(line)
        if rows and all(fits(r) for r in rows):
            return rows
    if stripped.upper().startswith("ALTER TABLE"):
        rows = wrap_alter_fk(line)
        if rows and all(fits(r) for r in rows):
            return rows
    if stripped.upper().startswith("CREATE INDEX"):
        indent = line[: len(line) - len(line.lstrip())]
        m = re.match(r"^(CREATE INDEX \S+ ON )(.+)$", stripped, re.IGNORECASE)
        if m:
            first = indent + m.group(1).rstrip()
            second = indent + "  " + m.group(2)
            if fits(first) and fits(second):
                return [first, second]
    rows = wrap_by_commas(line)
    if all(fits(r) for r in rows):
        return rows
    if "'" not in stripped:
        rows = wrap_by_words(line)
        if all(fits(r) for r in rows):
            return rows
    # Ultimo recurso: partir CHECK/FK largos por AND/OR fuera de comillas
    rows = wrap_by_keywords(line, (" OR ", " AND "))
    if rows and all(fits(r) for r in rows):
        return rows
    return [trim_to_width(line)]


def wrap_by_keywords(line: str, keywords: tuple[str, ...]) -> list[str]:
    indent = line[: len(line) - len(line.lstrip())]
    stripped = line.strip()
    if fits(line):
        return [line]
    for kw in keywords:
        parts = split_outside_quotes(stripped, kw)
        if len(parts) <= 1:
            continue
        rows: list[str] = []
        cur = indent + parts[0]
        for part in parts[1:]:
            piece = kw + part
            if fits(cur + piece):
                cur += piece
            else:
                rows.append(cur.rstrip())
                cur = indent + "  " + piece.lstrip()
        rows.append(cur.rstrip())
        if all(fits(r) for r in rows):
            return rows
    return wrap_by_commas(line)


def normalize_statements(text: str) -> str:
    out: list[str] = []
    in_quote = False
    for ch in text:
        if ch == "'":
            out.append(ch)
            in_quote = not in_quote
            continue
        if in_quote:
            out.append(ch)
            continue
        if ch.isspace():
            continue
        out.append(ch)
    s = "".join(out)
    # Unificar 'a' 'b' (concatenacion por espacio) en 'ab'
    while True:
        ns = re.sub(r"'([^']*)'\s*'([^']*)'", r"'\1\2'", s)
        if ns == s:
            break
        s = ns
    return s


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
    print(f"    lineas: {len(result)} (orig logico desde SET SCHEMA: "
          f"{sum(1 for l in raw_lines if l.strip())})")
    print(f"    max col: {max(col_width(l) for l in result)} (UTF-8 bytes)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
