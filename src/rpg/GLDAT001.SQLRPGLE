**FREE
// =============================================================================
// Nombre del Objeto: GLDAT001                                                  
// DESCRIPCION: Modulo de acceso a datos de conciliacion GLBLN.                 
// Objetivo: Consultar GLBLN, TRANS, TTRAN y TRDSC; poblar tablas SESSION       
//           de trabajo para armado del JSON de salida.                         
// Tipo de Objeto: Modulo SQLRPGLE (capa de acceso a datos)                     
// Restricciones: Tablas SESSION declaradas sin PRIMARY KEY; DECIMAL(p, s)      
//           con espacio tras la coma en SQL embebido                           
// Dependencias: GLCONH (/COPY), esquema GLBLN/GLMST/TRANS/TTRAN/TRDSC          
// Exporta: DatInitWorkTables, DatClearWorkTables, DatOpenGlblnCursor,          
//          DatFetchGlbln, DatCloseGlblnCursor, DatLoadMovimientos, ...         
// Hecho por: Fernando Ramirez, mediante Agentes de IA                          
// Fecha: 2026-06-08                                                            
// Proyecto: Conciliacion GLBLN - Taller IBM i                                  
// =============================================================================
Ctl-Opt Nomain
        DatFmt(*Iso) TimFmt(*Iso) Option(*SrcStmt)
        Debug(*Constants);

/copy QTALLERCP1,GLCONH

Dcl-s Wrk_SqlBanco    char(20) inz('');
Dcl-s Wrk_SqlSucursal char(20) inz('');
Dcl-s Wrk_SqlMoneda   char(20) inz('');
Dcl-s Wrk_SqlDesde    char(24) inz('');
Dcl-s Wrk_SqlHasta    char(24) inz('');
Dcl-s Wrk_SqlFecha    char(10) inz('');

// -----------------------------------------------------------------------------
// DatInitWorkTables - Declara tablas temporales SESSION de trabajo
// -----------------------------------------------------------------------------
Dcl-Proc DatInitWorkTables Export;
Dcl-Pi *N int(10);
End-Pi;

  Exec Sql
    DECLARE GLOBAL TEMPORARY TABLE SESSION.GLCONCU (
      SEQ_CUENTA            INTEGER NOT NULL,
      CODIGO_BANCO          VARCHAR(20),
      CODIGO_SUCURSAL       VARCHAR(20),
      CODIGO_MONEDA         VARCHAR(20),
      CUENTA_CONTABLE       VARCHAR(24),
      DESCRIPCION_CUENTA    VARCHAR(120),
      NATURALEZA_CUENTA     VARCHAR(20),
      NIVEL_CUENTA          VARCHAR(50),
      SALDO_INICIAL         DECIMAL(18, 2),
      DEBITOS_PERIODO       DECIMAL(18, 2),
      CREDITOS_PERIODO      DECIMAL(18, 2),
      SALDO_FINAL_CALC      DECIMAL(18, 2),
      SALDO_FINAL_FUENTE    DECIMAL(18, 2),
      SALDO_FINAL_CONC      DECIMAL(18, 2),
      CNT_MOVIMIENTOS       INTEGER,
      PRIMER_MOVIMIENTO     VARCHAR(26),
      ULTIMO_MOVIMIENTO     VARCHAR(26),
      CNT_TRANS             INTEGER,
      CNT_TRDSC             INTEGER,
      CNT_TTRAN             INTEGER,
      DIFERENCIA_NETA       DECIMAL(18, 2),
      DIFERENCIA_ABSOLUTA   DECIMAL(18, 2),
      TOLERANCIA            DECIMAL(18, 2),
      EXCEDE_TOLERANCIA     VARCHAR(5),
      MOTIVO_PRINCIPAL      VARCHAR(80),
      ESTADO_CODIGO         VARCHAR(20),
      ESTADO_DESCRIPCION    VARCHAR(80),
      ESTADO_SEVERIDAD      VARCHAR(10),
      REQUIERE_REVISION     VARCHAR(5),
      HASH_CUENTA           VARCHAR(32)
    ) ON COMMIT PRESERVE ROWS NOT LOGGED WITH REPLACE;

  Exec Sql
    DECLARE GLOBAL TEMPORARY TABLE SESSION.GLCONPC (
      SEQ_CUENTA            INTEGER NOT NULL,
      SEQ_PARTIDA           INTEGER NOT NULL,
      ID_PARTIDA            VARCHAR(20),
      TIPO                  VARCHAR(20),
      SUBTIPO               VARCHAR(30),
      REFERENCIA            VARCHAR(40),
      FECHA_PARTIDA         VARCHAR(10),
      MONTO                 DECIMAL(18, 2),
      SIGNO                 VARCHAR(10),
      ESTADO                VARCHAR(15),
      ORIGEN                VARCHAR(10),
      OBSERVACION           VARCHAR(120)
    ) ON COMMIT PRESERVE ROWS NOT LOGGED WITH REPLACE;

  Exec Sql
    DECLARE GLOBAL TEMPORARY TABLE SESSION.GLCONIN (
      SEQ_INCIDENTE         INTEGER NOT NULL,
      CODIGO                VARCHAR(20),
      TIPO                  VARCHAR(20),
      CUENTA_CONTABLE       VARCHAR(24),
      MENSAJE               VARCHAR(120),
      SEVERIDAD             VARCHAR(10)
    ) ON COMMIT PRESERVE ROWS NOT LOGGED WITH REPLACE;

  if Sqlcode < 0;
    Return -1;
  endif;
  Return 0;

