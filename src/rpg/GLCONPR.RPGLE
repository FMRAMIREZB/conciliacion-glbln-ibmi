**FREE
// =============================================================================
// Nombre del Objeto: GLCONPR                                                   
// DESCRIPCION: Copybook de prototipos exportados del taller GLBLN.             
// Objetivo: Centralizar Dcl-Pr ExtProc para el orquestador GLRPT001.           
// Tipo de Objeto: Copybook RPGLE - exportar via /COPY en GLRPT001              
// Restricciones: Incluir despues de GLCONH; ExtProc en MAYUSCULAS              
// Dependencias: GLCONH plantillas T_*
// Hecho por: Fernando Ramirez, mediante Agentes de IA                          
// Fecha: 2026-06-08                                                            
// Proyecto: Conciliacion GLBLN - Taller IBM i                                  
// =============================================================================

Dcl-Pr GenIdEjecucion char(30) ExtProc('GENIDEJECUCION');
  correlativo packed(3:0) const;
End-Pr;

Dcl-Pr FmtTimestampIso char(26) ExtProc('FMTTIMESTAMPISO');
  ts timestamp const;
End-Pr;

Dcl-Pr WriteIfsUtf8 int(10) ExtProc('WRITEIFSUTF8');
  path char(252) const;
  content varchar(3200000) const;
End-Pr;

Dcl-Pr WriteLogLine int(10) ExtProc('WRITELOGLINE');
  path char(252) const;
  linea varchar(512) const;
End-Pr;

Dcl-Pr AbsDecimal packed(18:2) ExtProc('ABSDECIMAL');
  valor packed(18:2) const;
End-Pr;

Dcl-Pr BoolJson char(5) ExtProc('BOOLJSON');
  cond ind const;
End-Pr;

Dcl-Pr DatInitWorkTables int(10) ExtProc('DATINITWORKTABLES');
End-Pr;

Dcl-Pr DatClearWorkTables int(10) ExtProc('DATCLEARWORKTABLES');
End-Pr;

Dcl-Pr DatOpenGlblnCursor int(10) ExtProc('DATOPENGLBLNCURSOR');
  pParms likeds(T_ParmsConc) const;
End-Pr;

Dcl-Pr DatFetchGlbln int(10) ExtProc('DATFETCHGLBLN');
  pCuenta likeds(T_CuentaGlbln);
End-Pr;

Dcl-Pr DatResolveCentroCosto ExtProc('DATRESOLVECENTROCOSTO');
  pCuenta likeds(T_CuentaGlbln);
End-Pr;

Dcl-Pr DatCloseGlblnCursor int(10) ExtProc('DATCLOSEGLBLNCURSOR');
End-Pr;

Dcl-Pr DatLoadMovimientos int(10) ExtProc('DATLOADMOVIMIENTOS');
  pCuenta likeds(T_CuentaGlbln) const;
  pParms likeds(T_ParmsConc) const;
  pResumen likeds(T_ResumenMov);
  pDebitos packed(18:2);
  pCreditos packed(18:2);
End-Pr;

Dcl-Pr DatLoadPartidas int(10) ExtProc('DATLOADPARTIDAS');
  pCuenta likeds(T_CuentaGlbln) const;
  pParms likeds(T_ParmsConc) const;
  pPartidas likeds(T_PartidaConc) dim(C_MAX_PARTIDAS);
  pCantPartidas int(10);
End-Pr;

Dcl-Pr DatInsertCuentaWrk int(10) ExtProc('DATINSERTCUENTAWRK');
  pSeq int(10) const;
  pCuenta likeds(T_CuentaGlbln) const;
  pSaldos likeds(T_SaldosCuenta) const;
  pResumen likeds(T_ResumenMov) const;
  pDif likeds(T_DifConc) const;
  pEstado likeds(T_EstadoConc) const;
  pHash char(32) const;
End-Pr;

Dcl-Pr DatInsertPartidaWrk int(10) ExtProc('DATINSERTPARTIDAWRK');
  pSeqCuenta int(10) const;
  pPartida likeds(T_PartidaConc) const;
End-Pr;

Dcl-Pr DatInsertIncidentWrk int(10) ExtProc('DATINSERTINCIDENTWRK');
  pIncidente likeds(T_Incidente) const;
End-Pr;

Dcl-Pr NegCalcSaldos ExtProc('NEGCALCSALDOS');
  pCuenta likeds(T_CuentaGlbln) const;
  pDebitos packed(18:2) const;
  pCreditos packed(18:2) const;
  pPartidas likeds(T_PartidaConc) dim(C_MAX_PARTIDAS) const;
  pCantPartidas int(10) const;
  pSaldos likeds(T_SaldosCuenta);
End-Pr;

Dcl-Pr NegEvalDiferencias ExtProc('NEGEVALDIFERENCIAS');
  pSaldos likeds(T_SaldosCuenta) const;
  pTolerancia packed(18:2) const;
  pCantPartidas int(10) const;
  pDif likeds(T_DifConc);
End-Pr;

Dcl-Pr NegEvalEstado ExtProc('NEGEVALESTADO');
  pDif likeds(T_DifConc) const;
  pCantPartidas int(10) const;
  pEstado likeds(T_EstadoConc);
End-Pr;

Dcl-Pr NegBuildIncidente ind ExtProc('NEGBUILDINCIDENTE');
  pCuenta likeds(T_CuentaGlbln) const;
  pDif likeds(T_DifConc) const;
  pEstado likeds(T_EstadoConc) const;
  pIncidente likeds(T_Incidente);
End-Pr;

Dcl-Pr NegAcumTotales ExtProc('NEGACUMTOTALES');
  pSaldos likeds(T_SaldosCuenta) const;
  pDif likeds(T_DifConc) const;
  pEstado likeds(T_EstadoConc) const;
  pTotales likeds(T_ControlTot);
End-Pr;

Dcl-Pr NegGenHashCuenta char(32) ExtProc('NEGGENHASHCUENTA');
  pCuenta likeds(T_CuentaGlbln) const;
  pSaldos likeds(T_SaldosCuenta) const;
End-Pr;

Dcl-Pr OutBuildAndWriteJson int(10) ExtProc('OUTBUILDANDWRITEJSON');
  pParms likeds(T_ParmsConc) const;
  pEjec likeds(T_EjecCtx) const;
  pTotales likeds(T_ControlTot) const;
End-Pr;

Dcl-Pr OutWriteErrorJson int(10) ExtProc('OUTWRITEERRORJSON');
  pParms likeds(T_ParmsConc) const;
  pEjec likeds(T_EjecCtx) const;
  pIncidente likeds(T_Incidente) const;
End-Pr;
