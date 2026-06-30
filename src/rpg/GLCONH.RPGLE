**FREE
// =============================================================================
// Nombre del Objeto: GLCONH                                                    
// DESCRIPCION: Copybook de constantes y plantillas de conciliacion GLBLN.      
// Objetivo: Centralizar constantes y plantillas de datos del taller.           
// Tipo de Objeto: Copybook RPGLE - exportar via /COPY                          
// Restricciones: Linea 1 **FREE obligatoria; sin duplicar **FREE               
// Dependencias: Ninguna en tiempo de ejecucion                                 
// Hecho por: Fernando Ramirez, mediante Agentes de IA                          
// Fecha: 2026-06-08                                                            
// Proyecto: Conciliacion GLBLN - Taller IBM i                                  
// =============================================================================

// --- Constantes del contrato JSON ---
Dcl-c C_VERSION_ESTRUCTURA '1.0.0';
Dcl-c C_SISTEMA_ORIGEN     'IBS-IBM-i';
Dcl-c C_PROCESO            'CONCILIACION_GLBLN';
Dcl-c C_CHARSET            'UTF-8';
Dcl-c C_PROGRAMA           'GLRPT001';
Dcl-c C_MAX_INCIDENTES     500;
Dcl-c C_MAX_PARTIDAS       2000;

// --- Parametros de ejecucion ---
Dcl-ds T_ParmsConc qualified template;
  banco          char(20);
  sucursal       char(20);
  moneda         char(20);
  cuentaDesde    char(24);
  cuentaHasta    char(24);
  fechaProceso   char(10);
  rutaIfs        char(252);
  ambiente       char(10);
  tolerancia     packed(15:2);
  modo           char(10);
End-ds;

// --- Contexto de ejecucion ---
Dcl-ds T_EjecCtx qualified template;
  idEjecucion    char(30);
  fechaHoraIni   char(26);
  fechaHoraFin   char(26);
  usuario        char(10);
  libreria       char(10);
  estado         char(15);
  anio           packed(4:0);
  mes            packed(2:0);
End-ds;

// --- Cuenta contable GLBLN ---
Dcl-ds T_CuentaGlbln qualified template;
  codigoBanco       char(20);
  codigoSucursal    char(20);
  codigoMoneda      char(20);
  cuentaContable    char(24);
  descripcionCuenta char(120);
  naturalezaCuenta  char(20);
  nivelCuenta       char(50);
  centroCosto       char(20);
  saldoFuente       packed(18:2);
End-ds;

// --- Saldos calculados por cuenta ---
Dcl-ds T_SaldosCuenta qualified template;
  saldoInicial          packed(18:2);
  debitosPeriodo        packed(18:2);
  creditosPeriodo       packed(18:2);
  saldoFinalCalculado   packed(18:2);
  saldoFinalFuente      packed(18:2);
  saldoFinalConciliado  packed(18:2);
End-ds;

// --- Resumen de movimientos del periodo ---
Dcl-ds T_ResumenMov qualified template;
  cantidadMovimientos packed(9:0);
  primerMovimiento    char(26);
  ultimoMovimiento    char(26);
  cntTrans            packed(9:0);
  cntTrdsc            packed(9:0);
  cntTtran            packed(9:0);
End-ds;

// --- Partida de conciliacion ---
Dcl-ds T_PartidaConc qualified template;
  idPartida         char(20);
  tipo              char(20);
  subtipo           char(30);
  referencia        char(40);
  fechaPartida      char(10);
  monto             packed(18:2);
  signo             char(10);
  estado            char(15);
  origen            char(10);
  observacion       char(120);
End-ds;

// --- Diferencias y tolerancia ---
Dcl-ds T_DifConc qualified template;
  diferenciaNeta      packed(18:2);
  diferenciaAbsoluta  packed(18:2);
  toleranciaPermitida packed(18:2);
  excedeTolerancia    char(5);
  motivoPrincipal     char(80);
End-ds;

// --- Estado de conciliacion por cuenta ---
Dcl-ds T_EstadoConc qualified template;
  codigo            char(20);
  descripcion       char(80);
  severidad         char(10);
  requiereRevision  char(5);
End-ds;

// --- Incidente o alerta ---
Dcl-ds T_Incidente qualified template;
  codigo            char(20);
  tipo              char(20);
  cuentaContable    char(24);
  mensaje           char(120);
  severidad         char(10);
End-ds;

// --- Totales de control del proceso ---
Dcl-ds T_ControlTot qualified template;
  totalCuentasProcesadas      packed(9:0);
  totalCuentasConciliadas     packed(9:0);
  totalCuentasConDiferencia   packed(9:0);
  sumatoriaSaldoFinalFuente   packed(18:2);
  sumatoriaSaldoFinalConc     packed(18:2);
  sumatoriaDiferenciaNeta     packed(18:2);
End-ds;