End-Proc;

// -----------------------------------------------------------------------------
// DatClearWorkTables - Vacia tablas temporales SESSION
// -----------------------------------------------------------------------------
Dcl-Proc DatClearWorkTables Export;
Dcl-Pi *N int(10);
End-Pi;
  Exec Sql DELETE FROM SESSION.GLCONCU;
  Exec Sql DELETE FROM SESSION.GLCONPC;
  Exec Sql DELETE FROM SESSION.GLCONIN;
  Return 0;
End-Proc;

// -----------------------------------------------------------------------------
// DatOpenGlblnCursor - Abre cursor de cuentas mayores filtradas
// -----------------------------------------------------------------------------
Dcl-Proc DatOpenGlblnCursor Export;
Dcl-Pi *N int(10);
  pParms likeds(T_ParmsConc) const;
End-Pi;

  Wrk_SqlBanco    = pParms.banco;
  Wrk_SqlSucursal = pParms.sucursal;
  Wrk_SqlMoneda   = pParms.moneda;
  Wrk_SqlDesde    = pParms.cuentaDesde;
  Wrk_SqlHasta    = pParms.cuentaHasta;

  Exec Sql
    DECLARE C_GLBLN CURSOR FOR
      SELECT G.CODIGO_BANCO,
             G.CODIGO_SUCURSAL,
             G.CODIGO_MONEDA,
             G.CUENTA_CONTABLE,
             COALESCE(M.DESCRIPCION_CUENTA, G.DESCRIPCION_CUENTA, ' ') ,
             COALESCE(M.NATURALEZA_CUENTA, G.NATURALEZA_CUENTA, 'DEUDORA'),
             COALESCE(M.NIVEL_CUENTA, G.NIVEL_CUENTA, '4'),
             G.SALDO_ACTUAL
        FROM GLBLN G
        LEFT JOIN GLMST M
          ON M.CODIGO_BANCO = G.CODIGO_BANCO
         AND M.CODIGO_MONEDA = G.CODIGO_MONEDA
         AND M.CUENTA_CONTABLE = G.CUENTA_CONTABLE
       WHERE G.CODIGO_BANCO    = :Wrk_SqlBanco
         AND G.CODIGO_SUCURSAL = :Wrk_SqlSucursal
         AND G.CODIGO_MONEDA   = :Wrk_SqlMoneda
         AND G.CUENTA_CONTABLE BETWEEN :Wrk_SqlDesde AND :Wrk_SqlHasta
       ORDER BY G.CUENTA_CONTABLE
       FOR READ ONLY;

  Exec Sql OPEN C_GLBLN;
  if Sqlcode < 0;
    Return -1;
  endif;
  Return 0;

End-Proc;

// -----------------------------------------------------------------------------
// DatFetchGlbln - Lee siguiente fila del cursor GLBLN
// -----------------------------------------------------------------------------
Dcl-Proc DatFetchGlbln Export;
Dcl-Pi *N int(10);
  pCuenta likeds(T_CuentaGlbln);
