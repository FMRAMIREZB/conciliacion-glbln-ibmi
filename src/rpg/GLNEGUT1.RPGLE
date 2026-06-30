**FREE
// =============================================================================
// Nombre del Objeto: GLNEGUT1                                                  
// DESCRIPCION: Pruebas unitarias del modulo de negocio GLNEG001.               
// Objetivo: Validar reglas clave de conciliacion sin acceso a BD.
// Tipo de Objeto: Programa RPGLE (*PGM) driver de pruebas                      
// Restricciones: Requiere SRVPGM GLNEG001 y GLUTIL001 compilados               
// Dependencias: GLCONH, GLCONPR                                                
// Hecho por: Taller IBM i - Conciliacion GLBLN                                 
// Fecha: 2026-06-29                                                            
// Proyecto: Conciliacion GLBLN - Taller IBM i                                  
// =============================================================================
Ctl-Opt DatFmt(*Iso) TimFmt(*Iso) Option(*SrcStmt)
        Debug(*Constants);

/copy QTALLERCP1,GLCONH
/copy QTALLERCP1,GLCONPR

Dcl-Pi *N;
  pIfsPerfil char(10);
End-Pi;

Dcl-Ds psds psds qualified;
  user char(10) pos(254);
End-Ds;

Dcl-s passCnt int(10) inz(0);
Dcl-s failCnt int(10) inz(0);
Dcl-s logPath char(252) inz('');
Dcl-s msgLine varchar(512) inz('');
Dcl-s perfil char(10) inz('');

Dcl-ds cuenta likeds(T_CuentaGlbln) inz;
Dcl-ds saldos likeds(T_SaldosCuenta) inz;
Dcl-ds dif likeds(T_DifConc) inz;
Dcl-ds estado likeds(T_EstadoConc) inz;
Dcl-ds wrkIncidente likeds(T_Incidente) inz;
Dcl-ds totales likeds(T_ControlTot) inz;
Dcl-ds partidas likeds(T_PartidaConc) dim(C_MAX_PARTIDAS) inz;

Dcl-s cantPartidas int(10) inz(0);
Dcl-s hayInc ind inz(*off);
Dcl-s hash char(32) inz('');
Dcl-s toler packed(15:2) inz(1.00);
Dcl-s logIniciado ind inz(*off);

Dcl-Pr AssertEqPacked;
  pName varchar(80) const;
  pExp packed(18:2) const;
  pAct packed(18:2) const;
End-Pr;

Dcl-Pr AssertCharEq;
  pName varchar(80) const;
  pExp char(20) const;
  pAct char(20) const;
End-Pr;

Dcl-Pr AssertInd;
  pName varchar(80) const;
  pExp ind const;
  pAct ind const;
End-Pr;

Dcl-Pr UtWriteLog;
  pText varchar(512) const;
End-Pr;

Dcl-Pr TestEscenarioParcial;
End-Pr;

Dcl-Pr TestEscenarioConciliada;
End-Pr;

Dcl-Pr TestEscenarioNoConciliada;
End-Pr;

Dcl-Pr TestAcumTotalesDemo;
End-Pr;

Dcl-Pr TestHashDeterministico;
End-Pr;

perfil = %trim(pIfsPerfil);
if perfil = '';
  perfil = %trim(psds.user);
endif;
if %len(%trim(perfil)) > 1 and
   %subst(perfil:%len(%trim(perfil)):1) = '1';
  perfil = %subst(perfil:1:%len(%trim(perfil))-1);
endif;

logPath = '/home/' + %trim(perfil) + '/salida/glnegut1.log';
UtWriteLog('INICIO GLNEGUT1 pass=' + %trim(perfil));

TestEscenarioParcial();
TestEscenarioConciliada();
TestEscenarioNoConciliada();
TestAcumTotalesDemo();
TestHashDeterministico();

msgLine = 'RESULTADO pass=' + %char(passCnt) +
          ' fail=' + %char(failCnt);
UtWriteLog(msgLine);

if failCnt > 0;
  UtWriteLog('ESTADO FAIL');
else;
  UtWriteLog('ESTADO OK');
endif;

*inlr = *on;
return;

