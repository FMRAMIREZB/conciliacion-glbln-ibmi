**FREE
// =============================================================================
// Nombre del Objeto: GLOUT001                                                  
// DESCRIPCION: Modulo de salida JSON e IFS.                                    
// Objetivo: Construir documento de conciliacion con JSON_OBJECT y              
//           JSON_ARRAYAGG; publicar en ruta IFS parametrizable UTF-8.          
// Tipo de Objeto: Modulo SQLRPGLE (capa de presentacion / salida)              
// Restricciones: Contrato JSON version 1.0.0 segun requerimientos del taller   
// Dependencias: GLCONH, GLCONPRU, GLUTIL001 (WriteIfsUtf8 via BNDSRVPGM)       
// Exporta: OutBuildAndWriteJson, OutWriteErrorJson                             
// Hecho por: Fernando Ramirez, mediante Agentes de IA                          
// Fecha: 2026-06-08                                                            
// Proyecto: Conciliacion GLBLN - Taller IBM i                                  
// =============================================================================
Ctl-Opt Nomain
        DatFmt(*Iso) TimFmt(*Iso) Option(*SrcStmt)
        Debug(*Constants);

/copy QTALLERCP1,GLCONH
/copy QTALLERCP1,GLCONPRU

Exec Sql Set Option Commit = *None;

// -----------------------------------------------------------------------------
// OutBuildAndWriteJson - Arma JSON de conciliacion y lo escribe en IFS
// -----------------------------------------------------------------------------
Dcl-Proc OutBuildAndWriteJson Export;
Dcl-Pi *N int(10);
  pParms   likeds(T_ParmsConc) const;
  pEjec    likeds(T_EjecCtx) const;
  pTotales likeds(T_ControlTot) const;
