**FREE
// =============================================================================
// Nombre del Objeto: GLRPT001                                                  
// DESCRIPCION: Programa principal de conciliacion GLBLN.                       
// Objetivo: Orquestar consulta de cuentas mayores, reglas de negocio,          
//           generacion de JSON en IFS y bitacora de ejecucion.                 
// Tipo de Objeto: Programa SQLRPGLE (*PGM, punto de entrada batch)             
// Restricciones: Requiere Estructura_BD_2.sql y datos de demostracion opcionale
// Dependencias: GLCONH, GLCONPR, GLDAT001, GLNEG001, GLOUT001, GLUTIL001       
// Entradas: banco, sucursal, moneda, rango cuentas, fecha, ruta IFS,           
//           ambiente, tolerancia, modo                                         
// Salidas: JSON en IFS; estado FINALIZADO / PARCIAL / ERROR                    
// Hecho por: Fernando Ramirez, mediante Agentes de IA                          
// Fecha: 2026-06-08                                                            
// Proyecto: Conciliacion GLBLN - Taller IBM i                                  
// =============================================================================
Ctl-Opt DatFmt(*Iso) TimFmt(*Iso) Option(*SrcStmt)
        Debug(*Constants);

/copy QTALLERCP1,GLCONH
/copy QTALLERCP1,GLCONPR

Dcl-Pi *N;
  pBanco        char(20);
  pSucursal     char(20);
  pMoneda       char(20);
  pCuentaDesde  char(24);
  pCuentaHasta  char(24);
  pFechaProceso char(10);
  pRutaIfs      char(252);
  pAmbiente     char(10);
  pTolerancia   packed(15:2);
  pModo         char(10);
  pIfsPerfil    char(10);
End-Pi;

Dcl-Ds Ds_ParmsConc likeds(T_ParmsConc) inz;
Dcl-Ds Ds_EjecCtx   likeds(T_EjecCtx) inz;
Dcl-Ds Ds_ControlTot likeds(T_ControlTot) inz;
Dcl-Ds Ds_CuentaGlbln likeds(T_CuentaGlbln) inz;
Dcl-Ds Ds_SaldosCuenta likeds(T_SaldosCuenta) inz;
Dcl-Ds Ds_ResumenMov likeds(T_ResumenMov) inz;
Dcl-Ds Ds_DifConc   likeds(T_DifConc) inz;
Dcl-Ds Ds_EstadoConc likeds(T_EstadoConc) inz;
Dcl-Ds Ds_Incidente likeds(T_Incidente) inz;
Dcl-Ds Ds_Partidas  likeds(T_PartidaConc) dim(C_MAX_PARTIDAS) inz;

Dcl-Ds psds psds qualified;
  pgmName char(10) pos(201);
  user char(10) pos(254);
End-Ds;

Dcl-s Wrk_SeqCuenta     int(10) inz(0);
Dcl-s Wrk_CantPartidas  int(10) inz(0);
Dcl-s Wrk_RcFetch       int(10) inz(0);
Dcl-s Wrk_RcMod         int(10) inz(0);
Dcl-s Wrk_Debitos       packed(18:2) inz(0);
Dcl-s Wrk_Creditos      packed(18:2) inz(0);
Dcl-s Wrk_HashCuenta    char(32) inz('');
Dcl-s Wrk_LogPath       char(252) inz('');
Dcl-s Wrk_LogLine       varchar(512) inz('');
Dcl-s i                 int(10) inz(0);
Dcl-s Wrk_HayIncidenteAlta ind inz(*off);
Dcl-s Wrk_UsarErrorJson ind inz(*off);
Dcl-s Wrk_SqlLibreria   char(10) inz('');
Dcl-s Wrk_IfsPerfil     char(10) inz('');

Dcl-Pr FinalizarEjecucion;
End-Pr;

Dcl-Pr CargarIncidenteTecnico;
  Par_Codigo char(20) const;
  Par_Mensaje char(120) const;
End-Pr;

Dcl-Pr ObtenerLibPrograma char(10);
End-Pr;

Dcl-Pr DerivarRutaIfs;
End-Pr;