// -----------------------------------------------------------------------------
// TestEscenarioParcial - Cuenta 11010101 demo (WARN-GL-002)
// -----------------------------------------------------------------------------
Dcl-Proc TestEscenarioParcial;
Dcl-Pi *N;
End-Pi;

  clear cuenta;
  clear saldos;
  clear dif;
  clear estado;
  clear wrkIncidente;
  clear partidas;
  cantPartidas = 0;

  cuenta.cuentaContable = '11010101';
  cuenta.codigoBanco = '01';
  cuenta.codigoSucursal = '001';
  cuenta.codigoMoneda = 'USD';
  cuenta.saldoFuente = 125000.50;

  cantPartidas = 1;
  partidas(1).subtipo = 'DEPOSITO_PENDIENTE';
  partidas(1).signo = 'DEBITO';
  partidas(1).monto = 500.50;

  NegCalcSaldos(cuenta: 40000: 0: partidas: cantPartidas: saldos);
  AssertEqPacked('PARCIAL saldoInicial': 85000: saldos.saldoInicial);
  AssertEqPacked('PARCIAL saldoFinalCalc': 125000:
                 saldos.saldoFinalCalculado);
  AssertEqPacked('PARCIAL saldoFinalConc': 125000:
                 saldos.saldoFinalConciliado);

  NegEvalDiferencias(saldos: toler: cantPartidas: dif);
  AssertEqPacked('PARCIAL difNeta': 0.50: dif.diferenciaNeta);
  AssertCharEq('PARCIAL excedeTol': 'false': dif.excedeTolerancia);

  NegEvalEstado(dif: cantPartidas: estado);
  AssertCharEq('PARCIAL estado': 'PARCIAL': estado.codigo);

  hayInc = NegBuildIncidente(cuenta: dif: estado: wrkIncidente);
  AssertInd('PARCIAL incidente': *on: hayInc);
  AssertCharEq('PARCIAL incCod': 'WARN-GL-002': wrkIncidente.codigo);

End-Proc;

// -----------------------------------------------------------------------------
// TestEscenarioConciliada - Cuenta 11020101 demo
// -----------------------------------------------------------------------------
Dcl-Proc TestEscenarioConciliada;
Dcl-Pi *N;
End-Pi;

  clear cuenta;
  clear saldos;
  clear dif;
  clear estado;
  clear wrkIncidente;
  cantPartidas = 0;

  cuenta.cuentaContable = '11020101';
  cuenta.saldoFuente = 50000.00;

  NegCalcSaldos(cuenta: 15000: 10000: partidas: cantPartidas: saldos);
  AssertEqPacked('CONC saldoInicial': 45000: saldos.saldoInicial);
  AssertEqPacked('CONC difNeta impl': 0: saldos.saldoFinalFuente
                 - saldos.saldoFinalConciliado);

  NegEvalDiferencias(saldos: toler: cantPartidas: dif);
  AssertEqPacked('CONC difNeta': 0: dif.diferenciaNeta);

  NegEvalEstado(dif: cantPartidas: estado);
  AssertCharEq('CONC estado': 'CONCILIADA': estado.codigo);

  hayInc = NegBuildIncidente(cuenta: dif: estado: wrkIncidente);
  AssertInd('CONC sin incidente': *off: hayInc);

End-Proc;

// -----------------------------------------------------------------------------
// TestEscenarioNoConciliada - Cuenta 11030101 demo (ERR-GL-001)
// -----------------------------------------------------------------------------
Dcl-Proc TestEscenarioNoConciliada;
Dcl-Pi *N;
End-Pi;

  clear cuenta;
  clear saldos;
  clear dif;
  clear estado;
  clear wrkIncidente;
  clear partidas;
  cantPartidas = 0;

  cuenta.cuentaContable = '11030101';
  cuenta.saldoFuente = 100000.00;

  cantPartidas = 1;
  partidas(1).subtipo = 'TRANSFER_PENDIENTE';
  partidas(1).signo = 'DEBITO';
  partidas(1).monto = 5000.00;

  NegCalcSaldos(cuenta: 15000: 5000: partidas: cantPartidas: saldos);
  AssertEqPacked('NOCONC saldoFinalConc': 105000:
                 saldos.saldoFinalConciliado);

  NegEvalDiferencias(saldos: toler: cantPartidas: dif);
  AssertEqPacked('NOCONC difNeta': -5000: dif.diferenciaNeta);
  AssertCharEq('NOCONC excedeTol': 'true': dif.excedeTolerancia);

  NegEvalEstado(dif: cantPartidas: estado);
  AssertCharEq('NOCONC estado': 'NO_CONCILIADA': estado.codigo);

  hayInc = NegBuildIncidente(cuenta: dif: estado: wrkIncidente);
  AssertInd('NOCONC incidente': *on: hayInc);
  AssertCharEq('NOCONC incCod': 'ERR-GL-001': wrkIncidente.codigo);

End-Proc;

