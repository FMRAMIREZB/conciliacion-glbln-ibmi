**FREE
// =============================================================================
// Nombre del Objeto: GLNEG001                                                  
// DESCRIPCION: Modulo de reglas de negocio de conciliacion.                    
// Objetivo: Calcular saldos, evaluar diferencias y tolerancia, clasificar      
//           estado e incidentes de conciliacion.                               
// Tipo de Objeto: Modulo RPGLE (capa de negocio)                               
// Restricciones: Tolerancia parametrizable; estados RF-02/RF-03                
// Dependencias: GLCONH                                                         
// Exporta: NegCalcSaldos, NegEvalDiferencias, NegEvalEstado,                   
//           NegBuildIncidente, NegAcumTotales, NegGenHashCuenta                
// Hecho por: Fernando Ramirez, mediante Agentes de IA                          
// Fecha: 2026-06-08                                                            
// Proyecto: Conciliacion GLBLN - Taller IBM i                                  
// =============================================================================
Ctl-Opt Nomain
        DatFmt(*Iso) TimFmt(*Iso) Option(*SrcStmt)
        Debug(*Constants);

/copy QTALLERCP1,GLCONH
/copy QTALLERCP1,GLCONPRU
// -----------------------------------------------------------------------------
// NegCalcSaldos - Calcula saldos inicial, final y conciliado por cuenta
// -----------------------------------------------------------------------------
Dcl-Proc NegCalcSaldos Export;
Dcl-Pi *N;
  pCuenta       likeds(T_CuentaGlbln) const;
  pDebitos      packed(18:2) const;
  pCreditos     packed(18:2) const;
  pPartidas     likeds(T_PartidaConc) dim(C_MAX_PARTIDAS) const;
  pCantPartidas int(10) const;
  pSaldos       likeds(T_SaldosCuenta);
End-Pi;

  Dcl-s Wrk_AjusteDeposito   packed(18:2) inz(0);
  Dcl-s Wrk_AjusteConciliado packed(18:2) inz(0);
  Dcl-s Wrk_Subtipo          char(30) inz('');
  Dcl-s i int(10) inz(0);

  pSaldos.saldoFinalFuente = pCuenta.saldoFuente;
  pSaldos.debitosPeriodo   = pDebitos;
  pSaldos.creditosPeriodo  = pCreditos;

  for i = 1 to pCantPartidas;
    Wrk_Subtipo = %xlate('abcdefghijklmnopqrstuvwxyz':
                         'ABCDEFGHIJKLMNOPQRSTUVWXYZ':
                         %trim(pPartidas(i).subtipo));
    if %scan('DEPOSITO': Wrk_Subtipo) > 0;
      if pPartidas(i).signo = 'DEBITO';
        Wrk_AjusteDeposito += pPartidas(i).monto;
      else;
        Wrk_AjusteDeposito -= pPartidas(i).monto;
      endif;
    else;
      if pPartidas(i).signo = 'DEBITO';
        Wrk_AjusteConciliado += pPartidas(i).monto;
      else;
        Wrk_AjusteConciliado -= pPartidas(i).monto;
      endif;
    endif;
  endfor;

  // Saldo inicial: truncar a entero si hay deposito pendiente
  if Wrk_AjusteDeposito > 0;
    pSaldos.saldoInicial = %int(pSaldos.saldoFinalFuente
                             - pSaldos.debitosPeriodo
                             + pSaldos.creditosPeriodo);
  else;
    pSaldos.saldoInicial = pSaldos.saldoFinalFuente
                         - pSaldos.debitosPeriodo
                         + pSaldos.creditosPeriodo;
  endif;

  pSaldos.saldoFinalCalculado = pSaldos.saldoInicial
                              + pSaldos.debitosPeriodo
                              - pSaldos.creditosPeriodo;

  pSaldos.saldoFinalConciliado = pSaldos.saldoFinalCalculado
                               + Wrk_AjusteConciliado;

End-Proc;

// -----------------------------------------------------------------------------
// NegEvalDiferencias - Evalua diferencia neta, absoluta y tolerancia
// -----------------------------------------------------------------------------
Dcl-Proc NegEvalDiferencias Export;
Dcl-Pi *N;
  pSaldos     likeds(T_SaldosCuenta) const;
  pTolerancia packed(18:2) const;
  pCantPartidas int(10) const;
  pDif        likeds(T_DifConc);
End-Pi;

  pDif.diferenciaNeta = pSaldos.saldoFinalFuente
                      - pSaldos.saldoFinalConciliado;
  pDif.diferenciaAbsoluta = %abs(pDif.diferenciaNeta);
  pDif.toleranciaPermitida = pTolerancia;

  if pDif.diferenciaAbsoluta > pTolerancia;
    pDif.excedeTolerancia = 'true';
    if pCantPartidas > 0;
      pDif.motivoPrincipal = 'Diferencia con partidas pendientes';
    else;
      pDif.motivoPrincipal = 'Diferencia saldo fuente vs conciliado';
    endif;
  else;
    pDif.excedeTolerancia = 'false';
    if pCantPartidas > 0;
      pDif.motivoPrincipal = 'Partida en transito';
    else;
      pDif.motivoPrincipal = 'Sin diferencias relevantes';
    endif;
  endif;