End-Pi;

  Dcl-s Wrk_JsonDoc sqltype(clob:3200000) loc;
  Dcl-s Wrk_SqlAmbiente char(10) inz('');
  Dcl-s Wrk_SqlBanco char(20) inz('');
  Dcl-s Wrk_SqlSucursal char(20) inz('');
  Dcl-s Wrk_SqlMoneda char(20) inz('');
  Dcl-s Wrk_SqlDesde char(24) inz('');
  Dcl-s Wrk_SqlHasta char(24) inz('');
  Dcl-s Wrk_SqlFecha char(10) inz('');
  Dcl-s Wrk_SqlAnio int(10) inz(0);
  Dcl-s Wrk_SqlMes int(10) inz(0);
  Dcl-s Wrk_SqlTotProc int(10) inz(0);
  Dcl-s Wrk_SqlTotConc int(10) inz(0);
  Dcl-s Wrk_SqlTotDif int(10) inz(0);
  Dcl-s Wrk_SqlSumFuente packed(18:2) inz(0);
  Dcl-s Wrk_SqlSumConc   packed(18:2) inz(0);
  Dcl-s Wrk_SqlSumDifNeta packed(18:2) inz(0);
  Dcl-s Wrk_SqlIdEjec     char(30) inz('');
  Dcl-s Wrk_SqlFechaIni   char(26) inz('');
  Dcl-s Wrk_SqlFechaFin   char(26) inz('');
  Dcl-s Wrk_SqlUsuario    char(10) inz('');
  Dcl-s Wrk_SqlLibreria   char(10) inz('');
  Dcl-s Wrk_SqlEstadoEjec char(15) inz('');
  Dcl-s Wrk_SqlModo       char(10) inz('');
  Dcl-s Wrk_Rc int(10) inz(0);

  Wrk_SqlAmbiente = %trim(pParms.ambiente);
  Wrk_SqlBanco    = %trim(pParms.banco);
  Wrk_SqlSucursal = %trim(pParms.sucursal);
  Wrk_SqlMoneda   = %trim(pParms.moneda);
  Wrk_SqlDesde    = %trim(pParms.cuentaDesde);
  Wrk_SqlHasta    = %trim(pParms.cuentaHasta);
  Wrk_SqlFecha    = %trim(pParms.fechaProceso);
  Wrk_SqlAnio     = pEjec.anio;
  Wrk_SqlMes      = pEjec.mes;
  Wrk_SqlTotProc  = pTotales.totalCuentasProcesadas;
  Wrk_SqlTotConc  = pTotales.totalCuentasConciliadas;
  Wrk_SqlTotDif   = pTotales.totalCuentasConDiferencia;
  Wrk_SqlSumFuente = pTotales.sumatoriaSaldoFinalFuente;
  Wrk_SqlSumConc   = pTotales.sumatoriaSaldoFinalConc;
  Wrk_SqlSumDifNeta = pTotales.sumatoriaDiferenciaNeta;
  Wrk_SqlIdEjec     = %trim(pEjec.idEjecucion);
  Wrk_SqlFechaIni   = %trim(pEjec.fechaHoraIni);
  Wrk_SqlFechaFin   = %trim(pEjec.fechaHoraFin);
  Wrk_SqlUsuario    = %trim(pEjec.usuario);
  Wrk_SqlLibreria   = %trim(pEjec.libreria);
  Wrk_SqlEstadoEjec = %trim(pEjec.estado);
  Wrk_SqlModo       = %trim(pParms.modo);

  Exec Sql
    SELECT JSON_OBJECT(
      'metadata' VALUE JSON_OBJECT(
        'versionEstructura' VALUE TRIM(:C_VERSION_ESTRUCTURA),
        'sistemaOrigen'     VALUE TRIM(:C_SISTEMA_ORIGEN),
        'proceso'           VALUE TRIM(:C_PROCESO),
        'ambiente'          VALUE TRIM(:Wrk_SqlAmbiente),
        'modoEjecucion'     VALUE TRIM(:Wrk_SqlModo),
        'charset'           VALUE TRIM(:C_CHARSET)
      ),
      'ejecucion' VALUE JSON_OBJECT(
        'idEjecucion'     VALUE TRIM(:Wrk_SqlIdEjec),
        'fechaProceso'    VALUE TRIM(:Wrk_SqlFecha),
        'fechaHoraInicio' VALUE TRIM(:Wrk_SqlFechaIni),
        'fechaHoraFin'    VALUE TRIM(:Wrk_SqlFechaFin),
        'usuario'         VALUE TRIM(:Wrk_SqlUsuario),
        'programa'        VALUE TRIM(:C_PROGRAMA),
        'libreria'        VALUE TRIM(:Wrk_SqlLibreria),
        'modo'            VALUE TRIM(:Wrk_SqlModo),
        'estadoEjecucion' VALUE TRIM(:Wrk_SqlEstadoEjec)
      ),
      'contexto' VALUE JSON_OBJECT(
        'banco'    VALUE TRIM(:Wrk_SqlBanco),
        'sucursal' VALUE TRIM(:Wrk_SqlSucursal),
        'moneda'   VALUE TRIM(:Wrk_SqlMoneda),
        'periodo'  VALUE JSON_OBJECT(
          'anio'       VALUE :Wrk_SqlAnio,
          'mes'        VALUE :Wrk_SqlMes,
          'fechaCorte' VALUE TRIM(:Wrk_SqlFecha)
        ),
        'rangoCuentas' VALUE JSON_OBJECT(
          'desde' VALUE TRIM(:Wrk_SqlDesde),
          'hasta' VALUE TRIM(:Wrk_SqlHasta)
        )
      ),
      'cuentas' VALUE COALESCE((
        SELECT JSON_ARRAYAGG(
          JSON_OBJECT(
            'cuentaMayor' VALUE JSON_OBJECT(
              'codigoBanco'       VALUE TRIM(C.CODIGO_BANCO),
              'codigoSucursal'    VALUE TRIM(C.CODIGO_SUCURSAL),
              'codigoMoneda'      VALUE TRIM(C.CODIGO_MONEDA),
              'cuentaContable'    VALUE TRIM(C.CUENTA_CONTABLE),
              'descripcionCuenta' VALUE TRIM(C.DESCRIPCION_CUENTA),
              'naturaleza'        VALUE TRIM(C.NATURALEZA_CUENTA),
              'nivelCuenta'       VALUE INTEGER(TRIM(C.NIVEL_CUENTA)),
              'centroCosto'       VALUE COALESCE(
                (SELECT 'CC' || RIGHT('00' ||
                  TRIM(CHAR(CC.ID)), 3)
                  FROM CCDSC CC
                 WHERE TRIM(CC.OBSERVACIONES) =
                       TRIM(C.CUENTA_CONTABLE)
                   AND CC.ESTADO_REGISTRO = 'A'
                 FETCH FIRST 1 ROW ONLY),
                (SELECT 'CC' || RIGHT('00' ||
                  TRIM(CHAR(CC2.ID)), 3)
                  FROM CCDSC CC2
                 WHERE CC2.ID = 1),
                'CC001')
            ),
            'saldos' VALUE JSON_OBJECT(
              'saldoInicial'         VALUE C.SALDO_INICIAL,
              'debitosPeriodo'       VALUE C.DEBITOS_PERIODO,
              'creditosPeriodo'      VALUE C.CREDITOS_PERIODO,
              'saldoFinalCalculado'  VALUE C.SALDO_FINAL_CALC,
              'saldoFinalFuente'     VALUE C.SALDO_FINAL_FUENTE,
              'saldoFinalConciliado' VALUE C.SALDO_FINAL_CONC
            ),
            'resumenMovimientos' VALUE JSON_OBJECT(
              'cantidadMovimientos' VALUE C.CNT_MOVIMIENTOS,
              'primerMovimiento' VALUE NULLIF(
                REPLACE(TRIM(C.PRIMER_MOVIMIENTO), ' ', 'T'), ''),
              'ultimoMovimiento' VALUE NULLIF(
                REPLACE(TRIM(C.ULTIMO_MOVIMIENTO), ' ', 'T'), '')
            ),
            'partidasConciliatorias' VALUE COALESCE((
              SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                  'idPartida'    VALUE TRIM(P.ID_PARTIDA),
                  'tipo'         VALUE TRIM(P.TIPO),
                  'subtipo'      VALUE TRIM(P.SUBTIPO),
                  'referencia'   VALUE TRIM(P.REFERENCIA),
                  'fechaPartida' VALUE TRIM(P.FECHA_PARTIDA),
                  'monto'        VALUE P.MONTO,
                  'signo'        VALUE TRIM(P.SIGNO),
                  'estado'       VALUE TRIM(P.ESTADO),
                  'origen'       VALUE TRIM(P.ORIGEN),
                  'observacion'  VALUE TRIM(P.OBSERVACION)
                )
              )
              FROM SESSION.GLCONPC P
              WHERE P.SEQ_CUENTA = C.SEQ_CUENTA
            ), JSON_ARRAY()) FORMAT JSON,
            'diferencias' VALUE JSON_OBJECT(
              'diferenciaNeta'      VALUE C.DIFERENCIA_NETA,
              'diferenciaAbsoluta'  VALUE C.DIFERENCIA_ABSOLUTA,
              'toleranciaPermitida' VALUE C.TOLERANCIA,
              'excedeTolerancia'    VALUE CASE
                WHEN UPPER(TRIM(C.EXCEDE_TOLERANCIA)) = 'TRUE'
                THEN TRUE ELSE FALSE END,
              'motivoPrincipal'     VALUE TRIM(C.MOTIVO_PRINCIPAL)
            ),
            'estadoConciliacion' VALUE JSON_OBJECT(
              'codigo'           VALUE TRIM(C.ESTADO_CODIGO),
              'descripcion'      VALUE TRIM(C.ESTADO_DESCRIPCION),
              'severidad'        VALUE TRIM(C.ESTADO_SEVERIDAD),
              'requiereRevision' VALUE CASE
                WHEN UPPER(TRIM(C.REQUIERE_REVISION)) = 'TRUE'
                THEN TRUE ELSE FALSE END
            ),
            'trazabilidad' VALUE JSON_OBJECT(
              'hashCuenta' VALUE TRIM(C.HASH_CUENTA),
              'registrosFuente' VALUE JSON_OBJECT(
                'glbln' VALUE CAST(1 AS INTEGER),
                'trans' VALUE C.CNT_TRANS,
                'trdsc' VALUE C.CNT_TRDSC,
                'ttran' VALUE C.CNT_TTRAN
              )
            )
          )
        )
        FROM SESSION.GLCONCU C
      ), JSON_ARRAY()) FORMAT JSON,
      'controlTotales' VALUE JSON_OBJECT(
        'totalCuentasProcesadas'    VALUE :Wrk_SqlTotProc,
        'totalCuentasConciliadas'   VALUE :Wrk_SqlTotConc,
        'totalCuentasConDiferencia' VALUE :Wrk_SqlTotDif,
        'sumatoriaSaldoFinalFuente' VALUE :Wrk_SqlSumFuente,
        'sumatoriaSaldoFinalConciliado' VALUE :Wrk_SqlSumConc,
        'sumatoriaDiferenciaNeta'   VALUE :Wrk_SqlSumDifNeta
      ),
      'incidentes' VALUE COALESCE((
        SELECT JSON_ARRAYAGG(
          JSON_OBJECT(
            'codigo'         VALUE TRIM(I.CODIGO),
            'tipo'           VALUE TRIM(I.TIPO),
            'cuentaContable' VALUE TRIM(I.CUENTA_CONTABLE),
            'mensaje'        VALUE TRIM(I.MENSAJE),
            'severidad'      VALUE TRIM(I.SEVERIDAD)
          )
        )
        FROM SESSION.GLCONIN I
      ), JSON_ARRAY()) FORMAT JSON
    )
    INTO :Wrk_JsonDoc
    FROM SYSIBM.SYSDUMMY1;

  if Sqlcode < 0;
    Return -1;
  endif;

  Wrk_Rc = WriteIfsUtf8(pParms.rutaIfs: %trim(Wrk_JsonDoc));
  Return Wrk_Rc;