End-Pi;

  Exec Sql
    FETCH C_GLBLN INTO :pCuenta.codigoBanco,
                       :pCuenta.codigoSucursal,
                       :pCuenta.codigoMoneda,
                       :pCuenta.cuentaContable,
                       :pCuenta.descripcionCuenta,
                       :pCuenta.naturalezaCuenta,
                       :pCuenta.nivelCuenta,
                       :pCuenta.saldoFuente;

  if Sqlcode = 100;
    Return 1;
  elseif Sqlcode < 0;
    Return -1;
  endif;

  Return 0;

End-Proc;

// -----------------------------------------------------------------------------
// DatCloseGlblnCursor - Cierra cursor de cuentas mayores
// -----------------------------------------------------------------------------
Dcl-Proc DatCloseGlblnCursor Export;
Dcl-Pi *N int(10);
End-Pi;
  Exec Sql CLOSE C_GLBLN;
  Return 0;
End-Proc;

// -----------------------------------------------------------------------------
// DatLoadMovimientos - Carga resumen y totales de movimientos por cuenta
// -----------------------------------------------------------------------------
Dcl-Proc DatLoadMovimientos Export;
Dcl-Pi *N int(10);
  pCuenta  likeds(T_CuentaGlbln) const;
  pParms   likeds(T_ParmsConc) const;
  pResumen likeds(T_ResumenMov);
  pDebitos packed(18:2);
  pCreditos packed(18:2);