End-Proc;

// -----------------------------------------------------------------------------
// NegEvalEstado - Asigna codigo y severidad de conciliacion
// -----------------------------------------------------------------------------
Dcl-Proc NegEvalEstado Export;
Dcl-Pi *N;
  pDif          likeds(T_DifConc) const;
  pCantPartidas int(10) const;
  pEstado       likeds(T_EstadoConc);
End-Pi;

  if pDif.excedeTolerancia = 'true';
    pEstado.codigo = 'NO_CONCILIADA';
    pEstado.descripcion = 'Cuenta con diferencia fuera de tolerancia';
    pEstado.severidad = 'ALTA';
    pEstado.requiereRevision = 'true';
  elseif pCantPartidas > 0;
    pEstado.codigo = 'PARCIAL';
    pEstado.descripcion = 'Conciliada con partidas pendientes';
    pEstado.severidad = 'MEDIA';
    pEstado.requiereRevision = 'true';
  else;
    pEstado.codigo = 'CONCILIADA';
    pEstado.descripcion = 'Cuenta conciliada sin diferencias';
    pEstado.severidad = 'BAJA';
    pEstado.requiereRevision = 'false';
  endif;

End-Proc;

// -----------------------------------------------------------------------------
// NegBuildIncidente - Construye incidente funcional si aplica
// -----------------------------------------------------------------------------
Dcl-Proc NegBuildIncidente Export;
Dcl-Pi *N ind;
  pCuenta    likeds(T_CuentaGlbln) const;
  pDif       likeds(T_DifConc) const;
  pEstado    likeds(T_EstadoConc) const;
  pIncidente likeds(T_Incidente);
End-Pi;

  Dcl-s Wrk_Generar ind inz(*off);

  if pDif.excedeTolerancia = 'true';
    Wrk_Generar = *on;
    pIncidente.codigo = 'ERR-GL-001';
    pIncidente.tipo = 'VALIDACION';
    pIncidente.mensaje = 'Diferencia fuera de tolerancia permitida';
    pIncidente.severidad = 'ALTA';
  elseif pEstado.codigo = 'PARCIAL';
    Wrk_Generar = *on;
    pIncidente.codigo = 'WARN-GL-002';
    pIncidente.tipo = 'VALIDACION';
    pIncidente.mensaje = 'Diferencia menor dentro de tolerancia';
    pIncidente.severidad = 'BAJA';
  endif;

  if Wrk_Generar;
    pIncidente.cuentaContable = pCuenta.cuentaContable;
    Return *on;
  endif;

  Return *off;

End-Proc;

// -----------------------------------------------------------------------------
// NegAcumTotales - Acumula totales globales de control del JSON
// -----------------------------------------------------------------------------
Dcl-Proc NegAcumTotales Export;
Dcl-Pi *N;
  pSaldos   likeds(T_SaldosCuenta) const;
  pDif      likeds(T_DifConc) const;
  pEstado   likeds(T_EstadoConc) const;
  pTotales  likeds(T_ControlTot);
End-Pi;

  pTotales.totalCuentasProcesadas += 1;
  if pEstado.codigo = 'CONCILIADA';
    pTotales.totalCuentasConciliadas += 1;
  endif;
  if pDif.diferenciaNeta <> 0;
    pTotales.totalCuentasConDiferencia += 1;
  endif;
  pTotales.sumatoriaSaldoFinalFuente += pSaldos.saldoFinalFuente;
  pTotales.sumatoriaSaldoFinalConc  += pSaldos.saldoFinalConciliado;
  pTotales.sumatoriaDiferenciaNeta  += pDif.diferenciaNeta;

End-Proc;

// -----------------------------------------------------------------------------
// NegGenHashCuenta - Hash MD5 hex (32) de campos criticos via GLUTIL001
// -----------------------------------------------------------------------------
Dcl-Proc NegGenHashCuenta Export;
Dcl-Pi *N char(32);
  pCuenta likeds(T_CuentaGlbln) const;
  pSaldos likeds(T_SaldosCuenta) const;
End-Pi;

  Dcl-s Wrk_Seed varchar(256) inz('');

  Wrk_Seed = %trim(pCuenta.codigoBanco) + '|' +
             %trim(pCuenta.codigoSucursal) + '|' +
             %trim(pCuenta.codigoMoneda) + '|' +
             %trim(pCuenta.cuentaContable) + '|' +
             %trim(%char(pSaldos.saldoFinalFuente));

  Return UtilHashMd5Hex(Wrk_Seed);

End-Proc;
