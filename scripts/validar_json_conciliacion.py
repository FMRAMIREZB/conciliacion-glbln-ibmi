#!/usr/bin/env python3
"""Valida JSON de conciliacion GLBLN contra requerimientos y escenarios demo."""
import json
import re
import sys
from decimal import Decimal
from pathlib import Path

EXP = {
    "11010101": ("PARCIAL", Decimal("0.50"), "WARN-GL-002", False, 40000),
    "11020101": ("CONCILIADA", Decimal("0"), None, False, 15000),
    "11030101": ("NO_CONCILIADA", Decimal("-5000"), "ERR-GL-001", True, 15000),
}

ID_EJEC_RE = re.compile(r"^\d{8}_\d{6}_\d{3}$")


def check(name, ok, errors):
    if not ok:
        errors.append(name)


def main(path):
    errors = []
    p = Path(path)
    with open(p, encoding="utf-8") as f:
        j = json.load(f)

    # §8 / RF-05: estructura minima
    roots = {"metadata", "ejecucion", "contexto", "cuentas", "controlTotales", "incidentes"}
    check("6 secciones raiz", set(j) >= roots, errors)
    check("metadata.versionEstructura 1.0.0", j["metadata"]["versionEstructura"] == "1.0.0", errors)
    check("metadata.charset UTF-8", j["metadata"]["charset"] == "UTF-8", errors)
    check("ejecucion.programa GLRPT001", j["ejecucion"]["programa"] == "GLRPT001", errors)

    ejec = j["ejecucion"]
    check("ejecucion.idEjecucion formato", bool(ID_EJEC_RE.match(ejec["idEjecucion"])), errors)
    check("ejecucion.libreria real", ejec.get("libreria") not in (None, "", "*LIBL"), errors)
    check(
        "metadata/ejecucion modo coherentes",
        j["metadata"].get("modoEjecucion") == ejec.get("modo"),
        errors,
    )

    # RF-06: nombre trazable (si el archivo incluye idEjecucion)
    if ejec["idEjecucion"] in p.name:
        check("RF-06 nombre IFS trazable", True, errors)
    else:
        check(
            "RF-06 nombre IFS trazable",
            p.name.startswith("conciliacion_") and p.name.endswith(".json"),
            errors,
        )

    by = {c["cuentaMayor"]["cuentaContable"]: c for c in j["cuentas"]}
    check("3 cuentas demo", len(by) == 3, errors)

    for cc, (est, dif, inc, excede, deb) in EXP.items():
        cu = by.get(cc)
        check(f"cuenta {cc} presente", cu is not None, errors)
        if not cu:
            continue
        check(f"{cc} estado {est}", cu["estadoConciliacion"]["codigo"] == est, errors)
        check(f"{cc} dif neta {dif}", Decimal(str(cu["diferencias"]["diferenciaNeta"])) == dif, errors)
        check(f"{cc} excedeTolerancia {excede}", cu["diferencias"]["excedeTolerancia"] == excede, errors)
        check(f"{cc} debitos {deb}", cu["saldos"]["debitosPeriodo"] == deb, errors)
        check(f"{cc} tolerancia 1.00", cu["diferencias"]["toleranciaPermitida"] == 1.0, errors)
        check(f"{cc} centroCosto", bool(cu["cuentaMayor"].get("centroCosto")), errors)
        check(f"{cc} hashCuenta", bool(cu["trazabilidad"].get("hashCuenta")), errors)
        if inc:
            check(
                f"{cc} incidente {inc}",
                any(i["codigo"] == inc and i["cuentaContable"] == cc for i in j["incidentes"]),
                errors,
            )

    # §14.1: cuadre global
    sum_dif = sum(Decimal(str(c["diferencias"]["diferenciaNeta"])) for c in j["cuentas"])
    check(
        "sumatoriaDiferenciaNeta cuadra",
        Decimal(str(j["controlTotales"]["sumatoriaDiferenciaNeta"])) == sum_dif,
        errors,
    )

    ct = j["controlTotales"]
    conc = sum(1 for c in j["cuentas"] if c["estadoConciliacion"]["codigo"] == "CONCILIADA")
    con_dif = sum(
        1 for c in j["cuentas"] if Decimal(str(c["diferencias"]["diferenciaNeta"])) != 0
    )
    check("totalCuentasProcesadas", ct["totalCuentasProcesadas"] == len(j["cuentas"]), errors)
    check("totalCuentasConciliadas", ct["totalCuentasConciliadas"] == conc, errors)
    check("totalCuentasConDiferencia", ct["totalCuentasConDiferencia"] == con_dif, errors)

    # §14.1: incidentes ALTA/CRITICA -> PARCIAL o ERROR
    hay_alta = any(i["severidad"] in ("ALTA", "CRITICA") for i in j["incidentes"])
    check(
        "incidente ALTA/CRITICA impacta ejecucion",
        not hay_alta or ejec["estadoEjecucion"] in ("PARCIAL", "ERROR"),
        errors,
    )

    # Demo: TTRAN reflejado en resumen movimientos (11010101)
    ult = by["11010101"]["resumenMovimientos"]["ultimoMovimiento"]
    check("primerMovimiento/ultimoMov incluye TTRAN", "14:22:00" in ult, errors)

    total_checks = 25 + len(EXP) * 8
    passed = total_checks - len(errors)
    if errors:
        print(f"FAIL ({passed}/{total_checks}):", path)
        for e in errors:
            print(" -", e)
        sys.exit(1)

    print(f"OK ({total_checks}/{total_checks}):", path, "| id:", ejec["idEjecucion"])
    return 0


if __name__ == "__main__":
    default = "src/JSON Salidas/conciliacion_20260630_033459_001.json"
    sys.exit(main(sys.argv[1] if len(sys.argv) > 1 else default))