End-Pi;

  Dcl-s Wrk_CntTrans packed(9:0) inz(0);
  Dcl-s Wrk_CntTtranAll packed(9:0) inz(0);
  Dcl-s Wrk_CntTrdsc packed(9:0) inz(0);
  Dcl-s Wrk_DebTrans packed(18:2) inz(0);
  Dcl-s Wrk_CreTrans packed(18:2) inz(0);
  Dcl-s Wrk_DebTtran packed(18:2) inz(0);
  Dcl-s Wrk_CreTtran packed(18:2) inz(0);
  Dcl-s Wrk_PriMov   char(26) inz('');
  Dcl-s Wrk_UltMov   char(26) inz('');
  Dcl-s Wrk_CntMov   packed(9:0) inz(0);

  Wrk_SqlBanco    = pCuenta.codigoBanco;
  Wrk_SqlSucursal = pCuenta.codigoSucursal;
  Wrk_SqlMoneda   = pCuenta.codigoMoneda;
  Wrk_SqlDesde    = pCuenta.cuentaContable;
  Wrk_SqlFecha    = pParms.fechaProceso;

  Exec Sql
    SELECT COALESCE(COUNT(*), 0),
           COALESCE(SUM(CASE WHEN DEBITO_CREDITO = 'D'
                        THEN MONTO ELSE 0 END), 0),
           COALESCE(SUM(CASE WHEN DEBITO_CREDITO = 'C'
                        THEN MONTO ELSE 0 END), 0)
      INTO :Wrk_CntTrans, :Wrk_DebTrans, :Wrk_CreTrans
      FROM TRANS
     WHERE CODIGO_BANCO    = :Wrk_SqlBanco
       AND CODIGO_SUCURSAL = :Wrk_SqlSucursal
       AND CODIGO_MONEDA   = :Wrk_SqlMoneda
       AND CUENTA_CONTABLE = :Wrk_SqlDesde
       AND FECHA_OPERACION <= CAST(:Wrk_SqlFecha AS DATE);

  Exec Sql
    SELECT COALESCE(COUNT(*), 0)
      INTO :Wrk_CntTtranAll
      FROM TTRAN
     WHERE CODIGO_BANCO    = :Wrk_SqlBanco
       AND CODIGO_SUCURSAL = :Wrk_SqlSucursal
       AND CODIGO_MONEDA   = :Wrk_SqlMoneda
       AND CUENTA_CONTABLE = :Wrk_SqlDesde
       AND FECHA           = CAST(:Wrk_SqlFecha AS DATE);

  Exec Sql
    SELECT COALESCE(SUM(CASE WHEN DEBITO_CREDITO = 'D'
                        THEN MONTO ELSE 0 END), 0),
           COALESCE(SUM(CASE WHEN DEBITO_CREDITO = 'C'
                        THEN MONTO ELSE 0 END), 0)
      INTO :Wrk_DebTtran, :Wrk_CreTtran
      FROM TTRAN
     WHERE CODIGO_BANCO    = :Wrk_SqlBanco
       AND CODIGO_SUCURSAL = :Wrk_SqlSucursal
       AND CODIGO_MONEDA   = :Wrk_SqlMoneda
       AND CUENTA_CONTABLE = :Wrk_SqlDesde
       AND FECHA           = CAST(:Wrk_SqlFecha AS DATE)
       AND ESTADO_TRANSACCION NOT IN ('PENDIENTE', 'TRANSITO');

  Exec Sql
    SELECT COALESCE(COUNT(DISTINCT D.NUMERO_REGISTRO_RELATIVO), 0)
      INTO :Wrk_CntTrdsc
      FROM TRDSC D
     INNER JOIN TRANS T
        ON T.NUMERO_REGISTRO_RELATIVO = D.NUMERO_REGISTRO_RELATIVO
     WHERE T.CODIGO_BANCO    = :Wrk_SqlBanco
       AND T.CODIGO_SUCURSAL = :Wrk_SqlSucursal
       AND T.CODIGO_MONEDA   = :Wrk_SqlMoneda
       AND T.CUENTA_CONTABLE = :Wrk_SqlDesde
       AND T.FECHA_OPERACION <= CAST(:Wrk_SqlFecha AS DATE);

  Exec Sql
    SELECT COALESCE(MIN(M.TS_MOV), ' '),
           COALESCE(MAX(M.TS_MOV), ' ')
      INTO :Wrk_PriMov, :Wrk_UltMov
      FROM (
        SELECT VARCHAR_FORMAT(
                 TIMESTAMP(CAST(T.FECHA_OPERACION AS DATE),
                           T.HORA_OPERACION),
                 'YYYY-MM-DD HH24:MI:SS') AS TS_MOV
          FROM TRANS T
         WHERE T.CODIGO_BANCO    = :Wrk_SqlBanco
           AND T.CODIGO_SUCURSAL = :Wrk_SqlSucursal
           AND T.CODIGO_MONEDA   = :Wrk_SqlMoneda
           AND T.CUENTA_CONTABLE = :Wrk_SqlDesde
           AND T.FECHA_OPERACION <= CAST(:Wrk_SqlFecha AS DATE)
        UNION ALL
        SELECT VARCHAR_FORMAT(
                 TIMESTAMP(CAST(TT.FECHA AS DATE),
                           TT.HORA_OPERACION),
                 'YYYY-MM-DD HH24:MI:SS')
          FROM TTRAN TT
         WHERE TT.CODIGO_BANCO    = :Wrk_SqlBanco
           AND TT.CODIGO_SUCURSAL = :Wrk_SqlSucursal
           AND TT.CODIGO_MONEDA   = :Wrk_SqlMoneda
           AND TT.CUENTA_CONTABLE = :Wrk_SqlDesde
           AND TT.FECHA           = CAST(:Wrk_SqlFecha AS DATE)
      ) AS M;

  pDebitos  = Wrk_DebTrans + Wrk_DebTtran;
  pCreditos = Wrk_CreTrans + Wrk_CreTtran;
  Wrk_CntMov = Wrk_CntTrans + Wrk_CntTtranAll;

  pResumen.cantidadMovimientos = Wrk_CntMov;
  pResumen.primerMovimiento    = %trim(Wrk_PriMov);
  pResumen.ultimoMovimiento    = %trim(Wrk_UltMov);
  pResumen.cntTrans            = Wrk_CntTrans;
  pResumen.cntTtran            = Wrk_CntTtranAll;
  pResumen.cntTrdsc            = Wrk_CntTrdsc;

  Return 0;

End-Proc;

// -----------------------------------------------------------------------------
// DatLoadPartidas - Carga partidas conciliatorias pendientes (TTRAN)
// -----------------------------------------------------------------------------
Dcl-Proc DatLoadPartidas Export;
Dcl-Pi *N int(10);
  pCuenta       likeds(T_CuentaGlbln) const;
  pParms        likeds(T_ParmsConc) const;
  pPartidas     likeds(T_PartidaConc) dim(C_MAX_PARTIDAS);
  pCantPartidas int(10);