End-Proc;

// -----------------------------------------------------------------------------
// OutWriteErrorJson - JSON minimo cuando falla init SESSION (sin tablas wrk)
// -----------------------------------------------------------------------------
Dcl-Proc OutWriteErrorJson Export;
Dcl-Pi *N int(10);
  pParms     likeds(T_ParmsConc) const;
  pEjec      likeds(T_EjecCtx) const;
  pIncidente likeds(T_Incidente) const;
End-Pi;

  Dcl-s Wrk_JsonDoc sqltype(clob:3200000) loc;
  Dcl-s Wrk_SqlAmbiente char(10) inz('');
  Dcl-s Wrk_SqlBanco char(20) inz('');
  Dcl-s Wrk_SqlSucursal char(20) inz('');
  Dcl-s Wrk_SqlMoneda char(20) inz('');
  Dcl-s Wrk_SqlDesde char(24) inz('');
  Dcl-s Wrk_SqlHasta char(24) inz('');
  Dcl-s Wrk_SqlFecha char(10) inz('');
  Dcl-s Wrk_SqlAnio int(10) inz(0);
  Dcl-s Wrk_SqlMes int(10) inz(0);
  Dcl-s Wrk_SqlIdEjec char(30) inz('');
  Dcl-s Wrk_SqlFechaIni char(26) inz('');
  Dcl-s Wrk_SqlFechaFin char(26) inz('');
  Dcl-s Wrk_SqlUsuario char(10) inz('');
  Dcl-s Wrk_SqlLibreria char(10) inz('');
  Dcl-s Wrk_SqlEstadoEjec char(15) inz('');
  Dcl-s Wrk_SqlIncCodigo char(20) inz('');
  Dcl-s Wrk_SqlIncTipo char(20) inz('');
  Dcl-s Wrk_SqlIncCuenta char(24) inz('');
  Dcl-s Wrk_SqlIncMensaje char(120) inz('');
  Dcl-s Wrk_SqlIncSeveridad char(10) inz('');
  Dcl-s Wrk_SqlModo char(10) inz('');
  Dcl-s Wrk_Rc int(10) inz(0);

  Wrk_SqlAmbiente    = %trim(pParms.ambiente);
  Wrk_SqlBanco       = %trim(pParms.banco);
  Wrk_SqlSucursal    = %trim(pParms.sucursal);
  Wrk_SqlMoneda      = %trim(pParms.moneda);
  Wrk_SqlDesde       = %trim(pParms.cuentaDesde);
  Wrk_SqlHasta       = %trim(pParms.cuentaHasta);
  Wrk_SqlFecha       = %trim(pParms.fechaProceso);
  Wrk_SqlAnio        = pEjec.anio;
  Wrk_SqlMes         = pEjec.mes;
  Wrk_SqlIdEjec      = %trim(pEjec.idEjecucion);
  Wrk_SqlFechaIni    = %trim(pEjec.fechaHoraIni);
  Wrk_SqlFechaFin    = %trim(pEjec.fechaHoraFin);
  Wrk_SqlUsuario     = %trim(pEjec.usuario);
  Wrk_SqlLibreria    = %trim(pEjec.libreria);
  Wrk_SqlEstadoEjec  = %trim(pEjec.estado);
  Wrk_SqlIncCodigo   = %trim(pIncidente.codigo);
  Wrk_SqlIncTipo     = %trim(pIncidente.tipo);
  Wrk_SqlIncCuenta   = %trim(pIncidente.cuentaContable);
  Wrk_SqlIncMensaje  = %trim(pIncidente.mensaje);
  Wrk_SqlIncSeveridad = %trim(pIncidente.severidad);
  Wrk_SqlModo         = %trim(pParms.modo);

  Exec Sql
    SELECT JSON_OBJECT(
      'metadata' VALUE JSON_OBJECT(
        'versionEstructura' VALUE TRIM(:C_VERSION_ESTRUCTURA),
        'sistemaOrigen'     VALUE TRIM(:C_SISTEMA_ORIGEN),
        'proceso'           VALUE TRIM(:C_PROCESO),
        'ambiente'          VALUE TRIM(:Wrk_SqlAmbiente),
        'modoEjecucion'     VALUE TRIM(:Wrk_SqlModo),
        'charset'           VALUE TRIM(:C_CHARSET)
      ),
      'ejecucion' VALUE JSON_OBJECT(
        'idEjecucion'     VALUE TRIM(:Wrk_SqlIdEjec),
        'fechaProceso'    VALUE TRIM(:Wrk_SqlFecha),
        'fechaHoraInicio' VALUE TRIM(:Wrk_SqlFechaIni),
        'fechaHoraFin'    VALUE TRIM(:Wrk_SqlFechaFin),
        'usuario'         VALUE TRIM(:Wrk_SqlUsuario),
        'programa'        VALUE TRIM(:C_PROGRAMA),
        'libreria'        VALUE TRIM(:Wrk_SqlLibreria),
        'modo'            VALUE TRIM(:Wrk_SqlModo),
        'estadoEjecucion' VALUE TRIM(:Wrk_SqlEstadoEjec)
      ),
      'contexto' VALUE JSON_OBJECT(
        'banco'    VALUE TRIM(:Wrk_SqlBanco),
        'sucursal' VALUE TRIM(:Wrk_SqlSucursal),
        'moneda'   VALUE TRIM(:Wrk_SqlMoneda),
        'periodo'  VALUE JSON_OBJECT(
          'anio'       VALUE :Wrk_SqlAnio,
          'mes'        VALUE :Wrk_SqlMes,
          'fechaCorte' VALUE TRIM(:Wrk_SqlFecha)
        ),
        'rangoCuentas' VALUE JSON_OBJECT(
          'desde' VALUE TRIM(:Wrk_SqlDesde),
          'hasta' VALUE TRIM(:Wrk_SqlHasta)
        )
      ),
      'cuentas' VALUE JSON_ARRAY() FORMAT JSON,
      'controlTotales' VALUE JSON_OBJECT(
        'totalCuentasProcesadas'    VALUE 0,
        'totalCuentasConciliadas'   VALUE 0,
        'totalCuentasConDiferencia' VALUE 0,
        'sumatoriaSaldoFinalFuente' VALUE 0,
        'sumatoriaSaldoFinalConciliado' VALUE 0,
        'sumatoriaDiferenciaNeta'   VALUE 0
      ),
      'incidentes' VALUE JSON_ARRAY(
        JSON_OBJECT(
          'codigo'         VALUE TRIM(:Wrk_SqlIncCodigo),
          'tipo'           VALUE TRIM(:Wrk_SqlIncTipo),
          'cuentaContable' VALUE TRIM(:Wrk_SqlIncCuenta),
          'mensaje'        VALUE TRIM(:Wrk_SqlIncMensaje),
          'severidad'      VALUE TRIM(:Wrk_SqlIncSeveridad)
        )
      ) FORMAT JSON
    )
    INTO :Wrk_JsonDoc
    FROM SYSIBM.SYSDUMMY1;

  if Sqlcode < 0;
    Return -1;
  endif;

  Wrk_Rc = WriteIfsUtf8(pParms.rutaIfs: %trim(Wrk_JsonDoc));
  Return Wrk_Rc;

End-Proc;