// Normalizar parametros de entrada
Ds_ParmsConc.banco        = %trimr(pBanco);
Ds_ParmsConc.sucursal     = %trimr(pSucursal);
Ds_ParmsConc.moneda       = %trimr(pMoneda);
Ds_ParmsConc.cuentaDesde  = %trimr(pCuentaDesde);
Ds_ParmsConc.cuentaHasta  = %trimr(pCuentaHasta);
Ds_ParmsConc.fechaProceso = %trimr(pFechaProceso);
Ds_ParmsConc.rutaIfs      = %trim(pRutaIfs);
Ds_ParmsConc.ambiente     = %trimr(pAmbiente);
Ds_ParmsConc.tolerancia   = pTolerancia;
Ds_ParmsConc.modo         = %trimr(pModo);
Wrk_IfsPerfil             = %trimr(pIfsPerfil);

Ds_EjecCtx.idEjecucion  = GenIdEjecucion(1);
Ds_EjecCtx.fechaHoraIni = FmtTimestampIso(%timestamp());
Ds_EjecCtx.usuario      = %trimr(psds.user);
Ds_EjecCtx.libreria     = ObtenerLibPrograma();
Wrk_SqlLibreria         = Ds_EjecCtx.libreria;
if %trim(Wrk_SqlLibreria) <> '' and Wrk_SqlLibreria <> '*LIBL';
  Exec Sql SET CURRENT SCHEMA = :Wrk_SqlLibreria;
endif;
Ds_EjecCtx.estado       = 'FINALIZADO';
Ds_EjecCtx.anio         = %int(%subst(Ds_ParmsConc.fechaProceso:1:4));
Ds_EjecCtx.mes          = %int(%subst(Ds_ParmsConc.fechaProceso:6:2));

DerivarRutaIfs();
Wrk_LogLine = 'INICIO ' + Ds_EjecCtx.idEjecucion + ' modo=' +
              Ds_ParmsConc.modo +
              ' ruta=' + %trimr(Ds_ParmsConc.rutaIfs) +
              ' log=' + %trimr(Wrk_LogPath);
WriteLogLine(Wrk_LogPath: Wrk_LogLine);

Wrk_RcMod = DatInitWorkTables();
if Wrk_RcMod <> 0;
  Ds_EjecCtx.estado = 'ERROR';
  Wrk_UsarErrorJson = *on;
  CargarIncidenteTecnico('ERR-TEC-001':
    'Error init tablas SESSION SQLCODE=' + %char(sqlcode));
  Wrk_LogLine = 'ERROR init tablas trabajo SQLCODE=' + %char(sqlcode);
  WriteLogLine(Wrk_LogPath: Wrk_LogLine);
  FinalizarEjecucion();
  return;
endif;

Wrk_RcMod = DatOpenGlblnCursor(Ds_ParmsConc);
if Wrk_RcMod <> 0;
  Ds_EjecCtx.estado = 'ERROR';
  CargarIncidenteTecnico('ERR-TEC-002':
    'Error abrir cursor GLBLN SQLCODE=' + %char(sqlcode));
  DatInsertIncidentWrk(Ds_Incidente);
  Wrk_LogLine = 'ERROR abrir cursor GLBLN SQLCODE=' + %char(sqlcode);
  WriteLogLine(Wrk_LogPath: Wrk_LogLine);
  FinalizarEjecucion();
  return;
endif;