End-Pi;

  Dcl-s Wrk_Idx int(10) inz(0);
  Dcl-ds Ds_PartidaConc likeds(T_PartidaConc) inz;

  Wrk_SqlBanco    = pCuenta.codigoBanco;
  Wrk_SqlSucursal = pCuenta.codigoSucursal;
  Wrk_SqlMoneda   = pCuenta.codigoMoneda;
  Wrk_SqlDesde    = pCuenta.cuentaContable;
  Wrk_SqlFecha    = pParms.fechaProceso;
  pCantPartidas = 0;

  Exec Sql
    DECLARE C_PART CURSOR FOR
      SELECT 'PC-' CONCAT TRIM(CHAR(T.ID_TRANSACCION_DIA)),
             CASE WHEN T.ESTADO_TRANSACCION = 'PENDIENTE'
                  THEN 'TRANSITO' ELSE 'AJUSTE' END,
             COALESCE(D.TIPO_DESCRIPCION, 'GENERICO'),
             COALESCE(T.REFERENCIA_EXTERNA, ' '),
             VARCHAR_FORMAT(T.FECHA, 'YYYY-MM-DD'),
             T.MONTO,
             CASE WHEN T.DEBITO_CREDITO = 'D'
                  THEN 'DEBITO' ELSE 'CREDITO' END,
             COALESCE(T.ESTADO_TRANSACCION, 'PENDIENTE'),
             'TTRAN',
             COALESCE(D.TEXTO_DESCRIPCION, T.OBSERVACIONES, ' ')
        FROM TTRAN T
        LEFT JOIN TRDSC D
          ON D.NUMERO_REGISTRO_RELATIVO = T.NUMERO_REGISTRO_RELATIVO
       WHERE T.CODIGO_BANCO    = :Wrk_SqlBanco
         AND T.CODIGO_SUCURSAL = :Wrk_SqlSucursal
         AND T.CODIGO_MONEDA   = :Wrk_SqlMoneda
         AND T.CUENTA_CONTABLE = :Wrk_SqlDesde
         AND T.FECHA           = CAST(:Wrk_SqlFecha AS DATE)
         AND (T.ESTADO_TRANSACCION = 'PENDIENTE'
              OR T.ESTADO_TRANSACCION = 'TRANSITO')
       FOR READ ONLY;

  Exec Sql OPEN C_PART;

  dow *on;
    clear Ds_PartidaConc;

    Exec Sql
      FETCH C_PART INTO :Ds_PartidaConc.idPartida,
                        :Ds_PartidaConc.tipo,
                        :Ds_PartidaConc.subtipo,
                        :Ds_PartidaConc.referencia,
                        :Ds_PartidaConc.fechaPartida,
                        :Ds_PartidaConc.monto,
                        :Ds_PartidaConc.signo,
                        :Ds_PartidaConc.estado,
                        :Ds_PartidaConc.origen,
                        :Ds_PartidaConc.observacion;

    if Sqlcode = 100;
      leave;
    elseif Sqlcode < 0;
      leave;
    endif;

    Wrk_Idx += 1;
    if Wrk_Idx >= C_MAX_PARTIDAS;
      leave;
    endif;

    Eval-Corr pPartidas(Wrk_Idx) = Ds_PartidaConc;
  enddo;

  Exec Sql CLOSE C_PART;
  pCantPartidas = Wrk_Idx;

  Return 0;

End-Proc;

// -----------------------------------------------------------------------------
// DatResolveCentroCosto - Obtiene centro de costo desde CCDSC
// -----------------------------------------------------------------------------
Dcl-Proc DatResolveCentroCosto Export;
Dcl-Pi *N;
  pCuenta likeds(T_CuentaGlbln);
End-Pi;

  Wrk_SqlDesde = pCuenta.cuentaContable;

  Exec Sql
    SELECT COALESCE(
      (SELECT 'CC' || RIGHT('00' || TRIM(CHAR(C.ID)), 3)
         FROM CCDSC C
        WHERE TRIM(C.OBSERVACIONES) = TRIM(:Wrk_SqlDesde)
          AND C.ESTADO_REGISTRO = 'A'
        FETCH FIRST 1 ROW ONLY),
      (SELECT 'CC' || RIGHT('00' || TRIM(CHAR(C.ID)), 3)
         FROM CCDSC C
        WHERE C.ID = 1),
      'CC001')
    INTO :pCuenta.centroCosto
    FROM SYSIBM.SYSDUMMY1;

  if Sqlcode < 0 or %trim(pCuenta.centroCosto) = '';
    pCuenta.centroCosto = 'CC001';
  endif;
  pCuenta.centroCosto = %trim(pCuenta.centroCosto);

