**FREE
// =============================================================================
// Nombre del Objeto: GLUTIL001                                                 
// DESCRIPCION: Programa de servicio de utilidades de conciliacion.             
// Objetivo: Encapsular funciones transversales: identificador de ejecucion,    
//           formato ISO de timestamps, escritura IFS UTF-8 y bitacora.         
// Tipo de Objeto: Programa de servicio SQLRPGLE (SRVPGM)                       
// Restricciones: Requiere QSYS2.IFS_WRITE (CCSID 1208) en IBM i V7R4+          
// Dependencias: Ninguna (no usa copybook GLCONH)                               
// Exporta: GenIdEjecucion, FmtTimestampIso, WriteIfsUtf8, WriteLogLine,        
//           AbsDecimal, BoolJson, UtilHashMd5Hex                               
// Hecho por: Fernando Ramirez, mediante Agentes de IA                          
// Fecha: 2026-06-08                                                            
// Proyecto: Conciliacion GLBLN - Taller IBM i                                  
// =============================================================================
Ctl-Opt Nomain
        DatFmt(*Iso) TimFmt(*Iso) Option(*SrcStmt)
        Debug(*Constants);

Exec Sql Set Option Commit = *None;

// -----------------------------------------------------------------------------
// GenIdEjecucion - Genera identificador unico de corrida (YYYYMMDD_HHMMSS_NNN)
// -----------------------------------------------------------------------------
Dcl-Proc GenIdEjecucion Export;
Dcl-Pi *N char(30);
  correlativo packed(3:0) const;
End-Pi;

  Dcl-s Wrk_Id char(30) inz('');

  Wrk_Id = %char(%date():*iso0) + '_' +
           %subst(%char(%time():*hms0):1:6) + '_' +
           %editc(correlativo:'X');
  Return Wrk_Id;

End-Proc;

// -----------------------------------------------------------------------------
// FmtTimestampIso - Formatea timestamp en cadena ISO-8601 simplificada
// -----------------------------------------------------------------------------
Dcl-Proc FmtTimestampIso Export;
Dcl-Pi *N char(26);
  ts timestamp const;
End-Pi;

  Dcl-s Wrk_Result char(26) inz('');
  Dcl-s Wrk_Fecha char(10) inz('');
  Dcl-s Wrk_Hora  char(8) inz('');

  if ts = *loval;
    Return ' ';
  endif;

  Wrk_Fecha = %char(%date(ts):*iso);
  Wrk_Hora  = %subst(%char(%time(ts):*hms):1:8);
  Wrk_Result = %trim(Wrk_Fecha) + 'T' + Wrk_Hora;
  Return Wrk_Result;

End-Proc;

// -----------------------------------------------------------------------------
// WriteIfsUtf8 - Escribe contenido en archivo IFS con codificacion UTF-8
// -----------------------------------------------------------------------------
Dcl-Proc WriteIfsUtf8 Export;
Dcl-Pi *N int(10);
  path char(252) const;
  content varchar(3200000) const;
End-Pi;

  Dcl-s Wrk_SqlPath varchar(252) inz('');
  Dcl-s Wrk_SqlLine sqltype(clob:3200000) loc;
  Dcl-s Wrk_Rc int(10) inz(0);

  Wrk_SqlPath = %trim(path);
  Wrk_SqlLine = content;

  Exec Sql
    CALL QSYS2.IFS_WRITE(
      PATH_NAME   => TRIM(:Wrk_SqlPath),
      LINE        => :Wrk_SqlLine,
      FILE_CCSID  => 1208,
      OVERWRITE   => 'REPLACE'
    );

  if Sqlcode < 0;
    Wrk_Rc = -1;
  endif;

  Return Wrk_Rc;

End-Proc;

// -----------------------------------------------------------------------------
// WriteLogLine - Agrega una linea a la bitacora IFS del proceso
// -----------------------------------------------------------------------------
Dcl-Proc WriteLogLine Export;
Dcl-Pi *N int(10);
  path char(252) const;
  linea varchar(512) const;
End-Pi;

  Dcl-s Wrk_SqlPath varchar(252) inz('');
  Dcl-s Wrk_SqlLine varchar(512) inz('');
  Dcl-s Wrk_Rc int(10) inz(0);

  Wrk_SqlPath = %trim(path);
  Wrk_SqlLine = linea;

  Exec Sql
    CALL QSYS2.IFS_WRITE(
      PATH_NAME   => TRIM(:Wrk_SqlPath),
      LINE        => :Wrk_SqlLine,
      FILE_CCSID  => 1208,
      OVERWRITE   => 'APPEND'
    );

  if Sqlcode < 0;
    Exec Sql
      CALL QSYS2.IFS_WRITE(
        PATH_NAME   => TRIM(:Wrk_SqlPath),
        LINE        => :Wrk_SqlLine,
        FILE_CCSID  => 1208,
        OVERWRITE   => 'REPLACE'
      );
    if Sqlcode < 0;
      Wrk_Rc = -1;
    endif;
  endif;

  Return Wrk_Rc;

End-Proc;

// -----------------------------------------------------------------------------
// AbsDecimal - Retorna valor absoluto de un decimal empaquetado
// -----------------------------------------------------------------------------
Dcl-Proc AbsDecimal Export;
Dcl-Pi *N packed(18:2);
  valor packed(18:2) const;
End-Pi;
  if valor < 0;
    Return -valor;
  endif;
  Return valor;
End-Proc;

// -----------------------------------------------------------------------------
// BoolJson - Convierte indicador a literal JSON true/false
// -----------------------------------------------------------------------------
Dcl-Proc BoolJson Export;
Dcl-Pi *N char(5);
  cond ind const;
End-Pi;
  if cond;
    Return 'true';
  endif;
  Return 'false';
End-Proc;

// -----------------------------------------------------------------------------
// UtilHashMd5Hex - MD5 criptografico (32 hex) via HASH_MD5 + HEX (Db2 7.4+)
// -----------------------------------------------------------------------------
Dcl-Proc UtilHashMd5Hex Export;
Dcl-Pi *N char(32);
  seed varchar(256) const;
End-Pi;

  Dcl-s Wrk_SqlSeed varchar(256) inz('');
  Dcl-s Wrk_HashHex char(32) inz('');

  Wrk_SqlSeed = %trim(seed);

  Exec Sql
    VALUES HEX(HASH_MD5(:Wrk_SqlSeed))
    INTO :Wrk_HashHex;

  if Sqlcode < 0;
    Return *blanks;
  endif;

  Return %xlate('abcdefghijklmnopqrstuvwxyz':
                'ABCDEFGHIJKLMNOPQRSTUVWXYZ':
                %trim(Wrk_HashHex));

End-Proc;