// -----------------------------------------------------------------------------
// TestAcumTotalesDemo - Cuadre controlTotales escenario demo
// -----------------------------------------------------------------------------
Dcl-Proc TestAcumTotalesDemo;
Dcl-Pi *N;
End-Pi;

  clear totales;

  // Cuenta 11010101 PARCIAL
  clear cuenta;
  clear saldos;
  clear dif;
  clear estado;
  clear partidas;
  cantPartidas = 1;
  cuenta.cuentaContable = '11010101';
  cuenta.saldoFuente = 125000.50;
  partidas(1).subtipo = 'DEPOSITO_PENDIENTE';
  partidas(1).signo = 'DEBITO';
  partidas(1).monto = 500.50;
  NegCalcSaldos(cuenta: 40000: 0: partidas: cantPartidas: saldos);
  NegEvalDiferencias(saldos: toler: cantPartidas: dif);
  NegEvalEstado(dif: cantPartidas: estado);
  NegAcumTotales(saldos: dif: estado: totales);

  // Cuenta 11020101 CONCILIADA
  clear cuenta;
  clear saldos;
  clear dif;
  clear estado;
  cantPartidas = 0;
  cuenta.cuentaContable = '11020101';
  cuenta.saldoFuente = 50000.00;
  NegCalcSaldos(cuenta: 15000: 10000: partidas: cantPartidas: saldos);
  NegEvalDiferencias(saldos: toler: cantPartidas: dif);
  NegEvalEstado(dif: cantPartidas: estado);
  NegAcumTotales(saldos: dif: estado: totales);

  // Cuenta 11030101 NO_CONCILIADA
  clear cuenta;
  clear saldos;
  clear dif;
  clear estado;
  clear partidas;
  cantPartidas = 1;
  cuenta.cuentaContable = '11030101';
  cuenta.saldoFuente = 100000.00;
  partidas(1).subtipo = 'TRANSFER_PENDIENTE';
  partidas(1).signo = 'DEBITO';
  partidas(1).monto = 5000.00;
  NegCalcSaldos(cuenta: 15000: 5000: partidas: cantPartidas: saldos);
  NegEvalDiferencias(saldos: toler: cantPartidas: dif);
  NegEvalEstado(dif: cantPartidas: estado);
  NegAcumTotales(saldos: dif: estado: totales);

  AssertEqPacked('TOT procesadas': 3:
                 totales.totalCuentasProcesadas);
  AssertEqPacked('TOT conciliadas': 1:
                 totales.totalCuentasConciliadas);
  AssertEqPacked('TOT con dif': 2:
                 totales.totalCuentasConDiferencia);
  AssertEqPacked('TOT sum dif': -4999.50:
                 totales.sumatoriaDiferenciaNeta);

End-Proc;

// -----------------------------------------------------------------------------
// TestHashDeterministico - Sello trazabilidad cuenta 11010101
// -----------------------------------------------------------------------------
Dcl-Proc TestHashDeterministico;
Dcl-Pi *N;
End-Pi;

  clear cuenta;
  clear saldos;

  cuenta.codigoBanco = '01';
  cuenta.codigoSucursal = '001';
  cuenta.codigoMoneda = 'USD';
  cuenta.cuentaContable = '11010101';
  saldos.saldoFinalFuente = 125000.50;

  hash = NegGenHashCuenta(cuenta: saldos);
  if hash <> 'E01D6CC6C5CE83772B85739D2DBE2AB0';
    failCnt += 1;
    UtWriteLog('FAIL HASH md5 exp=E01D6CC6C5CE83772B85739D2DBE2AB0 act=' +
               %trim(hash));
  else;
    passCnt += 1;
    UtWriteLog('PASS HASH md5 demo');
  endif;
  if %len(%trim(hash)) <> 32;
    failCnt += 1;
    UtWriteLog('FAIL HASH longitud <> 32');
  else;
    passCnt += 1;
    UtWriteLog('PASS HASH longitud 32');
  endif;

End-Proc;

// -----------------------------------------------------------------------------
// AssertEqPacked - Compara packed; registra pass/fail
// -----------------------------------------------------------------------------
Dcl-Proc AssertEqPacked;
Dcl-Pi *N;
  pName varchar(80) const;
  pExp packed(18:2) const;
  pAct packed(18:2) const;
End-Pi;

  if pExp <> pAct;
    failCnt += 1;
    UtWriteLog('FAIL ' + %trim(pName) + ' exp=' +
            %trim(%char(pExp)) + ' act=' + %trim(%char(pAct)));
  else;
    passCnt += 1;
    UtWriteLog('PASS ' + %trim(pName));
  endif;

End-Proc;

// -----------------------------------------------------------------------------
// AssertCharEq - Compara char con trim
// -----------------------------------------------------------------------------
Dcl-Proc AssertCharEq;
Dcl-Pi *N;
  pName varchar(80) const;
  pExp char(20) const;
  pAct char(20) const;
End-Pi;

  if %trim(pExp) <> %trim(pAct);
    failCnt += 1;
    UtWriteLog('FAIL ' + %trim(pName) + ' exp=' +
            %trim(pExp) + ' act=' + %trim(pAct));
  else;
    passCnt += 1;
    UtWriteLog('PASS ' + %trim(pName));
  endif;

End-Proc;

// -----------------------------------------------------------------------------
// AssertInd - Compara indicadores
// -----------------------------------------------------------------------------
Dcl-Proc AssertInd;
Dcl-Pi *N;
  pName varchar(80) const;
  pExp ind const;
  pAct ind const;
End-Pi;

  if pExp <> pAct;
    failCnt += 1;
    UtWriteLog('FAIL ' + %trim(pName));
  else;
    passCnt += 1;
    UtWriteLog('PASS ' + %trim(pName));
  endif;

End-Proc;

// -----------------------------------------------------------------------------
// UtWriteLog - Bitacora IFS; 1er write trunca (REPLACE), resto APPEND
// -----------------------------------------------------------------------------
Dcl-Proc UtWriteLog;
Dcl-Pi *N;
  pText varchar(512) const;
End-Pi;

  if logIniciado = *off;
    logIniciado = *on;
    WriteIfsUtf8(logPath: pText);
  else;
    WriteLogLine(logPath: pText);
  endif;

End-Proc;