End-Proc;

// -----------------------------------------------------------------------------
// DatInsertCuentaWrk - Inserta fila de cuenta en SESSION.GLCONCU
// -----------------------------------------------------------------------------
Dcl-Proc DatInsertCuentaWrk Export;
Dcl-Pi *N int(10);
  pSeq     int(10) const;
  pCuenta  likeds(T_CuentaGlbln) const;
  pSaldos  likeds(T_SaldosCuenta) const;
  pResumen likeds(T_ResumenMov) const;
  pDif     likeds(T_DifConc) const;
  pEstado  likeds(T_EstadoConc) const;
  pHash    char(32) const;
End-Pi;

  Exec Sql
    INSERT INTO SESSION.GLCONCU VALUES (
      :pSeq,
      :pCuenta.codigoBanco,
      :pCuenta.codigoSucursal,
      :pCuenta.codigoMoneda,
      :pCuenta.cuentaContable,
      :pCuenta.descripcionCuenta,
      :pCuenta.naturalezaCuenta,
      :pCuenta.nivelCuenta,
      :pSaldos.saldoInicial,
      :pSaldos.debitosPeriodo,
      :pSaldos.creditosPeriodo,
      :pSaldos.saldoFinalCalculado,
      :pSaldos.saldoFinalFuente,
      :pSaldos.saldoFinalConciliado,
      :pResumen.cantidadMovimientos,
      :pResumen.primerMovimiento,
      :pResumen.ultimoMovimiento,
      :pResumen.cntTrans,
      :pResumen.cntTrdsc,
      :pResumen.cntTtran,
      :pDif.diferenciaNeta,
      :pDif.diferenciaAbsoluta,
      :pDif.toleranciaPermitida,
      :pDif.excedeTolerancia,
      :pDif.motivoPrincipal,
      :pEstado.codigo,
      :pEstado.descripcion,
      :pEstado.severidad,
      :pEstado.requiereRevision,
      :pHash
    );

  if Sqlcode < 0;
    Return -1;
  endif;
  Return 0;

End-Proc;

// -----------------------------------------------------------------------------
// DatInsertPartidaWrk - Inserta partida en SESSION.GLCONPC
// -----------------------------------------------------------------------------
Dcl-Proc DatInsertPartidaWrk Export;
Dcl-Pi *N int(10);
  pSeqCuenta int(10) const;
  pPartida   likeds(T_PartidaConc) const;
End-Pi;

  Dcl-s Wrk_SeqPartida int(10) inz(0);

  Exec Sql
    SELECT COALESCE(MAX(SEQ_PARTIDA), 0) + 1
      INTO :Wrk_SeqPartida
      FROM SESSION.GLCONPC
     WHERE SEQ_CUENTA = :pSeqCuenta;

  Exec Sql
    INSERT INTO SESSION.GLCONPC VALUES (
      :pSeqCuenta, :Wrk_SeqPartida,
      :pPartida.idPartida,
      :pPartida.tipo,
      :pPartida.subtipo,
      :pPartida.referencia,
      :pPartida.fechaPartida,
      :pPartida.monto,
      :pPartida.signo,
      :pPartida.estado,
      :pPartida.origen,
      :pPartida.observacion
    );

  Return 0;

End-Proc;

// -----------------------------------------------------------------------------
// DatInsertIncidentWrk - Inserta incidente en SESSION.GLCONIN
// -----------------------------------------------------------------------------
Dcl-Proc DatInsertIncidentWrk Export;
Dcl-Pi *N int(10);
  pIncidente likeds(T_Incidente) const;
End-Pi;

  Dcl-s Wrk_SeqIncidente int(10) inz(0);

  Exec Sql
    SELECT COALESCE(MAX(SEQ_INCIDENTE), 0) + 1
      INTO :Wrk_SeqIncidente
      FROM SESSION.GLCONIN;

  Exec Sql
    INSERT INTO SESSION.GLCONIN
      (SEQ_INCIDENTE, CODIGO, TIPO, CUENTA_CONTABLE, MENSAJE, SEVERIDAD)
    VALUES
      (:Wrk_SeqIncidente,
       :pIncidente.codigo,
       :pIncidente.tipo,
       :pIncidente.cuentaContable,
       :pIncidente.mensaje,
       :pIncidente.severidad);

  Return 0;

End-Proc;
