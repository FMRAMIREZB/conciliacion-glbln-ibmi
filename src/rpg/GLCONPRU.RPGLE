**FREE
// =============================================================================
// Nombre del Objeto: GLCONPRU                                                  
// DESCRIPCION: Copybook de prototipos del servicio GLUTIL001.                  
// Objetivo: Prototipos ExtProc para modulos NOMAIN que invocan utilidades.     
// Tipo de Objeto: Copybook RPGLE - exportar via /COPY                          
// Restricciones: Incluir despues de GLCONH; no incluir en GLUTIL001            
// Dependencias: Ninguna plantilla (solo tipos escalares)                       
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

Dcl-Pr UtilHashMd5Hex char(32) ExtProc('UTILHASHMD5HEX');
  seed varchar(256) const;
End-Pr;