dow *on;
  Wrk_RcFetch = DatFetchGlbln(Ds_CuentaGlbln);
  if Wrk_RcFetch = 1;
    leave;
  elseif Wrk_RcFetch < 0;
    Ds_EjecCtx.estado = 'PARCIAL';
    Wrk_LogLine = 'WARN fetch GLBLN SQLCODE=' + %char(sqlcode);
    WriteLogLine(Wrk_LogPath: Wrk_LogLine);
    leave;
  endif;

  Wrk_SeqCuenta += 1;
  clear Ds_SaldosCuenta;
  clear Ds_ResumenMov;
  clear Ds_DifConc;
  clear Ds_EstadoConc;
  Wrk_CantPartidas = 0;

  DatResolveCentroCosto(Ds_CuentaGlbln);
  if %trim(Ds_ParmsConc.modo) = 'PRUEBA';
    Wrk_LogLine = 'DBG cuenta=' + Ds_CuentaGlbln.cuentaContable +
                  ' cc=' + Ds_CuentaGlbln.centroCosto;
    WriteLogLine(Wrk_LogPath: Wrk_LogLine);
  endif;

  DatLoadMovimientos(Ds_CuentaGlbln: Ds_ParmsConc: Ds_ResumenMov:
                     Wrk_Debitos: Wrk_Creditos);
  DatLoadPartidas(Ds_CuentaGlbln: Ds_ParmsConc: Ds_Partidas:
                  Wrk_CantPartidas);

  NegCalcSaldos(Ds_CuentaGlbln: Wrk_Debitos: Wrk_Creditos:
                Ds_Partidas: Wrk_CantPartidas: Ds_SaldosCuenta);
  NegEvalDiferencias(Ds_SaldosCuenta: Ds_ParmsConc.tolerancia:
                     Wrk_CantPartidas: Ds_DifConc);
  NegEvalEstado(Ds_DifConc: Wrk_CantPartidas: Ds_EstadoConc);
  Wrk_HashCuenta = NegGenHashCuenta(Ds_CuentaGlbln: Ds_SaldosCuenta);
  NegAcumTotales(Ds_SaldosCuenta: Ds_DifConc: Ds_EstadoConc:
                 Ds_ControlTot);

  DatInsertCuentaWrk(Wrk_SeqCuenta: Ds_CuentaGlbln: Ds_SaldosCuenta:
                     Ds_ResumenMov: Ds_DifConc: Ds_EstadoConc:
                     Wrk_HashCuenta);

  for i = 1 to Wrk_CantPartidas;
    DatInsertPartidaWrk(Wrk_SeqCuenta: Ds_Partidas(i));
  endfor;

  if NegBuildIncidente(Ds_CuentaGlbln: Ds_DifConc: Ds_EstadoConc:
                       Ds_Incidente);
    DatInsertIncidentWrk(Ds_Incidente);
    if Ds_Incidente.severidad = 'ALTA' or
       Ds_Incidente.severidad = 'CRITICA';
      Wrk_HayIncidenteAlta = *on;
    endif;
  endif;
enddo;

DatCloseGlblnCursor();

if Wrk_HayIncidenteAlta;
  Ds_EjecCtx.estado = 'PARCIAL';
endif;

if Ds_ControlTot.totalCuentasProcesadas = 0;
  Ds_EjecCtx.estado = 'PARCIAL';
  Wrk_LogLine = 'WARN sin cuentas procesadas para filtros indicados';
  WriteLogLine(Wrk_LogPath: Wrk_LogLine);
endif;

FinalizarEjecucion();
return;

// -----------------------------------------------------------------------------
// ObtenerLibPrograma - Libreria del *PGM activo via pila (QSYS2.STACK_INFO)
// -----------------------------------------------------------------------------
Dcl-Proc ObtenerLibPrograma;
Dcl-Pi *N char(10);
End-Pi;

  Dcl-s Wrk_SqlPgmName char(10) Inz('');

  Wrk_SqlPgmName = %trim(psds.pgmName);
  if Wrk_SqlPgmName = '';
    Wrk_SqlPgmName = 'GLRPT001';
  endif;

  Exec Sql
    SELECT S.PROGRAM_LIBRARY_NAME
    INTO :Wrk_SqlLibreria
    FROM TABLE(QSYS2.STACK_INFO('*')) AS S
    WHERE S.ENTRY_TYPE = 'ILE'
      AND S.PROGRAM_NAME = :Wrk_SqlPgmName
      AND S.PROGRAM_LIBRARY_NAME IS NOT NULL
    ORDER BY S.ORDINAL_POSITION DESC
    FETCH FIRST 1 ROW ONLY;

  if Sqlcode = 0 and %trim(Wrk_SqlLibreria) <> '' and
     Wrk_SqlLibreria <> '*LIBL';
    Return %trim(Wrk_SqlLibreria);
  endif;

  Exec Sql VALUES CURRENT SCHEMA INTO :Wrk_SqlLibreria;
  Return %trim(Wrk_SqlLibreria);

End-Proc;

// -----------------------------------------------------------------------------
// DerivarRutaIfs - Nombre trazable conciliacion_<idEjecucion>.json
// -----------------------------------------------------------------------------
Dcl-Proc DerivarRutaIfs;
Dcl-Pi *N;
End-Pi;

  Dcl-s Wrk_PerfilIfs char(10) inz('');
  Dcl-s Wrk_RutaIfs varchar(512) inz('');
  Dcl-s Wrk_LenPerfil int(10) inz(0);

  Wrk_PerfilIfs = %trim(Wrk_IfsPerfil);
  if Wrk_PerfilIfs = '';
    Wrk_PerfilIfs = %trim(Ds_EjecCtx.usuario);
  endif;
  Wrk_LenPerfil = %len(%trim(Wrk_PerfilIfs));
  if Wrk_LenPerfil > 1 and
     %subst(Wrk_PerfilIfs:Wrk_LenPerfil:1) = '1';
    Wrk_PerfilIfs = %subst(Wrk_PerfilIfs:1:Wrk_LenPerfil - 1);
  endif;

  Wrk_RutaIfs = '/home/' + %trim(Wrk_PerfilIfs) + '/salida/conciliacion_' +
                %trim(Ds_EjecCtx.idEjecucion) + '.json';
  Ds_ParmsConc.rutaIfs = Wrk_RutaIfs;
  Wrk_LogPath = %trim(Ds_ParmsConc.rutaIfs) + '.log';

End-Proc;

// -----------------------------------------------------------------------------
// CargarIncidenteTecnico - Arma incidente CRITICA de ejecucion
// -----------------------------------------------------------------------------
Dcl-Proc CargarIncidenteTecnico;
Dcl-Pi *N;
  Par_Codigo  char(20) const;
  Par_Mensaje char(120) const;
End-Pi;

  clear Ds_Incidente;
  Ds_Incidente.codigo = Par_Codigo;
  Ds_Incidente.tipo = 'EJECUCION';
  Ds_Incidente.cuentaContable = ' ';
  Ds_Incidente.mensaje = Par_Mensaje;
  Ds_Incidente.severidad = 'CRITICA';

End-Proc;

// -----------------------------------------------------------------------------
// FinalizarEjecucion - Escribe JSON, bitacora FIN y termina programa
// -----------------------------------------------------------------------------
Dcl-Proc FinalizarEjecucion;
Dcl-Pi *N;
End-Pi;

  if %trim(Ds_EjecCtx.fechaHoraFin) = '';
    Ds_EjecCtx.fechaHoraFin = FmtTimestampIso(%timestamp());
  endif;

  if Wrk_UsarErrorJson;
    Wrk_RcMod = OutWriteErrorJson(Ds_ParmsConc: Ds_EjecCtx: Ds_Incidente);
  else;
    Wrk_RcMod = OutBuildAndWriteJson(Ds_ParmsConc: Ds_EjecCtx:
                                     Ds_ControlTot);
  endif;

  if Wrk_RcMod <> 0;
    Ds_EjecCtx.estado = 'ERROR';
    Wrk_LogLine = 'ERROR escribir JSON IFS ruta=' +
                  %trimr(Ds_ParmsConc.rutaIfs);
    WriteLogLine(Wrk_LogPath: Wrk_LogLine);
    if not Wrk_UsarErrorJson;
      CargarIncidenteTecnico('ERR-TEC-003':
        'Fallo escritura IFS en ' + %trimr(Ds_ParmsConc.rutaIfs));
      DatInsertIncidentWrk(Ds_Incidente);
      Wrk_RcMod = OutBuildAndWriteJson(Ds_ParmsConc: Ds_EjecCtx:
                                       Ds_ControlTot);
      if Wrk_RcMod = 0;
        Wrk_LogLine = 'JSON regenerado con incidente ERR-TEC-003';
        WriteLogLine(Wrk_LogPath: Wrk_LogLine);
      endif;
    endif;
  else;
    Wrk_LogLine = 'JSON generado en ' + %trimr(Ds_ParmsConc.rutaIfs);
    if not Wrk_UsarErrorJson;
      Wrk_LogLine = Wrk_LogLine + ' cuentas=' +
                    %char(Ds_ControlTot.totalCuentasProcesadas);
    endif;
    WriteLogLine(Wrk_LogPath: Wrk_LogLine);
  endif;

  Wrk_LogLine = 'FIN ' + Ds_EjecCtx.idEjecucion + ' estado=' +
                Ds_EjecCtx.estado;
  WriteLogLine(Wrk_LogPath: Wrk_LogLine);

  *inlr = *on;

End-Proc;
