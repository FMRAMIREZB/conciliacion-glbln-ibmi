-- Estructura_BD_2_80.sql
-- Db2 for i V7R4+ | Taller Conciliacion GLBLN
-- Copia formateada de Estructura_BD_2.sql (lineas <= 80 columnas).
-- Miembro QSQLSRC sugerido: ESTRUCBD80 (max 10 caracteres IBM i).
-- Funcionalidad equivalente al script original; no editar Estructura_BD_2.sql.
-- Generado por scripts/formatear_estructura_bd_80.py
-- Proyecto: Conciliacion GLBLN - Taller IBM i

SET SCHEMA FMRAMIREZ1;

--==============================================================================
-- Nombre de la Tabla: CNOFT
-- DESCRIPCION: Archivo Maestro de Tablas de Datos Comunes.
-- Objetivo: Persistir informacion funcional de archivo maestro de tablas de
-- datos comunes en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo maestro de
-- tablas de datos comunes
-- Restricciones: Clave reportada: Código de la Tabla, Idioma
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNOFT (
    codigo_tabla FOR COLUMN COTA VARCHAR(20),
    idioma FOR COLUMN SIDIOM VARCHAR(20),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cnoft PRIMARY KEY (codigo_tabla, idioma)
) RCDFMT CNOFTR;

COMMENT ON TABLE CNOFT IS 'Archivo Maestro de Tablas de Datos Comunes.';
LABEL ON TABLE CNOFT IS 'CNOFT - Archivo Maestro de Tablas de Datos Comunes';
COMMENT ON COLUMN CNOFT.codigo_tabla IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNOFT.codigo_tabla IS 'Codigo tabla';
LABEL ON COLUMN CNOFT.codigo_tabla TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNOFT.idioma IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN CNOFT.idioma IS 'Idioma';
LABEL ON COLUMN CNOFT.idioma TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNOFT.descripcion IS
  'Campo Descripcion de archivo maestro de tablas de datos comunes';
LABEL ON COLUMN CNOFT.descripcion IS 'Descripcion';
LABEL ON COLUMN CNOFT.descripcion TEXT IS
  'Campo Descripcion de archivo maestro de tablas de';
COMMENT ON COLUMN CNOFT.valor_texto IS
  'Campo Valor texto de archivo maestro de tablas de datos comunes';
LABEL ON COLUMN CNOFT.valor_texto IS 'Valor texto';
LABEL ON COLUMN CNOFT.valor_texto TEXT IS
  'Campo Valor texto de archivo maestro de tablas de';
COMMENT ON COLUMN CNOFT.valor_numerico IS
  'Campo Valor numerico de archivo maestro de tablas de datos comunes';
LABEL ON COLUMN CNOFT.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN CNOFT.valor_numerico TEXT IS
  'Campo Valor numerico de archivo maestro de tablas';
COMMENT ON COLUMN CNOFT.vigencia_desde IS
  'Campo Vigencia desde de archivo maestro de tablas de datos comunes';
LABEL ON COLUMN CNOFT.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN CNOFT.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo maestro de tablas';
COMMENT ON COLUMN CNOFT.vigencia_hasta IS
  'Campo Vigencia hasta de archivo maestro de tablas de datos comunes';
LABEL ON COLUMN CNOFT.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN CNOFT.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo maestro de tablas';
COMMENT ON COLUMN CNOFT.orden_visualizacion IS
  'Campo Orden visualizacion de archivo maestro de tablas de datos comunes';
LABEL ON COLUMN CNOFT.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN CNOFT.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo maestro de ta';
COMMENT ON COLUMN CNOFT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNOFT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNOFT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CNOFT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNOFT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNOFT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNOFT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNOFT.version_registro IS 'Version';
LABEL ON COLUMN CNOFT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNOFT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNOFT.observaciones IS 'Observaciones';
LABEL ON COLUMN CNOFT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNOFT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNOFT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNOFT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNOFT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNOFT.created_at IS 'Creado';
LABEL ON COLUMN CNOFT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNOFT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNOFT.updated_at IS 'Actualizado';
LABEL ON COLUMN CNOFT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cnoft_pk;
CREATE INDEX idx_cnoft_pk ON CNOFT (codigo_tabla, idioma);
DROP INDEX IF EXISTS idx_cnoft_created_at;
CREATE INDEX idx_cnoft_created_at ON CNOFT (created_at);

--==============================================================================
-- Nombre de la Tabla: CNOFC
-- DESCRIPCION: Archivo de Referencias del Sistema o de Datos Comunes.
-- Objetivo: Persistir informacion funcional de archivo de referencias del
-- sistema o de datos comunes en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de
-- referencias del sistema o de datos comunes
-- Restricciones: Clave reportada: Código de la Tabla, Código del Registro
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNOFC (
    codigo_tabla FOR COLUMN COTA VARCHAR(20),
    codigo_registro FOR COLUMN CORE VARCHAR(20),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cnofc PRIMARY KEY (codigo_tabla, codigo_registro)
) RCDFMT CNOFCR;

COMMENT ON TABLE CNOFC IS
  'Archivo de Referencias del Sistema o de Datos Comunes.';
LABEL ON TABLE CNOFC IS 'CNOFC - Archivo de Referencias del Sistema o de Da';
COMMENT ON COLUMN CNOFC.codigo_tabla IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNOFC.codigo_tabla IS 'Codigo tabla';
LABEL ON COLUMN CNOFC.codigo_tabla TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNOFC.codigo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNOFC.codigo_registro IS 'Codigo registro';
LABEL ON COLUMN CNOFC.codigo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNOFC.descripcion IS
  'Campo Descripcion de archivo de referencias del sistema o de datos comunes';
LABEL ON COLUMN CNOFC.descripcion IS 'Descripcion';
LABEL ON COLUMN CNOFC.descripcion TEXT IS
  'Campo Descripcion de archivo de referencias del si';
COMMENT ON COLUMN CNOFC.valor_texto IS
  'Campo Valor texto de archivo de referencias del sistema o de datos comunes';
LABEL ON COLUMN CNOFC.valor_texto IS 'Valor texto';
LABEL ON COLUMN CNOFC.valor_texto TEXT IS
  'Campo Valor texto de archivo de referencias del si';
COMMENT ON COLUMN CNOFC.valor_numerico IS
  'Campo Valor numerico de archivo de referencias del sistema o de datos comune'
  's';
LABEL ON COLUMN CNOFC.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN CNOFC.valor_numerico TEXT IS
  'Campo Valor numerico de archivo de referencias del';
COMMENT ON COLUMN CNOFC.vigencia_desde IS
  'Campo Vigencia desde de archivo de referencias del sistema o de datos comune'
  's';
LABEL ON COLUMN CNOFC.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN CNOFC.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo de referencias del';
COMMENT ON COLUMN CNOFC.vigencia_hasta IS
  'Campo Vigencia hasta de archivo de referencias del sistema o de datos comune'
  's';
LABEL ON COLUMN CNOFC.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN CNOFC.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo de referencias del';
COMMENT ON COLUMN CNOFC.orden_visualizacion IS
  'Campo Orden visualizacion de archivo de referencias del sistema o de datos c'
  'omunes';
LABEL ON COLUMN CNOFC.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN CNOFC.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo de referencia';
COMMENT ON COLUMN CNOFC.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNOFC.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNOFC.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CNOFC.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNOFC.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNOFC.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNOFC.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNOFC.version_registro IS 'Version';
LABEL ON COLUMN CNOFC.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNOFC.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNOFC.observaciones IS 'Observaciones';
LABEL ON COLUMN CNOFC.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNOFC.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNOFC.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNOFC.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNOFC.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNOFC.created_at IS 'Creado';
LABEL ON COLUMN CNOFC.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNOFC.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNOFC.updated_at IS 'Actualizado';
LABEL ON COLUMN CNOFC.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cnofc_pk;
CREATE INDEX idx_cnofc_pk ON CNOFC (codigo_tabla, codigo_registro);
DROP INDEX IF EXISTS idx_cnofc_created_at;
CREATE INDEX idx_cnofc_created_at ON CNOFC (created_at);

--==============================================================================
-- Nombre de la Tabla: MLNCT
-- DESCRIPCION: Archivo de patrones/formatos de Notificaciones a Clientes (Usos)
-- Objetivo: Persistir informacion funcional de archivo de patrones/formatos de
-- notificaciones a clientes (usos) en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de
-- patrones/formatos de notificaciones a clientes (usos)
-- Restricciones: Clave reportada: Banco, Código de Notificación, Nivel,
-- Idioma y Secuencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE MLNCT (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_de_notificacion FOR COLUMN CODENO VARCHAR(20),
    nivel FOR COLUMN SNIVEL INT,
    idioma FOR COLUMN SIDIOM VARCHAR(20),
    secuencia FOR COLUMN SSECUE INT,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_mlnct PRIMARY KEY (codigo_banco, codigo_de_notificacion, nivel
      , idioma, secuencia)
) RCDFMT MLNCTR;

COMMENT ON TABLE MLNCT IS
  'Archivo de patrones/formatos de Notificaciones a Clientes (Usos)';
LABEL ON TABLE MLNCT IS 'MLNCT - Archivo de patrones/formatos de Notificaci';
COMMENT ON COLUMN MLNCT.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN MLNCT.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN MLNCT.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN MLNCT.codigo_de_notificacion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN MLNCT.codigo_de_notificacion IS 'Codigo de notificaci';
LABEL ON COLUMN MLNCT.codigo_de_notificacion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN MLNCT.nivel IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN MLNCT.nivel IS 'Nivel';
LABEL ON COLUMN MLNCT.nivel TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN MLNCT.idioma IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN MLNCT.idioma IS 'Idioma';
LABEL ON COLUMN MLNCT.idioma TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN MLNCT.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN MLNCT.secuencia IS 'Secuencia';
LABEL ON COLUMN MLNCT.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN MLNCT.descripcion IS
  'Campo Descripcion de archivo de patrones/formatos de notificaciones a client'
  'es (usos)';
LABEL ON COLUMN MLNCT.descripcion IS 'Descripcion';
LABEL ON COLUMN MLNCT.descripcion TEXT IS
  'Campo Descripcion de archivo de patrones/formatos';
COMMENT ON COLUMN MLNCT.valor_texto IS
  'Campo Valor texto de archivo de patrones/formatos de notificaciones a client'
  'es (usos)';
LABEL ON COLUMN MLNCT.valor_texto IS 'Valor texto';
LABEL ON COLUMN MLNCT.valor_texto TEXT IS
  'Campo Valor texto de archivo de patrones/formatos';
COMMENT ON COLUMN MLNCT.valor_numerico IS
  'Campo Valor numerico de archivo de patrones/formatos de notificaciones a cli'
  'entes (usos)';
LABEL ON COLUMN MLNCT.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN MLNCT.valor_numerico TEXT IS
  'Campo Valor numerico de archivo de patrones/format';
COMMENT ON COLUMN MLNCT.vigencia_desde IS
  'Campo Vigencia desde de archivo de patrones/formatos de notificaciones a cli'
  'entes (usos)';
LABEL ON COLUMN MLNCT.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN MLNCT.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo de patrones/format';
COMMENT ON COLUMN MLNCT.vigencia_hasta IS
  'Campo Vigencia hasta de archivo de patrones/formatos de notificaciones a cli'
  'entes (usos)';
LABEL ON COLUMN MLNCT.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN MLNCT.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo de patrones/format';
COMMENT ON COLUMN MLNCT.orden_visualizacion IS
  'Campo Orden visualizacion de archivo de patrones/formatos de notificaciones '
  'a clientes (usos)';
LABEL ON COLUMN MLNCT.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN MLNCT.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo de patrones/f';
COMMENT ON COLUMN MLNCT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN MLNCT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN MLNCT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN MLNCT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN MLNCT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN MLNCT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN MLNCT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN MLNCT.version_registro IS 'Version';
LABEL ON COLUMN MLNCT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN MLNCT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN MLNCT.observaciones IS 'Observaciones';
LABEL ON COLUMN MLNCT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN MLNCT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN MLNCT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN MLNCT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN MLNCT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN MLNCT.created_at IS 'Creado';
LABEL ON COLUMN MLNCT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN MLNCT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN MLNCT.updated_at IS 'Actualizado';
LABEL ON COLUMN MLNCT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_mlnct_pk;
CREATE INDEX idx_mlnct_pk ON MLNCT (codigo_banco, codigo_de_notificacion);
DROP INDEX IF EXISTS idx_mlnct_created_at;
CREATE INDEX idx_mlnct_created_at ON MLNCT (created_at);

--==============================================================================
-- Nombre de la Tabla: MLNOT
-- DESCRIPCION: Archivo que contiene los datos a imprimir en la notificación
-- (Usos)
-- Objetivo: Persistir informacion funcional de archivo que contiene los datos a
-- imprimir en la notificación (usos) en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo que contiene
-- los datos a imprimir en la notificación (usos)
-- Restricciones: Clave reportada: Banco, Fecha de Proceso, Cuenta, Código de
-- Notificación y Nivel.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE MLNOT (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    fecha_proceso FOR COLUMN FEPR DATE,
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    codigo_de_notificacion FOR COLUMN CODENO VARCHAR(20),
    nivel FOR COLUMN SNIVEL INT,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_mlnot PRIMARY KEY (codigo_banco, fecha_proceso, numero_cuenta
      , codigo_de_notificacion, nivel)
) RCDFMT MLNOTR;

COMMENT ON TABLE MLNOT IS
  'Archivo que contiene los datos a imprimir en la notificación (Usos)';
LABEL ON TABLE MLNOT IS 'MLNOT - Archivo que contiene los datos a imprimir';
COMMENT ON COLUMN MLNOT.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN MLNOT.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN MLNOT.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN MLNOT.fecha_proceso IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN MLNOT.fecha_proceso IS 'Fecha proceso';
LABEL ON COLUMN MLNOT.fecha_proceso TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN MLNOT.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN MLNOT.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN MLNOT.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN MLNOT.codigo_de_notificacion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN MLNOT.codigo_de_notificacion IS 'Codigo de notificaci';
LABEL ON COLUMN MLNOT.codigo_de_notificacion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN MLNOT.nivel IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN MLNOT.nivel IS 'Nivel';
LABEL ON COLUMN MLNOT.nivel TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN MLNOT.descripcion IS
  'Campo Descripcion de archivo que contiene los datos a imprimir en la notific'
  'ación (usos)';
LABEL ON COLUMN MLNOT.descripcion IS 'Descripcion';
LABEL ON COLUMN MLNOT.descripcion TEXT IS
  'Campo Descripcion de archivo que contiene los dato';
COMMENT ON COLUMN MLNOT.valor_texto IS
  'Campo Valor texto de archivo que contiene los datos a imprimir en la notific'
  'ación (usos)';
LABEL ON COLUMN MLNOT.valor_texto IS 'Valor texto';
LABEL ON COLUMN MLNOT.valor_texto TEXT IS
  'Campo Valor texto de archivo que contiene los dato';
COMMENT ON COLUMN MLNOT.valor_numerico IS
  'Campo Valor numerico de archivo que contiene los datos a imprimir en la noti'
  'ficación (usos)';
LABEL ON COLUMN MLNOT.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN MLNOT.valor_numerico TEXT IS
  'Campo Valor numerico de archivo que contiene los d';
COMMENT ON COLUMN MLNOT.vigencia_desde IS
  'Campo Vigencia desde de archivo que contiene los datos a imprimir en la noti'
  'ficación (usos)';
LABEL ON COLUMN MLNOT.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN MLNOT.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo que contiene los d';
COMMENT ON COLUMN MLNOT.vigencia_hasta IS
  'Campo Vigencia hasta de archivo que contiene los datos a imprimir en la noti'
  'ficación (usos)';
LABEL ON COLUMN MLNOT.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN MLNOT.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo que contiene los d';
COMMENT ON COLUMN MLNOT.orden_visualizacion IS
  'Campo Orden visualizacion de archivo que contiene los datos a imprimir en la'
  ' notificación (usos)';
LABEL ON COLUMN MLNOT.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN MLNOT.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo que contiene';
COMMENT ON COLUMN MLNOT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN MLNOT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN MLNOT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN MLNOT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN MLNOT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN MLNOT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN MLNOT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN MLNOT.version_registro IS 'Version';
LABEL ON COLUMN MLNOT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN MLNOT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN MLNOT.observaciones IS 'Observaciones';
LABEL ON COLUMN MLNOT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN MLNOT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN MLNOT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN MLNOT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN MLNOT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN MLNOT.created_at IS 'Creado';
LABEL ON COLUMN MLNOT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN MLNOT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN MLNOT.updated_at IS 'Actualizado';
LABEL ON COLUMN MLNOT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_mlnot_pk;
CREATE INDEX idx_mlnot_pk ON MLNOT (codigo_banco, fecha_proceso);
DROP INDEX IF EXISTS idx_mlnot_fecha;
CREATE INDEX idx_mlnot_fecha ON MLNOT (fecha_proceso);

--==============================================================================
-- Nombre de la Tabla: HSNOT
-- DESCRIPCION: Histórico de Datos impresos en las Notificaciones
-- Objetivo: Persistir informacion funcional de histórico de datos impresos en
-- las notificaciones en el entorno IBM i del taller.
-- Tipo de Tabla: Historico
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de histórico de datos
-- impresos en las notificaciones
-- Restricciones: Clave reportada: Banco, Fecha de Proceso, Cuenta, Código de
-- Notificación y Nivel.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE HSNOT (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    fecha_proceso FOR COLUMN FEPR DATE,
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    codigo_de_notificacion FOR COLUMN CODENO VARCHAR(20),
    nivel FOR COLUMN SNIVEL INT,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_hsnot PRIMARY KEY (codigo_banco, fecha_proceso, numero_cuenta
      , codigo_de_notificacion, nivel)
) RCDFMT HSNOTR;

COMMENT ON TABLE HSNOT IS 'Histórico de Datos impresos en las Notificaciones';
LABEL ON TABLE HSNOT IS 'HSNOT - Histórico de Datos impresos en las Notific';
COMMENT ON COLUMN HSNOT.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN HSNOT.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN HSNOT.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN HSNOT.fecha_proceso IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN HSNOT.fecha_proceso IS 'Fecha proceso';
LABEL ON COLUMN HSNOT.fecha_proceso TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN HSNOT.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN HSNOT.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN HSNOT.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN HSNOT.codigo_de_notificacion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN HSNOT.codigo_de_notificacion IS 'Codigo de notificaci';
LABEL ON COLUMN HSNOT.codigo_de_notificacion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN HSNOT.nivel IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN HSNOT.nivel IS 'Nivel';
LABEL ON COLUMN HSNOT.nivel TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN HSNOT.descripcion IS
  'Campo Descripcion de histórico de datos impresos en las notificaciones';
LABEL ON COLUMN HSNOT.descripcion IS 'Descripcion';
LABEL ON COLUMN HSNOT.descripcion TEXT IS
  'Campo Descripcion de histórico de datos impresos e';
COMMENT ON COLUMN HSNOT.valor_texto IS
  'Campo Valor texto de histórico de datos impresos en las notificaciones';
LABEL ON COLUMN HSNOT.valor_texto IS 'Valor texto';
LABEL ON COLUMN HSNOT.valor_texto TEXT IS
  'Campo Valor texto de histórico de datos impresos e';
COMMENT ON COLUMN HSNOT.valor_numerico IS
  'Campo Valor numerico de histórico de datos impresos en las notificaciones';
LABEL ON COLUMN HSNOT.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN HSNOT.valor_numerico TEXT IS
  'Campo Valor numerico de histórico de datos impreso';
COMMENT ON COLUMN HSNOT.vigencia_desde IS
  'Campo Vigencia desde de histórico de datos impresos en las notificaciones';
LABEL ON COLUMN HSNOT.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN HSNOT.vigencia_desde TEXT IS
  'Campo Vigencia desde de histórico de datos impreso';
COMMENT ON COLUMN HSNOT.vigencia_hasta IS
  'Campo Vigencia hasta de histórico de datos impresos en las notificaciones';
LABEL ON COLUMN HSNOT.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN HSNOT.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de histórico de datos impreso';
COMMENT ON COLUMN HSNOT.orden_visualizacion IS
  'Campo Orden visualizacion de histórico de datos impresos en las notificacio'
  'nes';
LABEL ON COLUMN HSNOT.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN HSNOT.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de histórico de datos im';
COMMENT ON COLUMN HSNOT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN HSNOT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN HSNOT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN HSNOT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN HSNOT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN HSNOT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN HSNOT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN HSNOT.version_registro IS 'Version';
LABEL ON COLUMN HSNOT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN HSNOT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN HSNOT.observaciones IS 'Observaciones';
LABEL ON COLUMN HSNOT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN HSNOT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN HSNOT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN HSNOT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN HSNOT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN HSNOT.created_at IS 'Creado';
LABEL ON COLUMN HSNOT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN HSNOT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN HSNOT.updated_at IS 'Actualizado';
LABEL ON COLUMN HSNOT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_hsnot_pk;
CREATE INDEX idx_hsnot_pk ON HSNOT (codigo_banco, fecha_proceso);
DROP INDEX IF EXISTS idx_hsnot_fecha;
CREATE INDEX idx_hsnot_fecha ON HSNOT (fecha_proceso);

--==============================================================================
-- Nombre de la Tabla: HEAD
-- DESCRIPCION: Archivo títulos de reportes
-- Objetivo: Persistir informacion funcional de archivo títulos de reportes en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo títulos de
-- reportes
-- Restricciones: Clave reportada: Nombre del Printer File, Secuencia
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE HEAD (
    nombre_printer_file FOR COLUMN NOPRFI VARCHAR(50),
    secuencia FOR COLUMN SSECUE INT,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_head PRIMARY KEY (nombre_printer_file, secuencia)
) RCDFMT HEADR;

COMMENT ON TABLE HEAD IS 'Archivo títulos de reportes';
LABEL ON TABLE HEAD IS 'HEAD - Archivo títulos de reportes';
COMMENT ON COLUMN HEAD.nombre_printer_file IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN HEAD.nombre_printer_file IS 'Nombre printer file';
LABEL ON COLUMN HEAD.nombre_printer_file TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN HEAD.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN HEAD.secuencia IS 'Secuencia';
LABEL ON COLUMN HEAD.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN HEAD.descripcion IS
  'Campo Descripcion de archivo títulos de reportes';
LABEL ON COLUMN HEAD.descripcion IS 'Descripcion';
LABEL ON COLUMN HEAD.descripcion TEXT IS
  'Campo Descripcion de archivo títulos de reportes';
COMMENT ON COLUMN HEAD.valor_texto IS
  'Campo Valor texto de archivo títulos de reportes';
LABEL ON COLUMN HEAD.valor_texto IS 'Valor texto';
LABEL ON COLUMN HEAD.valor_texto TEXT IS
  'Campo Valor texto de archivo títulos de reportes';
COMMENT ON COLUMN HEAD.valor_numerico IS
  'Campo Valor numerico de archivo títulos de reportes';
LABEL ON COLUMN HEAD.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN HEAD.valor_numerico TEXT IS
  'Campo Valor numerico de archivo títulos de reporte';
COMMENT ON COLUMN HEAD.vigencia_desde IS
  'Campo Vigencia desde de archivo títulos de reportes';
LABEL ON COLUMN HEAD.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN HEAD.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo títulos de reporte';
COMMENT ON COLUMN HEAD.vigencia_hasta IS
  'Campo Vigencia hasta de archivo títulos de reportes';
LABEL ON COLUMN HEAD.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN HEAD.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo títulos de reporte';
COMMENT ON COLUMN HEAD.orden_visualizacion IS
  'Campo Orden visualizacion de archivo títulos de reportes';
LABEL ON COLUMN HEAD.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN HEAD.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo títulos de re';
COMMENT ON COLUMN HEAD.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN HEAD.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN HEAD.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN HEAD.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN HEAD.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN HEAD.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN HEAD.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN HEAD.version_registro IS 'Version';
LABEL ON COLUMN HEAD.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN HEAD.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN HEAD.observaciones IS 'Observaciones';
LABEL ON COLUMN HEAD.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN HEAD.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN HEAD.estado_registro IS 'Estado Reg';
LABEL ON COLUMN HEAD.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN HEAD.created_at IS 'Marca de tiempo de creacion del registro';
LABEL ON COLUMN HEAD.created_at IS 'Creado';
LABEL ON COLUMN HEAD.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN HEAD.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN HEAD.updated_at IS 'Actualizado';
LABEL ON COLUMN HEAD.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_head_pk;
CREATE INDEX idx_head_pk ON HEAD (nombre_printer_file, secuencia);
DROP INDEX IF EXISTS idx_head_created_at;
CREATE INDEX idx_head_created_at ON HEAD (created_at);

--==============================================================================
-- Nombre de la Tabla: MSSGS
-- DESCRIPCION: Archivo mensajes de Errores.
-- Objetivo: Persistir informacion funcional de archivo mensajes de errores en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo mensajes de
-- errores
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE MSSGS (
    id FOR COLUMN SID BIGINT,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_mssgs PRIMARY KEY (id)
) RCDFMT MSSGSR;

COMMENT ON TABLE MSSGS IS 'Archivo mensajes de Errores.';
LABEL ON TABLE MSSGS IS 'MSSGS - Archivo mensajes de Errores.';
COMMENT ON COLUMN MSSGS.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN MSSGS.id IS 'Id';
LABEL ON COLUMN MSSGS.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN MSSGS.descripcion IS
  'Campo Descripcion de archivo mensajes de errores';
LABEL ON COLUMN MSSGS.descripcion IS 'Descripcion';
LABEL ON COLUMN MSSGS.descripcion TEXT IS
  'Campo Descripcion de archivo mensajes de errores';
COMMENT ON COLUMN MSSGS.valor_texto IS
  'Campo Valor texto de archivo mensajes de errores';
LABEL ON COLUMN MSSGS.valor_texto IS 'Valor texto';
LABEL ON COLUMN MSSGS.valor_texto TEXT IS
  'Campo Valor texto de archivo mensajes de errores';
COMMENT ON COLUMN MSSGS.valor_numerico IS
  'Campo Valor numerico de archivo mensajes de errores';
LABEL ON COLUMN MSSGS.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN MSSGS.valor_numerico TEXT IS
  'Campo Valor numerico de archivo mensajes de errore';
COMMENT ON COLUMN MSSGS.vigencia_desde IS
  'Campo Vigencia desde de archivo mensajes de errores';
LABEL ON COLUMN MSSGS.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN MSSGS.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo mensajes de errore';
COMMENT ON COLUMN MSSGS.vigencia_hasta IS
  'Campo Vigencia hasta de archivo mensajes de errores';
LABEL ON COLUMN MSSGS.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN MSSGS.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo mensajes de errore';
COMMENT ON COLUMN MSSGS.orden_visualizacion IS
  'Campo Orden visualizacion de archivo mensajes de errores';
LABEL ON COLUMN MSSGS.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN MSSGS.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo mensajes de e';
COMMENT ON COLUMN MSSGS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN MSSGS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN MSSGS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN MSSGS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN MSSGS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN MSSGS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN MSSGS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN MSSGS.version_registro IS 'Version';
LABEL ON COLUMN MSSGS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN MSSGS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN MSSGS.observaciones IS 'Observaciones';
LABEL ON COLUMN MSSGS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN MSSGS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN MSSGS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN MSSGS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN MSSGS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN MSSGS.created_at IS 'Creado';
LABEL ON COLUMN MSSGS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN MSSGS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN MSSGS.updated_at IS 'Actualizado';
LABEL ON COLUMN MSSGS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_mssgs_pk;
CREATE INDEX idx_mssgs_pk ON MSSGS (id);
DROP INDEX IF EXISTS idx_mssgs_created_at;
CREATE INDEX idx_mssgs_created_at ON MSSGS (created_at);

--==============================================================================
-- Nombre de la Tabla: HOLYD
-- DESCRIPCION: Archivo de Feriados.
-- Objetivo: Persistir informacion funcional de archivo de feriados en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de feriados
-- Restricciones: Clave reportada: Moneda, Fecha
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE HOLYD (
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    fecha FOR COLUMN SFECHA DATE,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_holyd PRIMARY KEY (codigo_moneda, fecha)
) RCDFMT HOLYDR;

COMMENT ON TABLE HOLYD IS 'Archivo de Feriados.';
LABEL ON TABLE HOLYD IS 'HOLYD - Archivo de Feriados.';
COMMENT ON COLUMN HOLYD.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN HOLYD.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN HOLYD.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN HOLYD.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN HOLYD.fecha IS 'Fecha';
LABEL ON COLUMN HOLYD.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN HOLYD.descripcion IS
  'Campo Descripcion de archivo de feriados';
LABEL ON COLUMN HOLYD.descripcion IS 'Descripcion';
LABEL ON COLUMN HOLYD.descripcion TEXT IS
  'Campo Descripcion de archivo de feriados';
COMMENT ON COLUMN HOLYD.valor_texto IS
  'Campo Valor texto de archivo de feriados';
LABEL ON COLUMN HOLYD.valor_texto IS 'Valor texto';
LABEL ON COLUMN HOLYD.valor_texto TEXT IS
  'Campo Valor texto de archivo de feriados';
COMMENT ON COLUMN HOLYD.valor_numerico IS
  'Campo Valor numerico de archivo de feriados';
LABEL ON COLUMN HOLYD.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN HOLYD.valor_numerico TEXT IS
  'Campo Valor numerico de archivo de feriados';
COMMENT ON COLUMN HOLYD.vigencia_desde IS
  'Campo Vigencia desde de archivo de feriados';
LABEL ON COLUMN HOLYD.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN HOLYD.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo de feriados';
COMMENT ON COLUMN HOLYD.vigencia_hasta IS
  'Campo Vigencia hasta de archivo de feriados';
LABEL ON COLUMN HOLYD.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN HOLYD.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo de feriados';
COMMENT ON COLUMN HOLYD.orden_visualizacion IS
  'Campo Orden visualizacion de archivo de feriados';
LABEL ON COLUMN HOLYD.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN HOLYD.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo de feriados';
COMMENT ON COLUMN HOLYD.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN HOLYD.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN HOLYD.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN HOLYD.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN HOLYD.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN HOLYD.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN HOLYD.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN HOLYD.version_registro IS 'Version';
LABEL ON COLUMN HOLYD.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN HOLYD.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN HOLYD.observaciones IS 'Observaciones';
LABEL ON COLUMN HOLYD.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN HOLYD.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN HOLYD.estado_registro IS 'Estado Reg';
LABEL ON COLUMN HOLYD.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN HOLYD.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN HOLYD.created_at IS 'Creado';
LABEL ON COLUMN HOLYD.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN HOLYD.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN HOLYD.updated_at IS 'Actualizado';
LABEL ON COLUMN HOLYD.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_holyd_pk;
CREATE INDEX idx_holyd_pk ON HOLYD (codigo_moneda, fecha);
DROP INDEX IF EXISTS idx_holyd_fecha;
CREATE INDEX idx_holyd_fecha ON HOLYD (fecha);

--==============================================================================
-- Nombre de la Tabla: APCLS
-- DESCRIPCION: Archivo Maestro de Productos.
-- Objetivo: Persistir informacion funcional de archivo maestro de productos en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo maestro de
-- productos
-- Restricciones: Clave reportada: Código de Banco, Código de Producto
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE APCLS (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_de_producto FOR COLUMN CODEPR VARCHAR(20),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_apcls PRIMARY KEY (codigo_banco, codigo_de_producto)
) RCDFMT APCLSR;

COMMENT ON TABLE APCLS IS 'Archivo Maestro de Productos.';
LABEL ON TABLE APCLS IS 'APCLS - Archivo Maestro de Productos.';
COMMENT ON COLUMN APCLS.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN APCLS.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN APCLS.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN APCLS.codigo_de_producto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN APCLS.codigo_de_producto IS 'Codigo de producto';
LABEL ON COLUMN APCLS.codigo_de_producto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN APCLS.descripcion IS
  'Campo Descripcion de archivo maestro de productos';
LABEL ON COLUMN APCLS.descripcion IS 'Descripcion';
LABEL ON COLUMN APCLS.descripcion TEXT IS
  'Campo Descripcion de archivo maestro de productos';
COMMENT ON COLUMN APCLS.valor_texto IS
  'Campo Valor texto de archivo maestro de productos';
LABEL ON COLUMN APCLS.valor_texto IS 'Valor texto';
LABEL ON COLUMN APCLS.valor_texto TEXT IS
  'Campo Valor texto de archivo maestro de productos';
COMMENT ON COLUMN APCLS.valor_numerico IS
  'Campo Valor numerico de archivo maestro de productos';
LABEL ON COLUMN APCLS.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN APCLS.valor_numerico TEXT IS
  'Campo Valor numerico de archivo maestro de product';
COMMENT ON COLUMN APCLS.vigencia_desde IS
  'Campo Vigencia desde de archivo maestro de productos';
LABEL ON COLUMN APCLS.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN APCLS.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo maestro de product';
COMMENT ON COLUMN APCLS.vigencia_hasta IS
  'Campo Vigencia hasta de archivo maestro de productos';
LABEL ON COLUMN APCLS.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN APCLS.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo maestro de product';
COMMENT ON COLUMN APCLS.orden_visualizacion IS
  'Campo Orden visualizacion de archivo maestro de productos';
LABEL ON COLUMN APCLS.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN APCLS.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo maestro de pr';
COMMENT ON COLUMN APCLS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN APCLS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN APCLS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN APCLS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN APCLS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN APCLS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN APCLS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN APCLS.version_registro IS 'Version';
LABEL ON COLUMN APCLS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN APCLS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN APCLS.observaciones IS 'Observaciones';
LABEL ON COLUMN APCLS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN APCLS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN APCLS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN APCLS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN APCLS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN APCLS.created_at IS 'Creado';
LABEL ON COLUMN APCLS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN APCLS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN APCLS.updated_at IS 'Actualizado';
LABEL ON COLUMN APCLS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_apcls_pk;
CREATE INDEX idx_apcls_pk ON APCLS (codigo_banco, codigo_de_producto);
DROP INDEX IF EXISTS idx_apcls_created_at;
CREATE INDEX idx_apcls_created_at ON APCLS (created_at);

--==============================================================================
-- Nombre de la Tabla: RATES
-- DESCRIPCION: Archivos de Tasas de Cambio (Posición / Contra Valor)
-- Objetivo: Persistir informacion funcional de archivos de tasas de cambio
-- (posición / contra valor) en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivos de tasas de
-- cambio (posición / contra valor)
-- Restricciones: Clave reportada: Código de Banco, Código de Moneda
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE RATES (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_rates PRIMARY KEY (codigo_banco, codigo_moneda)
) RCDFMT RATESR;

COMMENT ON TABLE RATES IS
  'Archivos de Tasas de Cambio (Posición / Contra Valor)';
LABEL ON TABLE RATES IS 'RATES - Archivos de Tasas de Cambio (Posición / Co';
COMMENT ON COLUMN RATES.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RATES.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN RATES.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RATES.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RATES.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN RATES.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RATES.descripcion IS
  'Campo Descripcion de archivos de tasas de cambio (posición / contra valor)';
LABEL ON COLUMN RATES.descripcion IS 'Descripcion';
LABEL ON COLUMN RATES.descripcion TEXT IS
  'Campo Descripcion de archivos de tasas de cambio (';
COMMENT ON COLUMN RATES.valor_texto IS
  'Campo Valor texto de archivos de tasas de cambio (posición / contra valor)';
LABEL ON COLUMN RATES.valor_texto IS 'Valor texto';
LABEL ON COLUMN RATES.valor_texto TEXT IS
  'Campo Valor texto de archivos de tasas de cambio (';
COMMENT ON COLUMN RATES.valor_numerico IS
  'Campo Valor numerico de archivos de tasas de cambio (posición / contra valo'
  'r)';
LABEL ON COLUMN RATES.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN RATES.valor_numerico TEXT IS
  'Campo Valor numerico de archivos de tasas de cambi';
COMMENT ON COLUMN RATES.vigencia_desde IS
  'Campo Vigencia desde de archivos de tasas de cambio (posición / contra valo'
  'r)';
LABEL ON COLUMN RATES.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN RATES.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivos de tasas de cambi';
COMMENT ON COLUMN RATES.vigencia_hasta IS
  'Campo Vigencia hasta de archivos de tasas de cambio (posición / contra valo'
  'r)';
LABEL ON COLUMN RATES.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN RATES.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivos de tasas de cambi';
COMMENT ON COLUMN RATES.orden_visualizacion IS
  'Campo Orden visualizacion de archivos de tasas de cambio (posición / contra'
  ' valor)';
LABEL ON COLUMN RATES.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN RATES.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivos de tasas de';
COMMENT ON COLUMN RATES.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN RATES.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN RATES.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN RATES.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN RATES.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN RATES.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN RATES.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN RATES.version_registro IS 'Version';
LABEL ON COLUMN RATES.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN RATES.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN RATES.observaciones IS 'Observaciones';
LABEL ON COLUMN RATES.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN RATES.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN RATES.estado_registro IS 'Estado Reg';
LABEL ON COLUMN RATES.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN RATES.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN RATES.created_at IS 'Creado';
LABEL ON COLUMN RATES.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN RATES.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN RATES.updated_at IS 'Actualizado';
LABEL ON COLUMN RATES.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_rates_pk;
CREATE INDEX idx_rates_pk ON RATES (codigo_banco, codigo_moneda);
DROP INDEX IF EXISTS idx_rates_created_at;
CREATE INDEX idx_rates_created_at ON RATES (created_at);

--==============================================================================
-- Nombre de la Tabla: RTRNS
-- DESCRIPCION: Historia de Tasas de Cambio.
-- Objetivo: Persistir informacion funcional de historia de tasas de cambio en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Historico
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de historia de tasas de
-- cambio
-- Restricciones: Clave reportada: Código de Banco, Moneda, Fecha
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE RTRNS (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    fecha FOR COLUMN SFECHA DATE,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_rtrns PRIMARY KEY (codigo_banco, codigo_moneda, fecha)
) RCDFMT RTRNSR;

COMMENT ON TABLE RTRNS IS 'Historia de Tasas de Cambio.';
LABEL ON TABLE RTRNS IS 'RTRNS - Historia de Tasas de Cambio.';
COMMENT ON COLUMN RTRNS.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RTRNS.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN RTRNS.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RTRNS.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RTRNS.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN RTRNS.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RTRNS.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN RTRNS.fecha IS 'Fecha';
LABEL ON COLUMN RTRNS.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN RTRNS.descripcion IS
  'Campo Descripcion de historia de tasas de cambio';
LABEL ON COLUMN RTRNS.descripcion IS 'Descripcion';
LABEL ON COLUMN RTRNS.descripcion TEXT IS
  'Campo Descripcion de historia de tasas de cambio';
COMMENT ON COLUMN RTRNS.valor_texto IS
  'Campo Valor texto de historia de tasas de cambio';
LABEL ON COLUMN RTRNS.valor_texto IS 'Valor texto';
LABEL ON COLUMN RTRNS.valor_texto TEXT IS
  'Campo Valor texto de historia de tasas de cambio';
COMMENT ON COLUMN RTRNS.valor_numerico IS
  'Campo Valor numerico de historia de tasas de cambio';
LABEL ON COLUMN RTRNS.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN RTRNS.valor_numerico TEXT IS
  'Campo Valor numerico de historia de tasas de cambi';
COMMENT ON COLUMN RTRNS.vigencia_desde IS
  'Campo Vigencia desde de historia de tasas de cambio';
LABEL ON COLUMN RTRNS.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN RTRNS.vigencia_desde TEXT IS
  'Campo Vigencia desde de historia de tasas de cambi';
COMMENT ON COLUMN RTRNS.vigencia_hasta IS
  'Campo Vigencia hasta de historia de tasas de cambio';
LABEL ON COLUMN RTRNS.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN RTRNS.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de historia de tasas de cambi';
COMMENT ON COLUMN RTRNS.orden_visualizacion IS
  'Campo Orden visualizacion de historia de tasas de cambio';
LABEL ON COLUMN RTRNS.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN RTRNS.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de historia de tasas de';
COMMENT ON COLUMN RTRNS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN RTRNS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN RTRNS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN RTRNS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN RTRNS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN RTRNS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN RTRNS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN RTRNS.version_registro IS 'Version';
LABEL ON COLUMN RTRNS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN RTRNS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN RTRNS.observaciones IS 'Observaciones';
LABEL ON COLUMN RTRNS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN RTRNS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN RTRNS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN RTRNS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN RTRNS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN RTRNS.created_at IS 'Creado';
LABEL ON COLUMN RTRNS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN RTRNS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN RTRNS.updated_at IS 'Actualizado';
LABEL ON COLUMN RTRNS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_rtrns_pk;
CREATE INDEX idx_rtrns_pk ON RTRNS (codigo_banco, codigo_moneda);
DROP INDEX IF EXISTS idx_rtrns_fecha;
CREATE INDEX idx_rtrns_fecha ON RTRNS (fecha);

--==============================================================================
-- Nombre de la Tabla: HLHIS
-- DESCRIPCION: Archivo histórico de Cambios en Retenciones.
-- Objetivo: Persistir informacion funcional de archivo histórico de cambios en
-- retenciones en el entorno IBM i del taller.
-- Tipo de Tabla: Historico
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo histórico
-- de cambios en retenciones
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE HLHIS (
    id FOR COLUMN SID BIGINT,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_hlhis PRIMARY KEY (id)
) RCDFMT HLHISR;

COMMENT ON TABLE HLHIS IS 'Archivo histórico de Cambios en Retenciones.';
LABEL ON TABLE HLHIS IS 'HLHIS - Archivo histórico de Cambios en Retencione';
COMMENT ON COLUMN HLHIS.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN HLHIS.id IS 'Id';
LABEL ON COLUMN HLHIS.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN HLHIS.descripcion IS
  'Campo Descripcion de archivo histórico de cambios en retenciones';
LABEL ON COLUMN HLHIS.descripcion IS 'Descripcion';
LABEL ON COLUMN HLHIS.descripcion TEXT IS
  'Campo Descripcion de archivo histórico de cambios';
COMMENT ON COLUMN HLHIS.valor_texto IS
  'Campo Valor texto de archivo histórico de cambios en retenciones';
LABEL ON COLUMN HLHIS.valor_texto IS 'Valor texto';
LABEL ON COLUMN HLHIS.valor_texto TEXT IS
  'Campo Valor texto de archivo histórico de cambios';
COMMENT ON COLUMN HLHIS.valor_numerico IS
  'Campo Valor numerico de archivo histórico de cambios en retenciones';
LABEL ON COLUMN HLHIS.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN HLHIS.valor_numerico TEXT IS
  'Campo Valor numerico de archivo histórico de cambi';
COMMENT ON COLUMN HLHIS.vigencia_desde IS
  'Campo Vigencia desde de archivo histórico de cambios en retenciones';
LABEL ON COLUMN HLHIS.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN HLHIS.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo histórico de cambi';
COMMENT ON COLUMN HLHIS.vigencia_hasta IS
  'Campo Vigencia hasta de archivo histórico de cambios en retenciones';
LABEL ON COLUMN HLHIS.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN HLHIS.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo histórico de cambi';
COMMENT ON COLUMN HLHIS.orden_visualizacion IS
  'Campo Orden visualizacion de archivo histórico de cambios en retenciones';
LABEL ON COLUMN HLHIS.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN HLHIS.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo histórico de';
COMMENT ON COLUMN HLHIS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN HLHIS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN HLHIS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN HLHIS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN HLHIS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN HLHIS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN HLHIS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN HLHIS.version_registro IS 'Version';
LABEL ON COLUMN HLHIS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN HLHIS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN HLHIS.observaciones IS 'Observaciones';
LABEL ON COLUMN HLHIS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN HLHIS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN HLHIS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN HLHIS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN HLHIS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN HLHIS.created_at IS 'Creado';
LABEL ON COLUMN HLHIS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN HLHIS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN HLHIS.updated_at IS 'Actualizado';
LABEL ON COLUMN HLHIS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_hlhis_pk;
CREATE INDEX idx_hlhis_pk ON HLHIS (id);
DROP INDEX IF EXISTS idx_hlhis_created_at;
CREATE INDEX idx_hlhis_created_at ON HLHIS (created_at);

--==============================================================================
-- Nombre de la Tabla: PRENA
-- DESCRIPCION: Archivo de Descripciones de Programas en Inglés.
-- Objetivo: Persistir informacion funcional de archivo de descripciones de
-- programas en inglés en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de
-- descripciones de programas en inglés
-- Restricciones: Clave reportada: Nombre del Programa
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE PRENA (
    nombre_programa FOR COLUMN NOPR VARCHAR(50),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_prena PRIMARY KEY (nombre_programa)
) RCDFMT PRENAR;

COMMENT ON TABLE PRENA IS 'Archivo de Descripciones de Programas en Inglés.';
LABEL ON TABLE PRENA IS 'PRENA - Archivo de Descripciones de Programas en I';
COMMENT ON COLUMN PRENA.nombre_programa IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN PRENA.nombre_programa IS 'Nombre programa';
LABEL ON COLUMN PRENA.nombre_programa TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN PRENA.descripcion IS
  'Campo Descripcion de archivo de descripciones de programas en inglés';
LABEL ON COLUMN PRENA.descripcion IS 'Descripcion';
LABEL ON COLUMN PRENA.descripcion TEXT IS
  'Campo Descripcion de archivo de descripciones de p';
COMMENT ON COLUMN PRENA.valor_texto IS
  'Campo Valor texto de archivo de descripciones de programas en inglés';
LABEL ON COLUMN PRENA.valor_texto IS 'Valor texto';
LABEL ON COLUMN PRENA.valor_texto TEXT IS
  'Campo Valor texto de archivo de descripciones de p';
COMMENT ON COLUMN PRENA.valor_numerico IS
  'Campo Valor numerico de archivo de descripciones de programas en inglés';
LABEL ON COLUMN PRENA.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN PRENA.valor_numerico TEXT IS
  'Campo Valor numerico de archivo de descripciones d';
COMMENT ON COLUMN PRENA.vigencia_desde IS
  'Campo Vigencia desde de archivo de descripciones de programas en inglés';
LABEL ON COLUMN PRENA.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN PRENA.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo de descripciones d';
COMMENT ON COLUMN PRENA.vigencia_hasta IS
  'Campo Vigencia hasta de archivo de descripciones de programas en inglés';
LABEL ON COLUMN PRENA.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN PRENA.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo de descripciones d';
COMMENT ON COLUMN PRENA.orden_visualizacion IS
  'Campo Orden visualizacion de archivo de descripciones de programas en inglé'
  's';
LABEL ON COLUMN PRENA.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN PRENA.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo de descripcio';
COMMENT ON COLUMN PRENA.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN PRENA.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN PRENA.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN PRENA.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN PRENA.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN PRENA.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN PRENA.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN PRENA.version_registro IS 'Version';
LABEL ON COLUMN PRENA.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN PRENA.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN PRENA.observaciones IS 'Observaciones';
LABEL ON COLUMN PRENA.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN PRENA.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN PRENA.estado_registro IS 'Estado Reg';
LABEL ON COLUMN PRENA.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN PRENA.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN PRENA.created_at IS 'Creado';
LABEL ON COLUMN PRENA.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN PRENA.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN PRENA.updated_at IS 'Actualizado';
LABEL ON COLUMN PRENA.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_prena_pk;
CREATE INDEX idx_prena_pk ON PRENA (nombre_programa);
DROP INDEX IF EXISTS idx_prena_created_at;
CREATE INDEX idx_prena_created_at ON PRENA (created_at);

--==============================================================================
-- Nombre de la Tabla: PRENS
-- DESCRIPCION: Archivo de Descripciones de Programas en Español.
-- Objetivo: Persistir informacion funcional de archivo de descripciones de
-- programas en español en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de
-- descripciones de programas en español
-- Restricciones: Clave reportada: Nombre del Programa
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE PRENS (
    nombre_programa FOR COLUMN NOPR VARCHAR(50),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_prens PRIMARY KEY (nombre_programa)
) RCDFMT PRENSR;

COMMENT ON TABLE PRENS IS 'Archivo de Descripciones de Programas en Español.';
LABEL ON TABLE PRENS IS 'PRENS - Archivo de Descripciones de Programas en E';
COMMENT ON COLUMN PRENS.nombre_programa IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN PRENS.nombre_programa IS 'Nombre programa';
LABEL ON COLUMN PRENS.nombre_programa TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN PRENS.descripcion IS
  'Campo Descripcion de archivo de descripciones de programas en español';
LABEL ON COLUMN PRENS.descripcion IS 'Descripcion';
LABEL ON COLUMN PRENS.descripcion TEXT IS
  'Campo Descripcion de archivo de descripciones de p';
COMMENT ON COLUMN PRENS.valor_texto IS
  'Campo Valor texto de archivo de descripciones de programas en español';
LABEL ON COLUMN PRENS.valor_texto IS 'Valor texto';
LABEL ON COLUMN PRENS.valor_texto TEXT IS
  'Campo Valor texto de archivo de descripciones de p';
COMMENT ON COLUMN PRENS.valor_numerico IS
  'Campo Valor numerico de archivo de descripciones de programas en español';
LABEL ON COLUMN PRENS.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN PRENS.valor_numerico TEXT IS
  'Campo Valor numerico de archivo de descripciones d';
COMMENT ON COLUMN PRENS.vigencia_desde IS
  'Campo Vigencia desde de archivo de descripciones de programas en español';
LABEL ON COLUMN PRENS.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN PRENS.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo de descripciones d';
COMMENT ON COLUMN PRENS.vigencia_hasta IS
  'Campo Vigencia hasta de archivo de descripciones de programas en español';
LABEL ON COLUMN PRENS.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN PRENS.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo de descripciones d';
COMMENT ON COLUMN PRENS.orden_visualizacion IS
  'Campo Orden visualizacion de archivo de descripciones de programas en españ'
  'ol';
LABEL ON COLUMN PRENS.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN PRENS.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo de descripcio';
COMMENT ON COLUMN PRENS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN PRENS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN PRENS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN PRENS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN PRENS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN PRENS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN PRENS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN PRENS.version_registro IS 'Version';
LABEL ON COLUMN PRENS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN PRENS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN PRENS.observaciones IS 'Observaciones';
LABEL ON COLUMN PRENS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN PRENS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN PRENS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN PRENS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN PRENS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN PRENS.created_at IS 'Creado';
LABEL ON COLUMN PRENS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN PRENS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN PRENS.updated_at IS 'Actualizado';
LABEL ON COLUMN PRENS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_prens_pk;
CREATE INDEX idx_prens_pk ON PRENS (nombre_programa);
DROP INDEX IF EXISTS idx_prens_created_at;
CREATE INDEX idx_prens_created_at ON PRENS (created_at);

--==============================================================================
-- Nombre de la Tabla: UT500
-- DESCRIPCION: Agenda Personalizada
-- Objetivo: Persistir informacion funcional de agenda personalizada en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de agenda personalizada
-- Restricciones: Clave reportada: Código de Usuario, Fecha
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE UT500 (
    codigo_usuario FOR COLUMN COUS VARCHAR(20),
    fecha FOR COLUMN SFECHA DATE,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ut500 PRIMARY KEY (codigo_usuario, fecha)
) RCDFMT UT500R;

COMMENT ON TABLE UT500 IS 'Agenda Personalizada';
LABEL ON TABLE UT500 IS 'UT500 - Agenda Personalizada';
COMMENT ON COLUMN UT500.codigo_usuario IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN UT500.codigo_usuario IS 'Codigo usuario';
LABEL ON COLUMN UT500.codigo_usuario TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN UT500.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN UT500.fecha IS 'Fecha';
LABEL ON COLUMN UT500.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN UT500.descripcion IS
  'Campo Descripcion de agenda personalizada';
LABEL ON COLUMN UT500.descripcion IS 'Descripcion';
LABEL ON COLUMN UT500.descripcion TEXT IS
  'Campo Descripcion de agenda personalizada';
COMMENT ON COLUMN UT500.valor_texto IS
  'Campo Valor texto de agenda personalizada';
LABEL ON COLUMN UT500.valor_texto IS 'Valor texto';
LABEL ON COLUMN UT500.valor_texto TEXT IS
  'Campo Valor texto de agenda personalizada';
COMMENT ON COLUMN UT500.valor_numerico IS
  'Campo Valor numerico de agenda personalizada';
LABEL ON COLUMN UT500.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN UT500.valor_numerico TEXT IS
  'Campo Valor numerico de agenda personalizada';
COMMENT ON COLUMN UT500.vigencia_desde IS
  'Campo Vigencia desde de agenda personalizada';
LABEL ON COLUMN UT500.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN UT500.vigencia_desde TEXT IS
  'Campo Vigencia desde de agenda personalizada';
COMMENT ON COLUMN UT500.vigencia_hasta IS
  'Campo Vigencia hasta de agenda personalizada';
LABEL ON COLUMN UT500.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN UT500.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de agenda personalizada';
COMMENT ON COLUMN UT500.orden_visualizacion IS
  'Campo Orden visualizacion de agenda personalizada';
LABEL ON COLUMN UT500.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN UT500.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de agenda personalizada';
COMMENT ON COLUMN UT500.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN UT500.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN UT500.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN UT500.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN UT500.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN UT500.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN UT500.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN UT500.version_registro IS 'Version';
LABEL ON COLUMN UT500.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN UT500.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN UT500.observaciones IS 'Observaciones';
LABEL ON COLUMN UT500.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN UT500.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN UT500.estado_registro IS 'Estado Reg';
LABEL ON COLUMN UT500.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN UT500.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN UT500.created_at IS 'Creado';
LABEL ON COLUMN UT500.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN UT500.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN UT500.updated_at IS 'Actualizado';
LABEL ON COLUMN UT500.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ut500_pk;
CREATE INDEX idx_ut500_pk ON UT500 (codigo_usuario, fecha);
DROP INDEX IF EXISTS idx_ut500_fecha;
CREATE INDEX idx_ut500_fecha ON UT500 (fecha);

--==============================================================================
-- Nombre de la Tabla: UT510
-- DESCRIPCION: Mensajes de Usuarios.
-- Objetivo: Persistir informacion funcional de mensajes de usuarios en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de mensajes de usuarios
-- Restricciones: Clave reportada: Código de Usuario, Fecha
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE UT510 (
    codigo_usuario FOR COLUMN COUS VARCHAR(20),
    fecha FOR COLUMN SFECHA DATE,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ut510 PRIMARY KEY (codigo_usuario, fecha)
) RCDFMT UT510R;

COMMENT ON TABLE UT510 IS 'Mensajes de Usuarios.';
LABEL ON TABLE UT510 IS 'UT510 - Mensajes de Usuarios.';
COMMENT ON COLUMN UT510.codigo_usuario IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN UT510.codigo_usuario IS 'Codigo usuario';
LABEL ON COLUMN UT510.codigo_usuario TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN UT510.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN UT510.fecha IS 'Fecha';
LABEL ON COLUMN UT510.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN UT510.descripcion IS
  'Campo Descripcion de mensajes de usuarios';
LABEL ON COLUMN UT510.descripcion IS 'Descripcion';
LABEL ON COLUMN UT510.descripcion TEXT IS
  'Campo Descripcion de mensajes de usuarios';
COMMENT ON COLUMN UT510.valor_texto IS
  'Campo Valor texto de mensajes de usuarios';
LABEL ON COLUMN UT510.valor_texto IS 'Valor texto';
LABEL ON COLUMN UT510.valor_texto TEXT IS
  'Campo Valor texto de mensajes de usuarios';
COMMENT ON COLUMN UT510.valor_numerico IS
  'Campo Valor numerico de mensajes de usuarios';
LABEL ON COLUMN UT510.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN UT510.valor_numerico TEXT IS
  'Campo Valor numerico de mensajes de usuarios';
COMMENT ON COLUMN UT510.vigencia_desde IS
  'Campo Vigencia desde de mensajes de usuarios';
LABEL ON COLUMN UT510.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN UT510.vigencia_desde TEXT IS
  'Campo Vigencia desde de mensajes de usuarios';
COMMENT ON COLUMN UT510.vigencia_hasta IS
  'Campo Vigencia hasta de mensajes de usuarios';
LABEL ON COLUMN UT510.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN UT510.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de mensajes de usuarios';
COMMENT ON COLUMN UT510.orden_visualizacion IS
  'Campo Orden visualizacion de mensajes de usuarios';
LABEL ON COLUMN UT510.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN UT510.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de mensajes de usuarios';
COMMENT ON COLUMN UT510.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN UT510.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN UT510.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN UT510.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN UT510.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN UT510.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN UT510.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN UT510.version_registro IS 'Version';
LABEL ON COLUMN UT510.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN UT510.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN UT510.observaciones IS 'Observaciones';
LABEL ON COLUMN UT510.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN UT510.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN UT510.estado_registro IS 'Estado Reg';
LABEL ON COLUMN UT510.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN UT510.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN UT510.created_at IS 'Creado';
LABEL ON COLUMN UT510.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN UT510.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN UT510.updated_at IS 'Actualizado';
LABEL ON COLUMN UT510.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ut510_pk;
CREATE INDEX idx_ut510_pk ON UT510 (codigo_usuario, fecha);
DROP INDEX IF EXISTS idx_ut510_fecha;
CREATE INDEX idx_ut510_fecha ON UT510 (fecha);

--==============================================================================
-- Nombre de la Tabla: MICRF
-- DESCRIPCION: Archivo que contiene los reportes salvados en Microficha.
-- Objetivo: Persistir informacion funcional de archivo que contiene los
-- reportes salvados en microficha en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo que contiene
-- los reportes salvados en microficha
-- Restricciones: Clave reportada: Tipo de Formulario, Nombre del Reporte,
-- Secuencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE MICRF (
    tipo_formulario FOR COLUMN TIFO VARCHAR(50),
    nombre_reporte FOR COLUMN NORE VARCHAR(50),
    secuencia FOR COLUMN SSECUE INT,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_micrf PRIMARY KEY (tipo_formulario, nombre_reporte, secuencia)
) RCDFMT MICRFR;

COMMENT ON TABLE MICRF IS
  'Archivo que contiene los reportes salvados en Microficha.';
LABEL ON TABLE MICRF IS 'MICRF - Archivo que contiene los reportes salvados';
COMMENT ON COLUMN MICRF.tipo_formulario IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN MICRF.tipo_formulario IS 'Tipo formulario';
LABEL ON COLUMN MICRF.tipo_formulario TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN MICRF.nombre_reporte IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN MICRF.nombre_reporte IS 'Nombre reporte';
LABEL ON COLUMN MICRF.nombre_reporte TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN MICRF.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN MICRF.secuencia IS 'Secuencia';
LABEL ON COLUMN MICRF.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN MICRF.descripcion IS
  'Campo Descripcion de archivo que contiene los reportes salvados en microfich'
  'a';
LABEL ON COLUMN MICRF.descripcion IS 'Descripcion';
LABEL ON COLUMN MICRF.descripcion TEXT IS
  'Campo Descripcion de archivo que contiene los repo';
COMMENT ON COLUMN MICRF.valor_texto IS
  'Campo Valor texto de archivo que contiene los reportes salvados en microfich'
  'a';
LABEL ON COLUMN MICRF.valor_texto IS 'Valor texto';
LABEL ON COLUMN MICRF.valor_texto TEXT IS
  'Campo Valor texto de archivo que contiene los repo';
COMMENT ON COLUMN MICRF.valor_numerico IS
  'Campo Valor numerico de archivo que contiene los reportes salvados en microf'
  'icha';
LABEL ON COLUMN MICRF.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN MICRF.valor_numerico TEXT IS
  'Campo Valor numerico de archivo que contiene los r';
COMMENT ON COLUMN MICRF.vigencia_desde IS
  'Campo Vigencia desde de archivo que contiene los reportes salvados en microf'
  'icha';
LABEL ON COLUMN MICRF.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN MICRF.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo que contiene los r';
COMMENT ON COLUMN MICRF.vigencia_hasta IS
  'Campo Vigencia hasta de archivo que contiene los reportes salvados en microf'
  'icha';
LABEL ON COLUMN MICRF.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN MICRF.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo que contiene los r';
COMMENT ON COLUMN MICRF.orden_visualizacion IS
  'Campo Orden visualizacion de archivo que contiene los reportes salvados en m'
  'icroficha';
LABEL ON COLUMN MICRF.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN MICRF.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo que contiene';
COMMENT ON COLUMN MICRF.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN MICRF.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN MICRF.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN MICRF.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN MICRF.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN MICRF.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN MICRF.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN MICRF.version_registro IS 'Version';
LABEL ON COLUMN MICRF.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN MICRF.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN MICRF.observaciones IS 'Observaciones';
LABEL ON COLUMN MICRF.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN MICRF.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN MICRF.estado_registro IS 'Estado Reg';
LABEL ON COLUMN MICRF.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN MICRF.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN MICRF.created_at IS 'Creado';
LABEL ON COLUMN MICRF.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN MICRF.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN MICRF.updated_at IS 'Actualizado';
LABEL ON COLUMN MICRF.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_micrf_pk;
CREATE INDEX idx_micrf_pk ON MICRF (tipo_formulario, nombre_reporte);
DROP INDEX IF EXISTS idx_micrf_created_at;
CREATE INDEX idx_micrf_created_at ON MICRF (created_at);

--==============================================================================
-- Nombre de la Tabla: IBSDD
-- DESCRIPCION: Diccionario de Datos del IBS
-- Objetivo: Persistir informacion funcional de diccionario de datos del ibs en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de diccionario de datos
-- del ibs
-- Restricciones: Clave reportada: No tiene clave
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE IBSDD (
    id FOR COLUMN SID BIGINT,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ibsdd PRIMARY KEY (id)
) RCDFMT IBSDDR;

COMMENT ON TABLE IBSDD IS 'Diccionario de Datos del IBS';
LABEL ON TABLE IBSDD IS 'IBSDD - Diccionario de Datos del IBS';
COMMENT ON COLUMN IBSDD.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN IBSDD.id IS 'Id';
LABEL ON COLUMN IBSDD.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN IBSDD.descripcion IS
  'Campo Descripcion de diccionario de datos del ibs';
LABEL ON COLUMN IBSDD.descripcion IS 'Descripcion';
LABEL ON COLUMN IBSDD.descripcion TEXT IS
  'Campo Descripcion de diccionario de datos del ibs';
COMMENT ON COLUMN IBSDD.valor_texto IS
  'Campo Valor texto de diccionario de datos del ibs';
LABEL ON COLUMN IBSDD.valor_texto IS 'Valor texto';
LABEL ON COLUMN IBSDD.valor_texto TEXT IS
  'Campo Valor texto de diccionario de datos del ibs';
COMMENT ON COLUMN IBSDD.valor_numerico IS
  'Campo Valor numerico de diccionario de datos del ibs';
LABEL ON COLUMN IBSDD.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN IBSDD.valor_numerico TEXT IS
  'Campo Valor numerico de diccionario de datos del i';
COMMENT ON COLUMN IBSDD.vigencia_desde IS
  'Campo Vigencia desde de diccionario de datos del ibs';
LABEL ON COLUMN IBSDD.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN IBSDD.vigencia_desde TEXT IS
  'Campo Vigencia desde de diccionario de datos del i';
COMMENT ON COLUMN IBSDD.vigencia_hasta IS
  'Campo Vigencia hasta de diccionario de datos del ibs';
LABEL ON COLUMN IBSDD.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN IBSDD.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de diccionario de datos del i';
COMMENT ON COLUMN IBSDD.orden_visualizacion IS
  'Campo Orden visualizacion de diccionario de datos del ibs';
LABEL ON COLUMN IBSDD.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN IBSDD.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de diccionario de datos';
COMMENT ON COLUMN IBSDD.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN IBSDD.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN IBSDD.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN IBSDD.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN IBSDD.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN IBSDD.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN IBSDD.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN IBSDD.version_registro IS 'Version';
LABEL ON COLUMN IBSDD.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN IBSDD.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN IBSDD.observaciones IS 'Observaciones';
LABEL ON COLUMN IBSDD.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN IBSDD.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN IBSDD.estado_registro IS 'Estado Reg';
LABEL ON COLUMN IBSDD.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN IBSDD.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN IBSDD.created_at IS 'Creado';
LABEL ON COLUMN IBSDD.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN IBSDD.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN IBSDD.updated_at IS 'Actualizado';
LABEL ON COLUMN IBSDD.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ibsdd_pk;
CREATE INDEX idx_ibsdd_pk ON IBSDD (id);
DROP INDEX IF EXISTS idx_ibsdd_created_at;
CREATE INDEX idx_ibsdd_created_at ON IBSDD (created_at);

--==============================================================================
-- Nombre de la Tabla: IBTBL
-- DESCRIPCION: Archivo de Referencias Cruzadas para manejo de Intersucursales.
-- Objetivo: Persistir informacion funcional de archivo de referencias cruzadas
-- para manejo de intersucursales en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de
-- referencias cruzadas para manejo de intersucursales
-- Restricciones: Clave reportada: No especificada en documento
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE IBTBL (
    id FOR COLUMN SID BIGINT,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ibtbl PRIMARY KEY (id)
) RCDFMT IBTBLR;

COMMENT ON TABLE IBTBL IS
  'Archivo de Referencias Cruzadas para manejo de Intersucursales.';
LABEL ON TABLE IBTBL IS 'IBTBL - Archivo de Referencias Cruzadas para manej';
COMMENT ON COLUMN IBTBL.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN IBTBL.id IS 'Id';
LABEL ON COLUMN IBTBL.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN IBTBL.descripcion IS
  'Campo Descripcion de archivo de referencias cruzadas para manejo de intersuc'
  'ursales';
LABEL ON COLUMN IBTBL.descripcion IS 'Descripcion';
LABEL ON COLUMN IBTBL.descripcion TEXT IS
  'Campo Descripcion de archivo de referencias cruzad';
COMMENT ON COLUMN IBTBL.valor_texto IS
  'Campo Valor texto de archivo de referencias cruzadas para manejo de intersuc'
  'ursales';
LABEL ON COLUMN IBTBL.valor_texto IS 'Valor texto';
LABEL ON COLUMN IBTBL.valor_texto TEXT IS
  'Campo Valor texto de archivo de referencias cruzad';
COMMENT ON COLUMN IBTBL.valor_numerico IS
  'Campo Valor numerico de archivo de referencias cruzadas para manejo de inter'
  'sucursales';
LABEL ON COLUMN IBTBL.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN IBTBL.valor_numerico TEXT IS
  'Campo Valor numerico de archivo de referencias cru';
COMMENT ON COLUMN IBTBL.vigencia_desde IS
  'Campo Vigencia desde de archivo de referencias cruzadas para manejo de inter'
  'sucursales';
LABEL ON COLUMN IBTBL.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN IBTBL.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo de referencias cru';
COMMENT ON COLUMN IBTBL.vigencia_hasta IS
  'Campo Vigencia hasta de archivo de referencias cruzadas para manejo de inter'
  'sucursales';
LABEL ON COLUMN IBTBL.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN IBTBL.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo de referencias cru';
COMMENT ON COLUMN IBTBL.orden_visualizacion IS
  'Campo Orden visualizacion de archivo de referencias cruzadas para manejo de '
  'intersucursales';
LABEL ON COLUMN IBTBL.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN IBTBL.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo de referencia';
COMMENT ON COLUMN IBTBL.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN IBTBL.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN IBTBL.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN IBTBL.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN IBTBL.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN IBTBL.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN IBTBL.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN IBTBL.version_registro IS 'Version';
LABEL ON COLUMN IBTBL.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN IBTBL.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN IBTBL.observaciones IS 'Observaciones';
LABEL ON COLUMN IBTBL.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN IBTBL.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN IBTBL.estado_registro IS 'Estado Reg';
LABEL ON COLUMN IBTBL.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN IBTBL.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN IBTBL.created_at IS 'Creado';
LABEL ON COLUMN IBTBL.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN IBTBL.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN IBTBL.updated_at IS 'Actualizado';
LABEL ON COLUMN IBTBL.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ibtbl_pk;
CREATE INDEX idx_ibtbl_pk ON IBTBL (id);
DROP INDEX IF EXISTS idx_ibtbl_created_at;
CREATE INDEX idx_ibtbl_created_at ON IBTBL (created_at);

--==============================================================================
-- Nombre de la Tabla: TRANS
-- DESCRIPCION: Archivo histórico de transacciones
-- Objetivo: Almacenar el historico de transacciones contables para calculo de
-- saldos y partidas conciliatorias.
-- Tipo de Tabla: Transaccional
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo histórico
-- de transacciones
-- Restricciones: Clave reportada: No especificada en documento
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE TRANS (
    id_transaccion FOR COLUMN IDTR BIGINT,
    numero_registro_relativo FOR COLUMN NURERE VARCHAR(30),
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    cuenta_contable FOR COLUMN CUCO VARCHAR(24),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    fecha_operacion FOR COLUMN FEOP DATE,
    fecha_valor FOR COLUMN FEVA DATE,
    hora_operacion FOR COLUMN HOOP TIME,
    tipo_movimiento FOR COLUMN TIMO VARCHAR(20),
    debito_credito FOR COLUMN DECR CHAR(1),
    monto FOR COLUMN SMONTO DECIMAL(18,2),
    saldo_anterior FOR COLUMN SAAN DECIMAL(18,2),
    saldo_posterior FOR COLUMN SAPO DECIMAL(18,2),
    canal_origen FOR COLUMN CAOR VARCHAR(20),
    terminal_origen FOR COLUMN TEOR VARCHAR(30),
    referencia_externa FOR COLUMN REEX VARCHAR(40),
    estado_transaccion FOR COLUMN ESTR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_trans PRIMARY KEY (id_transaccion)
) RCDFMT TRANSR;

COMMENT ON TABLE TRANS IS 'Archivo histórico de transacciones';
LABEL ON TABLE TRANS IS 'TRANS - Archivo histórico de transacciones';
COMMENT ON COLUMN TRANS.id_transaccion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TRANS.id_transaccion IS 'Id transaccion';
LABEL ON COLUMN TRANS.id_transaccion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TRANS.numero_registro_relativo IS
  'Numero de registro relativo en archivo fuente';
LABEL ON COLUMN TRANS.numero_registro_relativo IS 'Num Reg Rel';
LABEL ON COLUMN TRANS.numero_registro_relativo TEXT IS
  'Numero de registro relativo en archivo fuente';
COMMENT ON COLUMN TRANS.codigo_banco IS 'Codigo identificador del banco';
LABEL ON COLUMN TRANS.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN TRANS.codigo_banco TEXT IS 'Codigo identificador del banco';
COMMENT ON COLUMN TRANS.codigo_sucursal IS
  'Codigo identificador de la sucursal';
LABEL ON COLUMN TRANS.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN TRANS.codigo_sucursal TEXT IS
  'Codigo identificador de la sucursal';
COMMENT ON COLUMN TRANS.codigo_moneda IS 'Codigo identificador de la moneda';
LABEL ON COLUMN TRANS.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN TRANS.codigo_moneda TEXT IS 'Codigo identificador de la moneda';
COMMENT ON COLUMN TRANS.cuenta_contable IS
  'Clave foranea hacia GLMST.cuenta_contable';
LABEL ON COLUMN TRANS.cuenta_contable IS 'Cta Contable';
LABEL ON COLUMN TRANS.cuenta_contable TEXT IS
  'Clave foranea hacia GLMST.cuenta_contable';
COMMENT ON COLUMN TRANS.numero_cuenta IS
  'Clave foranea hacia ACMST.numero_cuenta';
LABEL ON COLUMN TRANS.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN TRANS.numero_cuenta TEXT IS
  'Clave foranea hacia ACMST.numero_cuenta';
COMMENT ON COLUMN TRANS.id_cliente IS 'Clave foranea hacia CUMST.id_cliente';
LABEL ON COLUMN TRANS.id_cliente IS 'Id Cliente';
LABEL ON COLUMN TRANS.id_cliente TEXT IS 'Clave foranea hacia CUMST.id_cliente';
COMMENT ON COLUMN TRANS.fecha_operacion IS
  'Fecha de la operacion transaccional';
LABEL ON COLUMN TRANS.fecha_operacion IS 'Fecha Oper';
LABEL ON COLUMN TRANS.fecha_operacion TEXT IS
  'Fecha de la operacion transaccional';
COMMENT ON COLUMN TRANS.fecha_valor IS 'Fecha valor contable de la operacion';
LABEL ON COLUMN TRANS.fecha_valor IS 'Fecha Valor';
LABEL ON COLUMN TRANS.fecha_valor TEXT IS
  'Fecha valor contable de la operacion';
COMMENT ON COLUMN TRANS.hora_operacion IS 'Hora de la operacion transaccional';
LABEL ON COLUMN TRANS.hora_operacion IS 'Hora Oper';
LABEL ON COLUMN TRANS.hora_operacion TEXT IS
  'Hora de la operacion transaccional';
COMMENT ON COLUMN TRANS.tipo_movimiento IS
  'Campo Tipo movimiento de archivo histórico de transacciones';
LABEL ON COLUMN TRANS.tipo_movimiento IS 'Tipo movimiento';
LABEL ON COLUMN TRANS.tipo_movimiento TEXT IS
  'Campo Tipo movimiento de archivo histórico de tran';
COMMENT ON COLUMN TRANS.debito_credito IS
  'Indicador de debito (D) o credito (C)';
LABEL ON COLUMN TRANS.debito_credito IS 'Deb/Cred';
LABEL ON COLUMN TRANS.debito_credito TEXT IS
  'Indicador de debito (D) o credito (C)';
COMMENT ON COLUMN TRANS.monto IS 'Monto monetario de la transaccion o partida';
LABEL ON COLUMN TRANS.monto IS 'Monto';
LABEL ON COLUMN TRANS.monto TEXT IS
  'Monto monetario de la transaccion o partida';
COMMENT ON COLUMN TRANS.saldo_anterior IS
  'Campo Saldo anterior de archivo histórico de transacciones';
LABEL ON COLUMN TRANS.saldo_anterior IS 'Saldo anterior';
LABEL ON COLUMN TRANS.saldo_anterior TEXT IS
  'Campo Saldo anterior de archivo histórico de trans';
COMMENT ON COLUMN TRANS.saldo_posterior IS
  'Campo Saldo posterior de archivo histórico de transacciones';
LABEL ON COLUMN TRANS.saldo_posterior IS 'Saldo posterior';
LABEL ON COLUMN TRANS.saldo_posterior TEXT IS
  'Campo Saldo posterior de archivo histórico de tran';
COMMENT ON COLUMN TRANS.canal_origen IS
  'Campo Canal origen de archivo histórico de transacciones';
LABEL ON COLUMN TRANS.canal_origen IS 'Canal origen';
LABEL ON COLUMN TRANS.canal_origen TEXT IS
  'Campo Canal origen de archivo histórico de transac';
COMMENT ON COLUMN TRANS.terminal_origen IS
  'Campo Terminal origen de archivo histórico de transacciones';
LABEL ON COLUMN TRANS.terminal_origen IS 'Terminal origen';
LABEL ON COLUMN TRANS.terminal_origen TEXT IS
  'Campo Terminal origen de archivo histórico de tran';
COMMENT ON COLUMN TRANS.referencia_externa IS
  'Referencia externa del documento o movimiento';
LABEL ON COLUMN TRANS.referencia_externa IS 'Ref Externa';
LABEL ON COLUMN TRANS.referencia_externa TEXT IS
  'Referencia externa del documento o movimiento';
COMMENT ON COLUMN TRANS.estado_transaccion IS
  'Campo Estado transaccion de archivo histórico de transacciones';
LABEL ON COLUMN TRANS.estado_transaccion IS 'Estado transaccion';
LABEL ON COLUMN TRANS.estado_transaccion TEXT IS
  'Campo Estado transaccion de archivo histórico de t';
COMMENT ON COLUMN TRANS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN TRANS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN TRANS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN TRANS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN TRANS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN TRANS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN TRANS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN TRANS.version_registro IS 'Version';
LABEL ON COLUMN TRANS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN TRANS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN TRANS.observaciones IS 'Observaciones';
LABEL ON COLUMN TRANS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN TRANS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN TRANS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN TRANS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN TRANS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN TRANS.created_at IS 'Creado';
LABEL ON COLUMN TRANS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN TRANS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN TRANS.updated_at IS 'Actualizado';
LABEL ON COLUMN TRANS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_trans_pk;
CREATE INDEX idx_trans_pk ON TRANS (id_transaccion);
DROP INDEX IF EXISTS idx_trans_reg_rel;
CREATE INDEX idx_trans_reg_rel ON TRANS (numero_registro_relativo);
DROP INDEX IF EXISTS idx_trans_cuenta_fecha;
CREATE INDEX idx_trans_cuenta_fecha ON TRANS (numero_cuenta, fecha_operacion);
DROP INDEX IF EXISTS idx_trans_contable_fecha;
CREATE INDEX idx_trans_contable_fecha ON
  TRANS (cuenta_contable, fecha_operacion);
DROP INDEX IF EXISTS idx_trans_cliente_fecha;
CREATE INDEX idx_trans_cliente_fecha ON TRANS (id_cliente, fecha_operacion);
DROP INDEX IF EXISTS idx_trans_created_at;
CREATE INDEX idx_trans_created_at ON TRANS (created_at);

--==============================================================================
-- Nombre de la Tabla: TRDSC
-- DESCRIPCION: Descripciones Adicionales a las Transacciones (TRANS).
-- Objetivo: Proveer descripciones adicionales de transacciones para auditoria y
-- JSON de conciliacion.
-- Tipo de Tabla: Transaccional
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de descripciones
-- adicionales a las transacciones (trans)
-- Restricciones: Clave reportada: Número de Registro Relativo, Secuencia
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE TRDSC (
    numero_registro_relativo FOR COLUMN NURERE VARCHAR(30),
    secuencia FOR COLUMN SSECUE INT,
    tipo_descripcion FOR COLUMN TIDE VARCHAR(20),
    texto_descripcion FOR COLUMN TEDE VARCHAR(200),
    codigo_idioma FOR COLUMN COID VARCHAR(5),
    formato_salida FOR COLUMN FOSA VARCHAR(20),
    obligatorio FOR COLUMN SOBLIG CHAR(1) NOT NULL DEFAULT 'N',
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_trdsc PRIMARY KEY (numero_registro_relativo, secuencia),
    CONSTRAINT chk_trdsc_oblig CHECK (obligatorio IN ('Y', 'N'))
) RCDFMT TRDSCR;

COMMENT ON TABLE TRDSC IS
  'Descripciones Adicionales a las Transacciones (TRANS).';
LABEL ON TABLE TRDSC IS 'TRDSC - Descripciones Adicionales a las Transaccio';
COMMENT ON COLUMN TRDSC.numero_registro_relativo IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TRDSC.numero_registro_relativo IS 'Num Reg Rel';
LABEL ON COLUMN TRDSC.numero_registro_relativo TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TRDSC.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN TRDSC.secuencia IS 'Secuencia';
LABEL ON COLUMN TRDSC.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TRDSC.tipo_descripcion IS
  'Tipo de descripcion adicional de transaccion';
LABEL ON COLUMN TRDSC.tipo_descripcion IS 'Tipo Desc';
LABEL ON COLUMN TRDSC.tipo_descripcion TEXT IS
  'Tipo de descripcion adicional de transaccion';
COMMENT ON COLUMN TRDSC.texto_descripcion IS
  'Texto descriptivo de la partida o transaccion';
LABEL ON COLUMN TRDSC.texto_descripcion IS 'Texto Desc';
LABEL ON COLUMN TRDSC.texto_descripcion TEXT IS
  'Texto descriptivo de la partida o transaccion';
COMMENT ON COLUMN TRDSC.codigo_idioma IS
  'Campo Codigo idioma de descripciones adicionales a las transacciones (trans'
  ')';
LABEL ON COLUMN TRDSC.codigo_idioma IS 'Codigo idioma';
LABEL ON COLUMN TRDSC.codigo_idioma TEXT IS
  'Campo Codigo idioma de descripciones adicionales a';
COMMENT ON COLUMN TRDSC.formato_salida IS
  'Campo Formato salida de descripciones adicionales a las transacciones (trans'
  ')';
LABEL ON COLUMN TRDSC.formato_salida IS 'Formato salida';
LABEL ON COLUMN TRDSC.formato_salida TEXT IS
  'Campo Formato salida de descripciones adicionales';
COMMENT ON COLUMN TRDSC.obligatorio IS 'Indicador Y/N de campo obligatorio';
LABEL ON COLUMN TRDSC.obligatorio IS 'Obligatorio';
LABEL ON COLUMN TRDSC.obligatorio TEXT IS 'Indicador Y/N de campo obligatorio';
COMMENT ON COLUMN TRDSC.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN TRDSC.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN TRDSC.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN TRDSC.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN TRDSC.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN TRDSC.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN TRDSC.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN TRDSC.version_registro IS 'Version';
LABEL ON COLUMN TRDSC.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN TRDSC.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN TRDSC.observaciones IS 'Observaciones';
LABEL ON COLUMN TRDSC.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN TRDSC.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN TRDSC.estado_registro IS 'Estado Reg';
LABEL ON COLUMN TRDSC.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN TRDSC.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN TRDSC.created_at IS 'Creado';
LABEL ON COLUMN TRDSC.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN TRDSC.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN TRDSC.updated_at IS 'Actualizado';
LABEL ON COLUMN TRDSC.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_trdsc_pk;
CREATE INDEX idx_trdsc_pk ON TRDSC (numero_registro_relativo, secuencia);
DROP INDEX IF EXISTS idx_trdsc_tipo;
CREATE INDEX idx_trdsc_tipo ON TRDSC (tipo_descripcion);
DROP INDEX IF EXISTS idx_trdsc_created_at;
CREATE INDEX idx_trdsc_created_at ON TRDSC (created_at);

--==============================================================================
-- Nombre de la Tabla: TTRAN
-- DESCRIPCION: Archivo Maestro de Transacciones del día.
-- Objetivo: Registrar transacciones del dia para conciliacion operativa y
-- cuadre con GLBLN.
-- Tipo de Tabla: Transaccional
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo maestro de
-- transacciones del día
-- Restricciones: Clave reportada: Banco, Sucursal, Moneda, Cuenta Contable,
-- Cuenta, Fecha
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE TTRAN (
    id_transaccion_dia FOR COLUMN IDTRDI BIGINT,
    numero_registro_relativo FOR COLUMN NURERE VARCHAR(30),
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    cuenta_contable FOR COLUMN CUCO VARCHAR(24),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    fecha FOR COLUMN SFECHA DATE,
    fecha_valor FOR COLUMN FEVA DATE,
    hora_operacion FOR COLUMN HOOP TIME,
    tipo_movimiento FOR COLUMN TIMO VARCHAR(20),
    debito_credito FOR COLUMN DECR CHAR(1),
    monto FOR COLUMN SMONTO DECIMAL(18,2),
    saldo_anterior FOR COLUMN SAAN DECIMAL(18,2),
    saldo_posterior FOR COLUMN SAPO DECIMAL(18,2),
    canal_origen FOR COLUMN CAOR VARCHAR(20),
    terminal_origen FOR COLUMN TEOR VARCHAR(30),
    referencia_externa FOR COLUMN REEX VARCHAR(40),
    estado_transaccion FOR COLUMN ESTR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ttran PRIMARY KEY (id_transaccion_dia, codigo_banco
      , codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, fecha)
) RCDFMT TTRANR;

COMMENT ON TABLE TTRAN IS 'Archivo Maestro de Transacciones del día.';
LABEL ON TABLE TTRAN IS 'TTRAN - Archivo Maestro de Transacciones del día.';
COMMENT ON COLUMN TTRAN.id_transaccion_dia IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TTRAN.id_transaccion_dia IS 'Id transaccion dia';
LABEL ON COLUMN TTRAN.id_transaccion_dia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TTRAN.numero_registro_relativo IS
  'Clave foranea hacia TRANS.numero_registro_relativo';
LABEL ON COLUMN TTRAN.numero_registro_relativo IS 'Num Reg Rel';
LABEL ON COLUMN TTRAN.numero_registro_relativo TEXT IS
  'Clave foranea hacia TRANS.numero_registro_relativo';
COMMENT ON COLUMN TTRAN.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TTRAN.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN TTRAN.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TTRAN.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TTRAN.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN TTRAN.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TTRAN.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TTRAN.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN TTRAN.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TTRAN.cuenta_contable IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TTRAN.cuenta_contable IS 'Cta Contable';
LABEL ON COLUMN TTRAN.cuenta_contable TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TTRAN.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TTRAN.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN TTRAN.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TTRAN.id_cliente IS 'Clave foranea hacia CUMST.id_cliente';
LABEL ON COLUMN TTRAN.id_cliente IS 'Id Cliente';
LABEL ON COLUMN TTRAN.id_cliente TEXT IS 'Clave foranea hacia CUMST.id_cliente';
COMMENT ON COLUMN TTRAN.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN TTRAN.fecha IS 'Fecha';
LABEL ON COLUMN TTRAN.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN TTRAN.fecha_valor IS 'Fecha valor contable de la operacion';
LABEL ON COLUMN TTRAN.fecha_valor IS 'Fecha Valor';
LABEL ON COLUMN TTRAN.fecha_valor TEXT IS
  'Fecha valor contable de la operacion';
COMMENT ON COLUMN TTRAN.hora_operacion IS 'Hora de la operacion transaccional';
LABEL ON COLUMN TTRAN.hora_operacion IS 'Hora Oper';
LABEL ON COLUMN TTRAN.hora_operacion TEXT IS
  'Hora de la operacion transaccional';
COMMENT ON COLUMN TTRAN.tipo_movimiento IS
  'Campo Tipo movimiento de archivo maestro de transacciones del día';
LABEL ON COLUMN TTRAN.tipo_movimiento IS 'Tipo movimiento';
LABEL ON COLUMN TTRAN.tipo_movimiento TEXT IS
  'Campo Tipo movimiento de archivo maestro de transa';
COMMENT ON COLUMN TTRAN.debito_credito IS
  'Indicador de debito (D) o credito (C)';
LABEL ON COLUMN TTRAN.debito_credito IS 'Deb/Cred';
LABEL ON COLUMN TTRAN.debito_credito TEXT IS
  'Indicador de debito (D) o credito (C)';
COMMENT ON COLUMN TTRAN.monto IS 'Monto monetario de la transaccion o partida';
LABEL ON COLUMN TTRAN.monto IS 'Monto';
LABEL ON COLUMN TTRAN.monto TEXT IS
  'Monto monetario de la transaccion o partida';
COMMENT ON COLUMN TTRAN.saldo_anterior IS
  'Campo Saldo anterior de archivo maestro de transacciones del día';
LABEL ON COLUMN TTRAN.saldo_anterior IS 'Saldo anterior';
LABEL ON COLUMN TTRAN.saldo_anterior TEXT IS
  'Campo Saldo anterior de archivo maestro de transac';
COMMENT ON COLUMN TTRAN.saldo_posterior IS
  'Campo Saldo posterior de archivo maestro de transacciones del día';
LABEL ON COLUMN TTRAN.saldo_posterior IS 'Saldo posterior';
LABEL ON COLUMN TTRAN.saldo_posterior TEXT IS
  'Campo Saldo posterior de archivo maestro de transa';
COMMENT ON COLUMN TTRAN.canal_origen IS
  'Campo Canal origen de archivo maestro de transacciones del día';
LABEL ON COLUMN TTRAN.canal_origen IS 'Canal origen';
LABEL ON COLUMN TTRAN.canal_origen TEXT IS
  'Campo Canal origen de archivo maestro de transacci';
COMMENT ON COLUMN TTRAN.terminal_origen IS
  'Campo Terminal origen de archivo maestro de transacciones del día';
LABEL ON COLUMN TTRAN.terminal_origen IS 'Terminal origen';
LABEL ON COLUMN TTRAN.terminal_origen TEXT IS
  'Campo Terminal origen de archivo maestro de transa';
COMMENT ON COLUMN TTRAN.referencia_externa IS
  'Referencia externa del documento o movimiento';
LABEL ON COLUMN TTRAN.referencia_externa IS 'Ref Externa';
LABEL ON COLUMN TTRAN.referencia_externa TEXT IS
  'Referencia externa del documento o movimiento';
COMMENT ON COLUMN TTRAN.estado_transaccion IS
  'Campo Estado transaccion de archivo maestro de transacciones del día';
LABEL ON COLUMN TTRAN.estado_transaccion IS 'Estado transaccion';
LABEL ON COLUMN TTRAN.estado_transaccion TEXT IS
  'Campo Estado transaccion de archivo maestro de tra';
COMMENT ON COLUMN TTRAN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN TTRAN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN TTRAN.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN TTRAN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN TTRAN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN TTRAN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN TTRAN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN TTRAN.version_registro IS 'Version';
LABEL ON COLUMN TTRAN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN TTRAN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN TTRAN.observaciones IS 'Observaciones';
LABEL ON COLUMN TTRAN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN TTRAN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN TTRAN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN TTRAN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN TTRAN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN TTRAN.created_at IS 'Creado';
LABEL ON COLUMN TTRAN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN TTRAN.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN TTRAN.updated_at IS 'Actualizado';
LABEL ON COLUMN TTRAN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ttran_pk;
CREATE INDEX idx_ttran_pk ON TTRAN (id_transaccion_dia, codigo_banco);
DROP INDEX IF EXISTS idx_ttran_reg_rel;
CREATE INDEX idx_ttran_reg_rel ON TTRAN (numero_registro_relativo);
DROP INDEX IF EXISTS idx_ttran_cuenta_fecha;
CREATE INDEX idx_ttran_cuenta_fecha ON TTRAN (numero_cuenta, fecha);
DROP INDEX IF EXISTS idx_ttran_contable_fecha;
CREATE INDEX idx_ttran_contable_fecha ON TTRAN (cuenta_contable, fecha);
DROP INDEX IF EXISTS idx_ttran_cliente_fecha;
CREATE INDEX idx_ttran_cliente_fecha ON TTRAN (id_cliente, fecha);
DROP INDEX IF EXISTS idx_ttran_fecha;
CREATE INDEX idx_ttran_fecha ON TTRAN (fecha);

--==============================================================================
-- Nombre de la Tabla: CIFXF
-- DESCRIPCION: Relación de operaciones con clientes.
-- Objetivo: Persistir informacion funcional de relación de operaciones con
-- clientes en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de relación de
-- operaciones con clientes
-- Restricciones: Clave reportada: No tiene clave
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CIFXF (
    id FOR COLUMN SID BIGINT,
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cifxf PRIMARY KEY (id)
) RCDFMT CIFXFR;

COMMENT ON TABLE CIFXF IS 'Relación de operaciones con clientes.';
LABEL ON TABLE CIFXF IS 'CIFXF - Relación de operaciones con clientes.';
COMMENT ON COLUMN CIFXF.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN CIFXF.id IS 'Id';
LABEL ON COLUMN CIFXF.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN CIFXF.descripcion IS
  'Campo Descripcion de relación de operaciones con clientes';
LABEL ON COLUMN CIFXF.descripcion IS 'Descripcion';
LABEL ON COLUMN CIFXF.descripcion TEXT IS
  'Campo Descripcion de relación de operaciones con c';
COMMENT ON COLUMN CIFXF.valor_texto IS
  'Campo Valor texto de relación de operaciones con clientes';
LABEL ON COLUMN CIFXF.valor_texto IS 'Valor texto';
LABEL ON COLUMN CIFXF.valor_texto TEXT IS
  'Campo Valor texto de relación de operaciones con c';
COMMENT ON COLUMN CIFXF.valor_numerico IS
  'Campo Valor numerico de relación de operaciones con clientes';
LABEL ON COLUMN CIFXF.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN CIFXF.valor_numerico TEXT IS
  'Campo Valor numerico de relación de operaciones co';
COMMENT ON COLUMN CIFXF.vigencia_desde IS
  'Campo Vigencia desde de relación de operaciones con clientes';
LABEL ON COLUMN CIFXF.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN CIFXF.vigencia_desde TEXT IS
  'Campo Vigencia desde de relación de operaciones co';
COMMENT ON COLUMN CIFXF.vigencia_hasta IS
  'Campo Vigencia hasta de relación de operaciones con clientes';
LABEL ON COLUMN CIFXF.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN CIFXF.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de relación de operaciones co';
COMMENT ON COLUMN CIFXF.orden_visualizacion IS
  'Campo Orden visualizacion de relación de operaciones con clientes';
LABEL ON COLUMN CIFXF.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN CIFXF.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de relación de operacion';
COMMENT ON COLUMN CIFXF.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CIFXF.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CIFXF.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CIFXF.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CIFXF.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CIFXF.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CIFXF.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CIFXF.version_registro IS 'Version';
LABEL ON COLUMN CIFXF.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CIFXF.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CIFXF.observaciones IS 'Observaciones';
LABEL ON COLUMN CIFXF.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CIFXF.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CIFXF.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CIFXF.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CIFXF.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CIFXF.created_at IS 'Creado';
LABEL ON COLUMN CIFXF.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CIFXF.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CIFXF.updated_at IS 'Actualizado';
LABEL ON COLUMN CIFXF.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cifxf_pk;
CREATE INDEX idx_cifxf_pk ON CIFXF (id);
DROP INDEX IF EXISTS idx_cifxf_created_at;
CREATE INDEX idx_cifxf_created_at ON CIFXF (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLCNT
-- DESCRIPCION: Parámetros Generales del Sistema
-- Objetivo: Persistir informacion funcional de parámetros generales del
-- sistema en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de parámetros
-- generales del sistema
-- Restricciones: Clave reportada: Código de Banco
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLCNT (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlcnt PRIMARY KEY (codigo_banco)
) RCDFMT CNTRLCNTR;

COMMENT ON TABLE CNTRLCNT IS 'Parámetros Generales del Sistema';
LABEL ON TABLE CNTRLCNT IS 'CNTRLCNT - Parámetros Generales del Sistema';
COMMENT ON COLUMN CNTRLCNT.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLCNT.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLCNT.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLCNT.descripcion IS
  'Campo Descripcion de parámetros generales del sistema';
LABEL ON COLUMN CNTRLCNT.descripcion IS 'Descripcion';
LABEL ON COLUMN CNTRLCNT.descripcion TEXT IS
  'Campo Descripcion de parámetros generales del sist';
COMMENT ON COLUMN CNTRLCNT.valor_texto IS
  'Campo Valor texto de parámetros generales del sistema';
LABEL ON COLUMN CNTRLCNT.valor_texto IS 'Valor texto';
LABEL ON COLUMN CNTRLCNT.valor_texto TEXT IS
  'Campo Valor texto de parámetros generales del sist';
COMMENT ON COLUMN CNTRLCNT.valor_numerico IS
  'Campo Valor numerico de parámetros generales del sistema';
LABEL ON COLUMN CNTRLCNT.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN CNTRLCNT.valor_numerico TEXT IS
  'Campo Valor numerico de parámetros generales del s';
COMMENT ON COLUMN CNTRLCNT.vigencia_desde IS
  'Campo Vigencia desde de parámetros generales del sistema';
LABEL ON COLUMN CNTRLCNT.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN CNTRLCNT.vigencia_desde TEXT IS
  'Campo Vigencia desde de parámetros generales del s';
COMMENT ON COLUMN CNTRLCNT.vigencia_hasta IS
  'Campo Vigencia hasta de parámetros generales del sistema';
LABEL ON COLUMN CNTRLCNT.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN CNTRLCNT.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de parámetros generales del s';
COMMENT ON COLUMN CNTRLCNT.orden_visualizacion IS
  'Campo Orden visualizacion de parámetros generales del sistema';
LABEL ON COLUMN CNTRLCNT.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN CNTRLCNT.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de parámetros generales';
COMMENT ON COLUMN CNTRLCNT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLCNT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLCNT.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLCNT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLCNT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLCNT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLCNT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLCNT.version_registro IS 'Version';
LABEL ON COLUMN CNTRLCNT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLCNT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLCNT.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLCNT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLCNT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLCNT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLCNT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLCNT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLCNT.created_at IS 'Creado';
LABEL ON COLUMN CNTRLCNT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLCNT.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLCNT.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLCNT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlcnt_pk;
CREATE INDEX idx_cntrlcnt_pk ON CNTRLCNT (codigo_banco);
DROP INDEX IF EXISTS idx_cntrlcnt_created_at;
CREATE INDEX idx_cntrlcnt_created_at ON CNTRLCNT (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLBRN
-- DESCRIPCION: Archivo de Sucursales
-- Objetivo: Persistir informacion funcional de archivo de sucursales en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de
-- sucursales
-- Restricciones: Clave reportada: Código de Banco, Código de Sucursal
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLBRN (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlbrn PRIMARY KEY (codigo_banco, codigo_sucursal)
) RCDFMT CNTRLBRNR;

COMMENT ON TABLE CNTRLBRN IS 'Archivo de Sucursales';
LABEL ON TABLE CNTRLBRN IS 'CNTRLBRN - Archivo de Sucursales';
COMMENT ON COLUMN CNTRLBRN.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLBRN.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLBRN.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLBRN.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLBRN.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN CNTRLBRN.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLBRN.descripcion IS
  'Campo Descripcion de archivo de sucursales';
LABEL ON COLUMN CNTRLBRN.descripcion IS 'Descripcion';
LABEL ON COLUMN CNTRLBRN.descripcion TEXT IS
  'Campo Descripcion de archivo de sucursales';
COMMENT ON COLUMN CNTRLBRN.valor_texto IS
  'Campo Valor texto de archivo de sucursales';
LABEL ON COLUMN CNTRLBRN.valor_texto IS 'Valor texto';
LABEL ON COLUMN CNTRLBRN.valor_texto TEXT IS
  'Campo Valor texto de archivo de sucursales';
COMMENT ON COLUMN CNTRLBRN.valor_numerico IS
  'Campo Valor numerico de archivo de sucursales';
LABEL ON COLUMN CNTRLBRN.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN CNTRLBRN.valor_numerico TEXT IS
  'Campo Valor numerico de archivo de sucursales';
COMMENT ON COLUMN CNTRLBRN.vigencia_desde IS
  'Campo Vigencia desde de archivo de sucursales';
LABEL ON COLUMN CNTRLBRN.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN CNTRLBRN.vigencia_desde TEXT IS
  'Campo Vigencia desde de archivo de sucursales';
COMMENT ON COLUMN CNTRLBRN.vigencia_hasta IS
  'Campo Vigencia hasta de archivo de sucursales';
LABEL ON COLUMN CNTRLBRN.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN CNTRLBRN.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de archivo de sucursales';
COMMENT ON COLUMN CNTRLBRN.orden_visualizacion IS
  'Campo Orden visualizacion de archivo de sucursales';
LABEL ON COLUMN CNTRLBRN.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN CNTRLBRN.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de archivo de sucursales';
COMMENT ON COLUMN CNTRLBRN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLBRN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLBRN.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLBRN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLBRN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLBRN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLBRN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLBRN.version_registro IS 'Version';
LABEL ON COLUMN CNTRLBRN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLBRN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLBRN.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLBRN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLBRN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLBRN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLBRN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLBRN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLBRN.created_at IS 'Creado';
LABEL ON COLUMN CNTRLBRN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLBRN.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLBRN.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLBRN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlbrn_pk;
CREATE INDEX idx_cntrlbrn_pk ON CNTRLBRN (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_cntrlbrn_created_at;
CREATE INDEX idx_cntrlbrn_created_at ON CNTRLBRN (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLNUM
-- DESCRIPCION: Control de Numeración Automática de Operaciones.
-- Objetivo: Persistir informacion funcional de control de numeración
-- automática de operaciones en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de control de
-- numeración automática de operaciones
-- Restricciones: Clave reportada: Código de Aplicación, Tipo de Cuenta.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLNUM (
    codigo_aplicacion FOR COLUMN COAP VARCHAR(20),
    tipo_cuenta FOR COLUMN TICU VARCHAR(20),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlnum PRIMARY KEY (codigo_aplicacion, tipo_cuenta)
) RCDFMT CNTRLNUMR;

COMMENT ON TABLE CNTRLNUM IS
  'Control de Numeración Automática de Operaciones.';
LABEL ON TABLE CNTRLNUM IS
  'CNTRLNUM - Control de Numeración Automática de Ope';
COMMENT ON COLUMN CNTRLNUM.codigo_aplicacion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLNUM.codigo_aplicacion IS 'Codigo aplicacion';
LABEL ON COLUMN CNTRLNUM.codigo_aplicacion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLNUM.tipo_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLNUM.tipo_cuenta IS 'Tipo cuenta';
LABEL ON COLUMN CNTRLNUM.tipo_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLNUM.descripcion IS
  'Campo Descripcion de control de numeración automática de operaciones';
LABEL ON COLUMN CNTRLNUM.descripcion IS 'Descripcion';
LABEL ON COLUMN CNTRLNUM.descripcion TEXT IS
  'Campo Descripcion de control de numeración automát';
COMMENT ON COLUMN CNTRLNUM.valor_texto IS
  'Campo Valor texto de control de numeración automática de operaciones';
LABEL ON COLUMN CNTRLNUM.valor_texto IS 'Valor texto';
LABEL ON COLUMN CNTRLNUM.valor_texto TEXT IS
  'Campo Valor texto de control de numeración automát';
COMMENT ON COLUMN CNTRLNUM.valor_numerico IS
  'Campo Valor numerico de control de numeración automática de operaciones';
LABEL ON COLUMN CNTRLNUM.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN CNTRLNUM.valor_numerico TEXT IS
  'Campo Valor numerico de control de numeración auto';
COMMENT ON COLUMN CNTRLNUM.vigencia_desde IS
  'Campo Vigencia desde de control de numeración automática de operaciones';
LABEL ON COLUMN CNTRLNUM.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN CNTRLNUM.vigencia_desde TEXT IS
  'Campo Vigencia desde de control de numeración auto';
COMMENT ON COLUMN CNTRLNUM.vigencia_hasta IS
  'Campo Vigencia hasta de control de numeración automática de operaciones';
LABEL ON COLUMN CNTRLNUM.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN CNTRLNUM.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de control de numeración auto';
COMMENT ON COLUMN CNTRLNUM.orden_visualizacion IS
  'Campo Orden visualizacion de control de numeración automática de operacion'
  'es';
LABEL ON COLUMN CNTRLNUM.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN CNTRLNUM.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de control de numeración';
COMMENT ON COLUMN CNTRLNUM.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLNUM.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLNUM.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLNUM.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLNUM.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLNUM.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLNUM.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLNUM.version_registro IS 'Version';
LABEL ON COLUMN CNTRLNUM.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLNUM.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLNUM.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLNUM.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLNUM.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLNUM.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLNUM.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLNUM.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLNUM.created_at IS 'Creado';
LABEL ON COLUMN CNTRLNUM.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLNUM.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLNUM.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLNUM.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlnum_pk;
CREATE INDEX idx_cntrlnum_pk ON CNTRLNUM (codigo_aplicacion, tipo_cuenta);
DROP INDEX IF EXISTS idx_cntrlnum_created_at;
CREATE INDEX idx_cntrlnum_created_at ON CNTRLNUM (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLTAX
-- DESCRIPCION: Definiciones para el manejo de cobro de impuestos.
-- Objetivo: Persistir informacion funcional de definiciones para el manejo de
-- cobro de impuestos en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de definiciones para el
-- manejo de cobro de impuestos
-- Restricciones: Clave reportada: Código de Banco, Código de Impuesto.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLTAX (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_impuesto FOR COLUMN COIM VARCHAR(20),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    valor_texto FOR COLUMN VATE VARCHAR(50),
    valor_numerico FOR COLUMN VANU DECIMAL(18,2),
    vigencia_desde FOR COLUMN VIDE DATE,
    vigencia_hasta FOR COLUMN VIHA DATE,
    orden_visualizacion FOR COLUMN ORVI INT,
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrltax PRIMARY KEY (codigo_banco, codigo_impuesto)
) RCDFMT CNTRLTAXR;

COMMENT ON TABLE CNTRLTAX IS
  'Definiciones para el manejo de cobro de impuestos.';
LABEL ON TABLE CNTRLTAX IS 'CNTRLTAX - Definiciones para el manejo de cobro de';
COMMENT ON COLUMN CNTRLTAX.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLTAX.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLTAX.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLTAX.codigo_impuesto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLTAX.codigo_impuesto IS 'Codigo impuesto';
LABEL ON COLUMN CNTRLTAX.codigo_impuesto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLTAX.descripcion IS
  'Campo Descripcion de definiciones para el manejo de cobro de impuestos';
LABEL ON COLUMN CNTRLTAX.descripcion IS 'Descripcion';
LABEL ON COLUMN CNTRLTAX.descripcion TEXT IS
  'Campo Descripcion de definiciones para el manejo d';
COMMENT ON COLUMN CNTRLTAX.valor_texto IS
  'Campo Valor texto de definiciones para el manejo de cobro de impuestos';
LABEL ON COLUMN CNTRLTAX.valor_texto IS 'Valor texto';
LABEL ON COLUMN CNTRLTAX.valor_texto TEXT IS
  'Campo Valor texto de definiciones para el manejo d';
COMMENT ON COLUMN CNTRLTAX.valor_numerico IS
  'Campo Valor numerico de definiciones para el manejo de cobro de impuestos';
LABEL ON COLUMN CNTRLTAX.valor_numerico IS 'Valor numerico';
LABEL ON COLUMN CNTRLTAX.valor_numerico TEXT IS
  'Campo Valor numerico de definiciones para el manej';
COMMENT ON COLUMN CNTRLTAX.vigencia_desde IS
  'Campo Vigencia desde de definiciones para el manejo de cobro de impuestos';
LABEL ON COLUMN CNTRLTAX.vigencia_desde IS 'Vigencia desde';
LABEL ON COLUMN CNTRLTAX.vigencia_desde TEXT IS
  'Campo Vigencia desde de definiciones para el manej';
COMMENT ON COLUMN CNTRLTAX.vigencia_hasta IS
  'Campo Vigencia hasta de definiciones para el manejo de cobro de impuestos';
LABEL ON COLUMN CNTRLTAX.vigencia_hasta IS 'Vigencia hasta';
LABEL ON COLUMN CNTRLTAX.vigencia_hasta TEXT IS
  'Campo Vigencia hasta de definiciones para el manej';
COMMENT ON COLUMN CNTRLTAX.orden_visualizacion IS
  'Campo Orden visualizacion de definiciones para el manejo de cobro de impuest'
  'os';
LABEL ON COLUMN CNTRLTAX.orden_visualizacion IS 'Orden visualizacion';
LABEL ON COLUMN CNTRLTAX.orden_visualizacion TEXT IS
  'Campo Orden visualizacion de definiciones para el';
COMMENT ON COLUMN CNTRLTAX.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLTAX.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLTAX.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLTAX.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLTAX.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLTAX.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLTAX.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLTAX.version_registro IS 'Version';
LABEL ON COLUMN CNTRLTAX.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLTAX.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLTAX.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLTAX.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLTAX.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLTAX.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLTAX.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLTAX.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLTAX.created_at IS 'Creado';
LABEL ON COLUMN CNTRLTAX.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLTAX.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLTAX.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLTAX.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrltax_pk;
CREATE INDEX idx_cntrltax_pk ON CNTRLTAX (codigo_banco, codigo_impuesto);
DROP INDEX IF EXISTS idx_cntrltax_created_at;
CREATE INDEX idx_cntrltax_created_at ON CNTRLTAX (created_at);

--==============================================================================
-- Nombre de la Tabla: CUMST
-- DESCRIPCION: Archivo de Maestro de Clientes
-- Objetivo: Persistir informacion funcional de archivo de maestro de clientes
-- en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de maestro
-- de clientes
-- Restricciones: Clave reportada: Número del Cliente o Identificación del
-- Cliente
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CUMST (
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    tipo_persona FOR COLUMN TIPE VARCHAR(20),
    tipo_identificacion FOR COLUMN TIID VARCHAR(20),
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    nombres FOR COLUMN SNOMBR VARCHAR(80),
    apellidos FOR COLUMN SAPELL VARCHAR(80),
    razon_social FOR COLUMN RASO VARCHAR(80),
    fecha_nacimiento FOR COLUMN FENA DATE,
    direccion FOR COLUMN SDIREC VARCHAR(120),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    pais_residencia FOR COLUMN PARE VARCHAR(50),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cumst PRIMARY KEY (id_cliente)
) RCDFMT CUMSTR;

COMMENT ON TABLE CUMST IS 'Archivo de Maestro de Clientes';
LABEL ON TABLE CUMST IS 'CUMST - Archivo de Maestro de Clientes';
COMMENT ON COLUMN CUMST.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN CUMST.id_cliente IS 'Id Cliente';
LABEL ON COLUMN CUMST.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CUMST.tipo_persona IS
  'Campo Tipo persona de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.tipo_persona IS 'Tipo persona';
LABEL ON COLUMN CUMST.tipo_persona TEXT IS
  'Campo Tipo persona de archivo de maestro de client';
COMMENT ON COLUMN CUMST.tipo_identificacion IS
  'Campo Tipo identificacion de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.tipo_identificacion IS 'Tipo identificacion';
LABEL ON COLUMN CUMST.tipo_identificacion TEXT IS
  'Campo Tipo identificacion de archivo de maestro de';
COMMENT ON COLUMN CUMST.numero_identificacion IS
  'Campo Numero identificacion de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN CUMST.numero_identificacion TEXT IS
  'Campo Numero identificacion de archivo de maestro';
COMMENT ON COLUMN CUMST.nombres IS
  'Campo Nombres de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.nombres IS 'Nombres';
LABEL ON COLUMN CUMST.nombres TEXT IS
  'Campo Nombres de archivo de maestro de clientes';
COMMENT ON COLUMN CUMST.apellidos IS
  'Campo Apellidos de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.apellidos IS 'Apellidos';
LABEL ON COLUMN CUMST.apellidos TEXT IS
  'Campo Apellidos de archivo de maestro de clientes';
COMMENT ON COLUMN CUMST.razon_social IS
  'Campo Razon social de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.razon_social IS 'Razon social';
LABEL ON COLUMN CUMST.razon_social TEXT IS
  'Campo Razon social de archivo de maestro de client';
COMMENT ON COLUMN CUMST.fecha_nacimiento IS
  'Campo Fecha nacimiento de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.fecha_nacimiento IS 'Fecha nacimiento';
LABEL ON COLUMN CUMST.fecha_nacimiento TEXT IS
  'Campo Fecha nacimiento de archivo de maestro de cl';
COMMENT ON COLUMN CUMST.direccion IS
  'Campo Direccion de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.direccion IS 'Direccion';
LABEL ON COLUMN CUMST.direccion TEXT IS
  'Campo Direccion de archivo de maestro de clientes';
COMMENT ON COLUMN CUMST.email IS
  'Campo Email de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.email IS 'Email';
LABEL ON COLUMN CUMST.email TEXT IS
  'Campo Email de archivo de maestro de clientes';
COMMENT ON COLUMN CUMST.telefono IS
  'Campo Telefono de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.telefono IS 'Telefono';
LABEL ON COLUMN CUMST.telefono TEXT IS
  'Campo Telefono de archivo de maestro de clientes';
COMMENT ON COLUMN CUMST.pais_residencia IS
  'Campo Pais residencia de archivo de maestro de clientes';
LABEL ON COLUMN CUMST.pais_residencia IS 'Pais residencia';
LABEL ON COLUMN CUMST.pais_residencia TEXT IS
  'Campo Pais residencia de archivo de maestro de cli';
COMMENT ON COLUMN CUMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CUMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CUMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CUMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CUMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CUMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CUMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CUMST.version_registro IS 'Version';
LABEL ON COLUMN CUMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CUMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CUMST.observaciones IS 'Observaciones';
LABEL ON COLUMN CUMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CUMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CUMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CUMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CUMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CUMST.created_at IS 'Creado';
LABEL ON COLUMN CUMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CUMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CUMST.updated_at IS 'Actualizado';
LABEL ON COLUMN CUMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cumst_pk;
CREATE INDEX idx_cumst_pk ON CUMST (id_cliente);
DROP INDEX IF EXISTS idx_cumst_created_at;
CREATE INDEX idx_cumst_created_at ON CUMST (created_at);

--==============================================================================
-- Nombre de la Tabla: CUMAD
-- DESCRIPCION: Archivo de Direcciones de Correo y Beneficiarios de
-- Operaciones/Clientes.
-- Objetivo: Persistir informacion funcional de archivo de direcciones de correo
-- y beneficiarios de operaciones/clientes en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de
-- direcciones de correo y beneficiarios de operaciones/clientes
-- Restricciones: Clave reportada: Número del Cliente/Operación, Tipo de
-- Registro, Secuencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CUMAD (
    id_cliente_operacion FOR COLUMN IDCLOP VARCHAR(30),
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    secuencia FOR COLUMN SSECUE INT,
    tipo_persona FOR COLUMN TIPE VARCHAR(20),
    tipo_identificacion FOR COLUMN TIID VARCHAR(20),
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    nombres FOR COLUMN SNOMBR VARCHAR(80),
    apellidos FOR COLUMN SAPELL VARCHAR(80),
    razon_social FOR COLUMN RASO VARCHAR(80),
    fecha_nacimiento FOR COLUMN FENA DATE,
    direccion FOR COLUMN SDIREC VARCHAR(120),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    pais_residencia FOR COLUMN PARE VARCHAR(50),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cumad PRIMARY KEY (id_cliente_operacion, tipo_registro
      , secuencia)
) RCDFMT CUMADR;

COMMENT ON TABLE CUMAD IS
  'Archivo de Direcciones de Correo y Beneficiarios de Operaciones/Clientes.';
LABEL ON TABLE CUMAD IS 'CUMAD - Archivo de Direcciones de Correo y Benefic';
COMMENT ON COLUMN CUMAD.id_cliente_operacion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CUMAD.id_cliente_operacion IS 'Id cliente operacion';
LABEL ON COLUMN CUMAD.id_cliente_operacion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CUMAD.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CUMAD.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN CUMAD.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CUMAD.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN CUMAD.secuencia IS 'Secuencia';
LABEL ON COLUMN CUMAD.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CUMAD.tipo_persona IS
  'Campo Tipo persona de archivo de direcciones de correo y beneficiarios de op'
  'eraciones/clientes';
LABEL ON COLUMN CUMAD.tipo_persona IS 'Tipo persona';
LABEL ON COLUMN CUMAD.tipo_persona TEXT IS
  'Campo Tipo persona de archivo de direcciones de co';
COMMENT ON COLUMN CUMAD.tipo_identificacion IS
  'Campo Tipo identificacion de archivo de direcciones de correo y beneficiario'
  's de operaciones/clientes';
LABEL ON COLUMN CUMAD.tipo_identificacion IS 'Tipo identificacion';
LABEL ON COLUMN CUMAD.tipo_identificacion TEXT IS
  'Campo Tipo identificacion de archivo de direccione';
COMMENT ON COLUMN CUMAD.numero_identificacion IS
  'Campo Numero identificacion de archivo de direcciones de correo y beneficiar'
  'ios de operaciones/clientes';
LABEL ON COLUMN CUMAD.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN CUMAD.numero_identificacion TEXT IS
  'Campo Numero identificacion de archivo de direccio';
COMMENT ON COLUMN CUMAD.nombres IS
  'Campo Nombres de archivo de direcciones de correo y beneficiarios de operaci'
  'ones/clientes';
LABEL ON COLUMN CUMAD.nombres IS 'Nombres';
LABEL ON COLUMN CUMAD.nombres TEXT IS
  'Campo Nombres de archivo de direcciones de correo';
COMMENT ON COLUMN CUMAD.apellidos IS
  'Campo Apellidos de archivo de direcciones de correo y beneficiarios de opera'
  'ciones/clientes';
LABEL ON COLUMN CUMAD.apellidos IS 'Apellidos';
LABEL ON COLUMN CUMAD.apellidos TEXT IS
  'Campo Apellidos de archivo de direcciones de corre';
COMMENT ON COLUMN CUMAD.razon_social IS
  'Campo Razon social de archivo de direcciones de correo y beneficiarios de op'
  'eraciones/clientes';
LABEL ON COLUMN CUMAD.razon_social IS 'Razon social';
LABEL ON COLUMN CUMAD.razon_social TEXT IS
  'Campo Razon social de archivo de direcciones de co';
COMMENT ON COLUMN CUMAD.fecha_nacimiento IS
  'Campo Fecha nacimiento de archivo de direcciones de correo y beneficiarios d'
  'e operaciones/clientes';
LABEL ON COLUMN CUMAD.fecha_nacimiento IS 'Fecha nacimiento';
LABEL ON COLUMN CUMAD.fecha_nacimiento TEXT IS
  'Campo Fecha nacimiento de archivo de direcciones d';
COMMENT ON COLUMN CUMAD.direccion IS
  'Campo Direccion de archivo de direcciones de correo y beneficiarios de opera'
  'ciones/clientes';
LABEL ON COLUMN CUMAD.direccion IS 'Direccion';
LABEL ON COLUMN CUMAD.direccion TEXT IS
  'Campo Direccion de archivo de direcciones de corre';
COMMENT ON COLUMN CUMAD.email IS
  'Campo Email de archivo de direcciones de correo y beneficiarios de operacion'
  'es/clientes';
LABEL ON COLUMN CUMAD.email IS 'Email';
LABEL ON COLUMN CUMAD.email TEXT IS
  'Campo Email de archivo de direcciones de correo y';
COMMENT ON COLUMN CUMAD.telefono IS
  'Campo Telefono de archivo de direcciones de correo y beneficiarios de operac'
  'iones/clientes';
LABEL ON COLUMN CUMAD.telefono IS 'Telefono';
LABEL ON COLUMN CUMAD.telefono TEXT IS
  'Campo Telefono de archivo de direcciones de correo';
COMMENT ON COLUMN CUMAD.pais_residencia IS
  'Campo Pais residencia de archivo de direcciones de correo y beneficiarios de'
  ' operaciones/clientes';
LABEL ON COLUMN CUMAD.pais_residencia IS 'Pais residencia';
LABEL ON COLUMN CUMAD.pais_residencia TEXT IS
  'Campo Pais residencia de archivo de direcciones de';
COMMENT ON COLUMN CUMAD.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CUMAD.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CUMAD.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CUMAD.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CUMAD.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CUMAD.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CUMAD.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CUMAD.version_registro IS 'Version';
LABEL ON COLUMN CUMAD.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CUMAD.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CUMAD.observaciones IS 'Observaciones';
LABEL ON COLUMN CUMAD.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CUMAD.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CUMAD.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CUMAD.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CUMAD.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CUMAD.created_at IS 'Creado';
LABEL ON COLUMN CUMAD.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CUMAD.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CUMAD.updated_at IS 'Actualizado';
LABEL ON COLUMN CUMAD.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cumad_pk;
CREATE INDEX idx_cumad_pk ON CUMAD (id_cliente_operacion, tipo_registro);
DROP INDEX IF EXISTS idx_cumad_created_at;
CREATE INDEX idx_cumad_created_at ON CUMAD (created_at);

--==============================================================================
-- Nombre de la Tabla: CUMPR
-- DESCRIPCION: Archivo Maestro de Palabras Reservadas que se omiten en
-- Búsqueda de Clientes por String de Caracteres.
-- Objetivo: Persistir informacion funcional de archivo maestro de palabras
-- reservadas que se omiten en búsqueda de clientes por string de caracteres en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo maestro de
-- palabras reservadas que se omiten en búsqueda de clientes por string de
-- caracteres
-- Restricciones: Clave reportada: Palabra
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CUMPR (
    palabra FOR COLUMN SPALAB VARCHAR(50),
    tipo_persona FOR COLUMN TIPE VARCHAR(20),
    tipo_identificacion FOR COLUMN TIID VARCHAR(20),
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    nombres FOR COLUMN SNOMBR VARCHAR(80),
    apellidos FOR COLUMN SAPELL VARCHAR(80),
    razon_social FOR COLUMN RASO VARCHAR(80),
    fecha_nacimiento FOR COLUMN FENA DATE,
    direccion FOR COLUMN SDIREC VARCHAR(120),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    pais_residencia FOR COLUMN PARE VARCHAR(50),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cumpr PRIMARY KEY (palabra)
) RCDFMT CUMPRR;

COMMENT ON TABLE CUMPR IS
  'Archivo Maestro de Palabras Reservadas que se omiten en Búsqueda de Cliente'
  's por String de Caracteres.';
LABEL ON TABLE CUMPR IS 'CUMPR - Archivo Maestro de Palabras Reservadas que';
COMMENT ON COLUMN CUMPR.palabra IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN CUMPR.palabra IS 'Palabra';
LABEL ON COLUMN CUMPR.palabra TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN CUMPR.tipo_persona IS
  'Campo Tipo persona de archivo maestro de palabras reservadas que se omiten e'
  'n búsqueda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.tipo_persona IS 'Tipo persona';
LABEL ON COLUMN CUMPR.tipo_persona TEXT IS
  'Campo Tipo persona de archivo maestro de palabras';
COMMENT ON COLUMN CUMPR.tipo_identificacion IS
  'Campo Tipo identificacion de archivo maestro de palabras reservadas que se o'
  'miten en búsqueda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.tipo_identificacion IS 'Tipo identificacion';
LABEL ON COLUMN CUMPR.tipo_identificacion TEXT IS
  'Campo Tipo identificacion de archivo maestro de pa';
COMMENT ON COLUMN CUMPR.numero_identificacion IS
  'Campo Numero identificacion de archivo maestro de palabras reservadas que se'
  ' omiten en búsqueda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN CUMPR.numero_identificacion TEXT IS
  'Campo Numero identificacion de archivo maestro de';
COMMENT ON COLUMN CUMPR.nombres IS
  'Campo Nombres de archivo maestro de palabras reservadas que se omiten en bú'
  'squeda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.nombres IS 'Nombres';
LABEL ON COLUMN CUMPR.nombres TEXT IS
  'Campo Nombres de archivo maestro de palabras reser';
COMMENT ON COLUMN CUMPR.apellidos IS
  'Campo Apellidos de archivo maestro de palabras reservadas que se omiten en b'
  'úsqueda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.apellidos IS 'Apellidos';
LABEL ON COLUMN CUMPR.apellidos TEXT IS
  'Campo Apellidos de archivo maestro de palabras res';
COMMENT ON COLUMN CUMPR.razon_social IS
  'Campo Razon social de archivo maestro de palabras reservadas que se omiten e'
  'n búsqueda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.razon_social IS 'Razon social';
LABEL ON COLUMN CUMPR.razon_social TEXT IS
  'Campo Razon social de archivo maestro de palabras';
COMMENT ON COLUMN CUMPR.fecha_nacimiento IS
  'Campo Fecha nacimiento de archivo maestro de palabras reservadas que se omit'
  'en en búsqueda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.fecha_nacimiento IS 'Fecha nacimiento';
LABEL ON COLUMN CUMPR.fecha_nacimiento TEXT IS
  'Campo Fecha nacimiento de archivo maestro de palab';
COMMENT ON COLUMN CUMPR.direccion IS
  'Campo Direccion de archivo maestro de palabras reservadas que se omiten en b'
  'úsqueda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.direccion IS 'Direccion';
LABEL ON COLUMN CUMPR.direccion TEXT IS
  'Campo Direccion de archivo maestro de palabras res';
COMMENT ON COLUMN CUMPR.email IS
  'Campo Email de archivo maestro de palabras reservadas que se omiten en búsq'
  'ueda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.email IS 'Email';
LABEL ON COLUMN CUMPR.email TEXT IS
  'Campo Email de archivo maestro de palabras reserva';
COMMENT ON COLUMN CUMPR.telefono IS
  'Campo Telefono de archivo maestro de palabras reservadas que se omiten en b'
  'úsqueda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.telefono IS 'Telefono';
LABEL ON COLUMN CUMPR.telefono TEXT IS
  'Campo Telefono de archivo maestro de palabras rese';
COMMENT ON COLUMN CUMPR.pais_residencia IS
  'Campo Pais residencia de archivo maestro de palabras reservadas que se omite'
  'n en búsqueda de clientes por string de caracteres';
LABEL ON COLUMN CUMPR.pais_residencia IS 'Pais residencia';
LABEL ON COLUMN CUMPR.pais_residencia TEXT IS
  'Campo Pais residencia de archivo maestro de palabr';
COMMENT ON COLUMN CUMPR.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CUMPR.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CUMPR.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CUMPR.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CUMPR.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CUMPR.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CUMPR.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CUMPR.version_registro IS 'Version';
LABEL ON COLUMN CUMPR.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CUMPR.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CUMPR.observaciones IS 'Observaciones';
LABEL ON COLUMN CUMPR.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CUMPR.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CUMPR.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CUMPR.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CUMPR.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CUMPR.created_at IS 'Creado';
LABEL ON COLUMN CUMPR.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CUMPR.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CUMPR.updated_at IS 'Actualizado';
LABEL ON COLUMN CUMPR.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cumpr_pk;
CREATE INDEX idx_cumpr_pk ON CUMPR (palabra);
DROP INDEX IF EXISTS idx_cumpr_created_at;
CREATE INDEX idx_cumpr_created_at ON CUMPR (created_at);

--==============================================================================
-- Nombre de la Tabla: CUMSD
-- DESCRIPCION: Archivo Maestro de Clientes para búsqueda de Clientes a través
-- de un String de Caracteres.
-- Objetivo: Persistir informacion funcional de archivo maestro de clientes para
-- búsqueda de clientes a través de un string de caracteres en el entorno IBM
-- i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo maestro de
-- clientes para búsqueda de clientes a través de un string de caracteres
-- Restricciones: Clave reportada: Cliente.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CUMSD (
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    tipo_persona FOR COLUMN TIPE VARCHAR(20),
    tipo_identificacion FOR COLUMN TIID VARCHAR(20),
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    nombres FOR COLUMN SNOMBR VARCHAR(80),
    apellidos FOR COLUMN SAPELL VARCHAR(80),
    razon_social FOR COLUMN RASO VARCHAR(80),
    fecha_nacimiento FOR COLUMN FENA DATE,
    direccion FOR COLUMN SDIREC VARCHAR(120),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    pais_residencia FOR COLUMN PARE VARCHAR(50),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cumsd PRIMARY KEY (id_cliente)
) RCDFMT CUMSDR;

COMMENT ON TABLE CUMSD IS
  'Archivo Maestro de Clientes para búsqueda de Clientes a través de un Strin'
  'g de Caracteres.';
LABEL ON TABLE CUMSD IS 'CUMSD - Archivo Maestro de Clientes para búsqueda';
COMMENT ON COLUMN CUMSD.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN CUMSD.id_cliente IS 'Id Cliente';
LABEL ON COLUMN CUMSD.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CUMSD.tipo_persona IS
  'Campo Tipo persona de archivo maestro de clientes para búsqueda de clientes'
  ' a través de un string de caracteres';
LABEL ON COLUMN CUMSD.tipo_persona IS 'Tipo persona';
LABEL ON COLUMN CUMSD.tipo_persona TEXT IS
  'Campo Tipo persona de archivo maestro de clientes';
COMMENT ON COLUMN CUMSD.tipo_identificacion IS
  'Campo Tipo identificacion de archivo maestro de clientes para búsqueda de c'
  'lientes a través de un string de caracteres';
LABEL ON COLUMN CUMSD.tipo_identificacion IS 'Tipo identificacion';
LABEL ON COLUMN CUMSD.tipo_identificacion TEXT IS
  'Campo Tipo identificacion de archivo maestro de cl';
COMMENT ON COLUMN CUMSD.numero_identificacion IS
  'Campo Numero identificacion de archivo maestro de clientes para búsqueda de'
  ' clientes a través de un string de caracteres';
LABEL ON COLUMN CUMSD.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN CUMSD.numero_identificacion TEXT IS
  'Campo Numero identificacion de archivo maestro de';
COMMENT ON COLUMN CUMSD.nombres IS
  'Campo Nombres de archivo maestro de clientes para búsqueda de clientes a tr'
  'avés de un string de caracteres';
LABEL ON COLUMN CUMSD.nombres IS 'Nombres';
LABEL ON COLUMN CUMSD.nombres TEXT IS
  'Campo Nombres de archivo maestro de clientes para';
COMMENT ON COLUMN CUMSD.apellidos IS
  'Campo Apellidos de archivo maestro de clientes para búsqueda de clientes a '
  'través de un string de caracteres';
LABEL ON COLUMN CUMSD.apellidos IS 'Apellidos';
LABEL ON COLUMN CUMSD.apellidos TEXT IS
  'Campo Apellidos de archivo maestro de clientes par';
COMMENT ON COLUMN CUMSD.razon_social IS
  'Campo Razon social de archivo maestro de clientes para búsqueda de clientes'
  ' a través de un string de caracteres';
LABEL ON COLUMN CUMSD.razon_social IS 'Razon social';
LABEL ON COLUMN CUMSD.razon_social TEXT IS
  'Campo Razon social de archivo maestro de clientes';
COMMENT ON COLUMN CUMSD.fecha_nacimiento IS
  'Campo Fecha nacimiento de archivo maestro de clientes para búsqueda de clie'
  'ntes a través de un string de caracteres';
LABEL ON COLUMN CUMSD.fecha_nacimiento IS 'Fecha nacimiento';
LABEL ON COLUMN CUMSD.fecha_nacimiento TEXT IS
  'Campo Fecha nacimiento de archivo maestro de clien';
COMMENT ON COLUMN CUMSD.direccion IS
  'Campo Direccion de archivo maestro de clientes para búsqueda de clientes a '
  'través de un string de caracteres';
LABEL ON COLUMN CUMSD.direccion IS 'Direccion';
LABEL ON COLUMN CUMSD.direccion TEXT IS
  'Campo Direccion de archivo maestro de clientes par';
COMMENT ON COLUMN CUMSD.email IS
  'Campo Email de archivo maestro de clientes para búsqueda de clientes a trav'
  'és de un string de caracteres';
LABEL ON COLUMN CUMSD.email IS 'Email';
LABEL ON COLUMN CUMSD.email TEXT IS
  'Campo Email de archivo maestro de clientes para bú';
COMMENT ON COLUMN CUMSD.telefono IS
  'Campo Telefono de archivo maestro de clientes para búsqueda de clientes a t'
  'ravés de un string de caracteres';
LABEL ON COLUMN CUMSD.telefono IS 'Telefono';
LABEL ON COLUMN CUMSD.telefono TEXT IS
  'Campo Telefono de archivo maestro de clientes para';
COMMENT ON COLUMN CUMSD.pais_residencia IS
  'Campo Pais residencia de archivo maestro de clientes para búsqueda de clien'
  'tes a través de un string de caracteres';
LABEL ON COLUMN CUMSD.pais_residencia IS 'Pais residencia';
LABEL ON COLUMN CUMSD.pais_residencia TEXT IS
  'Campo Pais residencia de archivo maestro de client';
COMMENT ON COLUMN CUMSD.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CUMSD.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CUMSD.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CUMSD.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CUMSD.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CUMSD.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CUMSD.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CUMSD.version_registro IS 'Version';
LABEL ON COLUMN CUMSD.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CUMSD.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CUMSD.observaciones IS 'Observaciones';
LABEL ON COLUMN CUMSD.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CUMSD.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CUMSD.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CUMSD.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CUMSD.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CUMSD.created_at IS 'Creado';
LABEL ON COLUMN CUMSD.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CUMSD.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CUMSD.updated_at IS 'Actualizado';
LABEL ON COLUMN CUMSD.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cumsd_pk;
CREATE INDEX idx_cumsd_pk ON CUMSD (id_cliente);
DROP INDEX IF EXISTS idx_cumsd_created_at;
CREATE INDEX idx_cumsd_created_at ON CUMSD (created_at);

--==============================================================================
-- Nombre de la Tabla: SPINS
-- DESCRIPCION: Archivo de Instrucciones especiales (Usos)
-- Objetivo: Persistir informacion funcional de archivo de instrucciones
-- especiales (usos) en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de
-- instrucciones especiales (usos)
-- Restricciones: Clave reportada: Tipo de Información, Cuenta/Cliente ,
-- Secuencia
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE SPINS (
    tipo_informacion FOR COLUMN TIIN VARCHAR(50),
    cuenta_o_cliente FOR COLUMN CUOCL VARCHAR(50),
    tipo_entidad FOR COLUMN TIEN CHAR(1) NOT NULL DEFAULT 'C',
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    secuencia FOR COLUMN SSECUE INT,
    tipo_persona FOR COLUMN TIPE VARCHAR(20),
    tipo_identificacion FOR COLUMN TIID VARCHAR(20),
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    nombres FOR COLUMN SNOMBR VARCHAR(80),
    apellidos FOR COLUMN SAPELL VARCHAR(80),
    razon_social FOR COLUMN RASO VARCHAR(80),
    fecha_nacimiento FOR COLUMN FENA DATE,
    direccion FOR COLUMN SDIREC VARCHAR(120),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    pais_residencia FOR COLUMN PARE VARCHAR(50),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_spins PRIMARY KEY (tipo_informacion, cuenta_o_cliente
      , secuencia),
    CONSTRAINT chk_spins_tipo_ent CHECK (tipo_entidad IN ('C', 'A')),
    CONSTRAINT chk_spins_refs CHECK ((tipo_entidad = 'C' AND id_cliente IS NOT
      NULL AND numero_cuenta IS NULL AND cuenta_o_cliente = id_cliente) OR
      (tipo_entidad = 'A' AND numero_cuenta IS NOT NULL AND id_cliente IS NULL
      AND cuenta_o_cliente = numero_cuenta))
) RCDFMT SPINSR;

COMMENT ON TABLE SPINS IS 'Archivo de Instrucciones especiales (Usos)';
LABEL ON TABLE SPINS IS 'SPINS - Archivo de Instrucciones especiales (Usos)';
COMMENT ON COLUMN SPINS.tipo_informacion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN SPINS.tipo_informacion IS 'Tipo informacion';
LABEL ON COLUMN SPINS.tipo_informacion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN SPINS.cuenta_o_cliente IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN SPINS.cuenta_o_cliente IS 'Cuenta o cliente';
LABEL ON COLUMN SPINS.cuenta_o_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN SPINS.tipo_entidad IS 'C=cliente CUMST, A=cuenta ACMST';
LABEL ON COLUMN SPINS.tipo_entidad IS 'Tipo Entidad';
LABEL ON COLUMN SPINS.tipo_entidad TEXT IS 'C=cliente CUMST, A=cuenta ACMST';
COMMENT ON COLUMN SPINS.id_cliente IS 'Clave foranea hacia CUMST.id_cliente';
LABEL ON COLUMN SPINS.id_cliente IS 'Id Cliente';
LABEL ON COLUMN SPINS.id_cliente TEXT IS 'Clave foranea hacia CUMST.id_cliente';
COMMENT ON COLUMN SPINS.numero_cuenta IS
  'Clave foranea hacia ACMST.numero_cuenta';
LABEL ON COLUMN SPINS.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN SPINS.numero_cuenta TEXT IS
  'Clave foranea hacia ACMST.numero_cuenta';
COMMENT ON COLUMN SPINS.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN SPINS.secuencia IS 'Secuencia';
LABEL ON COLUMN SPINS.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN SPINS.tipo_persona IS
  'Campo Tipo persona de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.tipo_persona IS 'Tipo persona';
LABEL ON COLUMN SPINS.tipo_persona TEXT IS
  'Campo Tipo persona de archivo de instrucciones esp';
COMMENT ON COLUMN SPINS.tipo_identificacion IS
  'Campo Tipo identificacion de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.tipo_identificacion IS 'Tipo identificacion';
LABEL ON COLUMN SPINS.tipo_identificacion TEXT IS
  'Campo Tipo identificacion de archivo de instruccio';
COMMENT ON COLUMN SPINS.numero_identificacion IS
  'Campo Numero identificacion de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN SPINS.numero_identificacion TEXT IS
  'Campo Numero identificacion de archivo de instrucc';
COMMENT ON COLUMN SPINS.nombres IS
  'Campo Nombres de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.nombres IS 'Nombres';
LABEL ON COLUMN SPINS.nombres TEXT IS
  'Campo Nombres de archivo de instrucciones especial';
COMMENT ON COLUMN SPINS.apellidos IS
  'Campo Apellidos de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.apellidos IS 'Apellidos';
LABEL ON COLUMN SPINS.apellidos TEXT IS
  'Campo Apellidos de archivo de instrucciones especi';
COMMENT ON COLUMN SPINS.razon_social IS
  'Campo Razon social de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.razon_social IS 'Razon social';
LABEL ON COLUMN SPINS.razon_social TEXT IS
  'Campo Razon social de archivo de instrucciones esp';
COMMENT ON COLUMN SPINS.fecha_nacimiento IS
  'Campo Fecha nacimiento de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.fecha_nacimiento IS 'Fecha nacimiento';
LABEL ON COLUMN SPINS.fecha_nacimiento TEXT IS
  'Campo Fecha nacimiento de archivo de instrucciones';
COMMENT ON COLUMN SPINS.direccion IS
  'Campo Direccion de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.direccion IS 'Direccion';
LABEL ON COLUMN SPINS.direccion TEXT IS
  'Campo Direccion de archivo de instrucciones especi';
COMMENT ON COLUMN SPINS.email IS
  'Campo Email de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.email IS 'Email';
LABEL ON COLUMN SPINS.email TEXT IS
  'Campo Email de archivo de instrucciones especiales';
COMMENT ON COLUMN SPINS.telefono IS
  'Campo Telefono de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.telefono IS 'Telefono';
LABEL ON COLUMN SPINS.telefono TEXT IS
  'Campo Telefono de archivo de instrucciones especia';
COMMENT ON COLUMN SPINS.pais_residencia IS
  'Campo Pais residencia de archivo de instrucciones especiales (usos)';
LABEL ON COLUMN SPINS.pais_residencia IS 'Pais residencia';
LABEL ON COLUMN SPINS.pais_residencia TEXT IS
  'Campo Pais residencia de archivo de instrucciones';
COMMENT ON COLUMN SPINS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN SPINS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN SPINS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN SPINS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN SPINS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN SPINS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN SPINS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN SPINS.version_registro IS 'Version';
LABEL ON COLUMN SPINS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN SPINS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN SPINS.observaciones IS 'Observaciones';
LABEL ON COLUMN SPINS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN SPINS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN SPINS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN SPINS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN SPINS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN SPINS.created_at IS 'Creado';
LABEL ON COLUMN SPINS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN SPINS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN SPINS.updated_at IS 'Actualizado';
LABEL ON COLUMN SPINS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_spins_pk;
CREATE INDEX idx_spins_pk ON SPINS (tipo_informacion, cuenta_o_cliente);
DROP INDEX IF EXISTS idx_spins_created_at;
CREATE INDEX idx_spins_created_at ON SPINS (created_at);

--==============================================================================
-- Nombre de la Tabla: ACMST
-- DESCRIPCION: Archivo Maestro de Cuentas de Detalle
-- Objetivo: Persistir informacion funcional de archivo maestro de cuentas de
-- detalle en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo maestro de
-- cuentas de detalle
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE ACMST (
    id FOR COLUMN SID BIGINT,
    numero_cuenta FOR COLUMN NUCU VARCHAR(24) NOT NULL,
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_acmst PRIMARY KEY (id)
) RCDFMT ACMSTR;

COMMENT ON TABLE ACMST IS 'Archivo Maestro de Cuentas de Detalle';
LABEL ON TABLE ACMST IS 'ACMST - Archivo Maestro de Cuentas de Detalle';
COMMENT ON COLUMN ACMST.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN ACMST.id IS 'Id';
LABEL ON COLUMN ACMST.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN ACMST.numero_cuenta IS
  'Numero de cuenta de detalle para referencias cruzadas del modulo';
LABEL ON COLUMN ACMST.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN ACMST.numero_cuenta TEXT IS
  'Numero de cuenta de detalle para referencias cruza';
COMMENT ON COLUMN ACMST.fecha_apertura IS
  'Campo Fecha apertura de archivo maestro de cuentas de detalle';
LABEL ON COLUMN ACMST.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN ACMST.fecha_apertura TEXT IS
  'Campo Fecha apertura de archivo maestro de cuentas';
COMMENT ON COLUMN ACMST.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de archivo maestro de cuentas de detalle';
LABEL ON COLUMN ACMST.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN ACMST.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de archivo maestro';
COMMENT ON COLUMN ACMST.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN ACMST.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN ACMST.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN ACMST.saldo_disponible IS
  'Campo Saldo disponible de archivo maestro de cuentas de detalle';
LABEL ON COLUMN ACMST.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN ACMST.saldo_disponible TEXT IS
  'Campo Saldo disponible de archivo maestro de cuent';
COMMENT ON COLUMN ACMST.limite_sobregiro IS
  'Campo Limite sobregiro de archivo maestro de cuentas de detalle';
LABEL ON COLUMN ACMST.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN ACMST.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de archivo maestro de cuent';
COMMENT ON COLUMN ACMST.estado_cuenta IS
  'Campo Estado cuenta de archivo maestro de cuentas de detalle';
LABEL ON COLUMN ACMST.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN ACMST.estado_cuenta TEXT IS
  'Campo Estado cuenta de archivo maestro de cuentas';
COMMENT ON COLUMN ACMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN ACMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN ACMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN ACMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN ACMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN ACMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN ACMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN ACMST.version_registro IS 'Version';
LABEL ON COLUMN ACMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN ACMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN ACMST.observaciones IS 'Observaciones';
LABEL ON COLUMN ACMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN ACMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN ACMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN ACMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN ACMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN ACMST.created_at IS 'Creado';
LABEL ON COLUMN ACMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN ACMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN ACMST.updated_at IS 'Actualizado';
LABEL ON COLUMN ACMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_acmst_pk;
CREATE INDEX idx_acmst_pk ON ACMST (id);
DROP INDEX IF EXISTS idx_acmst_created_at;
CREATE INDEX idx_acmst_created_at ON ACMST (created_at);

--==============================================================================
-- Nombre de la Tabla: STPMT
-- DESCRIPCION: Ordenes de No Pago de Cheques
-- Objetivo: Persistir informacion funcional de ordenes de no pago de cheques en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de ordenes de no pago
-- de cheques
-- Restricciones: Clave reportada: Banco, Sucursal, Moneda, Cuenta Contable,
-- Cuenta, Secuencia
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE STPMT (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    cuenta_contable FOR COLUMN CUCO VARCHAR(24),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    secuencia FOR COLUMN SSECUE INT,
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_stpmt PRIMARY KEY (codigo_banco, codigo_sucursal
      , codigo_moneda, cuenta_contable, numero_cuenta, secuencia)
) RCDFMT STPMTR;

COMMENT ON TABLE STPMT IS 'Ordenes de No Pago de Cheques';
LABEL ON TABLE STPMT IS 'STPMT - Ordenes de No Pago de Cheques';
COMMENT ON COLUMN STPMT.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN STPMT.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN STPMT.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN STPMT.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN STPMT.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN STPMT.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN STPMT.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN STPMT.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN STPMT.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN STPMT.cuenta_contable IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN STPMT.cuenta_contable IS 'Cta Contable';
LABEL ON COLUMN STPMT.cuenta_contable TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN STPMT.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN STPMT.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN STPMT.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN STPMT.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN STPMT.secuencia IS 'Secuencia';
LABEL ON COLUMN STPMT.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN STPMT.fecha_apertura IS
  'Campo Fecha apertura de ordenes de no pago de cheques';
LABEL ON COLUMN STPMT.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN STPMT.fecha_apertura TEXT IS
  'Campo Fecha apertura de ordenes de no pago de cheq';
COMMENT ON COLUMN STPMT.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de ordenes de no pago de cheques';
LABEL ON COLUMN STPMT.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN STPMT.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de ordenes de no pa';
COMMENT ON COLUMN STPMT.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN STPMT.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN STPMT.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN STPMT.saldo_disponible IS
  'Campo Saldo disponible de ordenes de no pago de cheques';
LABEL ON COLUMN STPMT.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN STPMT.saldo_disponible TEXT IS
  'Campo Saldo disponible de ordenes de no pago de ch';
COMMENT ON COLUMN STPMT.limite_sobregiro IS
  'Campo Limite sobregiro de ordenes de no pago de cheques';
LABEL ON COLUMN STPMT.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN STPMT.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de ordenes de no pago de ch';
COMMENT ON COLUMN STPMT.estado_cuenta IS
  'Campo Estado cuenta de ordenes de no pago de cheques';
LABEL ON COLUMN STPMT.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN STPMT.estado_cuenta TEXT IS
  'Campo Estado cuenta de ordenes de no pago de chequ';
COMMENT ON COLUMN STPMT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN STPMT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN STPMT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN STPMT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN STPMT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN STPMT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN STPMT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN STPMT.version_registro IS 'Version';
LABEL ON COLUMN STPMT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN STPMT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN STPMT.observaciones IS 'Observaciones';
LABEL ON COLUMN STPMT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN STPMT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN STPMT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN STPMT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN STPMT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN STPMT.created_at IS 'Creado';
LABEL ON COLUMN STPMT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN STPMT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN STPMT.updated_at IS 'Actualizado';
LABEL ON COLUMN STPMT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_stpmt_pk;
CREATE INDEX idx_stpmt_pk ON STPMT (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_stpmt_created_at;
CREATE INDEX idx_stpmt_created_at ON STPMT (created_at);

--==============================================================================
-- Nombre de la Tabla: UNCOL
-- DESCRIPCION: Maestro de Retenciones
-- Objetivo: Persistir informacion funcional de maestro de retenciones en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de
-- retenciones
-- Restricciones: Clave reportada: Banco, Sucursal, Cuenta
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE UNCOL (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_uncol PRIMARY KEY (codigo_banco, codigo_sucursal
      , numero_cuenta)
) RCDFMT UNCOLR;

COMMENT ON TABLE UNCOL IS 'Maestro de Retenciones';
LABEL ON TABLE UNCOL IS 'UNCOL - Maestro de Retenciones';
COMMENT ON COLUMN UNCOL.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN UNCOL.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN UNCOL.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN UNCOL.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN UNCOL.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN UNCOL.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN UNCOL.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN UNCOL.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN UNCOL.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN UNCOL.fecha_apertura IS
  'Campo Fecha apertura de maestro de retenciones';
LABEL ON COLUMN UNCOL.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN UNCOL.fecha_apertura TEXT IS
  'Campo Fecha apertura de maestro de retenciones';
COMMENT ON COLUMN UNCOL.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de maestro de retenciones';
LABEL ON COLUMN UNCOL.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN UNCOL.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de maestro de reten';
COMMENT ON COLUMN UNCOL.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN UNCOL.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN UNCOL.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN UNCOL.saldo_disponible IS
  'Campo Saldo disponible de maestro de retenciones';
LABEL ON COLUMN UNCOL.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN UNCOL.saldo_disponible TEXT IS
  'Campo Saldo disponible de maestro de retenciones';
COMMENT ON COLUMN UNCOL.limite_sobregiro IS
  'Campo Limite sobregiro de maestro de retenciones';
LABEL ON COLUMN UNCOL.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN UNCOL.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de maestro de retenciones';
COMMENT ON COLUMN UNCOL.estado_cuenta IS
  'Campo Estado cuenta de maestro de retenciones';
LABEL ON COLUMN UNCOL.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN UNCOL.estado_cuenta TEXT IS
  'Campo Estado cuenta de maestro de retenciones';
COMMENT ON COLUMN UNCOL.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN UNCOL.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN UNCOL.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN UNCOL.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN UNCOL.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN UNCOL.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN UNCOL.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN UNCOL.version_registro IS 'Version';
LABEL ON COLUMN UNCOL.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN UNCOL.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN UNCOL.observaciones IS 'Observaciones';
LABEL ON COLUMN UNCOL.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN UNCOL.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN UNCOL.estado_registro IS 'Estado Reg';
LABEL ON COLUMN UNCOL.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN UNCOL.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN UNCOL.created_at IS 'Creado';
LABEL ON COLUMN UNCOL.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN UNCOL.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN UNCOL.updated_at IS 'Actualizado';
LABEL ON COLUMN UNCOL.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_uncol_pk;
CREATE INDEX idx_uncol_pk ON UNCOL (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_uncol_created_at;
CREATE INDEX idx_uncol_created_at ON UNCOL (created_at);

--==============================================================================
-- Nombre de la Tabla: PBTRN
-- DESCRIPCION: Transacciones de Libretas de Ahorro
-- Objetivo: Persistir informacion funcional de transacciones de libretas de
-- ahorro en el entorno IBM i del taller.
-- Tipo de Tabla: Transaccional
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de transacciones de
-- libretas de ahorro
-- Restricciones: Clave reportada: Cuenta, Fecha, Hora
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE PBTRN (
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    fecha FOR COLUMN SFECHA DATE,
    hora FOR COLUMN SHORA TIME,
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_pbtrn PRIMARY KEY (numero_cuenta, fecha, hora)
) RCDFMT PBTRNR;

COMMENT ON TABLE PBTRN IS 'Transacciones de Libretas de Ahorro';
LABEL ON TABLE PBTRN IS 'PBTRN - Transacciones de Libretas de Ahorro';
COMMENT ON COLUMN PBTRN.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN PBTRN.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN PBTRN.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN PBTRN.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN PBTRN.fecha IS 'Fecha';
LABEL ON COLUMN PBTRN.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN PBTRN.hora IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN PBTRN.hora IS 'Hora';
LABEL ON COLUMN PBTRN.hora TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN PBTRN.fecha_apertura IS
  'Campo Fecha apertura de transacciones de libretas de ahorro';
LABEL ON COLUMN PBTRN.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN PBTRN.fecha_apertura TEXT IS
  'Campo Fecha apertura de transacciones de libretas';
COMMENT ON COLUMN PBTRN.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de transacciones de libretas de ahorro';
LABEL ON COLUMN PBTRN.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN PBTRN.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de transacciones de';
COMMENT ON COLUMN PBTRN.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN PBTRN.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN PBTRN.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN PBTRN.saldo_disponible IS
  'Campo Saldo disponible de transacciones de libretas de ahorro';
LABEL ON COLUMN PBTRN.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN PBTRN.saldo_disponible TEXT IS
  'Campo Saldo disponible de transacciones de libreta';
COMMENT ON COLUMN PBTRN.limite_sobregiro IS
  'Campo Limite sobregiro de transacciones de libretas de ahorro';
LABEL ON COLUMN PBTRN.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN PBTRN.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de transacciones de libreta';
COMMENT ON COLUMN PBTRN.estado_cuenta IS
  'Campo Estado cuenta de transacciones de libretas de ahorro';
LABEL ON COLUMN PBTRN.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN PBTRN.estado_cuenta TEXT IS
  'Campo Estado cuenta de transacciones de libretas d';
COMMENT ON COLUMN PBTRN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN PBTRN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN PBTRN.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN PBTRN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN PBTRN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN PBTRN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN PBTRN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN PBTRN.version_registro IS 'Version';
LABEL ON COLUMN PBTRN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN PBTRN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN PBTRN.observaciones IS 'Observaciones';
LABEL ON COLUMN PBTRN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN PBTRN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN PBTRN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN PBTRN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN PBTRN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN PBTRN.created_at IS 'Creado';
LABEL ON COLUMN PBTRN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN PBTRN.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN PBTRN.updated_at IS 'Actualizado';
LABEL ON COLUMN PBTRN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_pbtrn_pk;
CREATE INDEX idx_pbtrn_pk ON PBTRN (numero_cuenta, fecha);
DROP INDEX IF EXISTS idx_pbtrn_fecha;
CREATE INDEX idx_pbtrn_fecha ON PBTRN (fecha);

--==============================================================================
-- Nombre de la Tabla: OFMST
-- DESCRIPCION: Maestro de Cheques Certificados y Cheques de Gerencia.
-- Objetivo: Persistir informacion funcional de maestro de cheques certificados
-- y cheques de gerencia en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de cheques
-- certificados y cheques de gerencia
-- Restricciones: Clave reportada: Banco, Sucursal, Numero de Cheque.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE OFMST (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    numero_cheque FOR COLUMN NUCH VARCHAR(30),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ofmst PRIMARY KEY (codigo_banco, codigo_sucursal
      , numero_cheque)
) RCDFMT OFMSTR;

COMMENT ON TABLE OFMST IS
  'Maestro de Cheques Certificados y Cheques de Gerencia.';
LABEL ON TABLE OFMST IS 'OFMST - Maestro de Cheques Certificados y Cheques';
COMMENT ON COLUMN OFMST.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN OFMST.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN OFMST.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN OFMST.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN OFMST.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN OFMST.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN OFMST.numero_cheque IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN OFMST.numero_cheque IS 'Numero cheque';
LABEL ON COLUMN OFMST.numero_cheque TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN OFMST.fecha_apertura IS
  'Campo Fecha apertura de maestro de cheques certificados y cheques de gerenci'
  'a';
LABEL ON COLUMN OFMST.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN OFMST.fecha_apertura TEXT IS
  'Campo Fecha apertura de maestro de cheques certifi';
COMMENT ON COLUMN OFMST.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de maestro de cheques certificados y cheques '
  'de gerencia';
LABEL ON COLUMN OFMST.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN OFMST.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de maestro de chequ';
COMMENT ON COLUMN OFMST.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN OFMST.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN OFMST.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN OFMST.saldo_disponible IS
  'Campo Saldo disponible de maestro de cheques certificados y cheques de geren'
  'cia';
LABEL ON COLUMN OFMST.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN OFMST.saldo_disponible TEXT IS
  'Campo Saldo disponible de maestro de cheques certi';
COMMENT ON COLUMN OFMST.limite_sobregiro IS
  'Campo Limite sobregiro de maestro de cheques certificados y cheques de geren'
  'cia';
LABEL ON COLUMN OFMST.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN OFMST.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de maestro de cheques certi';
COMMENT ON COLUMN OFMST.estado_cuenta IS
  'Campo Estado cuenta de maestro de cheques certificados y cheques de gerenci'
  'a';
LABEL ON COLUMN OFMST.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN OFMST.estado_cuenta TEXT IS
  'Campo Estado cuenta de maestro de cheques certific';
COMMENT ON COLUMN OFMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN OFMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN OFMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN OFMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN OFMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN OFMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN OFMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN OFMST.version_registro IS 'Version';
LABEL ON COLUMN OFMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN OFMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN OFMST.observaciones IS 'Observaciones';
LABEL ON COLUMN OFMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN OFMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN OFMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN OFMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN OFMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN OFMST.created_at IS 'Creado';
LABEL ON COLUMN OFMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN OFMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN OFMST.updated_at IS 'Actualizado';
LABEL ON COLUMN OFMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ofmst_pk;
CREATE INDEX idx_ofmst_pk ON OFMST (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_ofmst_created_at;
CREATE INDEX idx_ofmst_created_at ON OFMST (created_at);

--==============================================================================
-- Nombre de la Tabla: RCLNB
-- DESCRIPCION: Transacciones de Cuentas Reconciliables
-- Objetivo: Persistir informacion funcional de transacciones de cuentas
-- reconciliables en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de transacciones de
-- cuentas reconciliables
-- Restricciones: Clave reportada: Banco, Sucursal, Moneda, Cuenta Contable,
-- Cuenta, Fecha
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE RCLNB (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    cuenta_contable FOR COLUMN CUCO VARCHAR(24),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    fecha FOR COLUMN SFECHA DATE,
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_rclnb PRIMARY KEY (codigo_banco, codigo_sucursal
      , codigo_moneda, cuenta_contable, numero_cuenta, fecha)
) RCDFMT RCLNBR;

COMMENT ON TABLE RCLNB IS 'Transacciones de Cuentas Reconciliables';
LABEL ON TABLE RCLNB IS 'RCLNB - Transacciones de Cuentas Reconciliables';
COMMENT ON COLUMN RCLNB.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RCLNB.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN RCLNB.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RCLNB.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RCLNB.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN RCLNB.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RCLNB.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RCLNB.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN RCLNB.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RCLNB.cuenta_contable IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RCLNB.cuenta_contable IS 'Cta Contable';
LABEL ON COLUMN RCLNB.cuenta_contable TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RCLNB.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RCLNB.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN RCLNB.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RCLNB.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN RCLNB.fecha IS 'Fecha';
LABEL ON COLUMN RCLNB.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN RCLNB.fecha_apertura IS
  'Campo Fecha apertura de transacciones de cuentas reconciliables';
LABEL ON COLUMN RCLNB.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN RCLNB.fecha_apertura TEXT IS
  'Campo Fecha apertura de transacciones de cuentas r';
COMMENT ON COLUMN RCLNB.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de transacciones de cuentas reconciliables';
LABEL ON COLUMN RCLNB.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN RCLNB.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de transacciones de';
COMMENT ON COLUMN RCLNB.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN RCLNB.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN RCLNB.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN RCLNB.saldo_disponible IS
  'Campo Saldo disponible de transacciones de cuentas reconciliables';
LABEL ON COLUMN RCLNB.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN RCLNB.saldo_disponible TEXT IS
  'Campo Saldo disponible de transacciones de cuentas';
COMMENT ON COLUMN RCLNB.limite_sobregiro IS
  'Campo Limite sobregiro de transacciones de cuentas reconciliables';
LABEL ON COLUMN RCLNB.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN RCLNB.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de transacciones de cuentas';
COMMENT ON COLUMN RCLNB.estado_cuenta IS
  'Campo Estado cuenta de transacciones de cuentas reconciliables';
LABEL ON COLUMN RCLNB.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN RCLNB.estado_cuenta TEXT IS
  'Campo Estado cuenta de transacciones de cuentas re';
COMMENT ON COLUMN RCLNB.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN RCLNB.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN RCLNB.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN RCLNB.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN RCLNB.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN RCLNB.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN RCLNB.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN RCLNB.version_registro IS 'Version';
LABEL ON COLUMN RCLNB.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN RCLNB.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN RCLNB.observaciones IS 'Observaciones';
LABEL ON COLUMN RCLNB.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN RCLNB.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN RCLNB.estado_registro IS 'Estado Reg';
LABEL ON COLUMN RCLNB.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN RCLNB.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN RCLNB.created_at IS 'Creado';
LABEL ON COLUMN RCLNB.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN RCLNB.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN RCLNB.updated_at IS 'Actualizado';
LABEL ON COLUMN RCLNB.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_rclnb_pk;
CREATE INDEX idx_rclnb_pk ON RCLNB (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_rclnb_fecha;
CREATE INDEX idx_rclnb_fecha ON RCLNB (fecha);

--==============================================================================
-- Nombre de la Tabla: TLMST
-- DESCRIPCION: Maestro de Cajeros
-- Objetivo: Persistir informacion funcional de maestro de cajeros en el entorno
-- IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de cajeros
-- Restricciones: Clave reportada: Código de Cajero, Moneda
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE TLMST (
    codigo_de_cajero FOR COLUMN CODECA VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_tlmst PRIMARY KEY (codigo_de_cajero, codigo_moneda)
) RCDFMT TLMSTR;

COMMENT ON TABLE TLMST IS 'Maestro de Cajeros';
LABEL ON TABLE TLMST IS 'TLMST - Maestro de Cajeros';
COMMENT ON COLUMN TLMST.codigo_de_cajero IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TLMST.codigo_de_cajero IS 'Codigo de cajero';
LABEL ON COLUMN TLMST.codigo_de_cajero TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TLMST.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TLMST.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN TLMST.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TLMST.fecha_apertura IS
  'Campo Fecha apertura de maestro de cajeros';
LABEL ON COLUMN TLMST.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN TLMST.fecha_apertura TEXT IS
  'Campo Fecha apertura de maestro de cajeros';
COMMENT ON COLUMN TLMST.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de maestro de cajeros';
LABEL ON COLUMN TLMST.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN TLMST.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de maestro de cajer';
COMMENT ON COLUMN TLMST.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN TLMST.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN TLMST.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN TLMST.saldo_disponible IS
  'Campo Saldo disponible de maestro de cajeros';
LABEL ON COLUMN TLMST.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN TLMST.saldo_disponible TEXT IS
  'Campo Saldo disponible de maestro de cajeros';
COMMENT ON COLUMN TLMST.limite_sobregiro IS
  'Campo Limite sobregiro de maestro de cajeros';
LABEL ON COLUMN TLMST.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN TLMST.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de maestro de cajeros';
COMMENT ON COLUMN TLMST.estado_cuenta IS
  'Campo Estado cuenta de maestro de cajeros';
LABEL ON COLUMN TLMST.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN TLMST.estado_cuenta TEXT IS
  'Campo Estado cuenta de maestro de cajeros';
COMMENT ON COLUMN TLMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN TLMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN TLMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN TLMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN TLMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN TLMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN TLMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN TLMST.version_registro IS 'Version';
LABEL ON COLUMN TLMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN TLMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN TLMST.observaciones IS 'Observaciones';
LABEL ON COLUMN TLMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN TLMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN TLMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN TLMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN TLMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN TLMST.created_at IS 'Creado';
LABEL ON COLUMN TLMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN TLMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN TLMST.updated_at IS 'Actualizado';
LABEL ON COLUMN TLMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_tlmst_pk;
CREATE INDEX idx_tlmst_pk ON TLMST (codigo_de_cajero, codigo_moneda);
DROP INDEX IF EXISTS idx_tlmst_created_at;
CREATE INDEX idx_tlmst_created_at ON TLMST (created_at);

--==============================================================================
-- Nombre de la Tabla: TDRCR
-- DESCRIPCION: Maestro de Transacciones de Cajero
-- Objetivo: Persistir informacion funcional de maestro de transacciones de
-- cajero en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de
-- transacciones de cajero
-- Restricciones: Clave reportada: Código de Transacción.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE TDRCR (
    codigo_de_transaccion FOR COLUMN CODETR VARCHAR(20),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_tdrcr PRIMARY KEY (codigo_de_transaccion)
) RCDFMT TDRCRR;

COMMENT ON TABLE TDRCR IS 'Maestro de Transacciones de Cajero';
LABEL ON TABLE TDRCR IS 'TDRCR - Maestro de Transacciones de Cajero';
COMMENT ON COLUMN TDRCR.codigo_de_transaccion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN TDRCR.codigo_de_transaccion IS 'Codigo de transaccio';
LABEL ON COLUMN TDRCR.codigo_de_transaccion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN TDRCR.fecha_apertura IS
  'Campo Fecha apertura de maestro de transacciones de cajero';
LABEL ON COLUMN TDRCR.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN TDRCR.fecha_apertura TEXT IS
  'Campo Fecha apertura de maestro de transacciones d';
COMMENT ON COLUMN TDRCR.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de maestro de transacciones de cajero';
LABEL ON COLUMN TDRCR.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN TDRCR.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de maestro de trans';
COMMENT ON COLUMN TDRCR.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN TDRCR.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN TDRCR.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN TDRCR.saldo_disponible IS
  'Campo Saldo disponible de maestro de transacciones de cajero';
LABEL ON COLUMN TDRCR.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN TDRCR.saldo_disponible TEXT IS
  'Campo Saldo disponible de maestro de transacciones';
COMMENT ON COLUMN TDRCR.limite_sobregiro IS
  'Campo Limite sobregiro de maestro de transacciones de cajero';
LABEL ON COLUMN TDRCR.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN TDRCR.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de maestro de transacciones';
COMMENT ON COLUMN TDRCR.estado_cuenta IS
  'Campo Estado cuenta de maestro de transacciones de cajero';
LABEL ON COLUMN TDRCR.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN TDRCR.estado_cuenta TEXT IS
  'Campo Estado cuenta de maestro de transacciones de';
COMMENT ON COLUMN TDRCR.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN TDRCR.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN TDRCR.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN TDRCR.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN TDRCR.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN TDRCR.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN TDRCR.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN TDRCR.version_registro IS 'Version';
LABEL ON COLUMN TDRCR.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN TDRCR.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN TDRCR.observaciones IS 'Observaciones';
LABEL ON COLUMN TDRCR.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN TDRCR.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN TDRCR.estado_registro IS 'Estado Reg';
LABEL ON COLUMN TDRCR.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN TDRCR.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN TDRCR.created_at IS 'Creado';
LABEL ON COLUMN TDRCR.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN TDRCR.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN TDRCR.updated_at IS 'Actualizado';
LABEL ON COLUMN TDRCR.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_tdrcr_pk;
CREATE INDEX idx_tdrcr_pk ON TDRCR (codigo_de_transaccion);
DROP INDEX IF EXISTS idx_tdrcr_created_at;
CREATE INDEX idx_tdrcr_created_at ON TDRCR (created_at);

--==============================================================================
-- Nombre de la Tabla: AUDIT
-- DESCRIPCION: Detalle diario de transacciones de caja.
-- Objetivo: Persistir informacion funcional de detalle diario de transacciones
-- de caja en el entorno IBM i del taller.
-- Tipo de Tabla: Transaccional
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de detalle diario de
-- transacciones de caja
-- Restricciones: Clave reportada: Banco, Sucursal, Cajero, Moneda, Referencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE AUDIT (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_cajero FOR COLUMN COCA VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    referencia FOR COLUMN SREFER VARCHAR(50),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_audit PRIMARY KEY (codigo_banco, codigo_sucursal
      , codigo_cajero, codigo_moneda, referencia)
) RCDFMT AUDITR;

COMMENT ON TABLE AUDIT IS 'Detalle diario de transacciones de caja.';
LABEL ON TABLE AUDIT IS 'AUDIT - Detalle diario de transacciones de caja.';
COMMENT ON COLUMN AUDIT.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN AUDIT.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN AUDIT.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN AUDIT.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN AUDIT.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN AUDIT.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN AUDIT.codigo_cajero IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN AUDIT.codigo_cajero IS 'Codigo cajero';
LABEL ON COLUMN AUDIT.codigo_cajero TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN AUDIT.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN AUDIT.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN AUDIT.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN AUDIT.referencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN AUDIT.referencia IS 'Referencia';
LABEL ON COLUMN AUDIT.referencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN AUDIT.fecha_apertura IS
  'Campo Fecha apertura de detalle diario de transacciones de caja';
LABEL ON COLUMN AUDIT.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN AUDIT.fecha_apertura TEXT IS
  'Campo Fecha apertura de detalle diario de transacc';
COMMENT ON COLUMN AUDIT.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de detalle diario de transacciones de caja';
LABEL ON COLUMN AUDIT.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN AUDIT.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de detalle diario d';
COMMENT ON COLUMN AUDIT.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN AUDIT.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN AUDIT.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN AUDIT.saldo_disponible IS
  'Campo Saldo disponible de detalle diario de transacciones de caja';
LABEL ON COLUMN AUDIT.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN AUDIT.saldo_disponible TEXT IS
  'Campo Saldo disponible de detalle diario de transa';
COMMENT ON COLUMN AUDIT.limite_sobregiro IS
  'Campo Limite sobregiro de detalle diario de transacciones de caja';
LABEL ON COLUMN AUDIT.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN AUDIT.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de detalle diario de transa';
COMMENT ON COLUMN AUDIT.estado_cuenta IS
  'Campo Estado cuenta de detalle diario de transacciones de caja';
LABEL ON COLUMN AUDIT.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN AUDIT.estado_cuenta TEXT IS
  'Campo Estado cuenta de detalle diario de transacci';
COMMENT ON COLUMN AUDIT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN AUDIT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN AUDIT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN AUDIT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN AUDIT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN AUDIT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN AUDIT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN AUDIT.version_registro IS 'Version';
LABEL ON COLUMN AUDIT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN AUDIT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN AUDIT.observaciones IS 'Observaciones';
LABEL ON COLUMN AUDIT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN AUDIT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN AUDIT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN AUDIT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN AUDIT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN AUDIT.created_at IS 'Creado';
LABEL ON COLUMN AUDIT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN AUDIT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN AUDIT.updated_at IS 'Actualizado';
LABEL ON COLUMN AUDIT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_audit_pk;
CREATE INDEX idx_audit_pk ON AUDIT (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_audit_created_at;
CREATE INDEX idx_audit_created_at ON AUDIT (created_at);

--==============================================================================
-- Nombre de la Tabla: CHMST
-- DESCRIPCION: Maestro de Chequeras.
-- Objetivo: Persistir informacion funcional de maestro de chequeras en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de chequeras
-- Restricciones: Clave reportada: Banco, Sucursal, Moneda, Cuenta, Cheque
-- Inicial.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CHMST (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    cheque_inicial FOR COLUMN CHIN VARCHAR(50),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_chmst PRIMARY KEY (codigo_banco, codigo_sucursal
      , codigo_moneda, numero_cuenta, cheque_inicial)
) RCDFMT CHMSTR;

COMMENT ON TABLE CHMST IS 'Maestro de Chequeras.';
LABEL ON TABLE CHMST IS 'CHMST - Maestro de Chequeras.';
COMMENT ON COLUMN CHMST.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHMST.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CHMST.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHMST.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHMST.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN CHMST.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHMST.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHMST.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN CHMST.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHMST.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHMST.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN CHMST.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHMST.cheque_inicial IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHMST.cheque_inicial IS 'Cheque inicial';
LABEL ON COLUMN CHMST.cheque_inicial TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHMST.fecha_apertura IS
  'Campo Fecha apertura de maestro de chequeras';
LABEL ON COLUMN CHMST.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN CHMST.fecha_apertura TEXT IS
  'Campo Fecha apertura de maestro de chequeras';
COMMENT ON COLUMN CHMST.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de maestro de chequeras';
LABEL ON COLUMN CHMST.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN CHMST.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de maestro de chequ';
COMMENT ON COLUMN CHMST.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CHMST.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CHMST.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CHMST.saldo_disponible IS
  'Campo Saldo disponible de maestro de chequeras';
LABEL ON COLUMN CHMST.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN CHMST.saldo_disponible TEXT IS
  'Campo Saldo disponible de maestro de chequeras';
COMMENT ON COLUMN CHMST.limite_sobregiro IS
  'Campo Limite sobregiro de maestro de chequeras';
LABEL ON COLUMN CHMST.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN CHMST.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de maestro de chequeras';
COMMENT ON COLUMN CHMST.estado_cuenta IS
  'Campo Estado cuenta de maestro de chequeras';
LABEL ON COLUMN CHMST.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN CHMST.estado_cuenta TEXT IS
  'Campo Estado cuenta de maestro de chequeras';
COMMENT ON COLUMN CHMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CHMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CHMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CHMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CHMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CHMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CHMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CHMST.version_registro IS 'Version';
LABEL ON COLUMN CHMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CHMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CHMST.observaciones IS 'Observaciones';
LABEL ON COLUMN CHMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CHMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CHMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CHMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CHMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CHMST.created_at IS 'Creado';
LABEL ON COLUMN CHMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CHMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CHMST.updated_at IS 'Actualizado';
LABEL ON COLUMN CHMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_chmst_pk;
CREATE INDEX idx_chmst_pk ON CHMST (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_chmst_created_at;
CREATE INDEX idx_chmst_created_at ON CHMST (created_at);

--==============================================================================
-- Nombre de la Tabla: CHPER
-- DESCRIPCION: Personalizacion de Chequeras.
-- Objetivo: Persistir informacion funcional de personalizacion de chequeras en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de personalizacion de
-- chequeras
-- Restricciones: Clave reportada: Banco, Sucursal, Cuenta.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CHPER (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_chper PRIMARY KEY (codigo_banco, codigo_sucursal
      , numero_cuenta)
) RCDFMT CHPERR;

COMMENT ON TABLE CHPER IS 'Personalizacion de Chequeras.';
LABEL ON TABLE CHPER IS 'CHPER - Personalizacion de Chequeras.';
COMMENT ON COLUMN CHPER.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHPER.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CHPER.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHPER.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHPER.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN CHPER.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHPER.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHPER.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN CHPER.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHPER.fecha_apertura IS
  'Campo Fecha apertura de personalizacion de chequeras';
LABEL ON COLUMN CHPER.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN CHPER.fecha_apertura TEXT IS
  'Campo Fecha apertura de personalizacion de chequer';
COMMENT ON COLUMN CHPER.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de personalizacion de chequeras';
LABEL ON COLUMN CHPER.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN CHPER.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de personalizacion';
COMMENT ON COLUMN CHPER.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CHPER.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CHPER.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CHPER.saldo_disponible IS
  'Campo Saldo disponible de personalizacion de chequeras';
LABEL ON COLUMN CHPER.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN CHPER.saldo_disponible TEXT IS
  'Campo Saldo disponible de personalizacion de chequ';
COMMENT ON COLUMN CHPER.limite_sobregiro IS
  'Campo Limite sobregiro de personalizacion de chequeras';
LABEL ON COLUMN CHPER.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN CHPER.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de personalizacion de chequ';
COMMENT ON COLUMN CHPER.estado_cuenta IS
  'Campo Estado cuenta de personalizacion de chequeras';
LABEL ON COLUMN CHPER.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN CHPER.estado_cuenta TEXT IS
  'Campo Estado cuenta de personalizacion de chequera';
COMMENT ON COLUMN CHPER.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CHPER.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CHPER.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CHPER.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CHPER.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CHPER.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CHPER.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CHPER.version_registro IS 'Version';
LABEL ON COLUMN CHPER.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CHPER.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CHPER.observaciones IS 'Observaciones';
LABEL ON COLUMN CHPER.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CHPER.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CHPER.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CHPER.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CHPER.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CHPER.created_at IS 'Creado';
LABEL ON COLUMN CHPER.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CHPER.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CHPER.updated_at IS 'Actualizado';
LABEL ON COLUMN CHPER.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_chper_pk;
CREATE INDEX idx_chper_pk ON CHPER (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_chper_created_at;
CREATE INDEX idx_chper_created_at ON CHPER (created_at);

--==============================================================================
-- Nombre de la Tabla: CHSTS
-- DESCRIPCION: Maestro de cambio de estatus a cuentas de detalle.
-- Objetivo: Persistir informacion funcional de maestro de cambio de estatus a
-- cuentas de detalle en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de cambio de
-- estatus a cuentas de detalle
-- Restricciones: Clave reportada: Banco, Sucursal, Moneda, Cuenta Contable,
-- Cuenta.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CHSTS (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    cuenta_contable FOR COLUMN CUCO VARCHAR(24),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_chsts PRIMARY KEY (codigo_banco, codigo_sucursal
      , codigo_moneda, cuenta_contable, numero_cuenta)
) RCDFMT CHSTSR;

COMMENT ON TABLE CHSTS IS 'Maestro de cambio de estatus a cuentas de detalle.';
LABEL ON TABLE CHSTS IS 'CHSTS - Maestro de cambio de estatus a cuentas de';
COMMENT ON COLUMN CHSTS.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHSTS.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CHSTS.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHSTS.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHSTS.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN CHSTS.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHSTS.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHSTS.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN CHSTS.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHSTS.cuenta_contable IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHSTS.cuenta_contable IS 'Cta Contable';
LABEL ON COLUMN CHSTS.cuenta_contable TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHSTS.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CHSTS.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN CHSTS.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CHSTS.fecha_apertura IS
  'Campo Fecha apertura de maestro de cambio de estatus a cuentas de detalle';
LABEL ON COLUMN CHSTS.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN CHSTS.fecha_apertura TEXT IS
  'Campo Fecha apertura de maestro de cambio de estat';
COMMENT ON COLUMN CHSTS.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de maestro de cambio de estatus a cuentas de '
  'detalle';
LABEL ON COLUMN CHSTS.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN CHSTS.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de maestro de cambi';
COMMENT ON COLUMN CHSTS.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CHSTS.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CHSTS.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CHSTS.saldo_disponible IS
  'Campo Saldo disponible de maestro de cambio de estatus a cuentas de detalle';
LABEL ON COLUMN CHSTS.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN CHSTS.saldo_disponible TEXT IS
  'Campo Saldo disponible de maestro de cambio de est';
COMMENT ON COLUMN CHSTS.limite_sobregiro IS
  'Campo Limite sobregiro de maestro de cambio de estatus a cuentas de detalle';
LABEL ON COLUMN CHSTS.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN CHSTS.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de maestro de cambio de est';
COMMENT ON COLUMN CHSTS.estado_cuenta IS
  'Campo Estado cuenta de maestro de cambio de estatus a cuentas de detalle';
LABEL ON COLUMN CHSTS.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN CHSTS.estado_cuenta TEXT IS
  'Campo Estado cuenta de maestro de cambio de estatu';
COMMENT ON COLUMN CHSTS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CHSTS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CHSTS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CHSTS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CHSTS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CHSTS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CHSTS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CHSTS.version_registro IS 'Version';
LABEL ON COLUMN CHSTS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CHSTS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CHSTS.observaciones IS 'Observaciones';
LABEL ON COLUMN CHSTS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CHSTS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CHSTS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CHSTS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CHSTS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CHSTS.created_at IS 'Creado';
LABEL ON COLUMN CHSTS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CHSTS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CHSTS.updated_at IS 'Actualizado';
LABEL ON COLUMN CHSTS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_chsts_pk;
CREATE INDEX idx_chsts_pk ON CHSTS (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_chsts_created_at;
CREATE INDEX idx_chsts_created_at ON CHSTS (created_at);

--==============================================================================
-- Nombre de la Tabla: DEVOL
-- DESCRIPCION: Detalle de Cheques devueltos.
-- Objetivo: Persistir informacion funcional de detalle de cheques devueltos en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de detalle de cheques
-- devueltos
-- Restricciones: Clave reportada: Cuenta, Número de Cheque.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DEVOL (
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    numero_cheque FOR COLUMN NUCH VARCHAR(30),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_devol PRIMARY KEY (numero_cuenta, numero_cheque)
) RCDFMT DEVOLR;

COMMENT ON TABLE DEVOL IS 'Detalle de Cheques devueltos.';
LABEL ON TABLE DEVOL IS 'DEVOL - Detalle de Cheques devueltos.';
COMMENT ON COLUMN DEVOL.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DEVOL.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN DEVOL.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DEVOL.numero_cheque IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DEVOL.numero_cheque IS 'Numero cheque';
LABEL ON COLUMN DEVOL.numero_cheque TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DEVOL.fecha_apertura IS
  'Campo Fecha apertura de detalle de cheques devueltos';
LABEL ON COLUMN DEVOL.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN DEVOL.fecha_apertura TEXT IS
  'Campo Fecha apertura de detalle de cheques devuelt';
COMMENT ON COLUMN DEVOL.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de detalle de cheques devueltos';
LABEL ON COLUMN DEVOL.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN DEVOL.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de detalle de chequ';
COMMENT ON COLUMN DEVOL.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN DEVOL.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN DEVOL.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN DEVOL.saldo_disponible IS
  'Campo Saldo disponible de detalle de cheques devueltos';
LABEL ON COLUMN DEVOL.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN DEVOL.saldo_disponible TEXT IS
  'Campo Saldo disponible de detalle de cheques devue';
COMMENT ON COLUMN DEVOL.limite_sobregiro IS
  'Campo Limite sobregiro de detalle de cheques devueltos';
LABEL ON COLUMN DEVOL.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN DEVOL.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de detalle de cheques devue';
COMMENT ON COLUMN DEVOL.estado_cuenta IS
  'Campo Estado cuenta de detalle de cheques devueltos';
LABEL ON COLUMN DEVOL.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN DEVOL.estado_cuenta TEXT IS
  'Campo Estado cuenta de detalle de cheques devuelto';
COMMENT ON COLUMN DEVOL.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DEVOL.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DEVOL.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DEVOL.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DEVOL.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DEVOL.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DEVOL.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DEVOL.version_registro IS 'Version';
LABEL ON COLUMN DEVOL.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DEVOL.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DEVOL.observaciones IS 'Observaciones';
LABEL ON COLUMN DEVOL.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DEVOL.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DEVOL.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DEVOL.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DEVOL.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DEVOL.created_at IS 'Creado';
LABEL ON COLUMN DEVOL.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DEVOL.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DEVOL.updated_at IS 'Actualizado';
LABEL ON COLUMN DEVOL.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_devol_pk;
CREATE INDEX idx_devol_pk ON DEVOL (numero_cuenta, numero_cheque);
DROP INDEX IF EXISTS idx_devol_created_at;
CREATE INDEX idx_devol_created_at ON DEVOL (created_at);

--==============================================================================
-- Nombre de la Tabla: CMRIN
-- DESCRIPCION: Detalle de Cámara Entrante.
-- Objetivo: Persistir informacion funcional de detalle de cámara entrante en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de detalle de cámara
-- entrante
-- Restricciones: Clave reportada: Banco, Sucursal. Moneda, Cuenta, Monto
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CMRIN (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    sucursal_moneda FOR COLUMN SUMO VARCHAR(50),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    monto FOR COLUMN SMONTO DECIMAL(18,2),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cmrin PRIMARY KEY (codigo_banco, sucursal_moneda
      , numero_cuenta, monto)
) RCDFMT CMRINR;

COMMENT ON TABLE CMRIN IS 'Detalle de Cámara Entrante.';
LABEL ON TABLE CMRIN IS 'CMRIN - Detalle de Cámara Entrante.';
COMMENT ON COLUMN CMRIN.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CMRIN.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CMRIN.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CMRIN.sucursal_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CMRIN.sucursal_moneda IS 'Sucursal moneda';
LABEL ON COLUMN CMRIN.sucursal_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CMRIN.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CMRIN.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN CMRIN.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CMRIN.monto IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN CMRIN.monto IS 'Monto';
LABEL ON COLUMN CMRIN.monto TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN CMRIN.fecha_apertura IS
  'Campo Fecha apertura de detalle de cámara entrante';
LABEL ON COLUMN CMRIN.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN CMRIN.fecha_apertura TEXT IS
  'Campo Fecha apertura de detalle de cámara entrante';
COMMENT ON COLUMN CMRIN.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de detalle de cámara entrante';
LABEL ON COLUMN CMRIN.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN CMRIN.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de detalle de cámar';
COMMENT ON COLUMN CMRIN.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CMRIN.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CMRIN.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CMRIN.saldo_disponible IS
  'Campo Saldo disponible de detalle de cámara entrante';
LABEL ON COLUMN CMRIN.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN CMRIN.saldo_disponible TEXT IS
  'Campo Saldo disponible de detalle de cámara entran';
COMMENT ON COLUMN CMRIN.limite_sobregiro IS
  'Campo Limite sobregiro de detalle de cámara entrante';
LABEL ON COLUMN CMRIN.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN CMRIN.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de detalle de cámara entran';
COMMENT ON COLUMN CMRIN.estado_cuenta IS
  'Campo Estado cuenta de detalle de cámara entrante';
LABEL ON COLUMN CMRIN.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN CMRIN.estado_cuenta TEXT IS
  'Campo Estado cuenta de detalle de cámara entrante';
COMMENT ON COLUMN CMRIN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CMRIN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CMRIN.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CMRIN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CMRIN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CMRIN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CMRIN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CMRIN.version_registro IS 'Version';
LABEL ON COLUMN CMRIN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CMRIN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CMRIN.observaciones IS 'Observaciones';
LABEL ON COLUMN CMRIN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CMRIN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CMRIN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CMRIN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CMRIN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CMRIN.created_at IS 'Creado';
LABEL ON COLUMN CMRIN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CMRIN.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CMRIN.updated_at IS 'Actualizado';
LABEL ON COLUMN CMRIN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cmrin_pk;
CREATE INDEX idx_cmrin_pk ON CMRIN (codigo_banco, sucursal_moneda);
DROP INDEX IF EXISTS idx_cmrin_created_at;
CREATE INDEX idx_cmrin_created_at ON CMRIN (created_at);

--==============================================================================
-- Nombre de la Tabla: OVDRF
-- DESCRIPCION: Archivo diario de Sobregiros.
-- Objetivo: Persistir informacion funcional de archivo diario de sobregiros en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo diario de
-- sobregiros
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE OVDRF (
    id FOR COLUMN SID BIGINT,
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ovdrf PRIMARY KEY (id)
) RCDFMT OVDRFR;

COMMENT ON TABLE OVDRF IS 'Archivo diario de Sobregiros.';
LABEL ON TABLE OVDRF IS 'OVDRF - Archivo diario de Sobregiros.';
COMMENT ON COLUMN OVDRF.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN OVDRF.id IS 'Id';
LABEL ON COLUMN OVDRF.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN OVDRF.fecha_apertura IS
  'Campo Fecha apertura de archivo diario de sobregiros';
LABEL ON COLUMN OVDRF.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN OVDRF.fecha_apertura TEXT IS
  'Campo Fecha apertura de archivo diario de sobregir';
COMMENT ON COLUMN OVDRF.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de archivo diario de sobregiros';
LABEL ON COLUMN OVDRF.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN OVDRF.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de archivo diario d';
COMMENT ON COLUMN OVDRF.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN OVDRF.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN OVDRF.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN OVDRF.saldo_disponible IS
  'Campo Saldo disponible de archivo diario de sobregiros';
LABEL ON COLUMN OVDRF.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN OVDRF.saldo_disponible TEXT IS
  'Campo Saldo disponible de archivo diario de sobreg';
COMMENT ON COLUMN OVDRF.limite_sobregiro IS
  'Campo Limite sobregiro de archivo diario de sobregiros';
LABEL ON COLUMN OVDRF.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN OVDRF.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de archivo diario de sobreg';
COMMENT ON COLUMN OVDRF.estado_cuenta IS
  'Campo Estado cuenta de archivo diario de sobregiros';
LABEL ON COLUMN OVDRF.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN OVDRF.estado_cuenta TEXT IS
  'Campo Estado cuenta de archivo diario de sobregiro';
COMMENT ON COLUMN OVDRF.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN OVDRF.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN OVDRF.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN OVDRF.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN OVDRF.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN OVDRF.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN OVDRF.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN OVDRF.version_registro IS 'Version';
LABEL ON COLUMN OVDRF.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN OVDRF.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN OVDRF.observaciones IS 'Observaciones';
LABEL ON COLUMN OVDRF.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN OVDRF.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN OVDRF.estado_registro IS 'Estado Reg';
LABEL ON COLUMN OVDRF.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN OVDRF.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN OVDRF.created_at IS 'Creado';
LABEL ON COLUMN OVDRF.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN OVDRF.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN OVDRF.updated_at IS 'Actualizado';
LABEL ON COLUMN OVDRF.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ovdrf_pk;
CREATE INDEX idx_ovdrf_pk ON OVDRF (id);
DROP INDEX IF EXISTS idx_ovdrf_created_at;
CREATE INDEX idx_ovdrf_created_at ON OVDRF (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLMSG
-- DESCRIPCION: Mensajes a ser impresos en estados de cuenta.
-- Objetivo: Persistir informacion funcional de mensajes a ser impresos en
-- estados de cuenta en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de mensajes a ser
-- impresos en estados de cuenta
-- Restricciones: Clave reportada: Banco
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLMSG (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlmsg PRIMARY KEY (codigo_banco)
) RCDFMT CNTRLMSGR;

COMMENT ON TABLE CNTRLMSG IS 'Mensajes a ser impresos en estados de cuenta.';
LABEL ON TABLE CNTRLMSG IS 'CNTRLMSG - Mensajes a ser impresos en estados de c';
COMMENT ON COLUMN CNTRLMSG.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLMSG.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLMSG.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLMSG.fecha_apertura IS
  'Campo Fecha apertura de mensajes a ser impresos en estados de cuenta';
LABEL ON COLUMN CNTRLMSG.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN CNTRLMSG.fecha_apertura TEXT IS
  'Campo Fecha apertura de mensajes a ser impresos en';
COMMENT ON COLUMN CNTRLMSG.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de mensajes a ser impresos en estados de cuen'
  'ta';
LABEL ON COLUMN CNTRLMSG.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN CNTRLMSG.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de mensajes a ser i';
COMMENT ON COLUMN CNTRLMSG.saldo_actual IS
  'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CNTRLMSG.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CNTRLMSG.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CNTRLMSG.saldo_disponible IS
  'Campo Saldo disponible de mensajes a ser impresos en estados de cuenta';
LABEL ON COLUMN CNTRLMSG.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN CNTRLMSG.saldo_disponible TEXT IS
  'Campo Saldo disponible de mensajes a ser impresos';
COMMENT ON COLUMN CNTRLMSG.limite_sobregiro IS
  'Campo Limite sobregiro de mensajes a ser impresos en estados de cuenta';
LABEL ON COLUMN CNTRLMSG.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN CNTRLMSG.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de mensajes a ser impresos';
COMMENT ON COLUMN CNTRLMSG.estado_cuenta IS
  'Campo Estado cuenta de mensajes a ser impresos en estados de cuenta';
LABEL ON COLUMN CNTRLMSG.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN CNTRLMSG.estado_cuenta TEXT IS
  'Campo Estado cuenta de mensajes a ser impresos en';
COMMENT ON COLUMN CNTRLMSG.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLMSG.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLMSG.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLMSG.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLMSG.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLMSG.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLMSG.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLMSG.version_registro IS 'Version';
LABEL ON COLUMN CNTRLMSG.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLMSG.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLMSG.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLMSG.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLMSG.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLMSG.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLMSG.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLMSG.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLMSG.created_at IS 'Creado';
LABEL ON COLUMN CNTRLMSG.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLMSG.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLMSG.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLMSG.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlmsg_pk;
CREATE INDEX idx_cntrlmsg_pk ON CNTRLMSG (codigo_banco);
DROP INDEX IF EXISTS idx_cntrlmsg_created_at;
CREATE INDEX idx_cntrlmsg_created_at ON CNTRLMSG (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLRTE
-- DESCRIPCION: Tabla de Tasas y Cargos por Servicio en Cuentas de Detalle.
-- Objetivo: Persistir informacion funcional de tabla de tasas y cargos por
-- servicio en cuentas de detalle en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de tabla de tasas y
-- cargos por servicio en cuentas de detalle
-- Restricciones: Clave reportada: Banco, Tipo de Producto, Código de Tabla.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLRTE (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    tipo_producto FOR COLUMN TIPR VARCHAR(20),
    codigo_tabla FOR COLUMN COTA VARCHAR(20),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlrte PRIMARY KEY (codigo_banco, tipo_producto
      , codigo_tabla)
) RCDFMT CNTRLRTER;

COMMENT ON TABLE CNTRLRTE IS
  'Tabla de Tasas y Cargos por Servicio en Cuentas de Detalle.';
LABEL ON TABLE CNTRLRTE IS 'CNTRLRTE - Tabla de Tasas y Cargos por Servicio en';
COMMENT ON COLUMN CNTRLRTE.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLRTE.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLRTE.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLRTE.tipo_producto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLRTE.tipo_producto IS 'Tipo producto';
LABEL ON COLUMN CNTRLRTE.tipo_producto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLRTE.codigo_tabla IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLRTE.codigo_tabla IS 'Codigo tabla';
LABEL ON COLUMN CNTRLRTE.codigo_tabla TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLRTE.fecha_apertura IS
  'Campo Fecha apertura de tabla de tasas y cargos por servicio en cuentas de d'
  'etalle';
LABEL ON COLUMN CNTRLRTE.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN CNTRLRTE.fecha_apertura TEXT IS
  'Campo Fecha apertura de tabla de tasas y cargos po';
COMMENT ON COLUMN CNTRLRTE.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de tabla de tasas y cargos por servicio en cu'
  'entas de detalle';
LABEL ON COLUMN CNTRLRTE.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN CNTRLRTE.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de tabla de tasas y';
COMMENT ON COLUMN CNTRLRTE.saldo_actual IS
  'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CNTRLRTE.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CNTRLRTE.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CNTRLRTE.saldo_disponible IS
  'Campo Saldo disponible de tabla de tasas y cargos por servicio en cuentas de'
  ' detalle';
LABEL ON COLUMN CNTRLRTE.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN CNTRLRTE.saldo_disponible TEXT IS
  'Campo Saldo disponible de tabla de tasas y cargos';
COMMENT ON COLUMN CNTRLRTE.limite_sobregiro IS
  'Campo Limite sobregiro de tabla de tasas y cargos por servicio en cuentas de'
  ' detalle';
LABEL ON COLUMN CNTRLRTE.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN CNTRLRTE.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de tabla de tasas y cargos';
COMMENT ON COLUMN CNTRLRTE.estado_cuenta IS
  'Campo Estado cuenta de tabla de tasas y cargos por servicio en cuentas de de'
  'talle';
LABEL ON COLUMN CNTRLRTE.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN CNTRLRTE.estado_cuenta TEXT IS
  'Campo Estado cuenta de tabla de tasas y cargos por';
COMMENT ON COLUMN CNTRLRTE.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLRTE.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLRTE.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLRTE.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLRTE.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLRTE.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLRTE.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLRTE.version_registro IS 'Version';
LABEL ON COLUMN CNTRLRTE.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLRTE.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLRTE.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLRTE.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLRTE.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLRTE.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLRTE.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLRTE.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLRTE.created_at IS 'Creado';
LABEL ON COLUMN CNTRLRTE.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLRTE.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLRTE.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLRTE.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlrte_pk;
CREATE INDEX idx_cntrlrte_pk ON CNTRLRTE (codigo_banco, tipo_producto);
DROP INDEX IF EXISTS idx_cntrlrte_created_at;
CREATE INDEX idx_cntrlrte_created_at ON CNTRLRTE (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLDEV
-- DESCRIPCION: Definición de las Causales de Devolución de Cheques.
-- Objetivo: Persistir informacion funcional de definición de las causales de
-- devolución de cheques en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de definición de las
-- causales de devolución de cheques
-- Restricciones: Clave reportada: Código de Causal.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLDEV (
    codigo_causal FOR COLUMN COCA VARCHAR(20),
    fecha_apertura FOR COLUMN FEAP DATE,
    fecha_ultima_transaccion FOR COLUMN FEULTR DATE,
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    saldo_disponible FOR COLUMN SADI DECIMAL(18,2),
    limite_sobregiro FOR COLUMN LISO DECIMAL(18,2),
    estado_cuenta FOR COLUMN ESCU VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrldev PRIMARY KEY (codigo_causal)
) RCDFMT CNTRLDEVR;

COMMENT ON TABLE CNTRLDEV IS
  'Definición de las Causales de Devolución de Cheques.';
LABEL ON TABLE CNTRLDEV IS
  'CNTRLDEV - Definición de las Causales de Devolució';
COMMENT ON COLUMN CNTRLDEV.codigo_causal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLDEV.codigo_causal IS 'Codigo causal';
LABEL ON COLUMN CNTRLDEV.codigo_causal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLDEV.fecha_apertura IS
  'Campo Fecha apertura de definición de las causales de devolución de cheque'
  's';
LABEL ON COLUMN CNTRLDEV.fecha_apertura IS 'Fecha apertura';
LABEL ON COLUMN CNTRLDEV.fecha_apertura TEXT IS
  'Campo Fecha apertura de definición de las causales';
COMMENT ON COLUMN CNTRLDEV.fecha_ultima_transaccion IS
  'Campo Fecha ultima transaccion de definición de las causales de devolución'
  ' de cheques';
LABEL ON COLUMN CNTRLDEV.fecha_ultima_transaccion IS 'Fecha ultima transac';
LABEL ON COLUMN CNTRLDEV.fecha_ultima_transaccion TEXT IS
  'Campo Fecha ultima transaccion de definición de la';
COMMENT ON COLUMN CNTRLDEV.saldo_actual IS
  'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CNTRLDEV.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CNTRLDEV.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CNTRLDEV.saldo_disponible IS
  'Campo Saldo disponible de definición de las causales de devolución de cheq'
  'ues';
LABEL ON COLUMN CNTRLDEV.saldo_disponible IS 'Saldo disponible';
LABEL ON COLUMN CNTRLDEV.saldo_disponible TEXT IS
  'Campo Saldo disponible de definición de las causal';
COMMENT ON COLUMN CNTRLDEV.limite_sobregiro IS
  'Campo Limite sobregiro de definición de las causales de devolución de cheq'
  'ues';
LABEL ON COLUMN CNTRLDEV.limite_sobregiro IS 'Limite sobregiro';
LABEL ON COLUMN CNTRLDEV.limite_sobregiro TEXT IS
  'Campo Limite sobregiro de definición de las causal';
COMMENT ON COLUMN CNTRLDEV.estado_cuenta IS
  'Campo Estado cuenta de definición de las causales de devolución de cheque'
  's';
LABEL ON COLUMN CNTRLDEV.estado_cuenta IS 'Estado cuenta';
LABEL ON COLUMN CNTRLDEV.estado_cuenta TEXT IS
  'Campo Estado cuenta de definición de las causales';
COMMENT ON COLUMN CNTRLDEV.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLDEV.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLDEV.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLDEV.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLDEV.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLDEV.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLDEV.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLDEV.version_registro IS 'Version';
LABEL ON COLUMN CNTRLDEV.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLDEV.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLDEV.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLDEV.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLDEV.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLDEV.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLDEV.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLDEV.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLDEV.created_at IS 'Creado';
LABEL ON COLUMN CNTRLDEV.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLDEV.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLDEV.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLDEV.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrldev_pk;
CREATE INDEX idx_cntrldev_pk ON CNTRLDEV (codigo_causal);
DROP INDEX IF EXISTS idx_cntrldev_created_at;
CREATE INDEX idx_cntrldev_created_at ON CNTRLDEV (created_at);

--==============================================================================
-- Nombre de la Tabla: DEALS
-- DESCRIPCION: Maestro de Préstamos, Certificados, Giros, Valores al Cobro,
-- Inversiones.
-- Objetivo: Persistir informacion funcional de maestro de préstamos,
-- certificados, giros, valores al cobro, inversiones en el entorno IBM i del
-- taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de
-- préstamos, certificados, giros, valores al cobro, inversiones
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DEALS (
    id FOR COLUMN SID BIGINT,
    numero_prestamo FOR COLUMN NUPR VARCHAR(30) NOT NULL,
    fecha_desembolso FOR COLUMN FEDE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    tasa_interes FOR COLUMN TAIN DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    dias_mora FOR COLUMN DIMO INT,
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_deals PRIMARY KEY (id)
) RCDFMT DEALSR;

COMMENT ON TABLE DEALS IS
  'Maestro de Préstamos, Certificados, Giros, Valores al Cobro, Inversiones.';
LABEL ON TABLE DEALS IS 'DEALS - Maestro de Préstamos, Certificados, Giros,';
COMMENT ON COLUMN DEALS.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DEALS.id IS 'Id';
LABEL ON COLUMN DEALS.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN DEALS.numero_prestamo IS
  'Numero de prestamo u operacion para referencias cruzadas del modulo';
LABEL ON COLUMN DEALS.numero_prestamo IS 'Numero prestamo';
LABEL ON COLUMN DEALS.numero_prestamo TEXT IS
  'Numero de prestamo u operacion para referencias cr';
COMMENT ON COLUMN DEALS.fecha_desembolso IS
  'Campo Fecha desembolso de maestro de préstamos, certificados, giros, valore'
  's al cobro, inversiones';
LABEL ON COLUMN DEALS.fecha_desembolso IS 'Fecha desembolso';
LABEL ON COLUMN DEALS.fecha_desembolso TEXT IS
  'Campo Fecha desembolso de maestro de préstamos, ce';
COMMENT ON COLUMN DEALS.fecha_vencimiento IS
  'Campo Fecha vencimiento de maestro de préstamos, certificados, giros, valor'
  'es al cobro, inversiones';
LABEL ON COLUMN DEALS.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN DEALS.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de maestro de préstamos, c';
COMMENT ON COLUMN DEALS.monto_original IS
  'Campo Monto original de maestro de préstamos, certificados, giros, valores '
  'al cobro, inversiones';
LABEL ON COLUMN DEALS.monto_original IS 'Monto original';
LABEL ON COLUMN DEALS.monto_original TEXT IS
  'Campo Monto original de maestro de préstamos, cert';
COMMENT ON COLUMN DEALS.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN DEALS.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN DEALS.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN DEALS.tasa_interes IS
  'Campo Tasa interes de maestro de préstamos, certificados, giros, valores al'
  ' cobro, inversiones';
LABEL ON COLUMN DEALS.tasa_interes IS 'Tasa interes';
LABEL ON COLUMN DEALS.tasa_interes TEXT IS
  'Campo Tasa interes de maestro de préstamos, certif';
COMMENT ON COLUMN DEALS.plazo_meses IS
  'Campo Plazo meses de maestro de préstamos, certificados, giros, valores al '
  'cobro, inversiones';
LABEL ON COLUMN DEALS.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN DEALS.plazo_meses TEXT IS
  'Campo Plazo meses de maestro de préstamos, certifi';
COMMENT ON COLUMN DEALS.dias_mora IS
  'Campo Dias mora de maestro de préstamos, certificados, giros, valores al co'
  'bro, inversiones';
LABEL ON COLUMN DEALS.dias_mora IS 'Dias mora';
LABEL ON COLUMN DEALS.dias_mora TEXT IS
  'Campo Dias mora de maestro de préstamos, certifica';
COMMENT ON COLUMN DEALS.estado_operacion IS
  'Campo Estado operacion de maestro de préstamos, certificados, giros, valore'
  's al cobro, inversiones';
LABEL ON COLUMN DEALS.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN DEALS.estado_operacion TEXT IS
  'Campo Estado operacion de maestro de préstamos, ce';
COMMENT ON COLUMN DEALS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DEALS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DEALS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DEALS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DEALS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DEALS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DEALS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DEALS.version_registro IS 'Version';
LABEL ON COLUMN DEALS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DEALS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DEALS.observaciones IS 'Observaciones';
LABEL ON COLUMN DEALS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DEALS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DEALS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DEALS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DEALS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DEALS.created_at IS 'Creado';
LABEL ON COLUMN DEALS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DEALS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DEALS.updated_at IS 'Actualizado';
LABEL ON COLUMN DEALS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_deals_pk;
CREATE INDEX idx_deals_pk ON DEALS (id);
DROP INDEX IF EXISTS idx_deals_created_at;
CREATE INDEX idx_deals_created_at ON DEALS (created_at);

--==============================================================================
-- Nombre de la Tabla: DLPMT
-- DESCRIPCION: Plan de Pagos
-- Objetivo: Persistir informacion funcional de plan de pagos en el entorno IBM
-- i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de plan de pagos
-- Restricciones: Clave reportada: Banco, Sucursal, Moneda, Préstamo, Fecha,
-- Tipo de Registro.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DLPMT (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    numero_prestamo FOR COLUMN NUPR VARCHAR(30),
    fecha FOR COLUMN SFECHA DATE,
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    fecha_desembolso FOR COLUMN FEDE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    tasa_interes FOR COLUMN TAIN DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    dias_mora FOR COLUMN DIMO INT,
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_dlpmt PRIMARY KEY (codigo_banco, codigo_sucursal
      , codigo_moneda, numero_prestamo, fecha, tipo_registro)
) RCDFMT DLPMTR;

COMMENT ON TABLE DLPMT IS 'Plan de Pagos';
LABEL ON TABLE DLPMT IS 'DLPMT - Plan de Pagos';
COMMENT ON COLUMN DLPMT.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLPMT.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN DLPMT.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLPMT.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLPMT.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN DLPMT.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLPMT.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLPMT.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN DLPMT.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLPMT.numero_prestamo IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLPMT.numero_prestamo IS 'Numero prestamo';
LABEL ON COLUMN DLPMT.numero_prestamo TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLPMT.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DLPMT.fecha IS 'Fecha';
LABEL ON COLUMN DLPMT.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLPMT.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLPMT.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN DLPMT.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLPMT.fecha_desembolso IS
  'Campo Fecha desembolso de plan de pagos';
LABEL ON COLUMN DLPMT.fecha_desembolso IS 'Fecha desembolso';
LABEL ON COLUMN DLPMT.fecha_desembolso TEXT IS
  'Campo Fecha desembolso de plan de pagos';
COMMENT ON COLUMN DLPMT.fecha_vencimiento IS
  'Campo Fecha vencimiento de plan de pagos';
LABEL ON COLUMN DLPMT.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN DLPMT.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de plan de pagos';
COMMENT ON COLUMN DLPMT.monto_original IS
  'Campo Monto original de plan de pagos';
LABEL ON COLUMN DLPMT.monto_original IS 'Monto original';
LABEL ON COLUMN DLPMT.monto_original TEXT IS
  'Campo Monto original de plan de pagos';
COMMENT ON COLUMN DLPMT.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN DLPMT.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN DLPMT.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN DLPMT.tasa_interes IS 'Campo Tasa interes de plan de pagos';
LABEL ON COLUMN DLPMT.tasa_interes IS 'Tasa interes';
LABEL ON COLUMN DLPMT.tasa_interes TEXT IS
  'Campo Tasa interes de plan de pagos';
COMMENT ON COLUMN DLPMT.plazo_meses IS 'Campo Plazo meses de plan de pagos';
LABEL ON COLUMN DLPMT.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN DLPMT.plazo_meses TEXT IS 'Campo Plazo meses de plan de pagos';
COMMENT ON COLUMN DLPMT.dias_mora IS 'Campo Dias mora de plan de pagos';
LABEL ON COLUMN DLPMT.dias_mora IS 'Dias mora';
LABEL ON COLUMN DLPMT.dias_mora TEXT IS 'Campo Dias mora de plan de pagos';
COMMENT ON COLUMN DLPMT.estado_operacion IS
  'Campo Estado operacion de plan de pagos';
LABEL ON COLUMN DLPMT.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN DLPMT.estado_operacion TEXT IS
  'Campo Estado operacion de plan de pagos';
COMMENT ON COLUMN DLPMT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DLPMT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DLPMT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DLPMT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DLPMT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DLPMT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DLPMT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DLPMT.version_registro IS 'Version';
LABEL ON COLUMN DLPMT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DLPMT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DLPMT.observaciones IS 'Observaciones';
LABEL ON COLUMN DLPMT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DLPMT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DLPMT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DLPMT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DLPMT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DLPMT.created_at IS 'Creado';
LABEL ON COLUMN DLPMT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DLPMT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DLPMT.updated_at IS 'Actualizado';
LABEL ON COLUMN DLPMT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_dlpmt_pk;
CREATE INDEX idx_dlpmt_pk ON DLPMT (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_dlpmt_fecha;
CREATE INDEX idx_dlpmt_fecha ON DLPMT (fecha);

--==============================================================================
-- Nombre de la Tabla: DLDRF
-- DESCRIPCION: Detalle de Giros y Valores al Cobro.
-- Objetivo: Persistir informacion funcional de detalle de giros y valores al
-- cobro en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de detalle de giros y
-- valores al cobro
-- Restricciones: Clave reportada: Banco, Sucursal, Moneda, Préstamo,
-- Identificación, Número de Documento
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DLDRF (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    numero_prestamo FOR COLUMN NUPR VARCHAR(30),
    identificacion FOR COLUMN SIDENT VARCHAR(50),
    numero_documento FOR COLUMN NUDO VARCHAR(30),
    fecha_desembolso FOR COLUMN FEDE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    tasa_interes FOR COLUMN TAIN DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    dias_mora FOR COLUMN DIMO INT,
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_dldrf PRIMARY KEY (codigo_banco, codigo_sucursal
      , codigo_moneda, numero_prestamo, identificacion, numero_documento)
) RCDFMT DLDRFR;

COMMENT ON TABLE DLDRF IS 'Detalle de Giros y Valores al Cobro.';
LABEL ON TABLE DLDRF IS 'DLDRF - Detalle de Giros y Valores al Cobro.';
COMMENT ON COLUMN DLDRF.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLDRF.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN DLDRF.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLDRF.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLDRF.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN DLDRF.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLDRF.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLDRF.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN DLDRF.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLDRF.numero_prestamo IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLDRF.numero_prestamo IS 'Numero prestamo';
LABEL ON COLUMN DLDRF.numero_prestamo TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLDRF.identificacion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLDRF.identificacion IS 'Identificacion';
LABEL ON COLUMN DLDRF.identificacion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLDRF.numero_documento IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLDRF.numero_documento IS 'Numero documento';
LABEL ON COLUMN DLDRF.numero_documento TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLDRF.fecha_desembolso IS
  'Campo Fecha desembolso de detalle de giros y valores al cobro';
LABEL ON COLUMN DLDRF.fecha_desembolso IS 'Fecha desembolso';
LABEL ON COLUMN DLDRF.fecha_desembolso TEXT IS
  'Campo Fecha desembolso de detalle de giros y valor';
COMMENT ON COLUMN DLDRF.fecha_vencimiento IS
  'Campo Fecha vencimiento de detalle de giros y valores al cobro';
LABEL ON COLUMN DLDRF.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN DLDRF.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de detalle de giros y valo';
COMMENT ON COLUMN DLDRF.monto_original IS
  'Campo Monto original de detalle de giros y valores al cobro';
LABEL ON COLUMN DLDRF.monto_original IS 'Monto original';
LABEL ON COLUMN DLDRF.monto_original TEXT IS
  'Campo Monto original de detalle de giros y valores';
COMMENT ON COLUMN DLDRF.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN DLDRF.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN DLDRF.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN DLDRF.tasa_interes IS
  'Campo Tasa interes de detalle de giros y valores al cobro';
LABEL ON COLUMN DLDRF.tasa_interes IS 'Tasa interes';
LABEL ON COLUMN DLDRF.tasa_interes TEXT IS
  'Campo Tasa interes de detalle de giros y valores a';
COMMENT ON COLUMN DLDRF.plazo_meses IS
  'Campo Plazo meses de detalle de giros y valores al cobro';
LABEL ON COLUMN DLDRF.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN DLDRF.plazo_meses TEXT IS
  'Campo Plazo meses de detalle de giros y valores al';
COMMENT ON COLUMN DLDRF.dias_mora IS
  'Campo Dias mora de detalle de giros y valores al cobro';
LABEL ON COLUMN DLDRF.dias_mora IS 'Dias mora';
LABEL ON COLUMN DLDRF.dias_mora TEXT IS
  'Campo Dias mora de detalle de giros y valores al c';
COMMENT ON COLUMN DLDRF.estado_operacion IS
  'Campo Estado operacion de detalle de giros y valores al cobro';
LABEL ON COLUMN DLDRF.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN DLDRF.estado_operacion TEXT IS
  'Campo Estado operacion de detalle de giros y valor';
COMMENT ON COLUMN DLDRF.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DLDRF.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DLDRF.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DLDRF.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DLDRF.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DLDRF.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DLDRF.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DLDRF.version_registro IS 'Version';
LABEL ON COLUMN DLDRF.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DLDRF.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DLDRF.observaciones IS 'Observaciones';
LABEL ON COLUMN DLDRF.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DLDRF.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DLDRF.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DLDRF.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DLDRF.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DLDRF.created_at IS 'Creado';
LABEL ON COLUMN DLDRF.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DLDRF.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DLDRF.updated_at IS 'Actualizado';
LABEL ON COLUMN DLDRF.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_dldrf_pk;
CREATE INDEX idx_dldrf_pk ON DLDRF (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_dldrf_created_at;
CREATE INDEX idx_dldrf_created_at ON DLDRF (created_at);

--==============================================================================
-- Nombre de la Tabla: DLSDE
-- DESCRIPCION: Detalle de Deducciones del Plan de Pagos
-- Objetivo: Persistir informacion funcional de detalle de deducciones del plan
-- de pagos en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de detalle de
-- deducciones del plan de pagos
-- Restricciones: Clave reportada: Préstamo, Fecha, Tipo, Secuencia, Código de
-- Deducción.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DLSDE (
    numero_prestamo FOR COLUMN NUPR VARCHAR(30),
    fecha FOR COLUMN SFECHA DATE,
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    secuencia FOR COLUMN SSECUE INT,
    codigo_deduccion FOR COLUMN CODE VARCHAR(20),
    fecha_desembolso FOR COLUMN FEDE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    tasa_interes FOR COLUMN TAIN DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    dias_mora FOR COLUMN DIMO INT,
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_dlsde PRIMARY KEY (numero_prestamo, fecha, tipo_registro
      , secuencia, codigo_deduccion)
) RCDFMT DLSDER;

COMMENT ON TABLE DLSDE IS 'Detalle de Deducciones del Plan de Pagos';
LABEL ON TABLE DLSDE IS 'DLSDE - Detalle de Deducciones del Plan de Pagos';
COMMENT ON COLUMN DLSDE.numero_prestamo IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLSDE.numero_prestamo IS 'Numero prestamo';
LABEL ON COLUMN DLSDE.numero_prestamo TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLSDE.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DLSDE.fecha IS 'Fecha';
LABEL ON COLUMN DLSDE.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLSDE.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLSDE.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN DLSDE.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLSDE.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DLSDE.secuencia IS 'Secuencia';
LABEL ON COLUMN DLSDE.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLSDE.codigo_deduccion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLSDE.codigo_deduccion IS 'Codigo deduccion';
LABEL ON COLUMN DLSDE.codigo_deduccion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLSDE.fecha_desembolso IS
  'Campo Fecha desembolso de detalle de deducciones del plan de pagos';
LABEL ON COLUMN DLSDE.fecha_desembolso IS 'Fecha desembolso';
LABEL ON COLUMN DLSDE.fecha_desembolso TEXT IS
  'Campo Fecha desembolso de detalle de deducciones d';
COMMENT ON COLUMN DLSDE.fecha_vencimiento IS
  'Campo Fecha vencimiento de detalle de deducciones del plan de pagos';
LABEL ON COLUMN DLSDE.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN DLSDE.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de detalle de deducciones';
COMMENT ON COLUMN DLSDE.monto_original IS
  'Campo Monto original de detalle de deducciones del plan de pagos';
LABEL ON COLUMN DLSDE.monto_original IS 'Monto original';
LABEL ON COLUMN DLSDE.monto_original TEXT IS
  'Campo Monto original de detalle de deducciones del';
COMMENT ON COLUMN DLSDE.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN DLSDE.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN DLSDE.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN DLSDE.tasa_interes IS
  'Campo Tasa interes de detalle de deducciones del plan de pagos';
LABEL ON COLUMN DLSDE.tasa_interes IS 'Tasa interes';
LABEL ON COLUMN DLSDE.tasa_interes TEXT IS
  'Campo Tasa interes de detalle de deducciones del p';
COMMENT ON COLUMN DLSDE.plazo_meses IS
  'Campo Plazo meses de detalle de deducciones del plan de pagos';
LABEL ON COLUMN DLSDE.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN DLSDE.plazo_meses TEXT IS
  'Campo Plazo meses de detalle de deducciones del pl';
COMMENT ON COLUMN DLSDE.dias_mora IS
  'Campo Dias mora de detalle de deducciones del plan de pagos';
LABEL ON COLUMN DLSDE.dias_mora IS 'Dias mora';
LABEL ON COLUMN DLSDE.dias_mora TEXT IS
  'Campo Dias mora de detalle de deducciones del plan';
COMMENT ON COLUMN DLSDE.estado_operacion IS
  'Campo Estado operacion de detalle de deducciones del plan de pagos';
LABEL ON COLUMN DLSDE.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN DLSDE.estado_operacion TEXT IS
  'Campo Estado operacion de detalle de deducciones d';
COMMENT ON COLUMN DLSDE.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DLSDE.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DLSDE.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DLSDE.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DLSDE.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DLSDE.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DLSDE.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DLSDE.version_registro IS 'Version';
LABEL ON COLUMN DLSDE.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DLSDE.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DLSDE.observaciones IS 'Observaciones';
LABEL ON COLUMN DLSDE.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DLSDE.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DLSDE.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DLSDE.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DLSDE.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DLSDE.created_at IS 'Creado';
LABEL ON COLUMN DLSDE.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DLSDE.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DLSDE.updated_at IS 'Actualizado';
LABEL ON COLUMN DLSDE.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_dlsde_pk;
CREATE INDEX idx_dlsde_pk ON DLSDE (numero_prestamo, fecha);
DROP INDEX IF EXISTS idx_dlsde_fecha;
CREATE INDEX idx_dlsde_fecha ON DLSDE (fecha);

--==============================================================================
-- Nombre de la Tabla: DLCLP
-- DESCRIPCION: Calificación y Previsión de Cartera.
-- Objetivo: Persistir informacion funcional de calificación y previsión de
-- cartera en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de calificación y
-- previsión de cartera
-- Restricciones: Clave reportada: Cliente, Cuenta, Referencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DLCLP (
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    referencia FOR COLUMN SREFER VARCHAR(50),
    fecha_desembolso FOR COLUMN FEDE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    tasa_interes FOR COLUMN TAIN DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    dias_mora FOR COLUMN DIMO INT,
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_dlclp PRIMARY KEY (id_cliente, numero_cuenta, referencia)
) RCDFMT DLCLPR;

COMMENT ON TABLE DLCLP IS 'Calificación y Previsión de Cartera.';
LABEL ON TABLE DLCLP IS 'DLCLP - Calificación y Previsión de Cartera.';
COMMENT ON COLUMN DLCLP.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DLCLP.id_cliente IS 'Id Cliente';
LABEL ON COLUMN DLCLP.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLCLP.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLCLP.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN DLCLP.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLCLP.referencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DLCLP.referencia IS 'Referencia';
LABEL ON COLUMN DLCLP.referencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLCLP.fecha_desembolso IS
  'Campo Fecha desembolso de calificación y previsión de cartera';
LABEL ON COLUMN DLCLP.fecha_desembolso IS 'Fecha desembolso';
LABEL ON COLUMN DLCLP.fecha_desembolso TEXT IS
  'Campo Fecha desembolso de calificación y previsión';
COMMENT ON COLUMN DLCLP.fecha_vencimiento IS
  'Campo Fecha vencimiento de calificación y previsión de cartera';
LABEL ON COLUMN DLCLP.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN DLCLP.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de calificación y previsió';
COMMENT ON COLUMN DLCLP.monto_original IS
  'Campo Monto original de calificación y previsión de cartera';
LABEL ON COLUMN DLCLP.monto_original IS 'Monto original';
LABEL ON COLUMN DLCLP.monto_original TEXT IS
  'Campo Monto original de calificación y previsión d';
COMMENT ON COLUMN DLCLP.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN DLCLP.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN DLCLP.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN DLCLP.tasa_interes IS
  'Campo Tasa interes de calificación y previsión de cartera';
LABEL ON COLUMN DLCLP.tasa_interes IS 'Tasa interes';
LABEL ON COLUMN DLCLP.tasa_interes TEXT IS
  'Campo Tasa interes de calificación y previsión de';
COMMENT ON COLUMN DLCLP.plazo_meses IS
  'Campo Plazo meses de calificación y previsión de cartera';
LABEL ON COLUMN DLCLP.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN DLCLP.plazo_meses TEXT IS
  'Campo Plazo meses de calificación y previsión de c';
COMMENT ON COLUMN DLCLP.dias_mora IS
  'Campo Dias mora de calificación y previsión de cartera';
LABEL ON COLUMN DLCLP.dias_mora IS 'Dias mora';
LABEL ON COLUMN DLCLP.dias_mora TEXT IS
  'Campo Dias mora de calificación y previsión de car';
COMMENT ON COLUMN DLCLP.estado_operacion IS
  'Campo Estado operacion de calificación y previsión de cartera';
LABEL ON COLUMN DLCLP.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN DLCLP.estado_operacion TEXT IS
  'Campo Estado operacion de calificación y previsión';
COMMENT ON COLUMN DLCLP.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DLCLP.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DLCLP.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DLCLP.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DLCLP.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DLCLP.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DLCLP.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DLCLP.version_registro IS 'Version';
LABEL ON COLUMN DLCLP.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DLCLP.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DLCLP.observaciones IS 'Observaciones';
LABEL ON COLUMN DLCLP.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DLCLP.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DLCLP.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DLCLP.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DLCLP.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DLCLP.created_at IS 'Creado';
LABEL ON COLUMN DLCLP.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DLCLP.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DLCLP.updated_at IS 'Actualizado';
LABEL ON COLUMN DLCLP.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_dlclp_pk;
CREATE INDEX idx_dlclp_pk ON DLCLP (id_cliente, numero_cuenta);
DROP INDEX IF EXISTS idx_dlclp_created_at;
CREATE INDEX idx_dlclp_created_at ON DLCLP (created_at);

--==============================================================================
-- Nombre de la Tabla: DDCPN
-- DESCRIPCION: Transacciones pendientes de Cobro.
-- Objetivo: Persistir informacion funcional de transacciones pendientes de
-- cobro en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de transacciones
-- pendientes de cobro
-- Restricciones: Clave reportada: Préstamo
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DDCPN (
    numero_prestamo FOR COLUMN NUPR VARCHAR(30),
    fecha_desembolso FOR COLUMN FEDE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    tasa_interes FOR COLUMN TAIN DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    dias_mora FOR COLUMN DIMO INT,
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ddcpn PRIMARY KEY (numero_prestamo)
) RCDFMT DDCPNR;

COMMENT ON TABLE DDCPN IS 'Transacciones pendientes de Cobro.';
LABEL ON TABLE DDCPN IS 'DDCPN - Transacciones pendientes de Cobro.';
COMMENT ON COLUMN DDCPN.numero_prestamo IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DDCPN.numero_prestamo IS 'Numero prestamo';
LABEL ON COLUMN DDCPN.numero_prestamo TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DDCPN.fecha_desembolso IS
  'Campo Fecha desembolso de transacciones pendientes de cobro';
LABEL ON COLUMN DDCPN.fecha_desembolso IS 'Fecha desembolso';
LABEL ON COLUMN DDCPN.fecha_desembolso TEXT IS
  'Campo Fecha desembolso de transacciones pendientes';
COMMENT ON COLUMN DDCPN.fecha_vencimiento IS
  'Campo Fecha vencimiento de transacciones pendientes de cobro';
LABEL ON COLUMN DDCPN.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN DDCPN.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de transacciones pendiente';
COMMENT ON COLUMN DDCPN.monto_original IS
  'Campo Monto original de transacciones pendientes de cobro';
LABEL ON COLUMN DDCPN.monto_original IS 'Monto original';
LABEL ON COLUMN DDCPN.monto_original TEXT IS
  'Campo Monto original de transacciones pendientes d';
COMMENT ON COLUMN DDCPN.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN DDCPN.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN DDCPN.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN DDCPN.tasa_interes IS
  'Campo Tasa interes de transacciones pendientes de cobro';
LABEL ON COLUMN DDCPN.tasa_interes IS 'Tasa interes';
LABEL ON COLUMN DDCPN.tasa_interes TEXT IS
  'Campo Tasa interes de transacciones pendientes de';
COMMENT ON COLUMN DDCPN.plazo_meses IS
  'Campo Plazo meses de transacciones pendientes de cobro';
LABEL ON COLUMN DDCPN.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN DDCPN.plazo_meses TEXT IS
  'Campo Plazo meses de transacciones pendientes de c';
COMMENT ON COLUMN DDCPN.dias_mora IS
  'Campo Dias mora de transacciones pendientes de cobro';
LABEL ON COLUMN DDCPN.dias_mora IS 'Dias mora';
LABEL ON COLUMN DDCPN.dias_mora TEXT IS
  'Campo Dias mora de transacciones pendientes de cob';
COMMENT ON COLUMN DDCPN.estado_operacion IS
  'Campo Estado operacion de transacciones pendientes de cobro';
LABEL ON COLUMN DDCPN.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN DDCPN.estado_operacion TEXT IS
  'Campo Estado operacion de transacciones pendientes';
COMMENT ON COLUMN DDCPN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DDCPN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DDCPN.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DDCPN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DDCPN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DDCPN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DDCPN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DDCPN.version_registro IS 'Version';
LABEL ON COLUMN DDCPN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DDCPN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DDCPN.observaciones IS 'Observaciones';
LABEL ON COLUMN DDCPN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DDCPN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DDCPN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DDCPN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DDCPN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DDCPN.created_at IS 'Creado';
LABEL ON COLUMN DDCPN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DDCPN.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DDCPN.updated_at IS 'Actualizado';
LABEL ON COLUMN DDCPN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ddcpn_pk;
CREATE INDEX idx_ddcpn_pk ON DDCPN (numero_prestamo);
DROP INDEX IF EXISTS idx_ddcpn_created_at;
CREATE INDEX idx_ddcpn_created_at ON DDCPN (created_at);

--==============================================================================
-- Nombre de la Tabla: DLITP
-- DESCRIPCION: Maestro de Deducciones de Préstamos.
-- Objetivo: Persistir informacion funcional de maestro de deducciones de
-- préstamos en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de
-- deducciones de préstamos
-- Restricciones: Clave reportada: Préstamo, Código de Deducción
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DLITP (
    numero_prestamo FOR COLUMN NUPR VARCHAR(30),
    codigo_deduccion FOR COLUMN CODE VARCHAR(20),
    fecha_desembolso FOR COLUMN FEDE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    tasa_interes FOR COLUMN TAIN DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    dias_mora FOR COLUMN DIMO INT,
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_dlitp PRIMARY KEY (numero_prestamo, codigo_deduccion)
) RCDFMT DLITPR;

COMMENT ON TABLE DLITP IS 'Maestro de Deducciones de Préstamos.';
LABEL ON TABLE DLITP IS 'DLITP - Maestro de Deducciones de Préstamos.';
COMMENT ON COLUMN DLITP.numero_prestamo IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLITP.numero_prestamo IS 'Numero prestamo';
LABEL ON COLUMN DLITP.numero_prestamo TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLITP.codigo_deduccion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DLITP.codigo_deduccion IS 'Codigo deduccion';
LABEL ON COLUMN DLITP.codigo_deduccion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DLITP.fecha_desembolso IS
  'Campo Fecha desembolso de maestro de deducciones de préstamos';
LABEL ON COLUMN DLITP.fecha_desembolso IS 'Fecha desembolso';
LABEL ON COLUMN DLITP.fecha_desembolso TEXT IS
  'Campo Fecha desembolso de maestro de deducciones d';
COMMENT ON COLUMN DLITP.fecha_vencimiento IS
  'Campo Fecha vencimiento de maestro de deducciones de préstamos';
LABEL ON COLUMN DLITP.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN DLITP.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de maestro de deducciones';
COMMENT ON COLUMN DLITP.monto_original IS
  'Campo Monto original de maestro de deducciones de préstamos';
LABEL ON COLUMN DLITP.monto_original IS 'Monto original';
LABEL ON COLUMN DLITP.monto_original TEXT IS
  'Campo Monto original de maestro de deducciones de';
COMMENT ON COLUMN DLITP.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN DLITP.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN DLITP.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN DLITP.tasa_interes IS
  'Campo Tasa interes de maestro de deducciones de préstamos';
LABEL ON COLUMN DLITP.tasa_interes IS 'Tasa interes';
LABEL ON COLUMN DLITP.tasa_interes TEXT IS
  'Campo Tasa interes de maestro de deducciones de pr';
COMMENT ON COLUMN DLITP.plazo_meses IS
  'Campo Plazo meses de maestro de deducciones de préstamos';
LABEL ON COLUMN DLITP.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN DLITP.plazo_meses TEXT IS
  'Campo Plazo meses de maestro de deducciones de pré';
COMMENT ON COLUMN DLITP.dias_mora IS
  'Campo Dias mora de maestro de deducciones de préstamos';
LABEL ON COLUMN DLITP.dias_mora IS 'Dias mora';
LABEL ON COLUMN DLITP.dias_mora TEXT IS
  'Campo Dias mora de maestro de deducciones de prést';
COMMENT ON COLUMN DLITP.estado_operacion IS
  'Campo Estado operacion de maestro de deducciones de préstamos';
LABEL ON COLUMN DLITP.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN DLITP.estado_operacion TEXT IS
  'Campo Estado operacion de maestro de deducciones d';
COMMENT ON COLUMN DLITP.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DLITP.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DLITP.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DLITP.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DLITP.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DLITP.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DLITP.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DLITP.version_registro IS 'Version';
LABEL ON COLUMN DLITP.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DLITP.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DLITP.observaciones IS 'Observaciones';
LABEL ON COLUMN DLITP.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DLITP.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DLITP.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DLITP.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DLITP.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DLITP.created_at IS 'Creado';
LABEL ON COLUMN DLITP.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DLITP.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DLITP.updated_at IS 'Actualizado';
LABEL ON COLUMN DLITP.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_dlitp_pk;
CREATE INDEX idx_dlitp_pk ON DLITP (numero_prestamo, codigo_deduccion);
DROP INDEX IF EXISTS idx_dlitp_created_at;
CREATE INDEX idx_dlitp_created_at ON DLITP (created_at);

--==============================================================================
-- Nombre de la Tabla: CDRTE
-- DESCRIPCION: Tabla de Tasas de Depósitos
-- Objetivo: Persistir informacion funcional de tabla de tasas de depósitos en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de tabla de tasas de
-- depósitos
-- Restricciones: Clave reportada: Número de Tabla, Fecha, Moneda.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CDRTE (
    numero_tabla FOR COLUMN NUTA VARCHAR(30),
    fecha FOR COLUMN SFECHA DATE,
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    fecha_desembolso FOR COLUMN FEDE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    tasa_interes FOR COLUMN TAIN DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    dias_mora FOR COLUMN DIMO INT,
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cdrte PRIMARY KEY (numero_tabla, fecha, codigo_moneda)
) RCDFMT CDRTER;

COMMENT ON TABLE CDRTE IS 'Tabla de Tasas de Depósitos';
LABEL ON TABLE CDRTE IS 'CDRTE - Tabla de Tasas de Depósitos';
COMMENT ON COLUMN CDRTE.numero_tabla IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CDRTE.numero_tabla IS 'Numero tabla';
LABEL ON COLUMN CDRTE.numero_tabla TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CDRTE.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN CDRTE.fecha IS 'Fecha';
LABEL ON COLUMN CDRTE.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN CDRTE.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CDRTE.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN CDRTE.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CDRTE.fecha_desembolso IS
  'Campo Fecha desembolso de tabla de tasas de depósitos';
LABEL ON COLUMN CDRTE.fecha_desembolso IS 'Fecha desembolso';
LABEL ON COLUMN CDRTE.fecha_desembolso TEXT IS
  'Campo Fecha desembolso de tabla de tasas de depósi';
COMMENT ON COLUMN CDRTE.fecha_vencimiento IS
  'Campo Fecha vencimiento de tabla de tasas de depósitos';
LABEL ON COLUMN CDRTE.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN CDRTE.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de tabla de tasas de depós';
COMMENT ON COLUMN CDRTE.monto_original IS
  'Campo Monto original de tabla de tasas de depósitos';
LABEL ON COLUMN CDRTE.monto_original IS 'Monto original';
LABEL ON COLUMN CDRTE.monto_original TEXT IS
  'Campo Monto original de tabla de tasas de depósito';
COMMENT ON COLUMN CDRTE.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CDRTE.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CDRTE.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CDRTE.tasa_interes IS
  'Campo Tasa interes de tabla de tasas de depósitos';
LABEL ON COLUMN CDRTE.tasa_interes IS 'Tasa interes';
LABEL ON COLUMN CDRTE.tasa_interes TEXT IS
  'Campo Tasa interes de tabla de tasas de depósitos';
COMMENT ON COLUMN CDRTE.plazo_meses IS
  'Campo Plazo meses de tabla de tasas de depósitos';
LABEL ON COLUMN CDRTE.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN CDRTE.plazo_meses TEXT IS
  'Campo Plazo meses de tabla de tasas de depósitos';
COMMENT ON COLUMN CDRTE.dias_mora IS
  'Campo Dias mora de tabla de tasas de depósitos';
LABEL ON COLUMN CDRTE.dias_mora IS 'Dias mora';
LABEL ON COLUMN CDRTE.dias_mora TEXT IS
  'Campo Dias mora de tabla de tasas de depósitos';
COMMENT ON COLUMN CDRTE.estado_operacion IS
  'Campo Estado operacion de tabla de tasas de depósitos';
LABEL ON COLUMN CDRTE.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN CDRTE.estado_operacion TEXT IS
  'Campo Estado operacion de tabla de tasas de depósi';
COMMENT ON COLUMN CDRTE.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CDRTE.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CDRTE.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CDRTE.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CDRTE.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CDRTE.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CDRTE.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CDRTE.version_registro IS 'Version';
LABEL ON COLUMN CDRTE.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CDRTE.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CDRTE.observaciones IS 'Observaciones';
LABEL ON COLUMN CDRTE.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CDRTE.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CDRTE.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CDRTE.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CDRTE.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CDRTE.created_at IS 'Creado';
LABEL ON COLUMN CDRTE.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CDRTE.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CDRTE.updated_at IS 'Actualizado';
LABEL ON COLUMN CDRTE.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cdrte_pk;
CREATE INDEX idx_cdrte_pk ON CDRTE (numero_tabla, fecha);
DROP INDEX IF EXISTS idx_cdrte_fecha;
CREATE INDEX idx_cdrte_fecha ON CDRTE (fecha);

--==============================================================================
-- Nombre de la Tabla: CNTRLDLS
-- DESCRIPCION: Tabla de Tasas para control de Préstamos.
-- Objetivo: Persistir informacion funcional de tabla de tasas para control de
-- préstamos en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de tabla de tasas para
-- control de préstamos
-- Restricciones: Clave reportada: Banco, Número de Tabla, Tipo de Producto.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLDLS (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    numero_tabla FOR COLUMN NUTA VARCHAR(30),
    tipo_producto FOR COLUMN TIPR VARCHAR(20),
    fecha_desembolso FOR COLUMN FEDE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    tasa_interes FOR COLUMN TAIN DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    dias_mora FOR COLUMN DIMO INT,
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrldls PRIMARY KEY (codigo_banco, numero_tabla
      , tipo_producto)
) RCDFMT CNTRLDLSR;

COMMENT ON TABLE CNTRLDLS IS 'Tabla de Tasas para control de Préstamos.';
LABEL ON TABLE CNTRLDLS IS
  'CNTRLDLS - Tabla de Tasas para control de Préstamo';
COMMENT ON COLUMN CNTRLDLS.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLDLS.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLDLS.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLDLS.numero_tabla IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLDLS.numero_tabla IS 'Numero tabla';
LABEL ON COLUMN CNTRLDLS.numero_tabla TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLDLS.tipo_producto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLDLS.tipo_producto IS 'Tipo producto';
LABEL ON COLUMN CNTRLDLS.tipo_producto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLDLS.fecha_desembolso IS
  'Campo Fecha desembolso de tabla de tasas para control de préstamos';
LABEL ON COLUMN CNTRLDLS.fecha_desembolso IS 'Fecha desembolso';
LABEL ON COLUMN CNTRLDLS.fecha_desembolso TEXT IS
  'Campo Fecha desembolso de tabla de tasas para cont';
COMMENT ON COLUMN CNTRLDLS.fecha_vencimiento IS
  'Campo Fecha vencimiento de tabla de tasas para control de préstamos';
LABEL ON COLUMN CNTRLDLS.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN CNTRLDLS.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de tabla de tasas para con';
COMMENT ON COLUMN CNTRLDLS.monto_original IS
  'Campo Monto original de tabla de tasas para control de préstamos';
LABEL ON COLUMN CNTRLDLS.monto_original IS 'Monto original';
LABEL ON COLUMN CNTRLDLS.monto_original TEXT IS
  'Campo Monto original de tabla de tasas para contro';
COMMENT ON COLUMN CNTRLDLS.saldo_actual IS
  'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CNTRLDLS.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CNTRLDLS.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CNTRLDLS.tasa_interes IS
  'Campo Tasa interes de tabla de tasas para control de préstamos';
LABEL ON COLUMN CNTRLDLS.tasa_interes IS 'Tasa interes';
LABEL ON COLUMN CNTRLDLS.tasa_interes TEXT IS
  'Campo Tasa interes de tabla de tasas para control';
COMMENT ON COLUMN CNTRLDLS.plazo_meses IS
  'Campo Plazo meses de tabla de tasas para control de préstamos';
LABEL ON COLUMN CNTRLDLS.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN CNTRLDLS.plazo_meses TEXT IS
  'Campo Plazo meses de tabla de tasas para control d';
COMMENT ON COLUMN CNTRLDLS.dias_mora IS
  'Campo Dias mora de tabla de tasas para control de préstamos';
LABEL ON COLUMN CNTRLDLS.dias_mora IS 'Dias mora';
LABEL ON COLUMN CNTRLDLS.dias_mora TEXT IS
  'Campo Dias mora de tabla de tasas para control de';
COMMENT ON COLUMN CNTRLDLS.estado_operacion IS
  'Campo Estado operacion de tabla de tasas para control de préstamos';
LABEL ON COLUMN CNTRLDLS.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN CNTRLDLS.estado_operacion TEXT IS
  'Campo Estado operacion de tabla de tasas para cont';
COMMENT ON COLUMN CNTRLDLS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLDLS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLDLS.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLDLS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLDLS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLDLS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLDLS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLDLS.version_registro IS 'Version';
LABEL ON COLUMN CNTRLDLS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLDLS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLDLS.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLDLS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLDLS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLDLS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLDLS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLDLS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLDLS.created_at IS 'Creado';
LABEL ON COLUMN CNTRLDLS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLDLS.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLDLS.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLDLS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrldls_pk;
CREATE INDEX idx_cntrldls_pk ON CNTRLDLS (codigo_banco, numero_tabla);
DROP INDEX IF EXISTS idx_cntrldls_created_at;
CREATE INDEX idx_cntrldls_created_at ON CNTRLDLS (created_at);

--==============================================================================
-- Nombre de la Tabla: LCMST
-- DESCRIPCION: Maestro de Cartas de Crédito.
-- Objetivo: Persistir informacion funcional de maestro de cartas de crédito en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de cartas de
-- crédito
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LCMST (
    id FOR COLUMN SID BIGINT,
    numero_carta_credito FOR COLUMN NUCACR VARCHAR(30) NOT NULL,
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    banco_corresponsal FOR COLUMN BACO VARCHAR(80),
    pais_destino FOR COLUMN PADE VARCHAR(80),
    estado_carta FOR COLUMN ESCA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_lcmst PRIMARY KEY (id)
) RCDFMT LCMSTR;

COMMENT ON TABLE LCMST IS 'Maestro de Cartas de Crédito.';
LABEL ON TABLE LCMST IS 'LCMST - Maestro de Cartas de Crédito.';
COMMENT ON COLUMN LCMST.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN LCMST.id IS 'Id';
LABEL ON COLUMN LCMST.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCMST.numero_carta_credito IS
  'Numero de carta de credito para referencias cruzadas del modulo';
LABEL ON COLUMN LCMST.numero_carta_credito IS 'Numero carta credito';
LABEL ON COLUMN LCMST.numero_carta_credito TEXT IS
  'Numero de carta de credito para referencias cruzad';
COMMENT ON COLUMN LCMST.fecha_emision IS
  'Campo Fecha emision de maestro de cartas de crédito';
LABEL ON COLUMN LCMST.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN LCMST.fecha_emision TEXT IS
  'Campo Fecha emision de maestro de cartas de crédit';
COMMENT ON COLUMN LCMST.fecha_vencimiento IS
  'Campo Fecha vencimiento de maestro de cartas de crédito';
LABEL ON COLUMN LCMST.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN LCMST.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de maestro de cartas de cr';
COMMENT ON COLUMN LCMST.monto_original IS
  'Campo Monto original de maestro de cartas de crédito';
LABEL ON COLUMN LCMST.monto_original IS 'Monto original';
LABEL ON COLUMN LCMST.monto_original TEXT IS
  'Campo Monto original de maestro de cartas de crédi';
COMMENT ON COLUMN LCMST.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN LCMST.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN LCMST.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN LCMST.banco_corresponsal IS
  'Campo Banco corresponsal de maestro de cartas de crédito';
LABEL ON COLUMN LCMST.banco_corresponsal IS 'Banco corresponsal';
LABEL ON COLUMN LCMST.banco_corresponsal TEXT IS
  'Campo Banco corresponsal de maestro de cartas de c';
COMMENT ON COLUMN LCMST.pais_destino IS
  'Campo Pais destino de maestro de cartas de crédito';
LABEL ON COLUMN LCMST.pais_destino IS 'Pais destino';
LABEL ON COLUMN LCMST.pais_destino TEXT IS
  'Campo Pais destino de maestro de cartas de crédito';
COMMENT ON COLUMN LCMST.estado_carta IS
  'Campo Estado carta de maestro de cartas de crédito';
LABEL ON COLUMN LCMST.estado_carta IS 'Estado carta';
LABEL ON COLUMN LCMST.estado_carta TEXT IS
  'Campo Estado carta de maestro de cartas de crédito';
COMMENT ON COLUMN LCMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LCMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LCMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LCMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LCMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LCMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LCMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LCMST.version_registro IS 'Version';
LABEL ON COLUMN LCMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LCMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LCMST.observaciones IS 'Observaciones';
LABEL ON COLUMN LCMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LCMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LCMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LCMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LCMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LCMST.created_at IS 'Creado';
LABEL ON COLUMN LCMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LCMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LCMST.updated_at IS 'Actualizado';
LABEL ON COLUMN LCMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_lcmst_pk;
CREATE INDEX idx_lcmst_pk ON LCMST (id);
DROP INDEX IF EXISTS idx_lcmst_created_at;
CREATE INDEX idx_lcmst_created_at ON LCMST (created_at);

--==============================================================================
-- Nombre de la Tabla: LCDOC
-- DESCRIPCION: Documentos de Cartas de Crédito
-- Objetivo: Persistir informacion funcional de documentos de cartas de crédito
-- en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de documentos de cartas
-- de crédito
-- Restricciones: Clave reportada: Número de Carta Crédito, Tipo, Banco,
-- Código de Documento, Número de Línea.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LCDOC (
    numero_carta_credito FOR COLUMN NUCACR VARCHAR(30),
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_documento FOR COLUMN CODO VARCHAR(20),
    numero_linea FOR COLUMN NULI VARCHAR(30),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    banco_corresponsal FOR COLUMN BACO VARCHAR(80),
    pais_destino FOR COLUMN PADE VARCHAR(80),
    estado_carta FOR COLUMN ESCA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_lcdoc PRIMARY KEY (numero_carta_credito, tipo_registro
      , codigo_banco, codigo_documento, numero_linea)
) RCDFMT LCDOCR;

COMMENT ON TABLE LCDOC IS 'Documentos de Cartas de Crédito';
LABEL ON TABLE LCDOC IS 'LCDOC - Documentos de Cartas de Crédito';
COMMENT ON COLUMN LCDOC.numero_carta_credito IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCDOC.numero_carta_credito IS 'Numero carta credito';
LABEL ON COLUMN LCDOC.numero_carta_credito TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCDOC.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCDOC.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN LCDOC.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCDOC.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCDOC.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN LCDOC.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCDOC.codigo_documento IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCDOC.codigo_documento IS 'Codigo documento';
LABEL ON COLUMN LCDOC.codigo_documento TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCDOC.numero_linea IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCDOC.numero_linea IS 'Numero linea';
LABEL ON COLUMN LCDOC.numero_linea TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCDOC.fecha_emision IS
  'Campo Fecha emision de documentos de cartas de crédito';
LABEL ON COLUMN LCDOC.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN LCDOC.fecha_emision TEXT IS
  'Campo Fecha emision de documentos de cartas de cré';
COMMENT ON COLUMN LCDOC.fecha_vencimiento IS
  'Campo Fecha vencimiento de documentos de cartas de crédito';
LABEL ON COLUMN LCDOC.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN LCDOC.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de documentos de cartas de';
COMMENT ON COLUMN LCDOC.monto_original IS
  'Campo Monto original de documentos de cartas de crédito';
LABEL ON COLUMN LCDOC.monto_original IS 'Monto original';
LABEL ON COLUMN LCDOC.monto_original TEXT IS
  'Campo Monto original de documentos de cartas de cr';
COMMENT ON COLUMN LCDOC.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN LCDOC.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN LCDOC.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN LCDOC.banco_corresponsal IS
  'Campo Banco corresponsal de documentos de cartas de crédito';
LABEL ON COLUMN LCDOC.banco_corresponsal IS 'Banco corresponsal';
LABEL ON COLUMN LCDOC.banco_corresponsal TEXT IS
  'Campo Banco corresponsal de documentos de cartas d';
COMMENT ON COLUMN LCDOC.pais_destino IS
  'Campo Pais destino de documentos de cartas de crédito';
LABEL ON COLUMN LCDOC.pais_destino IS 'Pais destino';
LABEL ON COLUMN LCDOC.pais_destino TEXT IS
  'Campo Pais destino de documentos de cartas de créd';
COMMENT ON COLUMN LCDOC.estado_carta IS
  'Campo Estado carta de documentos de cartas de crédito';
LABEL ON COLUMN LCDOC.estado_carta IS 'Estado carta';
LABEL ON COLUMN LCDOC.estado_carta TEXT IS
  'Campo Estado carta de documentos de cartas de créd';
COMMENT ON COLUMN LCDOC.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LCDOC.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LCDOC.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LCDOC.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LCDOC.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LCDOC.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LCDOC.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LCDOC.version_registro IS 'Version';
LABEL ON COLUMN LCDOC.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LCDOC.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LCDOC.observaciones IS 'Observaciones';
LABEL ON COLUMN LCDOC.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LCDOC.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LCDOC.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LCDOC.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LCDOC.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LCDOC.created_at IS 'Creado';
LABEL ON COLUMN LCDOC.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LCDOC.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LCDOC.updated_at IS 'Actualizado';
LABEL ON COLUMN LCDOC.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_lcdoc_pk;
CREATE INDEX idx_lcdoc_pk ON LCDOC (numero_carta_credito, tipo_registro);
DROP INDEX IF EXISTS idx_lcdoc_created_at;
CREATE INDEX idx_lcdoc_created_at ON LCDOC (created_at);

--==============================================================================
-- Nombre de la Tabla: LCFIN
-- DESCRIPCION: Indice de Formatos de Cartas de Crédito
-- Objetivo: Persistir informacion funcional de indice de formatos de cartas de
-- crédito en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de indice de formatos
-- de cartas de crédito
-- Restricciones: Clave reportada: Nivel, Código de Documento, Secuencia de
-- Texto
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LCFIN (
    nivel FOR COLUMN SNIVEL INT,
    codigo_documento FOR COLUMN CODO VARCHAR(20),
    secuencia_de_texto FOR COLUMN SEDETE VARCHAR(50),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    banco_corresponsal FOR COLUMN BACO VARCHAR(80),
    pais_destino FOR COLUMN PADE VARCHAR(80),
    estado_carta FOR COLUMN ESCA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_lcfin PRIMARY KEY (nivel, codigo_documento
      , secuencia_de_texto)
) RCDFMT LCFINR;

COMMENT ON TABLE LCFIN IS 'Indice de Formatos de Cartas de Crédito';
LABEL ON TABLE LCFIN IS 'LCFIN - Indice de Formatos de Cartas de Crédito';
COMMENT ON COLUMN LCFIN.nivel IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN LCFIN.nivel IS 'Nivel';
LABEL ON COLUMN LCFIN.nivel TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCFIN.codigo_documento IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCFIN.codigo_documento IS 'Codigo documento';
LABEL ON COLUMN LCFIN.codigo_documento TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCFIN.secuencia_de_texto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCFIN.secuencia_de_texto IS 'Secuencia de texto';
LABEL ON COLUMN LCFIN.secuencia_de_texto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCFIN.fecha_emision IS
  'Campo Fecha emision de indice de formatos de cartas de crédito';
LABEL ON COLUMN LCFIN.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN LCFIN.fecha_emision TEXT IS
  'Campo Fecha emision de indice de formatos de carta';
COMMENT ON COLUMN LCFIN.fecha_vencimiento IS
  'Campo Fecha vencimiento de indice de formatos de cartas de crédito';
LABEL ON COLUMN LCFIN.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN LCFIN.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de indice de formatos de c';
COMMENT ON COLUMN LCFIN.monto_original IS
  'Campo Monto original de indice de formatos de cartas de crédito';
LABEL ON COLUMN LCFIN.monto_original IS 'Monto original';
LABEL ON COLUMN LCFIN.monto_original TEXT IS
  'Campo Monto original de indice de formatos de cart';
COMMENT ON COLUMN LCFIN.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN LCFIN.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN LCFIN.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN LCFIN.banco_corresponsal IS
  'Campo Banco corresponsal de indice de formatos de cartas de crédito';
LABEL ON COLUMN LCFIN.banco_corresponsal IS 'Banco corresponsal';
LABEL ON COLUMN LCFIN.banco_corresponsal TEXT IS
  'Campo Banco corresponsal de indice de formatos de';
COMMENT ON COLUMN LCFIN.pais_destino IS
  'Campo Pais destino de indice de formatos de cartas de crédito';
LABEL ON COLUMN LCFIN.pais_destino IS 'Pais destino';
LABEL ON COLUMN LCFIN.pais_destino TEXT IS
  'Campo Pais destino de indice de formatos de cartas';
COMMENT ON COLUMN LCFIN.estado_carta IS
  'Campo Estado carta de indice de formatos de cartas de crédito';
LABEL ON COLUMN LCFIN.estado_carta IS 'Estado carta';
LABEL ON COLUMN LCFIN.estado_carta TEXT IS
  'Campo Estado carta de indice de formatos de cartas';
COMMENT ON COLUMN LCFIN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LCFIN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LCFIN.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LCFIN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LCFIN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LCFIN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LCFIN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LCFIN.version_registro IS 'Version';
LABEL ON COLUMN LCFIN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LCFIN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LCFIN.observaciones IS 'Observaciones';
LABEL ON COLUMN LCFIN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LCFIN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LCFIN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LCFIN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LCFIN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LCFIN.created_at IS 'Creado';
LABEL ON COLUMN LCFIN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LCFIN.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LCFIN.updated_at IS 'Actualizado';
LABEL ON COLUMN LCFIN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_lcfin_pk;
CREATE INDEX idx_lcfin_pk ON LCFIN (nivel, codigo_documento);
DROP INDEX IF EXISTS idx_lcfin_created_at;
CREATE INDEX idx_lcfin_created_at ON LCFIN (created_at);

--==============================================================================
-- Nombre de la Tabla: LCFMT
-- DESCRIPCION: Formatos de Cartas de Crédito
-- Objetivo: Persistir informacion funcional de formatos de cartas de crédito
-- en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de formatos de cartas
-- de crédito
-- Restricciones: Clave reportada: Código de Documento, Secuencia de Texto,
-- Número de Línea
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LCFMT (
    codigo_documento FOR COLUMN CODO VARCHAR(20),
    secuencia_de_texto FOR COLUMN SEDETE VARCHAR(50),
    numero_linea FOR COLUMN NULI VARCHAR(30),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    banco_corresponsal FOR COLUMN BACO VARCHAR(80),
    pais_destino FOR COLUMN PADE VARCHAR(80),
    estado_carta FOR COLUMN ESCA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_lcfmt PRIMARY KEY (codigo_documento, secuencia_de_texto
      , numero_linea)
) RCDFMT LCFMTR;

COMMENT ON TABLE LCFMT IS 'Formatos de Cartas de Crédito';
LABEL ON TABLE LCFMT IS 'LCFMT - Formatos de Cartas de Crédito';
COMMENT ON COLUMN LCFMT.codigo_documento IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCFMT.codigo_documento IS 'Codigo documento';
LABEL ON COLUMN LCFMT.codigo_documento TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCFMT.secuencia_de_texto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCFMT.secuencia_de_texto IS 'Secuencia de texto';
LABEL ON COLUMN LCFMT.secuencia_de_texto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCFMT.numero_linea IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCFMT.numero_linea IS 'Numero linea';
LABEL ON COLUMN LCFMT.numero_linea TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCFMT.fecha_emision IS
  'Campo Fecha emision de formatos de cartas de crédito';
LABEL ON COLUMN LCFMT.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN LCFMT.fecha_emision TEXT IS
  'Campo Fecha emision de formatos de cartas de crédi';
COMMENT ON COLUMN LCFMT.fecha_vencimiento IS
  'Campo Fecha vencimiento de formatos de cartas de crédito';
LABEL ON COLUMN LCFMT.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN LCFMT.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de formatos de cartas de c';
COMMENT ON COLUMN LCFMT.monto_original IS
  'Campo Monto original de formatos de cartas de crédito';
LABEL ON COLUMN LCFMT.monto_original IS 'Monto original';
LABEL ON COLUMN LCFMT.monto_original TEXT IS
  'Campo Monto original de formatos de cartas de créd';
COMMENT ON COLUMN LCFMT.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN LCFMT.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN LCFMT.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN LCFMT.banco_corresponsal IS
  'Campo Banco corresponsal de formatos de cartas de crédito';
LABEL ON COLUMN LCFMT.banco_corresponsal IS 'Banco corresponsal';
LABEL ON COLUMN LCFMT.banco_corresponsal TEXT IS
  'Campo Banco corresponsal de formatos de cartas de';
COMMENT ON COLUMN LCFMT.pais_destino IS
  'Campo Pais destino de formatos de cartas de crédito';
LABEL ON COLUMN LCFMT.pais_destino IS 'Pais destino';
LABEL ON COLUMN LCFMT.pais_destino TEXT IS
  'Campo Pais destino de formatos de cartas de crédit';
COMMENT ON COLUMN LCFMT.estado_carta IS
  'Campo Estado carta de formatos de cartas de crédito';
LABEL ON COLUMN LCFMT.estado_carta IS 'Estado carta';
LABEL ON COLUMN LCFMT.estado_carta TEXT IS
  'Campo Estado carta de formatos de cartas de crédit';
COMMENT ON COLUMN LCFMT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LCFMT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LCFMT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LCFMT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LCFMT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LCFMT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LCFMT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LCFMT.version_registro IS 'Version';
LABEL ON COLUMN LCFMT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LCFMT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LCFMT.observaciones IS 'Observaciones';
LABEL ON COLUMN LCFMT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LCFMT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LCFMT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LCFMT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LCFMT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LCFMT.created_at IS 'Creado';
LABEL ON COLUMN LCFMT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LCFMT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LCFMT.updated_at IS 'Actualizado';
LABEL ON COLUMN LCFMT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_lcfmt_pk;
CREATE INDEX idx_lcfmt_pk ON LCFMT (codigo_documento, secuencia_de_texto);
DROP INDEX IF EXISTS idx_lcfmt_created_at;
CREATE INDEX idx_lcfmt_created_at ON LCFMT (created_at);

--==============================================================================
-- Nombre de la Tabla: LCADM
-- DESCRIPCION: Enmiendas a Cartas de Crédito
-- Objetivo: Persistir informacion funcional de enmiendas a cartas de crédito
-- en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de enmiendas a cartas
-- de crédito
-- Restricciones: Clave reportada: Número Carta de Crédito, Número de
-- Enmienda.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LCADM (
    numero_carta_credito FOR COLUMN NUCACR VARCHAR(30),
    numero_enmienda FOR COLUMN NUEN VARCHAR(30),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    banco_corresponsal FOR COLUMN BACO VARCHAR(80),
    pais_destino FOR COLUMN PADE VARCHAR(80),
    estado_carta FOR COLUMN ESCA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_lcadm PRIMARY KEY (numero_carta_credito, numero_enmienda)
) RCDFMT LCADMR;

COMMENT ON TABLE LCADM IS 'Enmiendas a Cartas de Crédito';
LABEL ON TABLE LCADM IS 'LCADM - Enmiendas a Cartas de Crédito';
COMMENT ON COLUMN LCADM.numero_carta_credito IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCADM.numero_carta_credito IS 'Numero carta credito';
LABEL ON COLUMN LCADM.numero_carta_credito TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCADM.numero_enmienda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCADM.numero_enmienda IS 'Numero enmienda';
LABEL ON COLUMN LCADM.numero_enmienda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCADM.fecha_emision IS
  'Campo Fecha emision de enmiendas a cartas de crédito';
LABEL ON COLUMN LCADM.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN LCADM.fecha_emision TEXT IS
  'Campo Fecha emision de enmiendas a cartas de crédi';
COMMENT ON COLUMN LCADM.fecha_vencimiento IS
  'Campo Fecha vencimiento de enmiendas a cartas de crédito';
LABEL ON COLUMN LCADM.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN LCADM.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de enmiendas a cartas de c';
COMMENT ON COLUMN LCADM.monto_original IS
  'Campo Monto original de enmiendas a cartas de crédito';
LABEL ON COLUMN LCADM.monto_original IS 'Monto original';
LABEL ON COLUMN LCADM.monto_original TEXT IS
  'Campo Monto original de enmiendas a cartas de créd';
COMMENT ON COLUMN LCADM.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN LCADM.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN LCADM.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN LCADM.banco_corresponsal IS
  'Campo Banco corresponsal de enmiendas a cartas de crédito';
LABEL ON COLUMN LCADM.banco_corresponsal IS 'Banco corresponsal';
LABEL ON COLUMN LCADM.banco_corresponsal TEXT IS
  'Campo Banco corresponsal de enmiendas a cartas de';
COMMENT ON COLUMN LCADM.pais_destino IS
  'Campo Pais destino de enmiendas a cartas de crédito';
LABEL ON COLUMN LCADM.pais_destino IS 'Pais destino';
LABEL ON COLUMN LCADM.pais_destino TEXT IS
  'Campo Pais destino de enmiendas a cartas de crédit';
COMMENT ON COLUMN LCADM.estado_carta IS
  'Campo Estado carta de enmiendas a cartas de crédito';
LABEL ON COLUMN LCADM.estado_carta IS 'Estado carta';
LABEL ON COLUMN LCADM.estado_carta TEXT IS
  'Campo Estado carta de enmiendas a cartas de crédit';
COMMENT ON COLUMN LCADM.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LCADM.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LCADM.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LCADM.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LCADM.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LCADM.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LCADM.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LCADM.version_registro IS 'Version';
LABEL ON COLUMN LCADM.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LCADM.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LCADM.observaciones IS 'Observaciones';
LABEL ON COLUMN LCADM.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LCADM.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LCADM.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LCADM.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LCADM.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LCADM.created_at IS 'Creado';
LABEL ON COLUMN LCADM.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LCADM.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LCADM.updated_at IS 'Actualizado';
LABEL ON COLUMN LCADM.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_lcadm_pk;
CREATE INDEX idx_lcadm_pk ON LCADM (numero_carta_credito, numero_enmienda);
DROP INDEX IF EXISTS idx_lcadm_created_at;
CREATE INDEX idx_lcadm_created_at ON LCADM (created_at);

--==============================================================================
-- Nombre de la Tabla: LCCOV
-- DESCRIPCION: Negociaciones de Cartas de Crédito
-- Objetivo: Persistir informacion funcional de negociaciones de cartas de
-- crédito en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de negociaciones de
-- cartas de crédito
-- Restricciones: Clave reportada: Número Carta de Crédito, Secuencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LCCOV (
    numero_carta_credito FOR COLUMN NUCACR VARCHAR(30),
    secuencia FOR COLUMN SSECUE INT,
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    banco_corresponsal FOR COLUMN BACO VARCHAR(80),
    pais_destino FOR COLUMN PADE VARCHAR(80),
    estado_carta FOR COLUMN ESCA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_lccov PRIMARY KEY (numero_carta_credito, secuencia)
) RCDFMT LCCOVR;

COMMENT ON TABLE LCCOV IS 'Negociaciones de Cartas de Crédito';
LABEL ON TABLE LCCOV IS 'LCCOV - Negociaciones de Cartas de Crédito';
COMMENT ON COLUMN LCCOV.numero_carta_credito IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCCOV.numero_carta_credito IS 'Numero carta credito';
LABEL ON COLUMN LCCOV.numero_carta_credito TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCCOV.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN LCCOV.secuencia IS 'Secuencia';
LABEL ON COLUMN LCCOV.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCCOV.fecha_emision IS
  'Campo Fecha emision de negociaciones de cartas de crédito';
LABEL ON COLUMN LCCOV.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN LCCOV.fecha_emision TEXT IS
  'Campo Fecha emision de negociaciones de cartas de';
COMMENT ON COLUMN LCCOV.fecha_vencimiento IS
  'Campo Fecha vencimiento de negociaciones de cartas de crédito';
LABEL ON COLUMN LCCOV.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN LCCOV.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de negociaciones de cartas';
COMMENT ON COLUMN LCCOV.monto_original IS
  'Campo Monto original de negociaciones de cartas de crédito';
LABEL ON COLUMN LCCOV.monto_original IS 'Monto original';
LABEL ON COLUMN LCCOV.monto_original TEXT IS
  'Campo Monto original de negociaciones de cartas de';
COMMENT ON COLUMN LCCOV.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN LCCOV.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN LCCOV.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN LCCOV.banco_corresponsal IS
  'Campo Banco corresponsal de negociaciones de cartas de crédito';
LABEL ON COLUMN LCCOV.banco_corresponsal IS 'Banco corresponsal';
LABEL ON COLUMN LCCOV.banco_corresponsal TEXT IS
  'Campo Banco corresponsal de negociaciones de carta';
COMMENT ON COLUMN LCCOV.pais_destino IS
  'Campo Pais destino de negociaciones de cartas de crédito';
LABEL ON COLUMN LCCOV.pais_destino IS 'Pais destino';
LABEL ON COLUMN LCCOV.pais_destino TEXT IS
  'Campo Pais destino de negociaciones de cartas de c';
COMMENT ON COLUMN LCCOV.estado_carta IS
  'Campo Estado carta de negociaciones de cartas de crédito';
LABEL ON COLUMN LCCOV.estado_carta IS 'Estado carta';
LABEL ON COLUMN LCCOV.estado_carta TEXT IS
  'Campo Estado carta de negociaciones de cartas de c';
COMMENT ON COLUMN LCCOV.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LCCOV.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LCCOV.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LCCOV.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LCCOV.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LCCOV.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LCCOV.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LCCOV.version_registro IS 'Version';
LABEL ON COLUMN LCCOV.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LCCOV.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LCCOV.observaciones IS 'Observaciones';
LABEL ON COLUMN LCCOV.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LCCOV.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LCCOV.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LCCOV.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LCCOV.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LCCOV.created_at IS 'Creado';
LABEL ON COLUMN LCCOV.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LCCOV.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LCCOV.updated_at IS 'Actualizado';
LABEL ON COLUMN LCCOV.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_lccov_pk;
CREATE INDEX idx_lccov_pk ON LCCOV (numero_carta_credito, secuencia);
DROP INDEX IF EXISTS idx_lccov_created_at;
CREATE INDEX idx_lccov_created_at ON LCCOV (created_at);

--==============================================================================
-- Nombre de la Tabla: LCDIN
-- DESCRIPCION: Documentos Recibidos en Cartas de Crédito
-- Objetivo: Persistir informacion funcional de documentos recibidos en cartas
-- de crédito en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de documentos recibidos
-- en cartas de crédito
-- Restricciones: Clave reportada: Número Carta de Crédito, Secuencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LCDIN (
    numero_carta_credito FOR COLUMN NUCACR VARCHAR(30),
    secuencia FOR COLUMN SSECUE INT,
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    banco_corresponsal FOR COLUMN BACO VARCHAR(80),
    pais_destino FOR COLUMN PADE VARCHAR(80),
    estado_carta FOR COLUMN ESCA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_lcdin PRIMARY KEY (numero_carta_credito, secuencia)
) RCDFMT LCDINR;

COMMENT ON TABLE LCDIN IS 'Documentos Recibidos en Cartas de Crédito';
LABEL ON TABLE LCDIN IS 'LCDIN - Documentos Recibidos en Cartas de Crédito';
COMMENT ON COLUMN LCDIN.numero_carta_credito IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCDIN.numero_carta_credito IS 'Numero carta credito';
LABEL ON COLUMN LCDIN.numero_carta_credito TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCDIN.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN LCDIN.secuencia IS 'Secuencia';
LABEL ON COLUMN LCDIN.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCDIN.fecha_emision IS
  'Campo Fecha emision de documentos recibidos en cartas de crédito';
LABEL ON COLUMN LCDIN.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN LCDIN.fecha_emision TEXT IS
  'Campo Fecha emision de documentos recibidos en car';
COMMENT ON COLUMN LCDIN.fecha_vencimiento IS
  'Campo Fecha vencimiento de documentos recibidos en cartas de crédito';
LABEL ON COLUMN LCDIN.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN LCDIN.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de documentos recibidos en';
COMMENT ON COLUMN LCDIN.monto_original IS
  'Campo Monto original de documentos recibidos en cartas de crédito';
LABEL ON COLUMN LCDIN.monto_original IS 'Monto original';
LABEL ON COLUMN LCDIN.monto_original TEXT IS
  'Campo Monto original de documentos recibidos en ca';
COMMENT ON COLUMN LCDIN.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN LCDIN.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN LCDIN.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN LCDIN.banco_corresponsal IS
  'Campo Banco corresponsal de documentos recibidos en cartas de crédito';
LABEL ON COLUMN LCDIN.banco_corresponsal IS 'Banco corresponsal';
LABEL ON COLUMN LCDIN.banco_corresponsal TEXT IS
  'Campo Banco corresponsal de documentos recibidos e';
COMMENT ON COLUMN LCDIN.pais_destino IS
  'Campo Pais destino de documentos recibidos en cartas de crédito';
LABEL ON COLUMN LCDIN.pais_destino IS 'Pais destino';
LABEL ON COLUMN LCDIN.pais_destino TEXT IS
  'Campo Pais destino de documentos recibidos en cart';
COMMENT ON COLUMN LCDIN.estado_carta IS
  'Campo Estado carta de documentos recibidos en cartas de crédito';
LABEL ON COLUMN LCDIN.estado_carta IS 'Estado carta';
LABEL ON COLUMN LCDIN.estado_carta TEXT IS
  'Campo Estado carta de documentos recibidos en cart';
COMMENT ON COLUMN LCDIN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LCDIN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LCDIN.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LCDIN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LCDIN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LCDIN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LCDIN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LCDIN.version_registro IS 'Version';
LABEL ON COLUMN LCDIN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LCDIN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LCDIN.observaciones IS 'Observaciones';
LABEL ON COLUMN LCDIN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LCDIN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LCDIN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LCDIN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LCDIN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LCDIN.created_at IS 'Creado';
LABEL ON COLUMN LCDIN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LCDIN.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LCDIN.updated_at IS 'Actualizado';
LABEL ON COLUMN LCDIN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_lcdin_pk;
CREATE INDEX idx_lcdin_pk ON LCDIN (numero_carta_credito, secuencia);
DROP INDEX IF EXISTS idx_lcdin_created_at;
CREATE INDEX idx_lcdin_created_at ON LCDIN (created_at);

--==============================================================================
-- Nombre de la Tabla: LCSTA
-- DESCRIPCION: Estadística de Aperturas, Enmiendas, Pagos en Cartas de
-- Crédito
-- Objetivo: Persistir informacion funcional de estadística de aperturas,
-- enmiendas, pagos en cartas de crédito en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de estadística de
-- aperturas, enmiendas, pagos en cartas de crédito
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LCSTA (
    id FOR COLUMN SID BIGINT,
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    banco_corresponsal FOR COLUMN BACO VARCHAR(80),
    pais_destino FOR COLUMN PADE VARCHAR(80),
    estado_carta FOR COLUMN ESCA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_lcsta PRIMARY KEY (id)
) RCDFMT LCSTAR;

COMMENT ON TABLE LCSTA IS
  'Estadística de Aperturas, Enmiendas, Pagos en Cartas de Crédito';
LABEL ON TABLE LCSTA IS 'LCSTA - Estadística de Aperturas, Enmiendas, Pagos';
COMMENT ON COLUMN LCSTA.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN LCSTA.id IS 'Id';
LABEL ON COLUMN LCSTA.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCSTA.fecha_emision IS
  'Campo Fecha emision de estadística de aperturas, enmiendas, pagos en cartas'
  ' de crédito';
LABEL ON COLUMN LCSTA.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN LCSTA.fecha_emision TEXT IS
  'Campo Fecha emision de estadística de aperturas, e';
COMMENT ON COLUMN LCSTA.fecha_vencimiento IS
  'Campo Fecha vencimiento de estadística de aperturas, enmiendas, pagos en ca'
  'rtas de crédito';
LABEL ON COLUMN LCSTA.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN LCSTA.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de estadística de apertura';
COMMENT ON COLUMN LCSTA.monto_original IS
  'Campo Monto original de estadística de aperturas, enmiendas, pagos en carta'
  's de crédito';
LABEL ON COLUMN LCSTA.monto_original IS 'Monto original';
LABEL ON COLUMN LCSTA.monto_original TEXT IS
  'Campo Monto original de estadística de aperturas,';
COMMENT ON COLUMN LCSTA.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN LCSTA.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN LCSTA.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN LCSTA.banco_corresponsal IS
  'Campo Banco corresponsal de estadística de aperturas, enmiendas, pagos en c'
  'artas de crédito';
LABEL ON COLUMN LCSTA.banco_corresponsal IS 'Banco corresponsal';
LABEL ON COLUMN LCSTA.banco_corresponsal TEXT IS
  'Campo Banco corresponsal de estadística de apertur';
COMMENT ON COLUMN LCSTA.pais_destino IS
  'Campo Pais destino de estadística de aperturas, enmiendas, pagos en cartas '
  'de crédito';
LABEL ON COLUMN LCSTA.pais_destino IS 'Pais destino';
LABEL ON COLUMN LCSTA.pais_destino TEXT IS
  'Campo Pais destino de estadística de aperturas, en';
COMMENT ON COLUMN LCSTA.estado_carta IS
  'Campo Estado carta de estadística de aperturas, enmiendas, pagos en cartas '
  'de crédito';
LABEL ON COLUMN LCSTA.estado_carta IS 'Estado carta';
LABEL ON COLUMN LCSTA.estado_carta TEXT IS
  'Campo Estado carta de estadística de aperturas, en';
COMMENT ON COLUMN LCSTA.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LCSTA.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LCSTA.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LCSTA.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LCSTA.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LCSTA.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LCSTA.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LCSTA.version_registro IS 'Version';
LABEL ON COLUMN LCSTA.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LCSTA.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LCSTA.observaciones IS 'Observaciones';
LABEL ON COLUMN LCSTA.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LCSTA.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LCSTA.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LCSTA.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LCSTA.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LCSTA.created_at IS 'Creado';
LABEL ON COLUMN LCSTA.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LCSTA.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LCSTA.updated_at IS 'Actualizado';
LABEL ON COLUMN LCSTA.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_lcsta_pk;
CREATE INDEX idx_lcsta_pk ON LCSTA (id);
DROP INDEX IF EXISTS idx_lcsta_created_at;
CREATE INDEX idx_lcsta_created_at ON LCSTA (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLLCP
-- DESCRIPCION: Archivo de Control de Cartas de Crédito
-- Objetivo: Persistir informacion funcional de archivo de control de cartas de
-- crédito en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de control
-- de cartas de crédito
-- Restricciones: Clave reportada: Banco, ?LCRPARM?
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLLCP (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    lcrparm FOR COLUMN SLCRPA VARCHAR(20),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    banco_corresponsal FOR COLUMN BACO VARCHAR(80),
    pais_destino FOR COLUMN PADE VARCHAR(80),
    estado_carta FOR COLUMN ESCA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrllcp PRIMARY KEY (codigo_banco, lcrparm)
) RCDFMT CNTRLLCPR;

COMMENT ON TABLE CNTRLLCP IS 'Archivo de Control de Cartas de Crédito';
LABEL ON TABLE CNTRLLCP IS
  'CNTRLLCP - Archivo de Control de Cartas de Crédito';
COMMENT ON COLUMN CNTRLLCP.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLLCP.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLLCP.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLLCP.lcrparm IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLLCP.lcrparm IS 'Lcrparm';
LABEL ON COLUMN CNTRLLCP.lcrparm TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLLCP.fecha_emision IS
  'Campo Fecha emision de archivo de control de cartas de crédito';
LABEL ON COLUMN CNTRLLCP.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN CNTRLLCP.fecha_emision TEXT IS
  'Campo Fecha emision de archivo de control de carta';
COMMENT ON COLUMN CNTRLLCP.fecha_vencimiento IS
  'Campo Fecha vencimiento de archivo de control de cartas de crédito';
LABEL ON COLUMN CNTRLLCP.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN CNTRLLCP.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de archivo de control de c';
COMMENT ON COLUMN CNTRLLCP.monto_original IS
  'Campo Monto original de archivo de control de cartas de crédito';
LABEL ON COLUMN CNTRLLCP.monto_original IS 'Monto original';
LABEL ON COLUMN CNTRLLCP.monto_original TEXT IS
  'Campo Monto original de archivo de control de cart';
COMMENT ON COLUMN CNTRLLCP.saldo_actual IS
  'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CNTRLLCP.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CNTRLLCP.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CNTRLLCP.banco_corresponsal IS
  'Campo Banco corresponsal de archivo de control de cartas de crédito';
LABEL ON COLUMN CNTRLLCP.banco_corresponsal IS 'Banco corresponsal';
LABEL ON COLUMN CNTRLLCP.banco_corresponsal TEXT IS
  'Campo Banco corresponsal de archivo de control de';
COMMENT ON COLUMN CNTRLLCP.pais_destino IS
  'Campo Pais destino de archivo de control de cartas de crédito';
LABEL ON COLUMN CNTRLLCP.pais_destino IS 'Pais destino';
LABEL ON COLUMN CNTRLLCP.pais_destino TEXT IS
  'Campo Pais destino de archivo de control de cartas';
COMMENT ON COLUMN CNTRLLCP.estado_carta IS
  'Campo Estado carta de archivo de control de cartas de crédito';
LABEL ON COLUMN CNTRLLCP.estado_carta IS 'Estado carta';
LABEL ON COLUMN CNTRLLCP.estado_carta TEXT IS
  'Campo Estado carta de archivo de control de cartas';
COMMENT ON COLUMN CNTRLLCP.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLLCP.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLLCP.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLLCP.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLLCP.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLLCP.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLLCP.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLLCP.version_registro IS 'Version';
LABEL ON COLUMN CNTRLLCP.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLLCP.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLLCP.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLLCP.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLLCP.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLLCP.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLLCP.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLLCP.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLLCP.created_at IS 'Creado';
LABEL ON COLUMN CNTRLLCP.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLLCP.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLLCP.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLLCP.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrllcp_pk;
CREATE INDEX idx_cntrllcp_pk ON CNTRLLCP (codigo_banco, lcrparm);
DROP INDEX IF EXISTS idx_cntrllcp_created_at;
CREATE INDEX idx_cntrllcp_created_at ON CNTRLLCP (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLRLC
-- DESCRIPCION: Tabla de Cargos por Servicios o Tarifas de Cartas de Crédito.
-- Objetivo: Persistir informacion funcional de tabla de cargos por servicios o
-- tarifas de cartas de crédito en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de tabla de cargos por
-- servicios o tarifas de cartas de crédito
-- Restricciones: Clave reportada: Banco, Tipo de Producto, Número de Tabla.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLRLC (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    tipo_producto FOR COLUMN TIPR VARCHAR(20),
    numero_tabla FOR COLUMN NUTA VARCHAR(30),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    banco_corresponsal FOR COLUMN BACO VARCHAR(80),
    pais_destino FOR COLUMN PADE VARCHAR(80),
    estado_carta FOR COLUMN ESCA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlrlc PRIMARY KEY (codigo_banco, tipo_producto
      , numero_tabla)
) RCDFMT CNTRLRLCR;

COMMENT ON TABLE CNTRLRLC IS
  'Tabla de Cargos por Servicios o Tarifas de Cartas de Crédito.';
LABEL ON TABLE CNTRLRLC IS 'CNTRLRLC - Tabla de Cargos por Servicios o Tarifas';
COMMENT ON COLUMN CNTRLRLC.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLRLC.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLRLC.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLRLC.tipo_producto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLRLC.tipo_producto IS 'Tipo producto';
LABEL ON COLUMN CNTRLRLC.tipo_producto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLRLC.numero_tabla IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLRLC.numero_tabla IS 'Numero tabla';
LABEL ON COLUMN CNTRLRLC.numero_tabla TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLRLC.fecha_emision IS
  'Campo Fecha emision de tabla de cargos por servicios o tarifas de cartas de '
  'crédito';
LABEL ON COLUMN CNTRLRLC.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN CNTRLRLC.fecha_emision TEXT IS
  'Campo Fecha emision de tabla de cargos por servici';
COMMENT ON COLUMN CNTRLRLC.fecha_vencimiento IS
  'Campo Fecha vencimiento de tabla de cargos por servicios o tarifas de cartas'
  ' de crédito';
LABEL ON COLUMN CNTRLRLC.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN CNTRLRLC.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de tabla de cargos por ser';
COMMENT ON COLUMN CNTRLRLC.monto_original IS
  'Campo Monto original de tabla de cargos por servicios o tarifas de cartas de'
  ' crédito';
LABEL ON COLUMN CNTRLRLC.monto_original IS 'Monto original';
LABEL ON COLUMN CNTRLRLC.monto_original TEXT IS
  'Campo Monto original de tabla de cargos por servic';
COMMENT ON COLUMN CNTRLRLC.saldo_actual IS
  'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CNTRLRLC.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CNTRLRLC.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CNTRLRLC.banco_corresponsal IS
  'Campo Banco corresponsal de tabla de cargos por servicios o tarifas de carta'
  's de crédito';
LABEL ON COLUMN CNTRLRLC.banco_corresponsal IS 'Banco corresponsal';
LABEL ON COLUMN CNTRLRLC.banco_corresponsal TEXT IS
  'Campo Banco corresponsal de tabla de cargos por se';
COMMENT ON COLUMN CNTRLRLC.pais_destino IS
  'Campo Pais destino de tabla de cargos por servicios o tarifas de cartas de c'
  'rédito';
LABEL ON COLUMN CNTRLRLC.pais_destino IS 'Pais destino';
LABEL ON COLUMN CNTRLRLC.pais_destino TEXT IS
  'Campo Pais destino de tabla de cargos por servicio';
COMMENT ON COLUMN CNTRLRLC.estado_carta IS
  'Campo Estado carta de tabla de cargos por servicios o tarifas de cartas de c'
  'rédito';
LABEL ON COLUMN CNTRLRLC.estado_carta IS 'Estado carta';
LABEL ON COLUMN CNTRLRLC.estado_carta TEXT IS
  'Campo Estado carta de tabla de cargos por servicio';
COMMENT ON COLUMN CNTRLRLC.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLRLC.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLRLC.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLRLC.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLRLC.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLRLC.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLRLC.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLRLC.version_registro IS 'Version';
LABEL ON COLUMN CNTRLRLC.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLRLC.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLRLC.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLRLC.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLRLC.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLRLC.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLRLC.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLRLC.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLRLC.created_at IS 'Creado';
LABEL ON COLUMN CNTRLRLC.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLRLC.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLRLC.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLRLC.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlrlc_pk;
CREATE INDEX idx_cntrlrlc_pk ON CNTRLRLC (codigo_banco, tipo_producto);
DROP INDEX IF EXISTS idx_cntrlrlc_created_at;
CREATE INDEX idx_cntrlrlc_created_at ON CNTRLRLC (created_at);

--==============================================================================
-- Nombre de la Tabla: DCMST
-- DESCRIPCION: Maestro de Cobranzas Documentarias.
-- Objetivo: Persistir informacion funcional de maestro de cobranzas
-- documentarias en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de cobranzas
-- documentarias
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DCMST (
    id FOR COLUMN SID BIGINT,
    fecha_recepcion FOR COLUMN FERE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    tipo_documento FOR COLUMN TIDO VARCHAR(20),
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_dcmst PRIMARY KEY (id)
) RCDFMT DCMSTR;

COMMENT ON TABLE DCMST IS 'Maestro de Cobranzas Documentarias.';
LABEL ON TABLE DCMST IS 'DCMST - Maestro de Cobranzas Documentarias.';
COMMENT ON COLUMN DCMST.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DCMST.id IS 'Id';
LABEL ON COLUMN DCMST.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN DCMST.fecha_recepcion IS
  'Campo Fecha recepcion de maestro de cobranzas documentarias';
LABEL ON COLUMN DCMST.fecha_recepcion IS 'Fecha recepcion';
LABEL ON COLUMN DCMST.fecha_recepcion TEXT IS
  'Campo Fecha recepcion de maestro de cobranzas docu';
COMMENT ON COLUMN DCMST.fecha_vencimiento IS
  'Campo Fecha vencimiento de maestro de cobranzas documentarias';
LABEL ON COLUMN DCMST.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN DCMST.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de maestro de cobranzas do';
COMMENT ON COLUMN DCMST.monto_original IS
  'Campo Monto original de maestro de cobranzas documentarias';
LABEL ON COLUMN DCMST.monto_original IS 'Monto original';
LABEL ON COLUMN DCMST.monto_original TEXT IS
  'Campo Monto original de maestro de cobranzas docum';
COMMENT ON COLUMN DCMST.saldo_pendiente IS
  'Campo Saldo pendiente de maestro de cobranzas documentarias';
LABEL ON COLUMN DCMST.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN DCMST.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de maestro de cobranzas docu';
COMMENT ON COLUMN DCMST.tipo_documento IS
  'Campo Tipo documento de maestro de cobranzas documentarias';
LABEL ON COLUMN DCMST.tipo_documento IS 'Tipo documento';
LABEL ON COLUMN DCMST.tipo_documento TEXT IS
  'Campo Tipo documento de maestro de cobranzas docum';
COMMENT ON COLUMN DCMST.estado_operacion IS
  'Campo Estado operacion de maestro de cobranzas documentarias';
LABEL ON COLUMN DCMST.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN DCMST.estado_operacion TEXT IS
  'Campo Estado operacion de maestro de cobranzas doc';
COMMENT ON COLUMN DCMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DCMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DCMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DCMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DCMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DCMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DCMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DCMST.version_registro IS 'Version';
LABEL ON COLUMN DCMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DCMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DCMST.observaciones IS 'Observaciones';
LABEL ON COLUMN DCMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DCMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DCMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DCMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DCMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DCMST.created_at IS 'Creado';
LABEL ON COLUMN DCMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DCMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DCMST.updated_at IS 'Actualizado';
LABEL ON COLUMN DCMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_dcmst_pk;
CREATE INDEX idx_dcmst_pk ON DCMST (id);
DROP INDEX IF EXISTS idx_dcmst_created_at;
CREATE INDEX idx_dcmst_created_at ON DCMST (created_at);

--==============================================================================
-- Nombre de la Tabla: APPRV
-- DESCRIPCION: Cobranzas pendientes de Aprobación.
-- Objetivo: Persistir informacion funcional de cobranzas pendientes de
-- aprobación en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de cobranzas pendientes
-- de aprobación
-- Restricciones: Clave reportada: Número de Carta Crédito, Tipo.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE APPRV (
    numero_carta_credito FOR COLUMN NUCACR VARCHAR(30),
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    fecha_recepcion FOR COLUMN FERE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    tipo_documento FOR COLUMN TIDO VARCHAR(20),
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_apprv PRIMARY KEY (numero_carta_credito, tipo_registro)
) RCDFMT APPRVR;

COMMENT ON TABLE APPRV IS 'Cobranzas pendientes de Aprobación.';
LABEL ON TABLE APPRV IS 'APPRV - Cobranzas pendientes de Aprobación.';
COMMENT ON COLUMN APPRV.numero_carta_credito IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN APPRV.numero_carta_credito IS 'Numero carta credito';
LABEL ON COLUMN APPRV.numero_carta_credito TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN APPRV.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN APPRV.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN APPRV.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN APPRV.fecha_recepcion IS
  'Campo Fecha recepcion de cobranzas pendientes de aprobación';
LABEL ON COLUMN APPRV.fecha_recepcion IS 'Fecha recepcion';
LABEL ON COLUMN APPRV.fecha_recepcion TEXT IS
  'Campo Fecha recepcion de cobranzas pendientes de a';
COMMENT ON COLUMN APPRV.fecha_vencimiento IS
  'Campo Fecha vencimiento de cobranzas pendientes de aprobación';
LABEL ON COLUMN APPRV.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN APPRV.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de cobranzas pendientes de';
COMMENT ON COLUMN APPRV.monto_original IS
  'Campo Monto original de cobranzas pendientes de aprobación';
LABEL ON COLUMN APPRV.monto_original IS 'Monto original';
LABEL ON COLUMN APPRV.monto_original TEXT IS
  'Campo Monto original de cobranzas pendientes de ap';
COMMENT ON COLUMN APPRV.saldo_pendiente IS
  'Campo Saldo pendiente de cobranzas pendientes de aprobación';
LABEL ON COLUMN APPRV.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN APPRV.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de cobranzas pendientes de a';
COMMENT ON COLUMN APPRV.tipo_documento IS
  'Campo Tipo documento de cobranzas pendientes de aprobación';
LABEL ON COLUMN APPRV.tipo_documento IS 'Tipo documento';
LABEL ON COLUMN APPRV.tipo_documento TEXT IS
  'Campo Tipo documento de cobranzas pendientes de ap';
COMMENT ON COLUMN APPRV.estado_operacion IS
  'Campo Estado operacion de cobranzas pendientes de aprobación';
LABEL ON COLUMN APPRV.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN APPRV.estado_operacion TEXT IS
  'Campo Estado operacion de cobranzas pendientes de';
COMMENT ON COLUMN APPRV.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN APPRV.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN APPRV.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN APPRV.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN APPRV.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN APPRV.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN APPRV.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN APPRV.version_registro IS 'Version';
LABEL ON COLUMN APPRV.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN APPRV.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN APPRV.observaciones IS 'Observaciones';
LABEL ON COLUMN APPRV.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN APPRV.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN APPRV.estado_registro IS 'Estado Reg';
LABEL ON COLUMN APPRV.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN APPRV.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN APPRV.created_at IS 'Creado';
LABEL ON COLUMN APPRV.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN APPRV.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN APPRV.updated_at IS 'Actualizado';
LABEL ON COLUMN APPRV.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_apprv_pk;
CREATE INDEX idx_apprv_pk ON APPRV (numero_carta_credito, tipo_registro);
DROP INDEX IF EXISTS idx_apprv_created_at;
CREATE INDEX idx_apprv_created_at ON APPRV (created_at);

--==============================================================================
-- Nombre de la Tabla: LCFEE
-- DESCRIPCION: Control de Cobro de Comisiones
-- Objetivo: Persistir informacion funcional de control de cobro de comisiones
-- en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de control de cobro de
-- comisiones
-- Restricciones: Clave reportada: Número de Carta Crédito, Código de
-- Comisión.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LCFEE (
    numero_carta_credito FOR COLUMN NUCACR VARCHAR(30),
    codigo_de_comision FOR COLUMN CODECO VARCHAR(20),
    fecha_recepcion FOR COLUMN FERE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    tipo_documento FOR COLUMN TIDO VARCHAR(20),
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_lcfee PRIMARY KEY (numero_carta_credito, codigo_de_comision)
) RCDFMT LCFEER;

COMMENT ON TABLE LCFEE IS 'Control de Cobro de Comisiones';
LABEL ON TABLE LCFEE IS 'LCFEE - Control de Cobro de Comisiones';
COMMENT ON COLUMN LCFEE.numero_carta_credito IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCFEE.numero_carta_credito IS 'Numero carta credito';
LABEL ON COLUMN LCFEE.numero_carta_credito TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCFEE.codigo_de_comision IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LCFEE.codigo_de_comision IS 'Codigo de comision';
LABEL ON COLUMN LCFEE.codigo_de_comision TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LCFEE.fecha_recepcion IS
  'Campo Fecha recepcion de control de cobro de comisiones';
LABEL ON COLUMN LCFEE.fecha_recepcion IS 'Fecha recepcion';
LABEL ON COLUMN LCFEE.fecha_recepcion TEXT IS
  'Campo Fecha recepcion de control de cobro de comis';
COMMENT ON COLUMN LCFEE.fecha_vencimiento IS
  'Campo Fecha vencimiento de control de cobro de comisiones';
LABEL ON COLUMN LCFEE.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN LCFEE.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de control de cobro de com';
COMMENT ON COLUMN LCFEE.monto_original IS
  'Campo Monto original de control de cobro de comisiones';
LABEL ON COLUMN LCFEE.monto_original IS 'Monto original';
LABEL ON COLUMN LCFEE.monto_original TEXT IS
  'Campo Monto original de control de cobro de comisi';
COMMENT ON COLUMN LCFEE.saldo_pendiente IS
  'Campo Saldo pendiente de control de cobro de comisiones';
LABEL ON COLUMN LCFEE.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN LCFEE.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de control de cobro de comis';
COMMENT ON COLUMN LCFEE.tipo_documento IS
  'Campo Tipo documento de control de cobro de comisiones';
LABEL ON COLUMN LCFEE.tipo_documento IS 'Tipo documento';
LABEL ON COLUMN LCFEE.tipo_documento TEXT IS
  'Campo Tipo documento de control de cobro de comisi';
COMMENT ON COLUMN LCFEE.estado_operacion IS
  'Campo Estado operacion de control de cobro de comisiones';
LABEL ON COLUMN LCFEE.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN LCFEE.estado_operacion TEXT IS
  'Campo Estado operacion de control de cobro de comi';
COMMENT ON COLUMN LCFEE.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LCFEE.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LCFEE.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LCFEE.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LCFEE.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LCFEE.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LCFEE.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LCFEE.version_registro IS 'Version';
LABEL ON COLUMN LCFEE.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LCFEE.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LCFEE.observaciones IS 'Observaciones';
LABEL ON COLUMN LCFEE.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LCFEE.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LCFEE.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LCFEE.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LCFEE.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LCFEE.created_at IS 'Creado';
LABEL ON COLUMN LCFEE.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LCFEE.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LCFEE.updated_at IS 'Actualizado';
LABEL ON COLUMN LCFEE.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_lcfee_pk;
CREATE INDEX idx_lcfee_pk ON LCFEE (numero_carta_credito, codigo_de_comision);
DROP INDEX IF EXISTS idx_lcfee_created_at;
CREATE INDEX idx_lcfee_created_at ON LCFEE (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLRCO
-- DESCRIPCION: Tabla de Cargos por Servicios o Tarifas de Cobranzas.
-- Objetivo: Persistir informacion funcional de tabla de cargos por servicios o
-- tarifas de cobranzas en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de tabla de cargos por
-- servicios o tarifas de cobranzas
-- Restricciones: Clave reportada: Banco, Tipo de Producto, Número de Tabla.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLRCO (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    tipo_producto FOR COLUMN TIPR VARCHAR(20),
    numero_tabla FOR COLUMN NUTA VARCHAR(30),
    fecha_recepcion FOR COLUMN FERE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    tipo_documento FOR COLUMN TIDO VARCHAR(20),
    estado_operacion FOR COLUMN ESOP VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlrco PRIMARY KEY (codigo_banco, tipo_producto
      , numero_tabla)
) RCDFMT CNTRLRCOR;

COMMENT ON TABLE CNTRLRCO IS
  'Tabla de Cargos por Servicios o Tarifas de Cobranzas.';
LABEL ON TABLE CNTRLRCO IS 'CNTRLRCO - Tabla de Cargos por Servicios o Tarifas';
COMMENT ON COLUMN CNTRLRCO.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLRCO.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLRCO.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLRCO.tipo_producto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLRCO.tipo_producto IS 'Tipo producto';
LABEL ON COLUMN CNTRLRCO.tipo_producto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLRCO.numero_tabla IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLRCO.numero_tabla IS 'Numero tabla';
LABEL ON COLUMN CNTRLRCO.numero_tabla TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLRCO.fecha_recepcion IS
  'Campo Fecha recepcion de tabla de cargos por servicios o tarifas de cobranza'
  's';
LABEL ON COLUMN CNTRLRCO.fecha_recepcion IS 'Fecha recepcion';
LABEL ON COLUMN CNTRLRCO.fecha_recepcion TEXT IS
  'Campo Fecha recepcion de tabla de cargos por servi';
COMMENT ON COLUMN CNTRLRCO.fecha_vencimiento IS
  'Campo Fecha vencimiento de tabla de cargos por servicios o tarifas de cobran'
  'zas';
LABEL ON COLUMN CNTRLRCO.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN CNTRLRCO.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de tabla de cargos por ser';
COMMENT ON COLUMN CNTRLRCO.monto_original IS
  'Campo Monto original de tabla de cargos por servicios o tarifas de cobranza'
  's';
LABEL ON COLUMN CNTRLRCO.monto_original IS 'Monto original';
LABEL ON COLUMN CNTRLRCO.monto_original TEXT IS
  'Campo Monto original de tabla de cargos por servic';
COMMENT ON COLUMN CNTRLRCO.saldo_pendiente IS
  'Campo Saldo pendiente de tabla de cargos por servicios o tarifas de cobranza'
  's';
LABEL ON COLUMN CNTRLRCO.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN CNTRLRCO.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de tabla de cargos por servi';
COMMENT ON COLUMN CNTRLRCO.tipo_documento IS
  'Campo Tipo documento de tabla de cargos por servicios o tarifas de cobranza'
  's';
LABEL ON COLUMN CNTRLRCO.tipo_documento IS 'Tipo documento';
LABEL ON COLUMN CNTRLRCO.tipo_documento TEXT IS
  'Campo Tipo documento de tabla de cargos por servic';
COMMENT ON COLUMN CNTRLRCO.estado_operacion IS
  'Campo Estado operacion de tabla de cargos por servicios o tarifas de cobranz'
  'as';
LABEL ON COLUMN CNTRLRCO.estado_operacion IS 'Estado operacion';
LABEL ON COLUMN CNTRLRCO.estado_operacion TEXT IS
  'Campo Estado operacion de tabla de cargos por serv';
COMMENT ON COLUMN CNTRLRCO.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLRCO.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLRCO.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLRCO.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLRCO.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLRCO.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLRCO.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLRCO.version_registro IS 'Version';
LABEL ON COLUMN CNTRLRCO.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLRCO.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLRCO.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLRCO.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLRCO.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLRCO.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLRCO.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLRCO.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLRCO.created_at IS 'Creado';
LABEL ON COLUMN CNTRLRCO.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLRCO.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLRCO.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLRCO.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlrco_pk;
CREATE INDEX idx_cntrlrco_pk ON CNTRLRCO (codigo_banco, tipo_producto);
DROP INDEX IF EXISTS idx_cntrlrco_created_at;
CREATE INDEX idx_cntrlrco_created_at ON CNTRLRCO (created_at);

--==============================================================================
-- Nombre de la Tabla: GLMST
-- DESCRIPCION: Maestro de Cuentas Contables.
-- Objetivo: Mantener el catalogo de cuentas contables usado en conciliacion y
-- estados financieros.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de cuentas
-- contables
-- Restricciones: Clave reportada: Código de Banco, Moneda, Cuenta Contable
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE GLMST (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    cuenta_contable FOR COLUMN CUCO VARCHAR(24),
    descripcion_cuenta FOR COLUMN DECU VARCHAR(120),
    naturaleza_cuenta FOR COLUMN NACU VARCHAR(20),
    nivel_cuenta FOR COLUMN NICU VARCHAR(50),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    fecha_proceso_sistema FOR COLUMN FEPRSI TIMESTAMP,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_glmst PRIMARY KEY (codigo_banco, codigo_moneda
      , cuenta_contable)
) RCDFMT GLMSTR;

COMMENT ON TABLE GLMST IS 'Maestro de Cuentas Contables.';
LABEL ON TABLE GLMST IS 'GLMST - Maestro de Cuentas Contables.';
COMMENT ON COLUMN GLMST.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN GLMST.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN GLMST.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN GLMST.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN GLMST.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN GLMST.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN GLMST.cuenta_contable IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN GLMST.cuenta_contable IS 'Cta Contable';
LABEL ON COLUMN GLMST.cuenta_contable TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN GLMST.descripcion_cuenta IS
  'Descripcion de la cuenta contable';
LABEL ON COLUMN GLMST.descripcion_cuenta IS 'Desc Cuenta';
LABEL ON COLUMN GLMST.descripcion_cuenta TEXT IS
  'Descripcion de la cuenta contable';
COMMENT ON COLUMN GLMST.naturaleza_cuenta IS
  'Naturaleza de la cuenta: deudora o acreedora';
LABEL ON COLUMN GLMST.naturaleza_cuenta IS 'Naturaleza';
LABEL ON COLUMN GLMST.naturaleza_cuenta TEXT IS
  'Naturaleza de la cuenta: deudora o acreedora';
COMMENT ON COLUMN GLMST.nivel_cuenta IS
  'Nivel jerarquico de la cuenta contable';
LABEL ON COLUMN GLMST.nivel_cuenta IS 'Nivel Cuenta';
LABEL ON COLUMN GLMST.nivel_cuenta TEXT IS
  'Nivel jerarquico de la cuenta contable';
COMMENT ON COLUMN GLMST.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN GLMST.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN GLMST.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN GLMST.fecha_proceso_sistema IS
  'Fecha y hora de procesamiento en el sistema';
LABEL ON COLUMN GLMST.fecha_proceso_sistema IS 'Fecha Proceso';
LABEL ON COLUMN GLMST.fecha_proceso_sistema TEXT IS
  'Fecha y hora de procesamiento en el sistema';
COMMENT ON COLUMN GLMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN GLMST.observaciones IS 'Observaciones';
LABEL ON COLUMN GLMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN GLMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN GLMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN GLMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN GLMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN GLMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN GLMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN GLMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN GLMST.version_registro IS 'Version';
LABEL ON COLUMN GLMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN GLMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN GLMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN GLMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN GLMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN GLMST.created_at IS 'Creado';
LABEL ON COLUMN GLMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN GLMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN GLMST.updated_at IS 'Actualizado';
LABEL ON COLUMN GLMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_glmst_pk;
CREATE INDEX idx_glmst_pk ON GLMST (codigo_banco, codigo_moneda);
DROP INDEX IF EXISTS idx_glmst_created_at;
CREATE INDEX idx_glmst_created_at ON GLMST (created_at);

--==============================================================================
-- Nombre de la Tabla: INPUT
-- DESCRIPCION: Archivo de Asientos Contables Aprobados (Archivos Derivados).
-- Objetivo: Persistir informacion funcional de archivo de asientos contables
-- aprobados (archivos derivados) en el entorno IBM i del taller.
-- Tipo de Tabla: Transaccional
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de asientos
-- contables aprobados (archivos derivados)
-- Restricciones: Clave reportada: Número del Lote y secuencia dentro del lote
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE INPUT (
    numero_del_lote FOR COLUMN NUDELO VARCHAR(30),
    secuencia_dentro_del_lote FOR COLUMN SEDEDE VARCHAR(50),
    descripcion_cuenta FOR COLUMN DECU VARCHAR(120),
    naturaleza_cuenta FOR COLUMN NACU VARCHAR(20),
    nivel_cuenta FOR COLUMN NICU VARCHAR(50),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    fecha_proceso_sistema FOR COLUMN FEPRSI TIMESTAMP,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_input PRIMARY KEY (numero_del_lote, secuencia_dentro_del_lote)
) RCDFMT INPUTR;

COMMENT ON TABLE INPUT IS
  'Archivo de Asientos Contables Aprobados (Archivos Derivados).';
LABEL ON TABLE INPUT IS 'INPUT - Archivo de Asientos Contables Aprobados (A';
COMMENT ON COLUMN INPUT.numero_del_lote IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN INPUT.numero_del_lote IS 'Numero del lote';
LABEL ON COLUMN INPUT.numero_del_lote TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN INPUT.secuencia_dentro_del_lote IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN INPUT.secuencia_dentro_del_lote IS 'Secuencia dentro del';
LABEL ON COLUMN INPUT.secuencia_dentro_del_lote TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN INPUT.descripcion_cuenta IS
  'Descripcion de la cuenta contable';
LABEL ON COLUMN INPUT.descripcion_cuenta IS 'Desc Cuenta';
LABEL ON COLUMN INPUT.descripcion_cuenta TEXT IS
  'Descripcion de la cuenta contable';
COMMENT ON COLUMN INPUT.naturaleza_cuenta IS
  'Naturaleza de la cuenta: deudora o acreedora';
LABEL ON COLUMN INPUT.naturaleza_cuenta IS 'Naturaleza';
LABEL ON COLUMN INPUT.naturaleza_cuenta TEXT IS
  'Naturaleza de la cuenta: deudora o acreedora';
COMMENT ON COLUMN INPUT.nivel_cuenta IS
  'Nivel jerarquico de la cuenta contable';
LABEL ON COLUMN INPUT.nivel_cuenta IS 'Nivel Cuenta';
LABEL ON COLUMN INPUT.nivel_cuenta TEXT IS
  'Nivel jerarquico de la cuenta contable';
COMMENT ON COLUMN INPUT.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN INPUT.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN INPUT.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN INPUT.fecha_proceso_sistema IS
  'Fecha y hora de procesamiento en el sistema';
LABEL ON COLUMN INPUT.fecha_proceso_sistema IS 'Fecha Proceso';
LABEL ON COLUMN INPUT.fecha_proceso_sistema TEXT IS
  'Fecha y hora de procesamiento en el sistema';
COMMENT ON COLUMN INPUT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN INPUT.observaciones IS 'Observaciones';
LABEL ON COLUMN INPUT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN INPUT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN INPUT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN INPUT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN INPUT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN INPUT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN INPUT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN INPUT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN INPUT.version_registro IS 'Version';
LABEL ON COLUMN INPUT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN INPUT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN INPUT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN INPUT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN INPUT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN INPUT.created_at IS 'Creado';
LABEL ON COLUMN INPUT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN INPUT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN INPUT.updated_at IS 'Actualizado';
LABEL ON COLUMN INPUT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_input_pk;
CREATE INDEX idx_input_pk ON INPUT (numero_del_lote, secuencia_dentro_del_lote);
DROP INDEX IF EXISTS idx_input_created_at;
CREATE INDEX idx_input_created_at ON INPUT (created_at);

--==============================================================================
-- Nombre de la Tabla: GLBLN
-- DESCRIPCION: Balances Generales
-- Objetivo: Soportar consulta de balances generales y conciliacion de cuentas
-- mayores para reporteria JSON.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de balances generales
-- Restricciones: Clave reportada: Banco, Sucursal, Moneda, Cuenta Contable
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE GLBLN (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    cuenta_contable FOR COLUMN CUCO VARCHAR(24),
    descripcion_cuenta FOR COLUMN DECU VARCHAR(120),
    naturaleza_cuenta FOR COLUMN NACU VARCHAR(20),
    nivel_cuenta FOR COLUMN NICU VARCHAR(50),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    fecha_proceso_sistema FOR COLUMN FEPRSI TIMESTAMP,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_glbln PRIMARY KEY (codigo_banco, codigo_sucursal
      , codigo_moneda, cuenta_contable)
) RCDFMT GLBLNR;

COMMENT ON TABLE GLBLN IS 'Balances Generales';
LABEL ON TABLE GLBLN IS 'GLBLN - Balances Generales';
COMMENT ON COLUMN GLBLN.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN GLBLN.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN GLBLN.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN GLBLN.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN GLBLN.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN GLBLN.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN GLBLN.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN GLBLN.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN GLBLN.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN GLBLN.cuenta_contable IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN GLBLN.cuenta_contable IS 'Cta Contable';
LABEL ON COLUMN GLBLN.cuenta_contable TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN GLBLN.descripcion_cuenta IS
  'Descripcion de la cuenta contable';
LABEL ON COLUMN GLBLN.descripcion_cuenta IS 'Desc Cuenta';
LABEL ON COLUMN GLBLN.descripcion_cuenta TEXT IS
  'Descripcion de la cuenta contable';
COMMENT ON COLUMN GLBLN.naturaleza_cuenta IS
  'Naturaleza de la cuenta: deudora o acreedora';
LABEL ON COLUMN GLBLN.naturaleza_cuenta IS 'Naturaleza';
LABEL ON COLUMN GLBLN.naturaleza_cuenta TEXT IS
  'Naturaleza de la cuenta: deudora o acreedora';
COMMENT ON COLUMN GLBLN.nivel_cuenta IS
  'Nivel jerarquico de la cuenta contable';
LABEL ON COLUMN GLBLN.nivel_cuenta IS 'Nivel Cuenta';
LABEL ON COLUMN GLBLN.nivel_cuenta TEXT IS
  'Nivel jerarquico de la cuenta contable';
COMMENT ON COLUMN GLBLN.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN GLBLN.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN GLBLN.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN GLBLN.fecha_proceso_sistema IS
  'Fecha y hora de procesamiento en el sistema';
LABEL ON COLUMN GLBLN.fecha_proceso_sistema IS 'Fecha Proceso';
LABEL ON COLUMN GLBLN.fecha_proceso_sistema TEXT IS
  'Fecha y hora de procesamiento en el sistema';
COMMENT ON COLUMN GLBLN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN GLBLN.observaciones IS 'Observaciones';
LABEL ON COLUMN GLBLN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN GLBLN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN GLBLN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN GLBLN.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN GLBLN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN GLBLN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN GLBLN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN GLBLN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN GLBLN.version_registro IS 'Version';
LABEL ON COLUMN GLBLN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN GLBLN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN GLBLN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN GLBLN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN GLBLN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN GLBLN.created_at IS 'Creado';
LABEL ON COLUMN GLBLN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN GLBLN.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN GLBLN.updated_at IS 'Actualizado';
LABEL ON COLUMN GLBLN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_glbln_pk;
CREATE INDEX idx_glbln_pk ON GLBLN (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_glbln_created_at;
CREATE INDEX idx_glbln_created_at ON GLBLN (created_at);

--==============================================================================
-- Nombre de la Tabla: GLBSE
-- DESCRIPCION: Balances Generales Consolidado.
-- Objetivo: Persistir informacion funcional de balances generales consolidado
-- en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de balances generales
-- consolidado
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE GLBSE (
    id FOR COLUMN SID BIGINT,
    descripcion_cuenta FOR COLUMN DECU VARCHAR(120),
    naturaleza_cuenta FOR COLUMN NACU VARCHAR(20),
    nivel_cuenta FOR COLUMN NICU VARCHAR(50),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    fecha_proceso_sistema FOR COLUMN FEPRSI TIMESTAMP,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_glbse PRIMARY KEY (id)
) RCDFMT GLBSER;

COMMENT ON TABLE GLBSE IS 'Balances Generales Consolidado.';
LABEL ON TABLE GLBSE IS 'GLBSE - Balances Generales Consolidado.';
COMMENT ON COLUMN GLBSE.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN GLBSE.id IS 'Id';
LABEL ON COLUMN GLBSE.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN GLBSE.descripcion_cuenta IS
  'Descripcion de la cuenta contable';
LABEL ON COLUMN GLBSE.descripcion_cuenta IS 'Desc Cuenta';
LABEL ON COLUMN GLBSE.descripcion_cuenta TEXT IS
  'Descripcion de la cuenta contable';
COMMENT ON COLUMN GLBSE.naturaleza_cuenta IS
  'Naturaleza de la cuenta: deudora o acreedora';
LABEL ON COLUMN GLBSE.naturaleza_cuenta IS 'Naturaleza';
LABEL ON COLUMN GLBSE.naturaleza_cuenta TEXT IS
  'Naturaleza de la cuenta: deudora o acreedora';
COMMENT ON COLUMN GLBSE.nivel_cuenta IS
  'Nivel jerarquico de la cuenta contable';
LABEL ON COLUMN GLBSE.nivel_cuenta IS 'Nivel Cuenta';
LABEL ON COLUMN GLBSE.nivel_cuenta TEXT IS
  'Nivel jerarquico de la cuenta contable';
COMMENT ON COLUMN GLBSE.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN GLBSE.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN GLBSE.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN GLBSE.fecha_proceso_sistema IS
  'Fecha y hora de procesamiento en el sistema';
LABEL ON COLUMN GLBSE.fecha_proceso_sistema IS 'Fecha Proceso';
LABEL ON COLUMN GLBSE.fecha_proceso_sistema TEXT IS
  'Fecha y hora de procesamiento en el sistema';
COMMENT ON COLUMN GLBSE.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN GLBSE.observaciones IS 'Observaciones';
LABEL ON COLUMN GLBSE.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN GLBSE.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN GLBSE.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN GLBSE.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN GLBSE.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN GLBSE.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN GLBSE.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN GLBSE.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN GLBSE.version_registro IS 'Version';
LABEL ON COLUMN GLBSE.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN GLBSE.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN GLBSE.estado_registro IS 'Estado Reg';
LABEL ON COLUMN GLBSE.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN GLBSE.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN GLBSE.created_at IS 'Creado';
LABEL ON COLUMN GLBSE.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN GLBSE.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN GLBSE.updated_at IS 'Actualizado';
LABEL ON COLUMN GLBSE.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_glbse_pk;
CREATE INDEX idx_glbse_pk ON GLBSE (id);
DROP INDEX IF EXISTS idx_glbse_created_at;
CREATE INDEX idx_glbse_created_at ON GLBSE (created_at);

--==============================================================================
-- Nombre de la Tabla: GLFIN
-- DESCRIPCION: Estados Financieros por niveles.
-- Objetivo: Persistir informacion funcional de estados financieros por niveles
-- en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de estados financieros
-- por niveles
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE GLFIN (
    id FOR COLUMN SID BIGINT,
    descripcion_cuenta FOR COLUMN DECU VARCHAR(120),
    naturaleza_cuenta FOR COLUMN NACU VARCHAR(20),
    nivel_cuenta FOR COLUMN NICU VARCHAR(50),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    fecha_proceso_sistema FOR COLUMN FEPRSI TIMESTAMP,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_glfin PRIMARY KEY (id)
) RCDFMT GLFINR;

COMMENT ON TABLE GLFIN IS 'Estados Financieros por niveles.';
LABEL ON TABLE GLFIN IS 'GLFIN - Estados Financieros por niveles.';
COMMENT ON COLUMN GLFIN.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN GLFIN.id IS 'Id';
LABEL ON COLUMN GLFIN.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN GLFIN.descripcion_cuenta IS
  'Descripcion de la cuenta contable';
LABEL ON COLUMN GLFIN.descripcion_cuenta IS 'Desc Cuenta';
LABEL ON COLUMN GLFIN.descripcion_cuenta TEXT IS
  'Descripcion de la cuenta contable';
COMMENT ON COLUMN GLFIN.naturaleza_cuenta IS
  'Naturaleza de la cuenta: deudora o acreedora';
LABEL ON COLUMN GLFIN.naturaleza_cuenta IS 'Naturaleza';
LABEL ON COLUMN GLFIN.naturaleza_cuenta TEXT IS
  'Naturaleza de la cuenta: deudora o acreedora';
COMMENT ON COLUMN GLFIN.nivel_cuenta IS
  'Nivel jerarquico de la cuenta contable';
LABEL ON COLUMN GLFIN.nivel_cuenta IS 'Nivel Cuenta';
LABEL ON COLUMN GLFIN.nivel_cuenta TEXT IS
  'Nivel jerarquico de la cuenta contable';
COMMENT ON COLUMN GLFIN.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN GLFIN.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN GLFIN.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN GLFIN.fecha_proceso_sistema IS
  'Fecha y hora de procesamiento en el sistema';
LABEL ON COLUMN GLFIN.fecha_proceso_sistema IS 'Fecha Proceso';
LABEL ON COLUMN GLFIN.fecha_proceso_sistema TEXT IS
  'Fecha y hora de procesamiento en el sistema';
COMMENT ON COLUMN GLFIN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN GLFIN.observaciones IS 'Observaciones';
LABEL ON COLUMN GLFIN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN GLFIN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN GLFIN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN GLFIN.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN GLFIN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN GLFIN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN GLFIN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN GLFIN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN GLFIN.version_registro IS 'Version';
LABEL ON COLUMN GLFIN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN GLFIN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN GLFIN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN GLFIN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN GLFIN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN GLFIN.created_at IS 'Creado';
LABEL ON COLUMN GLFIN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN GLFIN.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN GLFIN.updated_at IS 'Actualizado';
LABEL ON COLUMN GLFIN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_glfin_pk;
CREATE INDEX idx_glfin_pk ON GLFIN (id);
DROP INDEX IF EXISTS idx_glfin_created_at;
CREATE INDEX idx_glfin_created_at ON GLFIN (created_at);

--==============================================================================
-- Nombre de la Tabla: CCDSC
-- DESCRIPCION: Maestros de Centros de Costos
-- Objetivo: Persistir informacion funcional de maestros de centros de costos en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestros de centros
-- de costos
-- Restricciones: Clave reportada: No especificada en documento
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CCDSC (
    id FOR COLUMN SID BIGINT,
    descripcion_cuenta FOR COLUMN DECU VARCHAR(120),
    naturaleza_cuenta FOR COLUMN NACU VARCHAR(20),
    nivel_cuenta FOR COLUMN NICU VARCHAR(50),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    fecha_proceso_sistema FOR COLUMN FEPRSI TIMESTAMP,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ccdsc PRIMARY KEY (id)
) RCDFMT CCDSCR;

COMMENT ON TABLE CCDSC IS 'Maestros de Centros de Costos';
LABEL ON TABLE CCDSC IS 'CCDSC - Maestros de Centros de Costos';
COMMENT ON COLUMN CCDSC.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN CCDSC.id IS 'Id';
LABEL ON COLUMN CCDSC.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN CCDSC.descripcion_cuenta IS
  'Descripcion de la cuenta contable';
LABEL ON COLUMN CCDSC.descripcion_cuenta IS 'Desc Cuenta';
LABEL ON COLUMN CCDSC.descripcion_cuenta TEXT IS
  'Descripcion de la cuenta contable';
COMMENT ON COLUMN CCDSC.naturaleza_cuenta IS
  'Naturaleza de la cuenta: deudora o acreedora';
LABEL ON COLUMN CCDSC.naturaleza_cuenta IS 'Naturaleza';
LABEL ON COLUMN CCDSC.naturaleza_cuenta TEXT IS
  'Naturaleza de la cuenta: deudora o acreedora';
COMMENT ON COLUMN CCDSC.nivel_cuenta IS
  'Nivel jerarquico de la cuenta contable';
LABEL ON COLUMN CCDSC.nivel_cuenta IS 'Nivel Cuenta';
LABEL ON COLUMN CCDSC.nivel_cuenta TEXT IS
  'Nivel jerarquico de la cuenta contable';
COMMENT ON COLUMN CCDSC.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN CCDSC.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN CCDSC.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN CCDSC.fecha_proceso_sistema IS
  'Fecha y hora de procesamiento en el sistema';
LABEL ON COLUMN CCDSC.fecha_proceso_sistema IS 'Fecha Proceso';
LABEL ON COLUMN CCDSC.fecha_proceso_sistema TEXT IS
  'Fecha y hora de procesamiento en el sistema';
COMMENT ON COLUMN CCDSC.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CCDSC.observaciones IS 'Observaciones';
LABEL ON COLUMN CCDSC.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CCDSC.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CCDSC.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CCDSC.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CCDSC.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CCDSC.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CCDSC.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CCDSC.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CCDSC.version_registro IS 'Version';
LABEL ON COLUMN CCDSC.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CCDSC.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CCDSC.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CCDSC.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CCDSC.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CCDSC.created_at IS 'Creado';
LABEL ON COLUMN CCDSC.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CCDSC.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CCDSC.updated_at IS 'Actualizado';
LABEL ON COLUMN CCDSC.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ccdsc_pk;
CREATE INDEX idx_ccdsc_pk ON CCDSC (id);
DROP INDEX IF EXISTS idx_ccdsc_created_at;
CREATE INDEX idx_ccdsc_created_at ON CCDSC (created_at);

--==============================================================================
-- Nombre de la Tabla: INPT2
-- DESCRIPCION: Entradas Contables Automáticas generadas en el fin de día.
-- Objetivo: Persistir informacion funcional de entradas contables automáticas
-- generadas en el fin de día en el entorno IBM i del taller.
-- Tipo de Tabla: Transaccional
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de entradas contables
-- automáticas generadas en el fin de día
-- Restricciones: Clave reportada: No tiene clave.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE INPT2 (
    id FOR COLUMN SID BIGINT,
    descripcion_cuenta FOR COLUMN DECU VARCHAR(120),
    naturaleza_cuenta FOR COLUMN NACU VARCHAR(20),
    nivel_cuenta FOR COLUMN NICU VARCHAR(50),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    fecha_proceso_sistema FOR COLUMN FEPRSI TIMESTAMP,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_inpt2 PRIMARY KEY (id)
) RCDFMT INPT2R;

COMMENT ON TABLE INPT2 IS
  'Entradas Contables Automáticas generadas en el fin de día.';
LABEL ON TABLE INPT2 IS 'INPT2 - Entradas Contables Automáticas generadas e';
COMMENT ON COLUMN INPT2.id IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN INPT2.id IS 'Id';
LABEL ON COLUMN INPT2.id TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN INPT2.descripcion_cuenta IS
  'Descripcion de la cuenta contable';
LABEL ON COLUMN INPT2.descripcion_cuenta IS 'Desc Cuenta';
LABEL ON COLUMN INPT2.descripcion_cuenta TEXT IS
  'Descripcion de la cuenta contable';
COMMENT ON COLUMN INPT2.naturaleza_cuenta IS
  'Naturaleza de la cuenta: deudora o acreedora';
LABEL ON COLUMN INPT2.naturaleza_cuenta IS 'Naturaleza';
LABEL ON COLUMN INPT2.naturaleza_cuenta TEXT IS
  'Naturaleza de la cuenta: deudora o acreedora';
COMMENT ON COLUMN INPT2.nivel_cuenta IS
  'Nivel jerarquico de la cuenta contable';
LABEL ON COLUMN INPT2.nivel_cuenta IS 'Nivel Cuenta';
LABEL ON COLUMN INPT2.nivel_cuenta TEXT IS
  'Nivel jerarquico de la cuenta contable';
COMMENT ON COLUMN INPT2.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN INPT2.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN INPT2.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN INPT2.fecha_proceso_sistema IS
  'Fecha y hora de procesamiento en el sistema';
LABEL ON COLUMN INPT2.fecha_proceso_sistema IS 'Fecha Proceso';
LABEL ON COLUMN INPT2.fecha_proceso_sistema TEXT IS
  'Fecha y hora de procesamiento en el sistema';
COMMENT ON COLUMN INPT2.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN INPT2.observaciones IS 'Observaciones';
LABEL ON COLUMN INPT2.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN INPT2.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN INPT2.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN INPT2.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN INPT2.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN INPT2.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN INPT2.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN INPT2.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN INPT2.version_registro IS 'Version';
LABEL ON COLUMN INPT2.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN INPT2.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN INPT2.estado_registro IS 'Estado Reg';
LABEL ON COLUMN INPT2.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN INPT2.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN INPT2.created_at IS 'Creado';
LABEL ON COLUMN INPT2.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN INPT2.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN INPT2.updated_at IS 'Actualizado';
LABEL ON COLUMN INPT2.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_inpt2_pk;
CREATE INDEX idx_inpt2_pk ON INPT2 (id);
DROP INDEX IF EXISTS idx_inpt2_created_at;
CREATE INDEX idx_inpt2_created_at ON INPT2 (created_at);

--==============================================================================
-- Nombre de la Tabla: NXINP
-- DESCRIPCION: Transacciones Contables del próximo día.
-- Objetivo: Persistir informacion funcional de transacciones contables del
-- próximo día en el entorno IBM i del taller.
-- Tipo de Tabla: Transaccional
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de transacciones
-- contables del próximo día
-- Restricciones: Clave reportada: Número de Batch, Secuencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE NXINP (
    numero_batch FOR COLUMN NUBA VARCHAR(30),
    secuencia FOR COLUMN SSECUE INT,
    descripcion_cuenta FOR COLUMN DECU VARCHAR(120),
    naturaleza_cuenta FOR COLUMN NACU VARCHAR(20),
    nivel_cuenta FOR COLUMN NICU VARCHAR(50),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    fecha_proceso_sistema FOR COLUMN FEPRSI TIMESTAMP,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_nxinp PRIMARY KEY (numero_batch, secuencia)
) RCDFMT NXINPR;

COMMENT ON TABLE NXINP IS 'Transacciones Contables del próximo día.';
LABEL ON TABLE NXINP IS 'NXINP - Transacciones Contables del próximo día.';
COMMENT ON COLUMN NXINP.numero_batch IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN NXINP.numero_batch IS 'Numero batch';
LABEL ON COLUMN NXINP.numero_batch TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN NXINP.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN NXINP.secuencia IS 'Secuencia';
LABEL ON COLUMN NXINP.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN NXINP.descripcion_cuenta IS
  'Descripcion de la cuenta contable';
LABEL ON COLUMN NXINP.descripcion_cuenta IS 'Desc Cuenta';
LABEL ON COLUMN NXINP.descripcion_cuenta TEXT IS
  'Descripcion de la cuenta contable';
COMMENT ON COLUMN NXINP.naturaleza_cuenta IS
  'Naturaleza de la cuenta: deudora o acreedora';
LABEL ON COLUMN NXINP.naturaleza_cuenta IS 'Naturaleza';
LABEL ON COLUMN NXINP.naturaleza_cuenta TEXT IS
  'Naturaleza de la cuenta: deudora o acreedora';
COMMENT ON COLUMN NXINP.nivel_cuenta IS
  'Nivel jerarquico de la cuenta contable';
LABEL ON COLUMN NXINP.nivel_cuenta IS 'Nivel Cuenta';
LABEL ON COLUMN NXINP.nivel_cuenta TEXT IS
  'Nivel jerarquico de la cuenta contable';
COMMENT ON COLUMN NXINP.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN NXINP.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN NXINP.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN NXINP.fecha_proceso_sistema IS
  'Fecha y hora de procesamiento en el sistema';
LABEL ON COLUMN NXINP.fecha_proceso_sistema IS 'Fecha Proceso';
LABEL ON COLUMN NXINP.fecha_proceso_sistema TEXT IS
  'Fecha y hora de procesamiento en el sistema';
COMMENT ON COLUMN NXINP.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN NXINP.observaciones IS 'Observaciones';
LABEL ON COLUMN NXINP.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN NXINP.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN NXINP.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN NXINP.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN NXINP.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN NXINP.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN NXINP.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN NXINP.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN NXINP.version_registro IS 'Version';
LABEL ON COLUMN NXINP.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN NXINP.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN NXINP.estado_registro IS 'Estado Reg';
LABEL ON COLUMN NXINP.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN NXINP.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN NXINP.created_at IS 'Creado';
LABEL ON COLUMN NXINP.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN NXINP.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN NXINP.updated_at IS 'Actualizado';
LABEL ON COLUMN NXINP.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_nxinp_pk;
CREATE INDEX idx_nxinp_pk ON NXINP (numero_batch, secuencia);
DROP INDEX IF EXISTS idx_nxinp_created_at;
CREATE INDEX idx_nxinp_created_at ON NXINP (created_at);

--==============================================================================
-- Nombre de la Tabla: BUMST
-- DESCRIPCION: Maestro de Presupuestos
-- Objetivo: Persistir informacion funcional de maestro de presupuestos en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de
-- presupuestos
-- Restricciones: Clave reportada: Banco, Sucursal, Moneda, Número de
-- Presupuesto, Centro de Costo.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE BUMST (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    numero_presupuesto FOR COLUMN NUPR VARCHAR(30),
    centro_costo FOR COLUMN CECO VARCHAR(50),
    descripcion_cuenta FOR COLUMN DECU VARCHAR(120),
    naturaleza_cuenta FOR COLUMN NACU VARCHAR(20),
    nivel_cuenta FOR COLUMN NICU VARCHAR(50),
    saldo_actual FOR COLUMN SAAC DECIMAL(18,2),
    fecha_proceso_sistema FOR COLUMN FEPRSI TIMESTAMP,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_bumst PRIMARY KEY (codigo_banco, codigo_sucursal
      , codigo_moneda, numero_presupuesto, centro_costo)
) RCDFMT BUMSTR;

COMMENT ON TABLE BUMST IS 'Maestro de Presupuestos';
LABEL ON TABLE BUMST IS 'BUMST - Maestro de Presupuestos';
COMMENT ON COLUMN BUMST.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BUMST.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN BUMST.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BUMST.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BUMST.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN BUMST.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BUMST.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BUMST.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN BUMST.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BUMST.numero_presupuesto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BUMST.numero_presupuesto IS 'Numero presupuesto';
LABEL ON COLUMN BUMST.numero_presupuesto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BUMST.centro_costo IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BUMST.centro_costo IS 'Centro costo';
LABEL ON COLUMN BUMST.centro_costo TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BUMST.descripcion_cuenta IS
  'Descripcion de la cuenta contable';
LABEL ON COLUMN BUMST.descripcion_cuenta IS 'Desc Cuenta';
LABEL ON COLUMN BUMST.descripcion_cuenta TEXT IS
  'Descripcion de la cuenta contable';
COMMENT ON COLUMN BUMST.naturaleza_cuenta IS
  'Naturaleza de la cuenta: deudora o acreedora';
LABEL ON COLUMN BUMST.naturaleza_cuenta IS 'Naturaleza';
LABEL ON COLUMN BUMST.naturaleza_cuenta TEXT IS
  'Naturaleza de la cuenta: deudora o acreedora';
COMMENT ON COLUMN BUMST.nivel_cuenta IS
  'Nivel jerarquico de la cuenta contable';
LABEL ON COLUMN BUMST.nivel_cuenta IS 'Nivel Cuenta';
LABEL ON COLUMN BUMST.nivel_cuenta TEXT IS
  'Nivel jerarquico de la cuenta contable';
COMMENT ON COLUMN BUMST.saldo_actual IS 'Saldo actual de la cuenta o registro';
LABEL ON COLUMN BUMST.saldo_actual IS 'Saldo Actual';
LABEL ON COLUMN BUMST.saldo_actual TEXT IS
  'Saldo actual de la cuenta o registro';
COMMENT ON COLUMN BUMST.fecha_proceso_sistema IS
  'Fecha y hora de procesamiento en el sistema';
LABEL ON COLUMN BUMST.fecha_proceso_sistema IS 'Fecha Proceso';
LABEL ON COLUMN BUMST.fecha_proceso_sistema TEXT IS
  'Fecha y hora de procesamiento en el sistema';
COMMENT ON COLUMN BUMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN BUMST.observaciones IS 'Observaciones';
LABEL ON COLUMN BUMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN BUMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN BUMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN BUMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN BUMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN BUMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN BUMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN BUMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN BUMST.version_registro IS 'Version';
LABEL ON COLUMN BUMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN BUMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN BUMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN BUMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN BUMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN BUMST.created_at IS 'Creado';
LABEL ON COLUMN BUMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN BUMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN BUMST.updated_at IS 'Actualizado';
LABEL ON COLUMN BUMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_bumst_pk;
CREATE INDEX idx_bumst_pk ON BUMST (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_bumst_created_at;
CREATE INDEX idx_bumst_created_at ON BUMST (created_at);

--==============================================================================
-- Nombre de la Tabla: ROCOL
-- DESCRIPCION: Maestro de Garantías
-- Objetivo: Persistir informacion funcional de maestro de garantías en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de
-- garantías
-- Restricciones: Clave reportada: Banco, Cliente, Número de Garantía.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE ROCOL (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    numero_garantia FOR COLUMN NUGA VARCHAR(30),
    tipo_garantia FOR COLUMN TIGA VARCHAR(20),
    valor_garantia FOR COLUMN VAGA DECIMAL(18,2),
    fecha_avaluo FOR COLUMN FEAV DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    estado_garantia FOR COLUMN ESGA VARCHAR(20),
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_rocol PRIMARY KEY (codigo_banco, id_cliente, numero_garantia)
) RCDFMT ROCOLR;

COMMENT ON TABLE ROCOL IS 'Maestro de Garantías';
LABEL ON TABLE ROCOL IS 'ROCOL - Maestro de Garantías';
COMMENT ON COLUMN ROCOL.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN ROCOL.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN ROCOL.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN ROCOL.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN ROCOL.id_cliente IS 'Id Cliente';
LABEL ON COLUMN ROCOL.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN ROCOL.numero_garantia IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN ROCOL.numero_garantia IS 'Numero garantia';
LABEL ON COLUMN ROCOL.numero_garantia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN ROCOL.tipo_garantia IS
  'Campo Tipo garantia de maestro de garantías';
LABEL ON COLUMN ROCOL.tipo_garantia IS 'Tipo garantia';
LABEL ON COLUMN ROCOL.tipo_garantia TEXT IS
  'Campo Tipo garantia de maestro de garantías';
COMMENT ON COLUMN ROCOL.valor_garantia IS
  'Campo Valor garantia de maestro de garantías';
LABEL ON COLUMN ROCOL.valor_garantia IS 'Valor garantia';
LABEL ON COLUMN ROCOL.valor_garantia TEXT IS
  'Campo Valor garantia de maestro de garantías';
COMMENT ON COLUMN ROCOL.fecha_avaluo IS
  'Campo Fecha avaluo de maestro de garantías';
LABEL ON COLUMN ROCOL.fecha_avaluo IS 'Fecha avaluo';
LABEL ON COLUMN ROCOL.fecha_avaluo TEXT IS
  'Campo Fecha avaluo de maestro de garantías';
COMMENT ON COLUMN ROCOL.fecha_vencimiento IS
  'Campo Fecha vencimiento de maestro de garantías';
LABEL ON COLUMN ROCOL.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN ROCOL.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de maestro de garantías';
COMMENT ON COLUMN ROCOL.estado_garantia IS
  'Campo Estado garantia de maestro de garantías';
LABEL ON COLUMN ROCOL.estado_garantia IS 'Estado garantia';
LABEL ON COLUMN ROCOL.estado_garantia TEXT IS
  'Campo Estado garantia de maestro de garantías';
COMMENT ON COLUMN ROCOL.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN ROCOL.observaciones IS 'Observaciones';
LABEL ON COLUMN ROCOL.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN ROCOL.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN ROCOL.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN ROCOL.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN ROCOL.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN ROCOL.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN ROCOL.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN ROCOL.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN ROCOL.version_registro IS 'Version';
LABEL ON COLUMN ROCOL.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN ROCOL.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN ROCOL.estado_registro IS 'Estado Reg';
LABEL ON COLUMN ROCOL.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN ROCOL.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN ROCOL.created_at IS 'Creado';
LABEL ON COLUMN ROCOL.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN ROCOL.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN ROCOL.updated_at IS 'Actualizado';
LABEL ON COLUMN ROCOL.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_rocol_pk;
CREATE INDEX idx_rocol_pk ON ROCOL (codigo_banco, id_cliente);
DROP INDEX IF EXISTS idx_rocol_created_at;
CREATE INDEX idx_rocol_created_at ON ROCOL (created_at);

--==============================================================================
-- Nombre de la Tabla: RCOLL
-- DESCRIPCION: Relaciones entre Garantías
-- Objetivo: Persistir informacion funcional de relaciones entre garantías en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de relaciones entre
-- garantías
-- Restricciones: Clave reportada: Banco, Cuenta a Garantizar, Cuenta que
-- Garantiza.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE RCOLL (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    cuenta_a_garantizar FOR COLUMN CUAGA VARCHAR(50),
    cuenta_que_garantiza FOR COLUMN CUQUGA VARCHAR(50),
    tipo_garantia FOR COLUMN TIGA VARCHAR(20),
    valor_garantia FOR COLUMN VAGA DECIMAL(18,2),
    fecha_avaluo FOR COLUMN FEAV DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    estado_garantia FOR COLUMN ESGA VARCHAR(20),
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_rcoll PRIMARY KEY (codigo_banco, cuenta_a_garantizar
      , cuenta_que_garantiza)
) RCDFMT RCOLLR;

COMMENT ON TABLE RCOLL IS 'Relaciones entre Garantías';
LABEL ON TABLE RCOLL IS 'RCOLL - Relaciones entre Garantías';
COMMENT ON COLUMN RCOLL.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RCOLL.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN RCOLL.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RCOLL.cuenta_a_garantizar IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RCOLL.cuenta_a_garantizar IS 'Cuenta a garantizar';
LABEL ON COLUMN RCOLL.cuenta_a_garantizar TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RCOLL.cuenta_que_garantiza IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN RCOLL.cuenta_que_garantiza IS 'Cuenta que garantiza';
LABEL ON COLUMN RCOLL.cuenta_que_garantiza TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN RCOLL.tipo_garantia IS
  'Campo Tipo garantia de relaciones entre garantías';
LABEL ON COLUMN RCOLL.tipo_garantia IS 'Tipo garantia';
LABEL ON COLUMN RCOLL.tipo_garantia TEXT IS
  'Campo Tipo garantia de relaciones entre garantías';
COMMENT ON COLUMN RCOLL.valor_garantia IS
  'Campo Valor garantia de relaciones entre garantías';
LABEL ON COLUMN RCOLL.valor_garantia IS 'Valor garantia';
LABEL ON COLUMN RCOLL.valor_garantia TEXT IS
  'Campo Valor garantia de relaciones entre garantías';
COMMENT ON COLUMN RCOLL.fecha_avaluo IS
  'Campo Fecha avaluo de relaciones entre garantías';
LABEL ON COLUMN RCOLL.fecha_avaluo IS 'Fecha avaluo';
LABEL ON COLUMN RCOLL.fecha_avaluo TEXT IS
  'Campo Fecha avaluo de relaciones entre garantías';
COMMENT ON COLUMN RCOLL.fecha_vencimiento IS
  'Campo Fecha vencimiento de relaciones entre garantías';
LABEL ON COLUMN RCOLL.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN RCOLL.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de relaciones entre garant';
COMMENT ON COLUMN RCOLL.estado_garantia IS
  'Campo Estado garantia de relaciones entre garantías';
LABEL ON COLUMN RCOLL.estado_garantia IS 'Estado garantia';
LABEL ON COLUMN RCOLL.estado_garantia TEXT IS
  'Campo Estado garantia de relaciones entre garantía';
COMMENT ON COLUMN RCOLL.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN RCOLL.observaciones IS 'Observaciones';
LABEL ON COLUMN RCOLL.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN RCOLL.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN RCOLL.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN RCOLL.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN RCOLL.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN RCOLL.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN RCOLL.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN RCOLL.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN RCOLL.version_registro IS 'Version';
LABEL ON COLUMN RCOLL.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN RCOLL.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN RCOLL.estado_registro IS 'Estado Reg';
LABEL ON COLUMN RCOLL.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN RCOLL.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN RCOLL.created_at IS 'Creado';
LABEL ON COLUMN RCOLL.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN RCOLL.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN RCOLL.updated_at IS 'Actualizado';
LABEL ON COLUMN RCOLL.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_rcoll_pk;
CREATE INDEX idx_rcoll_pk ON RCOLL (codigo_banco, cuenta_a_garantizar);
DROP INDEX IF EXISTS idx_rcoll_created_at;
CREATE INDEX idx_rcoll_created_at ON RCOLL (created_at);

--==============================================================================
-- Nombre de la Tabla: LNECR
-- DESCRIPCION: Maestro de Lineas de Crédito
-- Objetivo: Persistir informacion funcional de maestro de lineas de crédito en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de lineas de
-- crédito
-- Restricciones: Clave reportada: Cliente, Número de Línea.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LNECR (
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    numero_linea FOR COLUMN NULI VARCHAR(30),
    fecha_aprobacion FOR COLUMN FEAP DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    monto_aprobado FOR COLUMN MOAP DECIMAL(18,2),
    monto_utilizado FOR COLUMN MOUT DECIMAL(18,2),
    monto_disponible FOR COLUMN MODI DECIMAL(18,2),
    estado_linea FOR COLUMN ESLI VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_lnecr PRIMARY KEY (id_cliente, numero_linea)
) RCDFMT LNECRR;

COMMENT ON TABLE LNECR IS 'Maestro de Lineas de Crédito';
LABEL ON TABLE LNECR IS 'LNECR - Maestro de Lineas de Crédito';
COMMENT ON COLUMN LNECR.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN LNECR.id_cliente IS 'Id Cliente';
LABEL ON COLUMN LNECR.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LNECR.numero_linea IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LNECR.numero_linea IS 'Numero linea';
LABEL ON COLUMN LNECR.numero_linea TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LNECR.fecha_aprobacion IS
  'Campo Fecha aprobacion de maestro de lineas de crédito';
LABEL ON COLUMN LNECR.fecha_aprobacion IS 'Fecha aprobacion';
LABEL ON COLUMN LNECR.fecha_aprobacion TEXT IS
  'Campo Fecha aprobacion de maestro de lineas de cré';
COMMENT ON COLUMN LNECR.fecha_vencimiento IS
  'Campo Fecha vencimiento de maestro de lineas de crédito';
LABEL ON COLUMN LNECR.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN LNECR.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de maestro de lineas de cr';
COMMENT ON COLUMN LNECR.monto_aprobado IS
  'Campo Monto aprobado de maestro de lineas de crédito';
LABEL ON COLUMN LNECR.monto_aprobado IS 'Monto aprobado';
LABEL ON COLUMN LNECR.monto_aprobado TEXT IS
  'Campo Monto aprobado de maestro de lineas de crédi';
COMMENT ON COLUMN LNECR.monto_utilizado IS
  'Campo Monto utilizado de maestro de lineas de crédito';
LABEL ON COLUMN LNECR.monto_utilizado IS 'Monto utilizado';
LABEL ON COLUMN LNECR.monto_utilizado TEXT IS
  'Campo Monto utilizado de maestro de lineas de créd';
COMMENT ON COLUMN LNECR.monto_disponible IS
  'Campo Monto disponible de maestro de lineas de crédito';
LABEL ON COLUMN LNECR.monto_disponible IS 'Monto disponible';
LABEL ON COLUMN LNECR.monto_disponible TEXT IS
  'Campo Monto disponible de maestro de lineas de cré';
COMMENT ON COLUMN LNECR.estado_linea IS
  'Campo Estado linea de maestro de lineas de crédito';
LABEL ON COLUMN LNECR.estado_linea IS 'Estado linea';
LABEL ON COLUMN LNECR.estado_linea TEXT IS
  'Campo Estado linea de maestro de lineas de crédito';
COMMENT ON COLUMN LNECR.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LNECR.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LNECR.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LNECR.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LNECR.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LNECR.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LNECR.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LNECR.version_registro IS 'Version';
LABEL ON COLUMN LNECR.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LNECR.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LNECR.observaciones IS 'Observaciones';
LABEL ON COLUMN LNECR.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LNECR.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LNECR.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LNECR.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LNECR.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LNECR.created_at IS 'Creado';
LABEL ON COLUMN LNECR.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LNECR.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LNECR.updated_at IS 'Actualizado';
LABEL ON COLUMN LNECR.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_lnecr_pk;
CREATE INDEX idx_lnecr_pk ON LNECR (id_cliente, numero_linea);
DROP INDEX IF EXISTS idx_lnecr_created_at;
CREATE INDEX idx_lnecr_created_at ON LNECR (created_at);

--==============================================================================
-- Nombre de la Tabla: FIXMS
-- DESCRIPCION: Maestro de Activos Fijos
-- Objetivo: Persistir informacion funcional de maestro de activos fijos en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de activos
-- fijos
-- Restricciones: Clave reportada: Número de Activo.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE FIXMS (
    numero_activo FOR COLUMN NUAC VARCHAR(30),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    fecha_adquisicion FOR COLUMN FEAD DATE,
    valor_adquisicion FOR COLUMN VAAD DECIMAL(18,2),
    vida_util_meses FOR COLUMN VIUTME INT,
    depreciacion_acumulada FOR COLUMN DEAC DECIMAL(18,2),
    estado_activo FOR COLUMN ESAC VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_fixms PRIMARY KEY (numero_activo)
) RCDFMT FIXMSR;

COMMENT ON TABLE FIXMS IS 'Maestro de Activos Fijos';
LABEL ON TABLE FIXMS IS 'FIXMS - Maestro de Activos Fijos';
COMMENT ON COLUMN FIXMS.numero_activo IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN FIXMS.numero_activo IS 'Numero activo';
LABEL ON COLUMN FIXMS.numero_activo TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN FIXMS.descripcion IS
  'Campo Descripcion de maestro de activos fijos';
LABEL ON COLUMN FIXMS.descripcion IS 'Descripcion';
LABEL ON COLUMN FIXMS.descripcion TEXT IS
  'Campo Descripcion de maestro de activos fijos';
COMMENT ON COLUMN FIXMS.fecha_adquisicion IS
  'Campo Fecha adquisicion de maestro de activos fijos';
LABEL ON COLUMN FIXMS.fecha_adquisicion IS 'Fecha adquisicion';
LABEL ON COLUMN FIXMS.fecha_adquisicion TEXT IS
  'Campo Fecha adquisicion de maestro de activos fijo';
COMMENT ON COLUMN FIXMS.valor_adquisicion IS
  'Campo Valor adquisicion de maestro de activos fijos';
LABEL ON COLUMN FIXMS.valor_adquisicion IS 'Valor adquisicion';
LABEL ON COLUMN FIXMS.valor_adquisicion TEXT IS
  'Campo Valor adquisicion de maestro de activos fijo';
COMMENT ON COLUMN FIXMS.vida_util_meses IS
  'Campo Vida util meses de maestro de activos fijos';
LABEL ON COLUMN FIXMS.vida_util_meses IS 'Vida util meses';
LABEL ON COLUMN FIXMS.vida_util_meses TEXT IS
  'Campo Vida util meses de maestro de activos fijos';
COMMENT ON COLUMN FIXMS.depreciacion_acumulada IS
  'Campo Depreciacion acumulada de maestro de activos fijos';
LABEL ON COLUMN FIXMS.depreciacion_acumulada IS 'Depreciacion acumula';
LABEL ON COLUMN FIXMS.depreciacion_acumulada TEXT IS
  'Campo Depreciacion acumulada de maestro de activos';
COMMENT ON COLUMN FIXMS.estado_activo IS
  'Campo Estado activo de maestro de activos fijos';
LABEL ON COLUMN FIXMS.estado_activo IS 'Estado activo';
LABEL ON COLUMN FIXMS.estado_activo TEXT IS
  'Campo Estado activo de maestro de activos fijos';
COMMENT ON COLUMN FIXMS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN FIXMS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN FIXMS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN FIXMS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN FIXMS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN FIXMS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN FIXMS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN FIXMS.version_registro IS 'Version';
LABEL ON COLUMN FIXMS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN FIXMS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN FIXMS.observaciones IS 'Observaciones';
LABEL ON COLUMN FIXMS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN FIXMS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN FIXMS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN FIXMS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN FIXMS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN FIXMS.created_at IS 'Creado';
LABEL ON COLUMN FIXMS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN FIXMS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN FIXMS.updated_at IS 'Actualizado';
LABEL ON COLUMN FIXMS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_fixms_pk;
CREATE INDEX idx_fixms_pk ON FIXMS (numero_activo);
DROP INDEX IF EXISTS idx_fixms_created_at;
CREATE INDEX idx_fixms_created_at ON FIXMS (created_at);

--==============================================================================
-- Nombre de la Tabla: CLSMS
-- DESCRIPCION: Maestro de Clases de Amortizaciones de Activos Fijos
-- Objetivo: Persistir informacion funcional de maestro de clases de
-- amortizaciones de activos fijos en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de clases de
-- amortizaciones de activos fijos
-- Restricciones: Clave reportada: Código de Clase.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CLSMS (
    codigo_clase FOR COLUMN COCL VARCHAR(20),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    fecha_adquisicion FOR COLUMN FEAD DATE,
    valor_adquisicion FOR COLUMN VAAD DECIMAL(18,2),
    vida_util_meses FOR COLUMN VIUTME INT,
    depreciacion_acumulada FOR COLUMN DEAC DECIMAL(18,2),
    estado_activo FOR COLUMN ESAC VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_clsms PRIMARY KEY (codigo_clase)
) RCDFMT CLSMSR;

COMMENT ON TABLE CLSMS IS
  'Maestro de Clases de Amortizaciones de Activos Fijos';
LABEL ON TABLE CLSMS IS 'CLSMS - Maestro de Clases de Amortizaciones de Act';
COMMENT ON COLUMN CLSMS.codigo_clase IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CLSMS.codigo_clase IS 'Codigo clase';
LABEL ON COLUMN CLSMS.codigo_clase TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CLSMS.descripcion IS
  'Campo Descripcion de maestro de clases de amortizaciones de activos fijos';
LABEL ON COLUMN CLSMS.descripcion IS 'Descripcion';
LABEL ON COLUMN CLSMS.descripcion TEXT IS
  'Campo Descripcion de maestro de clases de amortiza';
COMMENT ON COLUMN CLSMS.fecha_adquisicion IS
  'Campo Fecha adquisicion de maestro de clases de amortizaciones de activos fi'
  'jos';
LABEL ON COLUMN CLSMS.fecha_adquisicion IS 'Fecha adquisicion';
LABEL ON COLUMN CLSMS.fecha_adquisicion TEXT IS
  'Campo Fecha adquisicion de maestro de clases de am';
COMMENT ON COLUMN CLSMS.valor_adquisicion IS
  'Campo Valor adquisicion de maestro de clases de amortizaciones de activos fi'
  'jos';
LABEL ON COLUMN CLSMS.valor_adquisicion IS 'Valor adquisicion';
LABEL ON COLUMN CLSMS.valor_adquisicion TEXT IS
  'Campo Valor adquisicion de maestro de clases de am';
COMMENT ON COLUMN CLSMS.vida_util_meses IS
  'Campo Vida util meses de maestro de clases de amortizaciones de activos fijo'
  's';
LABEL ON COLUMN CLSMS.vida_util_meses IS 'Vida util meses';
LABEL ON COLUMN CLSMS.vida_util_meses TEXT IS
  'Campo Vida util meses de maestro de clases de amor';
COMMENT ON COLUMN CLSMS.depreciacion_acumulada IS
  'Campo Depreciacion acumulada de maestro de clases de amortizaciones de activ'
  'os fijos';
LABEL ON COLUMN CLSMS.depreciacion_acumulada IS 'Depreciacion acumula';
LABEL ON COLUMN CLSMS.depreciacion_acumulada TEXT IS
  'Campo Depreciacion acumulada de maestro de clases';
COMMENT ON COLUMN CLSMS.estado_activo IS
  'Campo Estado activo de maestro de clases de amortizaciones de activos fijos';
LABEL ON COLUMN CLSMS.estado_activo IS 'Estado activo';
LABEL ON COLUMN CLSMS.estado_activo TEXT IS
  'Campo Estado activo de maestro de clases de amorti';
COMMENT ON COLUMN CLSMS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CLSMS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CLSMS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN CLSMS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CLSMS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CLSMS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CLSMS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CLSMS.version_registro IS 'Version';
LABEL ON COLUMN CLSMS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CLSMS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CLSMS.observaciones IS 'Observaciones';
LABEL ON COLUMN CLSMS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CLSMS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CLSMS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CLSMS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CLSMS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CLSMS.created_at IS 'Creado';
LABEL ON COLUMN CLSMS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CLSMS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CLSMS.updated_at IS 'Actualizado';
LABEL ON COLUMN CLSMS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_clsms_pk;
CREATE INDEX idx_clsms_pk ON CLSMS (codigo_clase);
DROP INDEX IF EXISTS idx_clsms_created_at;
CREATE INDEX idx_clsms_created_at ON CLSMS (created_at);

--==============================================================================
-- Nombre de la Tabla: LOCMS
-- DESCRIPCION: Maestro de Localizaciones de Activos Fijos
-- Objetivo: Persistir informacion funcional de maestro de localizaciones de
-- activos fijos en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de
-- localizaciones de activos fijos
-- Restricciones: Clave reportada: Número de Localización.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LOCMS (
    numero_localizacion FOR COLUMN NULO VARCHAR(30),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    fecha_adquisicion FOR COLUMN FEAD DATE,
    valor_adquisicion FOR COLUMN VAAD DECIMAL(18,2),
    vida_util_meses FOR COLUMN VIUTME INT,
    depreciacion_acumulada FOR COLUMN DEAC DECIMAL(18,2),
    estado_activo FOR COLUMN ESAC VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_locms PRIMARY KEY (numero_localizacion)
) RCDFMT LOCMSR;

COMMENT ON TABLE LOCMS IS 'Maestro de Localizaciones de Activos Fijos';
LABEL ON TABLE LOCMS IS 'LOCMS - Maestro de Localizaciones de Activos Fijos';
COMMENT ON COLUMN LOCMS.numero_localizacion IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN LOCMS.numero_localizacion IS 'Numero localizacion';
LABEL ON COLUMN LOCMS.numero_localizacion TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LOCMS.descripcion IS
  'Campo Descripcion de maestro de localizaciones de activos fijos';
LABEL ON COLUMN LOCMS.descripcion IS 'Descripcion';
LABEL ON COLUMN LOCMS.descripcion TEXT IS
  'Campo Descripcion de maestro de localizaciones de';
COMMENT ON COLUMN LOCMS.fecha_adquisicion IS
  'Campo Fecha adquisicion de maestro de localizaciones de activos fijos';
LABEL ON COLUMN LOCMS.fecha_adquisicion IS 'Fecha adquisicion';
LABEL ON COLUMN LOCMS.fecha_adquisicion TEXT IS
  'Campo Fecha adquisicion de maestro de localizacion';
COMMENT ON COLUMN LOCMS.valor_adquisicion IS
  'Campo Valor adquisicion de maestro de localizaciones de activos fijos';
LABEL ON COLUMN LOCMS.valor_adquisicion IS 'Valor adquisicion';
LABEL ON COLUMN LOCMS.valor_adquisicion TEXT IS
  'Campo Valor adquisicion de maestro de localizacion';
COMMENT ON COLUMN LOCMS.vida_util_meses IS
  'Campo Vida util meses de maestro de localizaciones de activos fijos';
LABEL ON COLUMN LOCMS.vida_util_meses IS 'Vida util meses';
LABEL ON COLUMN LOCMS.vida_util_meses TEXT IS
  'Campo Vida util meses de maestro de localizaciones';
COMMENT ON COLUMN LOCMS.depreciacion_acumulada IS
  'Campo Depreciacion acumulada de maestro de localizaciones de activos fijos';
LABEL ON COLUMN LOCMS.depreciacion_acumulada IS 'Depreciacion acumula';
LABEL ON COLUMN LOCMS.depreciacion_acumulada TEXT IS
  'Campo Depreciacion acumulada de maestro de localiz';
COMMENT ON COLUMN LOCMS.estado_activo IS
  'Campo Estado activo de maestro de localizaciones de activos fijos';
LABEL ON COLUMN LOCMS.estado_activo IS 'Estado activo';
LABEL ON COLUMN LOCMS.estado_activo TEXT IS
  'Campo Estado activo de maestro de localizaciones d';
COMMENT ON COLUMN LOCMS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LOCMS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LOCMS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LOCMS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LOCMS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LOCMS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LOCMS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LOCMS.version_registro IS 'Version';
LABEL ON COLUMN LOCMS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LOCMS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LOCMS.observaciones IS 'Observaciones';
LABEL ON COLUMN LOCMS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LOCMS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LOCMS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LOCMS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LOCMS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LOCMS.created_at IS 'Creado';
LABEL ON COLUMN LOCMS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LOCMS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LOCMS.updated_at IS 'Actualizado';
LABEL ON COLUMN LOCMS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_locms_pk;
CREATE INDEX idx_locms_pk ON LOCMS (numero_localizacion);
DROP INDEX IF EXISTS idx_locms_created_at;
CREATE INDEX idx_locms_created_at ON LOCMS (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLFIX
-- DESCRIPCION: Archivo de Control de Activos Fijos.
-- Objetivo: Persistir informacion funcional de archivo de control de activos
-- fijos en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de control
-- de activos fijos
-- Restricciones: Clave reportada: Banco.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLFIX (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    descripcion FOR COLUMN SDESCR VARCHAR(120),
    fecha_adquisicion FOR COLUMN FEAD DATE,
    valor_adquisicion FOR COLUMN VAAD DECIMAL(18,2),
    vida_util_meses FOR COLUMN VIUTME INT,
    depreciacion_acumulada FOR COLUMN DEAC DECIMAL(18,2),
    estado_activo FOR COLUMN ESAC VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlfix PRIMARY KEY (codigo_banco)
) RCDFMT CNTRLFIXR;

COMMENT ON TABLE CNTRLFIX IS 'Archivo de Control de Activos Fijos.';
LABEL ON TABLE CNTRLFIX IS 'CNTRLFIX - Archivo de Control de Activos Fijos.';
COMMENT ON COLUMN CNTRLFIX.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLFIX.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLFIX.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLFIX.descripcion IS
  'Campo Descripcion de archivo de control de activos fijos';
LABEL ON COLUMN CNTRLFIX.descripcion IS 'Descripcion';
LABEL ON COLUMN CNTRLFIX.descripcion TEXT IS
  'Campo Descripcion de archivo de control de activos';
COMMENT ON COLUMN CNTRLFIX.fecha_adquisicion IS
  'Campo Fecha adquisicion de archivo de control de activos fijos';
LABEL ON COLUMN CNTRLFIX.fecha_adquisicion IS 'Fecha adquisicion';
LABEL ON COLUMN CNTRLFIX.fecha_adquisicion TEXT IS
  'Campo Fecha adquisicion de archivo de control de a';
COMMENT ON COLUMN CNTRLFIX.valor_adquisicion IS
  'Campo Valor adquisicion de archivo de control de activos fijos';
LABEL ON COLUMN CNTRLFIX.valor_adquisicion IS 'Valor adquisicion';
LABEL ON COLUMN CNTRLFIX.valor_adquisicion TEXT IS
  'Campo Valor adquisicion de archivo de control de a';
COMMENT ON COLUMN CNTRLFIX.vida_util_meses IS
  'Campo Vida util meses de archivo de control de activos fijos';
LABEL ON COLUMN CNTRLFIX.vida_util_meses IS 'Vida util meses';
LABEL ON COLUMN CNTRLFIX.vida_util_meses TEXT IS
  'Campo Vida util meses de archivo de control de act';
COMMENT ON COLUMN CNTRLFIX.depreciacion_acumulada IS
  'Campo Depreciacion acumulada de archivo de control de activos fijos';
LABEL ON COLUMN CNTRLFIX.depreciacion_acumulada IS 'Depreciacion acumula';
LABEL ON COLUMN CNTRLFIX.depreciacion_acumulada TEXT IS
  'Campo Depreciacion acumulada de archivo de control';
COMMENT ON COLUMN CNTRLFIX.estado_activo IS
  'Campo Estado activo de archivo de control de activos fijos';
LABEL ON COLUMN CNTRLFIX.estado_activo IS 'Estado activo';
LABEL ON COLUMN CNTRLFIX.estado_activo TEXT IS
  'Campo Estado activo de archivo de control de activ';
COMMENT ON COLUMN CNTRLFIX.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLFIX.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLFIX.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLFIX.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLFIX.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLFIX.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLFIX.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLFIX.version_registro IS 'Version';
LABEL ON COLUMN CNTRLFIX.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLFIX.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLFIX.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLFIX.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLFIX.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLFIX.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLFIX.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLFIX.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLFIX.created_at IS 'Creado';
LABEL ON COLUMN CNTRLFIX.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLFIX.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLFIX.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLFIX.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlfix_pk;
CREATE INDEX idx_cntrlfix_pk ON CNTRLFIX (codigo_banco);
DROP INDEX IF EXISTS idx_cntrlfix_created_at;
CREATE INDEX idx_cntrlfix_created_at ON CNTRLFIX (created_at);

--==============================================================================
-- Nombre de la Tabla: BAVEN
-- DESCRIPCION: Maestro de Proveedores.
-- Objetivo: Persistir informacion funcional de maestro de proveedores en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de
-- proveedores
-- Restricciones: Clave reportada: Número de Proveedor.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE BAVEN (
    numero_proveedor FOR COLUMN NUPR VARCHAR(30),
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    razon_social FOR COLUMN RASO VARCHAR(80),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    estado_cxp FOR COLUMN ESCX VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_baven PRIMARY KEY (numero_proveedor)
) RCDFMT BAVENR;

COMMENT ON TABLE BAVEN IS 'Maestro de Proveedores.';
LABEL ON TABLE BAVEN IS 'BAVEN - Maestro de Proveedores.';
COMMENT ON COLUMN BAVEN.numero_proveedor IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAVEN.numero_proveedor IS 'Numero proveedor';
LABEL ON COLUMN BAVEN.numero_proveedor TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAVEN.numero_identificacion IS
  'Campo Numero identificacion de maestro de proveedores';
LABEL ON COLUMN BAVEN.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN BAVEN.numero_identificacion TEXT IS
  'Campo Numero identificacion de maestro de proveedo';
COMMENT ON COLUMN BAVEN.razon_social IS
  'Campo Razon social de maestro de proveedores';
LABEL ON COLUMN BAVEN.razon_social IS 'Razon social';
LABEL ON COLUMN BAVEN.razon_social TEXT IS
  'Campo Razon social de maestro de proveedores';
COMMENT ON COLUMN BAVEN.email IS 'Campo Email de maestro de proveedores';
LABEL ON COLUMN BAVEN.email IS 'Email';
LABEL ON COLUMN BAVEN.email TEXT IS 'Campo Email de maestro de proveedores';
COMMENT ON COLUMN BAVEN.telefono IS 'Campo Telefono de maestro de proveedores';
LABEL ON COLUMN BAVEN.telefono IS 'Telefono';
LABEL ON COLUMN BAVEN.telefono TEXT IS
  'Campo Telefono de maestro de proveedores';
COMMENT ON COLUMN BAVEN.monto_original IS
  'Campo Monto original de maestro de proveedores';
LABEL ON COLUMN BAVEN.monto_original IS 'Monto original';
LABEL ON COLUMN BAVEN.monto_original TEXT IS
  'Campo Monto original de maestro de proveedores';
COMMENT ON COLUMN BAVEN.saldo_pendiente IS
  'Campo Saldo pendiente de maestro de proveedores';
LABEL ON COLUMN BAVEN.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN BAVEN.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de maestro de proveedores';
COMMENT ON COLUMN BAVEN.fecha_emision IS
  'Campo Fecha emision de maestro de proveedores';
LABEL ON COLUMN BAVEN.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN BAVEN.fecha_emision TEXT IS
  'Campo Fecha emision de maestro de proveedores';
COMMENT ON COLUMN BAVEN.fecha_vencimiento IS
  'Campo Fecha vencimiento de maestro de proveedores';
LABEL ON COLUMN BAVEN.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN BAVEN.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de maestro de proveedores';
COMMENT ON COLUMN BAVEN.estado_cxp IS
  'Campo Estado cxp de maestro de proveedores';
LABEL ON COLUMN BAVEN.estado_cxp IS 'Estado cxp';
LABEL ON COLUMN BAVEN.estado_cxp TEXT IS
  'Campo Estado cxp de maestro de proveedores';
COMMENT ON COLUMN BAVEN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN BAVEN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN BAVEN.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN BAVEN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN BAVEN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN BAVEN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN BAVEN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN BAVEN.version_registro IS 'Version';
LABEL ON COLUMN BAVEN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN BAVEN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN BAVEN.observaciones IS 'Observaciones';
LABEL ON COLUMN BAVEN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN BAVEN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN BAVEN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN BAVEN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN BAVEN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN BAVEN.created_at IS 'Creado';
LABEL ON COLUMN BAVEN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN BAVEN.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN BAVEN.updated_at IS 'Actualizado';
LABEL ON COLUMN BAVEN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_baven_pk;
CREATE INDEX idx_baven_pk ON BAVEN (numero_proveedor);
DROP INDEX IF EXISTS idx_baven_created_at;
CREATE INDEX idx_baven_created_at ON BAVEN (created_at);

--==============================================================================
-- Nombre de la Tabla: BAPRC
-- DESCRIPCION: Maestro de Cuentas por Pagar
-- Objetivo: Persistir informacion funcional de maestro de cuentas por pagar en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de cuentas
-- por pagar
-- Restricciones: Clave reportada: Banco, Sucursal, Origen de la Cuenta, Tipo de
-- Cuenta, Cliente, Número de Referencia, Tipo de Registro.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE BAPRC (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    origen_cuenta FOR COLUMN ORCU VARCHAR(20),
    tipo_cuenta FOR COLUMN TICU VARCHAR(20),
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    numero_referencia FOR COLUMN NURE VARCHAR(30),
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    razon_social FOR COLUMN RASO VARCHAR(80),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    estado_cxp FOR COLUMN ESCX VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_baprc PRIMARY KEY (codigo_banco, codigo_sucursal
      , origen_cuenta, tipo_cuenta, id_cliente, numero_referencia
      , tipo_registro)
) RCDFMT BAPRCR;

COMMENT ON TABLE BAPRC IS 'Maestro de Cuentas por Pagar';
LABEL ON TABLE BAPRC IS 'BAPRC - Maestro de Cuentas por Pagar';
COMMENT ON COLUMN BAPRC.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAPRC.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN BAPRC.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAPRC.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAPRC.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN BAPRC.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAPRC.origen_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAPRC.origen_cuenta IS 'Origen cuenta';
LABEL ON COLUMN BAPRC.origen_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAPRC.tipo_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAPRC.tipo_cuenta IS 'Tipo cuenta';
LABEL ON COLUMN BAPRC.tipo_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAPRC.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN BAPRC.id_cliente IS 'Id Cliente';
LABEL ON COLUMN BAPRC.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAPRC.numero_referencia IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAPRC.numero_referencia IS 'Numero referencia';
LABEL ON COLUMN BAPRC.numero_referencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAPRC.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAPRC.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN BAPRC.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAPRC.numero_identificacion IS
  'Campo Numero identificacion de maestro de cuentas por pagar';
LABEL ON COLUMN BAPRC.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN BAPRC.numero_identificacion TEXT IS
  'Campo Numero identificacion de maestro de cuentas';
COMMENT ON COLUMN BAPRC.razon_social IS
  'Campo Razon social de maestro de cuentas por pagar';
LABEL ON COLUMN BAPRC.razon_social IS 'Razon social';
LABEL ON COLUMN BAPRC.razon_social TEXT IS
  'Campo Razon social de maestro de cuentas por pagar';
COMMENT ON COLUMN BAPRC.email IS 'Campo Email de maestro de cuentas por pagar';
LABEL ON COLUMN BAPRC.email IS 'Email';
LABEL ON COLUMN BAPRC.email TEXT IS
  'Campo Email de maestro de cuentas por pagar';
COMMENT ON COLUMN BAPRC.telefono IS
  'Campo Telefono de maestro de cuentas por pagar';
LABEL ON COLUMN BAPRC.telefono IS 'Telefono';
LABEL ON COLUMN BAPRC.telefono TEXT IS
  'Campo Telefono de maestro de cuentas por pagar';
COMMENT ON COLUMN BAPRC.monto_original IS
  'Campo Monto original de maestro de cuentas por pagar';
LABEL ON COLUMN BAPRC.monto_original IS 'Monto original';
LABEL ON COLUMN BAPRC.monto_original TEXT IS
  'Campo Monto original de maestro de cuentas por pag';
COMMENT ON COLUMN BAPRC.saldo_pendiente IS
  'Campo Saldo pendiente de maestro de cuentas por pagar';
LABEL ON COLUMN BAPRC.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN BAPRC.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de maestro de cuentas por pa';
COMMENT ON COLUMN BAPRC.fecha_emision IS
  'Campo Fecha emision de maestro de cuentas por pagar';
LABEL ON COLUMN BAPRC.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN BAPRC.fecha_emision TEXT IS
  'Campo Fecha emision de maestro de cuentas por paga';
COMMENT ON COLUMN BAPRC.fecha_vencimiento IS
  'Campo Fecha vencimiento de maestro de cuentas por pagar';
LABEL ON COLUMN BAPRC.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN BAPRC.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de maestro de cuentas por';
COMMENT ON COLUMN BAPRC.estado_cxp IS
  'Campo Estado cxp de maestro de cuentas por pagar';
LABEL ON COLUMN BAPRC.estado_cxp IS 'Estado cxp';
LABEL ON COLUMN BAPRC.estado_cxp TEXT IS
  'Campo Estado cxp de maestro de cuentas por pagar';
COMMENT ON COLUMN BAPRC.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN BAPRC.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN BAPRC.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN BAPRC.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN BAPRC.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN BAPRC.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN BAPRC.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN BAPRC.version_registro IS 'Version';
LABEL ON COLUMN BAPRC.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN BAPRC.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN BAPRC.observaciones IS 'Observaciones';
LABEL ON COLUMN BAPRC.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN BAPRC.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN BAPRC.estado_registro IS 'Estado Reg';
LABEL ON COLUMN BAPRC.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN BAPRC.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN BAPRC.created_at IS 'Creado';
LABEL ON COLUMN BAPRC.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN BAPRC.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN BAPRC.updated_at IS 'Actualizado';
LABEL ON COLUMN BAPRC.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_baprc_pk;
CREATE INDEX idx_baprc_pk ON BAPRC (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_baprc_created_at;
CREATE INDEX idx_baprc_created_at ON BAPRC (created_at);

--==============================================================================
-- Nombre de la Tabla: BAMOR
-- DESCRIPCION: Amortizaciones de Cuentas por Pagar
-- Objetivo: Persistir informacion funcional de amortizaciones de cuentas por
-- pagar en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de amortizaciones de
-- cuentas por pagar
-- Restricciones: Clave reportada: Banco, Sucursal, Origen de la Cuenta, Tipo de
-- Cuenta, Cliente, Número de Referencia, Tipo de Registro.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE BAMOR (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    origen_cuenta FOR COLUMN ORCU VARCHAR(20),
    tipo_cuenta FOR COLUMN TICU VARCHAR(20),
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    numero_referencia FOR COLUMN NURE VARCHAR(30),
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    razon_social FOR COLUMN RASO VARCHAR(80),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    estado_cxp FOR COLUMN ESCX VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_bamor PRIMARY KEY (codigo_banco, codigo_sucursal
      , origen_cuenta, tipo_cuenta, id_cliente, numero_referencia
      , tipo_registro)
) RCDFMT BAMORR;

COMMENT ON TABLE BAMOR IS 'Amortizaciones de Cuentas por Pagar';
LABEL ON TABLE BAMOR IS 'BAMOR - Amortizaciones de Cuentas por Pagar';
COMMENT ON COLUMN BAMOR.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAMOR.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN BAMOR.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAMOR.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAMOR.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN BAMOR.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAMOR.origen_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAMOR.origen_cuenta IS 'Origen cuenta';
LABEL ON COLUMN BAMOR.origen_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAMOR.tipo_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAMOR.tipo_cuenta IS 'Tipo cuenta';
LABEL ON COLUMN BAMOR.tipo_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAMOR.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN BAMOR.id_cliente IS 'Id Cliente';
LABEL ON COLUMN BAMOR.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAMOR.numero_referencia IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAMOR.numero_referencia IS 'Numero referencia';
LABEL ON COLUMN BAMOR.numero_referencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAMOR.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAMOR.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN BAMOR.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAMOR.numero_identificacion IS
  'Campo Numero identificacion de amortizaciones de cuentas por pagar';
LABEL ON COLUMN BAMOR.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN BAMOR.numero_identificacion TEXT IS
  'Campo Numero identificacion de amortizaciones de c';
COMMENT ON COLUMN BAMOR.razon_social IS
  'Campo Razon social de amortizaciones de cuentas por pagar';
LABEL ON COLUMN BAMOR.razon_social IS 'Razon social';
LABEL ON COLUMN BAMOR.razon_social TEXT IS
  'Campo Razon social de amortizaciones de cuentas po';
COMMENT ON COLUMN BAMOR.email IS
  'Campo Email de amortizaciones de cuentas por pagar';
LABEL ON COLUMN BAMOR.email IS 'Email';
LABEL ON COLUMN BAMOR.email TEXT IS
  'Campo Email de amortizaciones de cuentas por pagar';
COMMENT ON COLUMN BAMOR.telefono IS
  'Campo Telefono de amortizaciones de cuentas por pagar';
LABEL ON COLUMN BAMOR.telefono IS 'Telefono';
LABEL ON COLUMN BAMOR.telefono TEXT IS
  'Campo Telefono de amortizaciones de cuentas por pa';
COMMENT ON COLUMN BAMOR.monto_original IS
  'Campo Monto original de amortizaciones de cuentas por pagar';
LABEL ON COLUMN BAMOR.monto_original IS 'Monto original';
LABEL ON COLUMN BAMOR.monto_original TEXT IS
  'Campo Monto original de amortizaciones de cuentas';
COMMENT ON COLUMN BAMOR.saldo_pendiente IS
  'Campo Saldo pendiente de amortizaciones de cuentas por pagar';
LABEL ON COLUMN BAMOR.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN BAMOR.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de amortizaciones de cuentas';
COMMENT ON COLUMN BAMOR.fecha_emision IS
  'Campo Fecha emision de amortizaciones de cuentas por pagar';
LABEL ON COLUMN BAMOR.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN BAMOR.fecha_emision TEXT IS
  'Campo Fecha emision de amortizaciones de cuentas p';
COMMENT ON COLUMN BAMOR.fecha_vencimiento IS
  'Campo Fecha vencimiento de amortizaciones de cuentas por pagar';
LABEL ON COLUMN BAMOR.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN BAMOR.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de amortizaciones de cuent';
COMMENT ON COLUMN BAMOR.estado_cxp IS
  'Campo Estado cxp de amortizaciones de cuentas por pagar';
LABEL ON COLUMN BAMOR.estado_cxp IS 'Estado cxp';
LABEL ON COLUMN BAMOR.estado_cxp TEXT IS
  'Campo Estado cxp de amortizaciones de cuentas por';
COMMENT ON COLUMN BAMOR.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN BAMOR.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN BAMOR.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN BAMOR.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN BAMOR.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN BAMOR.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN BAMOR.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN BAMOR.version_registro IS 'Version';
LABEL ON COLUMN BAMOR.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN BAMOR.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN BAMOR.observaciones IS 'Observaciones';
LABEL ON COLUMN BAMOR.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN BAMOR.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN BAMOR.estado_registro IS 'Estado Reg';
LABEL ON COLUMN BAMOR.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN BAMOR.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN BAMOR.created_at IS 'Creado';
LABEL ON COLUMN BAMOR.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN BAMOR.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN BAMOR.updated_at IS 'Actualizado';
LABEL ON COLUMN BAMOR.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_bamor_pk;
CREATE INDEX idx_bamor_pk ON BAMOR (codigo_banco, codigo_sucursal);
DROP INDEX IF EXISTS idx_bamor_created_at;
CREATE INDEX idx_bamor_created_at ON BAMOR (created_at);

--==============================================================================
-- Nombre de la Tabla: BAINP
-- DESCRIPCION: Transacciones Contables Diarias de Cuentas por Pagar
-- Objetivo: Persistir informacion funcional de transacciones contables diarias
-- de cuentas por pagar en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de transacciones
-- contables diarias de cuentas por pagar
-- Restricciones: Clave reportada: Número de Batch, Secuencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE BAINP (
    numero_batch FOR COLUMN NUBA VARCHAR(30),
    secuencia FOR COLUMN SSECUE INT,
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    razon_social FOR COLUMN RASO VARCHAR(80),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    estado_cxp FOR COLUMN ESCX VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_bainp PRIMARY KEY (numero_batch, secuencia)
) RCDFMT BAINPR;

COMMENT ON TABLE BAINP IS
  'Transacciones Contables Diarias de Cuentas por Pagar';
LABEL ON TABLE BAINP IS 'BAINP - Transacciones Contables Diarias de Cuentas';
COMMENT ON COLUMN BAINP.numero_batch IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAINP.numero_batch IS 'Numero batch';
LABEL ON COLUMN BAINP.numero_batch TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAINP.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN BAINP.secuencia IS 'Secuencia';
LABEL ON COLUMN BAINP.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAINP.numero_identificacion IS
  'Campo Numero identificacion de transacciones contables diarias de cuentas po'
  'r pagar';
LABEL ON COLUMN BAINP.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN BAINP.numero_identificacion TEXT IS
  'Campo Numero identificacion de transacciones conta';
COMMENT ON COLUMN BAINP.razon_social IS
  'Campo Razon social de transacciones contables diarias de cuentas por pagar';
LABEL ON COLUMN BAINP.razon_social IS 'Razon social';
LABEL ON COLUMN BAINP.razon_social TEXT IS
  'Campo Razon social de transacciones contables diar';
COMMENT ON COLUMN BAINP.email IS
  'Campo Email de transacciones contables diarias de cuentas por pagar';
LABEL ON COLUMN BAINP.email IS 'Email';
LABEL ON COLUMN BAINP.email TEXT IS
  'Campo Email de transacciones contables diarias de';
COMMENT ON COLUMN BAINP.telefono IS
  'Campo Telefono de transacciones contables diarias de cuentas por pagar';
LABEL ON COLUMN BAINP.telefono IS 'Telefono';
LABEL ON COLUMN BAINP.telefono TEXT IS
  'Campo Telefono de transacciones contables diarias';
COMMENT ON COLUMN BAINP.monto_original IS
  'Campo Monto original de transacciones contables diarias de cuentas por paga'
  'r';
LABEL ON COLUMN BAINP.monto_original IS 'Monto original';
LABEL ON COLUMN BAINP.monto_original TEXT IS
  'Campo Monto original de transacciones contables di';
COMMENT ON COLUMN BAINP.saldo_pendiente IS
  'Campo Saldo pendiente de transacciones contables diarias de cuentas por paga'
  'r';
LABEL ON COLUMN BAINP.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN BAINP.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de transacciones contables d';
COMMENT ON COLUMN BAINP.fecha_emision IS
  'Campo Fecha emision de transacciones contables diarias de cuentas por pagar';
LABEL ON COLUMN BAINP.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN BAINP.fecha_emision TEXT IS
  'Campo Fecha emision de transacciones contables dia';
COMMENT ON COLUMN BAINP.fecha_vencimiento IS
  'Campo Fecha vencimiento de transacciones contables diarias de cuentas por pa'
  'gar';
LABEL ON COLUMN BAINP.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN BAINP.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de transacciones contables';
COMMENT ON COLUMN BAINP.estado_cxp IS
  'Campo Estado cxp de transacciones contables diarias de cuentas por pagar';
LABEL ON COLUMN BAINP.estado_cxp IS 'Estado cxp';
LABEL ON COLUMN BAINP.estado_cxp TEXT IS
  'Campo Estado cxp de transacciones contables diaria';
COMMENT ON COLUMN BAINP.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN BAINP.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN BAINP.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN BAINP.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN BAINP.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN BAINP.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN BAINP.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN BAINP.version_registro IS 'Version';
LABEL ON COLUMN BAINP.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN BAINP.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN BAINP.observaciones IS 'Observaciones';
LABEL ON COLUMN BAINP.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN BAINP.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN BAINP.estado_registro IS 'Estado Reg';
LABEL ON COLUMN BAINP.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN BAINP.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN BAINP.created_at IS 'Creado';
LABEL ON COLUMN BAINP.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN BAINP.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN BAINP.updated_at IS 'Actualizado';
LABEL ON COLUMN BAINP.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_bainp_pk;
CREATE INDEX idx_bainp_pk ON BAINP (numero_batch, secuencia);
DROP INDEX IF EXISTS idx_bainp_created_at;
CREATE INDEX idx_bainp_created_at ON BAINP (created_at);

--==============================================================================
-- Nombre de la Tabla: BAHIS
-- DESCRIPCION: Histórico de Cuentas por Pagar
-- Objetivo: Persistir informacion funcional de histórico de cuentas por pagar
-- en el entorno IBM i del taller.
-- Tipo de Tabla: Historico
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de histórico de
-- cuentas por pagar
-- Restricciones: Clave reportada: Banco, Sucursal, Origen de la Cuenta, Tipo de
-- Cuenta, Cliente, Número de Referencia, Tipo de Registro, Fecha.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE BAHIS (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_sucursal FOR COLUMN COSU VARCHAR(20),
    origen_cuenta FOR COLUMN ORCU VARCHAR(20),
    tipo_cuenta FOR COLUMN TICU VARCHAR(20),
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    numero_referencia FOR COLUMN NURE VARCHAR(30),
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    fecha FOR COLUMN SFECHA DATE,
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    razon_social FOR COLUMN RASO VARCHAR(80),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    estado_cxp FOR COLUMN ESCX VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_bahis PRIMARY KEY (codigo_banco, codigo_sucursal
      , origen_cuenta, tipo_cuenta, id_cliente, numero_referencia, tipo_registro
      , fecha)
) RCDFMT BAHISR;

COMMENT ON TABLE BAHIS IS 'Histórico de Cuentas por Pagar';
LABEL ON TABLE BAHIS IS 'BAHIS - Histórico de Cuentas por Pagar';
COMMENT ON COLUMN BAHIS.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAHIS.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN BAHIS.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAHIS.codigo_sucursal IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAHIS.codigo_sucursal IS 'Cod Sucursal';
LABEL ON COLUMN BAHIS.codigo_sucursal TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAHIS.origen_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAHIS.origen_cuenta IS 'Origen cuenta';
LABEL ON COLUMN BAHIS.origen_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAHIS.tipo_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAHIS.tipo_cuenta IS 'Tipo cuenta';
LABEL ON COLUMN BAHIS.tipo_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAHIS.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN BAHIS.id_cliente IS 'Id Cliente';
LABEL ON COLUMN BAHIS.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAHIS.numero_referencia IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAHIS.numero_referencia IS 'Numero referencia';
LABEL ON COLUMN BAHIS.numero_referencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAHIS.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN BAHIS.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN BAHIS.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAHIS.fecha IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN BAHIS.fecha IS 'Fecha';
LABEL ON COLUMN BAHIS.fecha TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN BAHIS.numero_identificacion IS
  'Campo Numero identificacion de histórico de cuentas por pagar';
LABEL ON COLUMN BAHIS.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN BAHIS.numero_identificacion TEXT IS
  'Campo Numero identificacion de histórico de cuenta';
COMMENT ON COLUMN BAHIS.razon_social IS
  'Campo Razon social de histórico de cuentas por pagar';
LABEL ON COLUMN BAHIS.razon_social IS 'Razon social';
LABEL ON COLUMN BAHIS.razon_social TEXT IS
  'Campo Razon social de histórico de cuentas por pag';
COMMENT ON COLUMN BAHIS.email IS
  'Campo Email de histórico de cuentas por pagar';
LABEL ON COLUMN BAHIS.email IS 'Email';
LABEL ON COLUMN BAHIS.email TEXT IS
  'Campo Email de histórico de cuentas por pagar';
COMMENT ON COLUMN BAHIS.telefono IS
  'Campo Telefono de histórico de cuentas por pagar';
LABEL ON COLUMN BAHIS.telefono IS 'Telefono';
LABEL ON COLUMN BAHIS.telefono TEXT IS
  'Campo Telefono de histórico de cuentas por pagar';
COMMENT ON COLUMN BAHIS.monto_original IS
  'Campo Monto original de histórico de cuentas por pagar';
LABEL ON COLUMN BAHIS.monto_original IS 'Monto original';
LABEL ON COLUMN BAHIS.monto_original TEXT IS
  'Campo Monto original de histórico de cuentas por p';
COMMENT ON COLUMN BAHIS.saldo_pendiente IS
  'Campo Saldo pendiente de histórico de cuentas por pagar';
LABEL ON COLUMN BAHIS.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN BAHIS.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de histórico de cuentas por';
COMMENT ON COLUMN BAHIS.fecha_emision IS
  'Campo Fecha emision de histórico de cuentas por pagar';
LABEL ON COLUMN BAHIS.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN BAHIS.fecha_emision TEXT IS
  'Campo Fecha emision de histórico de cuentas por pa';
COMMENT ON COLUMN BAHIS.fecha_vencimiento IS
  'Campo Fecha vencimiento de histórico de cuentas por pagar';
LABEL ON COLUMN BAHIS.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN BAHIS.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de histórico de cuentas po';
COMMENT ON COLUMN BAHIS.estado_cxp IS
  'Campo Estado cxp de histórico de cuentas por pagar';
LABEL ON COLUMN BAHIS.estado_cxp IS 'Estado cxp';
LABEL ON COLUMN BAHIS.estado_cxp TEXT IS
  'Campo Estado cxp de histórico de cuentas por pagar';
COMMENT ON COLUMN BAHIS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN BAHIS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN BAHIS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN BAHIS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN BAHIS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN BAHIS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN BAHIS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN BAHIS.version_registro IS 'Version';
LABEL ON COLUMN BAHIS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN BAHIS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN BAHIS.observaciones IS 'Observaciones';
LABEL ON COLUMN BAHIS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN BAHIS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN BAHIS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN BAHIS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN BAHIS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN BAHIS.created_at IS 'Creado';
LABEL ON COLUMN BAHIS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN BAHIS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN BAHIS.updated_at IS 'Actualizado';
LABEL ON COLUMN BAHIS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_bahis_pk;
CREATE INDEX idx_bahis_pk ON BAHIS (codigo_banco, origen_cuenta);
DROP INDEX IF EXISTS idx_bahis_fecha;
CREATE INDEX idx_bahis_fecha ON BAHIS (fecha);

--==============================================================================
-- Nombre de la Tabla: CNTRLBAF
-- DESCRIPCION: Archivo de Control de Cuentas por Pagar (Sección Comisiones).
-- Objetivo: Persistir informacion funcional de archivo de control de cuentas
-- por pagar (sección comisiones) en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de control
-- de cuentas por pagar (sección comisiones)
-- Restricciones: Clave reportada: Banco, Moneda.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLBAF (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    razon_social FOR COLUMN RASO VARCHAR(80),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    estado_cxp FOR COLUMN ESCX VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlbaf PRIMARY KEY (codigo_banco, codigo_moneda)
) RCDFMT CNTRLBAFR;

COMMENT ON TABLE CNTRLBAF IS
  'Archivo de Control de Cuentas por Pagar (Sección Comisiones).';
LABEL ON TABLE CNTRLBAF IS 'CNTRLBAF - Archivo de Control de Cuentas por Pagar';
COMMENT ON COLUMN CNTRLBAF.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLBAF.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLBAF.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLBAF.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLBAF.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN CNTRLBAF.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLBAF.numero_identificacion IS
  'Campo Numero identificacion de archivo de control de cuentas por pagar (secc'
  'ión comisiones)';
LABEL ON COLUMN CNTRLBAF.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN CNTRLBAF.numero_identificacion TEXT IS
  'Campo Numero identificacion de archivo de control';
COMMENT ON COLUMN CNTRLBAF.razon_social IS
  'Campo Razon social de archivo de control de cuentas por pagar (sección comi'
  'siones)';
LABEL ON COLUMN CNTRLBAF.razon_social IS 'Razon social';
LABEL ON COLUMN CNTRLBAF.razon_social TEXT IS
  'Campo Razon social de archivo de control de cuenta';
COMMENT ON COLUMN CNTRLBAF.email IS
  'Campo Email de archivo de control de cuentas por pagar (sección comisiones'
  ')';
LABEL ON COLUMN CNTRLBAF.email IS 'Email';
LABEL ON COLUMN CNTRLBAF.email TEXT IS
  'Campo Email de archivo de control de cuentas por p';
COMMENT ON COLUMN CNTRLBAF.telefono IS
  'Campo Telefono de archivo de control de cuentas por pagar (sección comision'
  'es)';
LABEL ON COLUMN CNTRLBAF.telefono IS 'Telefono';
LABEL ON COLUMN CNTRLBAF.telefono TEXT IS
  'Campo Telefono de archivo de control de cuentas po';
COMMENT ON COLUMN CNTRLBAF.monto_original IS
  'Campo Monto original de archivo de control de cuentas por pagar (sección co'
  'misiones)';
LABEL ON COLUMN CNTRLBAF.monto_original IS 'Monto original';
LABEL ON COLUMN CNTRLBAF.monto_original TEXT IS
  'Campo Monto original de archivo de control de cuen';
COMMENT ON COLUMN CNTRLBAF.saldo_pendiente IS
  'Campo Saldo pendiente de archivo de control de cuentas por pagar (sección c'
  'omisiones)';
LABEL ON COLUMN CNTRLBAF.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN CNTRLBAF.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de archivo de control de cue';
COMMENT ON COLUMN CNTRLBAF.fecha_emision IS
  'Campo Fecha emision de archivo de control de cuentas por pagar (sección com'
  'isiones)';
LABEL ON COLUMN CNTRLBAF.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN CNTRLBAF.fecha_emision TEXT IS
  'Campo Fecha emision de archivo de control de cuent';
COMMENT ON COLUMN CNTRLBAF.fecha_vencimiento IS
  'Campo Fecha vencimiento de archivo de control de cuentas por pagar (sección'
  ' comisiones)';
LABEL ON COLUMN CNTRLBAF.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN CNTRLBAF.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de archivo de control de c';
COMMENT ON COLUMN CNTRLBAF.estado_cxp IS
  'Campo Estado cxp de archivo de control de cuentas por pagar (sección comisi'
  'ones)';
LABEL ON COLUMN CNTRLBAF.estado_cxp IS 'Estado cxp';
LABEL ON COLUMN CNTRLBAF.estado_cxp TEXT IS
  'Campo Estado cxp de archivo de control de cuentas';
COMMENT ON COLUMN CNTRLBAF.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLBAF.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLBAF.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLBAF.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLBAF.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLBAF.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLBAF.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLBAF.version_registro IS 'Version';
LABEL ON COLUMN CNTRLBAF.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLBAF.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLBAF.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLBAF.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLBAF.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLBAF.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLBAF.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLBAF.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLBAF.created_at IS 'Creado';
LABEL ON COLUMN CNTRLBAF.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLBAF.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLBAF.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLBAF.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlbaf_pk;
CREATE INDEX idx_cntrlbaf_pk ON CNTRLBAF (codigo_banco, codigo_moneda);
DROP INDEX IF EXISTS idx_cntrlbaf_created_at;
CREATE INDEX idx_cntrlbaf_created_at ON CNTRLBAF (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLBAP
-- DESCRIPCION: Archivo de Control de Cuentas por Pagar (Otros Parámetros).
-- Objetivo: Persistir informacion funcional de archivo de control de cuentas
-- por pagar (otros parámetros) en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de control
-- de cuentas por pagar (otros parámetros)
-- Restricciones: Clave reportada: Banco, Moneda.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLBAP (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    numero_identificacion FOR COLUMN NUID VARCHAR(30),
    razon_social FOR COLUMN RASO VARCHAR(80),
    email FOR COLUMN SEMAIL VARCHAR(80),
    telefono FOR COLUMN STELEF VARCHAR(80),
    monto_original FOR COLUMN MOOR DECIMAL(18,2),
    saldo_pendiente FOR COLUMN SAPE DECIMAL(18,2),
    fecha_emision FOR COLUMN FEEM DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    estado_cxp FOR COLUMN ESCX VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlbap PRIMARY KEY (codigo_banco, codigo_moneda)
) RCDFMT CNTRLBAPR;

COMMENT ON TABLE CNTRLBAP IS
  'Archivo de Control de Cuentas por Pagar (Otros Parámetros).';
LABEL ON TABLE CNTRLBAP IS 'CNTRLBAP - Archivo de Control de Cuentas por Pagar';
COMMENT ON COLUMN CNTRLBAP.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLBAP.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLBAP.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLBAP.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLBAP.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN CNTRLBAP.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLBAP.numero_identificacion IS
  'Campo Numero identificacion de archivo de control de cuentas por pagar (otro'
  's parámetros)';
LABEL ON COLUMN CNTRLBAP.numero_identificacion IS 'Numero identificacio';
LABEL ON COLUMN CNTRLBAP.numero_identificacion TEXT IS
  'Campo Numero identificacion de archivo de control';
COMMENT ON COLUMN CNTRLBAP.razon_social IS
  'Campo Razon social de archivo de control de cuentas por pagar (otros paráme'
  'tros)';
LABEL ON COLUMN CNTRLBAP.razon_social IS 'Razon social';
LABEL ON COLUMN CNTRLBAP.razon_social TEXT IS
  'Campo Razon social de archivo de control de cuenta';
COMMENT ON COLUMN CNTRLBAP.email IS
  'Campo Email de archivo de control de cuentas por pagar (otros parámetros)';
LABEL ON COLUMN CNTRLBAP.email IS 'Email';
LABEL ON COLUMN CNTRLBAP.email TEXT IS
  'Campo Email de archivo de control de cuentas por p';
COMMENT ON COLUMN CNTRLBAP.telefono IS
  'Campo Telefono de archivo de control de cuentas por pagar (otros parámetros'
  ')';
LABEL ON COLUMN CNTRLBAP.telefono IS 'Telefono';
LABEL ON COLUMN CNTRLBAP.telefono TEXT IS
  'Campo Telefono de archivo de control de cuentas po';
COMMENT ON COLUMN CNTRLBAP.monto_original IS
  'Campo Monto original de archivo de control de cuentas por pagar (otros pará'
  'metros)';
LABEL ON COLUMN CNTRLBAP.monto_original IS 'Monto original';
LABEL ON COLUMN CNTRLBAP.monto_original TEXT IS
  'Campo Monto original de archivo de control de cuen';
COMMENT ON COLUMN CNTRLBAP.saldo_pendiente IS
  'Campo Saldo pendiente de archivo de control de cuentas por pagar (otros par'
  'ámetros)';
LABEL ON COLUMN CNTRLBAP.saldo_pendiente IS 'Saldo pendiente';
LABEL ON COLUMN CNTRLBAP.saldo_pendiente TEXT IS
  'Campo Saldo pendiente de archivo de control de cue';
COMMENT ON COLUMN CNTRLBAP.fecha_emision IS
  'Campo Fecha emision de archivo de control de cuentas por pagar (otros parám'
  'etros)';
LABEL ON COLUMN CNTRLBAP.fecha_emision IS 'Fecha emision';
LABEL ON COLUMN CNTRLBAP.fecha_emision TEXT IS
  'Campo Fecha emision de archivo de control de cuent';
COMMENT ON COLUMN CNTRLBAP.fecha_vencimiento IS
  'Campo Fecha vencimiento de archivo de control de cuentas por pagar (otros pa'
  'rámetros)';
LABEL ON COLUMN CNTRLBAP.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN CNTRLBAP.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de archivo de control de c';
COMMENT ON COLUMN CNTRLBAP.estado_cxp IS
  'Campo Estado cxp de archivo de control de cuentas por pagar (otros parámetr'
  'os)';
LABEL ON COLUMN CNTRLBAP.estado_cxp IS 'Estado cxp';
LABEL ON COLUMN CNTRLBAP.estado_cxp TEXT IS
  'Campo Estado cxp de archivo de control de cuentas';
COMMENT ON COLUMN CNTRLBAP.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLBAP.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLBAP.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLBAP.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLBAP.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLBAP.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLBAP.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLBAP.version_registro IS 'Version';
LABEL ON COLUMN CNTRLBAP.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLBAP.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLBAP.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLBAP.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLBAP.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLBAP.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLBAP.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLBAP.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLBAP.created_at IS 'Creado';
LABEL ON COLUMN CNTRLBAP.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLBAP.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLBAP.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLBAP.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlbap_pk;
CREATE INDEX idx_cntrlbap_pk ON CNTRLBAP (codigo_banco, codigo_moneda);
DROP INDEX IF EXISTS idx_cntrlbap_created_at;
CREATE INDEX idx_cntrlbap_created_at ON CNTRLBAP (created_at);

--==============================================================================
-- Nombre de la Tabla: FIWRT
-- DESCRIPCION: Transacciones Históricas de Pagos y Recibos.
-- Objetivo: Persistir informacion funcional de transacciones históricas de
-- pagos y recibos en el entorno IBM i del taller.
-- Tipo de Tabla: Historico
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de transacciones
-- históricas de pagos y recibos
-- Restricciones: Clave reportada: Banco, Número de Transferencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE FIWRT (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    numero_transferencia FOR COLUMN NUTR VARCHAR(30),
    fecha_operacion FOR COLUMN FEOP DATE,
    monto FOR COLUMN SMONTO DECIMAL(18,2),
    beneficiario FOR COLUMN SBENEF VARCHAR(80),
    banco_destino FOR COLUMN BADE VARCHAR(80),
    canal_pago FOR COLUMN CAPA VARCHAR(20),
    estado_pago FOR COLUMN ESPA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_fiwrt PRIMARY KEY (codigo_banco, numero_transferencia)
) RCDFMT FIWRTR;

COMMENT ON TABLE FIWRT IS 'Transacciones Históricas de Pagos y Recibos.';
LABEL ON TABLE FIWRT IS 'FIWRT - Transacciones Históricas de Pagos y Recibo';
COMMENT ON COLUMN FIWRT.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN FIWRT.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN FIWRT.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN FIWRT.numero_transferencia IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN FIWRT.numero_transferencia IS 'Numero transferencia';
LABEL ON COLUMN FIWRT.numero_transferencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN FIWRT.fecha_operacion IS
  'Fecha de la operacion transaccional';
LABEL ON COLUMN FIWRT.fecha_operacion IS 'Fecha Oper';
LABEL ON COLUMN FIWRT.fecha_operacion TEXT IS
  'Fecha de la operacion transaccional';
COMMENT ON COLUMN FIWRT.monto IS 'Monto monetario de la transaccion o partida';
LABEL ON COLUMN FIWRT.monto IS 'Monto';
LABEL ON COLUMN FIWRT.monto TEXT IS
  'Monto monetario de la transaccion o partida';
COMMENT ON COLUMN FIWRT.beneficiario IS
  'Campo Beneficiario de transacciones históricas de pagos y recibos';
LABEL ON COLUMN FIWRT.beneficiario IS 'Beneficiario';
LABEL ON COLUMN FIWRT.beneficiario TEXT IS
  'Campo Beneficiario de transacciones históricas de';
COMMENT ON COLUMN FIWRT.banco_destino IS
  'Campo Banco destino de transacciones históricas de pagos y recibos';
LABEL ON COLUMN FIWRT.banco_destino IS 'Banco destino';
LABEL ON COLUMN FIWRT.banco_destino TEXT IS
  'Campo Banco destino de transacciones históricas de';
COMMENT ON COLUMN FIWRT.canal_pago IS
  'Campo Canal pago de transacciones históricas de pagos y recibos';
LABEL ON COLUMN FIWRT.canal_pago IS 'Canal pago';
LABEL ON COLUMN FIWRT.canal_pago TEXT IS
  'Campo Canal pago de transacciones históricas de pa';
COMMENT ON COLUMN FIWRT.estado_pago IS
  'Campo Estado pago de transacciones históricas de pagos y recibos';
LABEL ON COLUMN FIWRT.estado_pago IS 'Estado pago';
LABEL ON COLUMN FIWRT.estado_pago TEXT IS
  'Campo Estado pago de transacciones históricas de p';
COMMENT ON COLUMN FIWRT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN FIWRT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN FIWRT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN FIWRT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN FIWRT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN FIWRT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN FIWRT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN FIWRT.version_registro IS 'Version';
LABEL ON COLUMN FIWRT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN FIWRT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN FIWRT.observaciones IS 'Observaciones';
LABEL ON COLUMN FIWRT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN FIWRT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN FIWRT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN FIWRT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN FIWRT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN FIWRT.created_at IS 'Creado';
LABEL ON COLUMN FIWRT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN FIWRT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN FIWRT.updated_at IS 'Actualizado';
LABEL ON COLUMN FIWRT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_fiwrt_pk;
CREATE INDEX idx_fiwrt_pk ON FIWRT (codigo_banco, numero_transferencia);
DROP INDEX IF EXISTS idx_fiwrt_created_at;
CREATE INDEX idx_fiwrt_created_at ON FIWRT (created_at);

--==============================================================================
-- Nombre de la Tabla: POFED
-- DESCRIPCION: Ordenes de Pago.
-- Objetivo: Persistir informacion funcional de ordenes de pago en el entorno
-- IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de ordenes de pago
-- Restricciones: Clave reportada: Banco, Moneda, Cliente, Tipo, Cuenta, Número
-- de Referencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE POFED (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    numero_referencia FOR COLUMN NURE VARCHAR(30),
    fecha_operacion FOR COLUMN FEOP DATE,
    monto FOR COLUMN SMONTO DECIMAL(18,2),
    beneficiario FOR COLUMN SBENEF VARCHAR(80),
    banco_destino FOR COLUMN BADE VARCHAR(80),
    canal_pago FOR COLUMN CAPA VARCHAR(20),
    estado_pago FOR COLUMN ESPA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_pofed PRIMARY KEY (codigo_banco, codigo_moneda, id_cliente
      , tipo_registro, numero_cuenta, numero_referencia)
) RCDFMT POFEDR;

COMMENT ON TABLE POFED IS 'Ordenes de Pago.';
LABEL ON TABLE POFED IS 'POFED - Ordenes de Pago.';
COMMENT ON COLUMN POFED.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POFED.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN POFED.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POFED.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POFED.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN POFED.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POFED.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN POFED.id_cliente IS 'Id Cliente';
LABEL ON COLUMN POFED.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POFED.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POFED.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN POFED.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POFED.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POFED.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN POFED.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POFED.numero_referencia IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POFED.numero_referencia IS 'Numero referencia';
LABEL ON COLUMN POFED.numero_referencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POFED.fecha_operacion IS
  'Fecha de la operacion transaccional';
LABEL ON COLUMN POFED.fecha_operacion IS 'Fecha Oper';
LABEL ON COLUMN POFED.fecha_operacion TEXT IS
  'Fecha de la operacion transaccional';
COMMENT ON COLUMN POFED.monto IS 'Monto monetario de la transaccion o partida';
LABEL ON COLUMN POFED.monto IS 'Monto';
LABEL ON COLUMN POFED.monto TEXT IS
  'Monto monetario de la transaccion o partida';
COMMENT ON COLUMN POFED.beneficiario IS 'Campo Beneficiario de ordenes de pago';
LABEL ON COLUMN POFED.beneficiario IS 'Beneficiario';
LABEL ON COLUMN POFED.beneficiario TEXT IS
  'Campo Beneficiario de ordenes de pago';
COMMENT ON COLUMN POFED.banco_destino IS
  'Campo Banco destino de ordenes de pago';
LABEL ON COLUMN POFED.banco_destino IS 'Banco destino';
LABEL ON COLUMN POFED.banco_destino TEXT IS
  'Campo Banco destino de ordenes de pago';
COMMENT ON COLUMN POFED.canal_pago IS 'Campo Canal pago de ordenes de pago';
LABEL ON COLUMN POFED.canal_pago IS 'Canal pago';
LABEL ON COLUMN POFED.canal_pago TEXT IS 'Campo Canal pago de ordenes de pago';
COMMENT ON COLUMN POFED.estado_pago IS 'Campo Estado pago de ordenes de pago';
LABEL ON COLUMN POFED.estado_pago IS 'Estado pago';
LABEL ON COLUMN POFED.estado_pago TEXT IS
  'Campo Estado pago de ordenes de pago';
COMMENT ON COLUMN POFED.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN POFED.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN POFED.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN POFED.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN POFED.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN POFED.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN POFED.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN POFED.version_registro IS 'Version';
LABEL ON COLUMN POFED.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN POFED.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN POFED.observaciones IS 'Observaciones';
LABEL ON COLUMN POFED.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN POFED.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN POFED.estado_registro IS 'Estado Reg';
LABEL ON COLUMN POFED.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN POFED.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN POFED.created_at IS 'Creado';
LABEL ON COLUMN POFED.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN POFED.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN POFED.updated_at IS 'Actualizado';
LABEL ON COLUMN POFED.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_pofed_pk;
CREATE INDEX idx_pofed_pk ON POFED (codigo_banco, codigo_moneda);
DROP INDEX IF EXISTS idx_pofed_created_at;
CREATE INDEX idx_pofed_created_at ON POFED (created_at);

--==============================================================================
-- Nombre de la Tabla: POSWF
-- DESCRIPCION: Ordenes de Pago vía Swift.
-- Objetivo: Persistir informacion funcional de ordenes de pago vía swift en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de ordenes de pago vía
-- swift
-- Restricciones: Clave reportada: Banco, Moneda, Cliente, Tipo, Cuenta, Número
-- de Referencia, Monto.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE POSWF (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    numero_referencia FOR COLUMN NURE VARCHAR(30),
    monto FOR COLUMN SMONTO DECIMAL(18,2),
    fecha_operacion FOR COLUMN FEOP DATE,
    beneficiario FOR COLUMN SBENEF VARCHAR(80),
    banco_destino FOR COLUMN BADE VARCHAR(80),
    canal_pago FOR COLUMN CAPA VARCHAR(20),
    estado_pago FOR COLUMN ESPA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_poswf PRIMARY KEY (codigo_banco, codigo_moneda, id_cliente
      , tipo_registro, numero_cuenta, numero_referencia, monto)
) RCDFMT POSWFR;

COMMENT ON TABLE POSWF IS 'Ordenes de Pago vía Swift.';
LABEL ON TABLE POSWF IS 'POSWF - Ordenes de Pago vía Swift.';
COMMENT ON COLUMN POSWF.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POSWF.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN POSWF.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POSWF.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POSWF.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN POSWF.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POSWF.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN POSWF.id_cliente IS 'Id Cliente';
LABEL ON COLUMN POSWF.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POSWF.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POSWF.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN POSWF.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POSWF.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POSWF.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN POSWF.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POSWF.numero_referencia IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POSWF.numero_referencia IS 'Numero referencia';
LABEL ON COLUMN POSWF.numero_referencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POSWF.monto IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN POSWF.monto IS 'Monto';
LABEL ON COLUMN POSWF.monto TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN POSWF.fecha_operacion IS
  'Fecha de la operacion transaccional';
LABEL ON COLUMN POSWF.fecha_operacion IS 'Fecha Oper';
LABEL ON COLUMN POSWF.fecha_operacion TEXT IS
  'Fecha de la operacion transaccional';
COMMENT ON COLUMN POSWF.beneficiario IS
  'Campo Beneficiario de ordenes de pago vía swift';
LABEL ON COLUMN POSWF.beneficiario IS 'Beneficiario';
LABEL ON COLUMN POSWF.beneficiario TEXT IS
  'Campo Beneficiario de ordenes de pago vía swift';
COMMENT ON COLUMN POSWF.banco_destino IS
  'Campo Banco destino de ordenes de pago vía swift';
LABEL ON COLUMN POSWF.banco_destino IS 'Banco destino';
LABEL ON COLUMN POSWF.banco_destino TEXT IS
  'Campo Banco destino de ordenes de pago vía swift';
COMMENT ON COLUMN POSWF.canal_pago IS
  'Campo Canal pago de ordenes de pago vía swift';
LABEL ON COLUMN POSWF.canal_pago IS 'Canal pago';
LABEL ON COLUMN POSWF.canal_pago TEXT IS
  'Campo Canal pago de ordenes de pago vía swift';
COMMENT ON COLUMN POSWF.estado_pago IS
  'Campo Estado pago de ordenes de pago vía swift';
LABEL ON COLUMN POSWF.estado_pago IS 'Estado pago';
LABEL ON COLUMN POSWF.estado_pago TEXT IS
  'Campo Estado pago de ordenes de pago vía swift';
COMMENT ON COLUMN POSWF.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN POSWF.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN POSWF.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN POSWF.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN POSWF.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN POSWF.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN POSWF.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN POSWF.version_registro IS 'Version';
LABEL ON COLUMN POSWF.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN POSWF.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN POSWF.observaciones IS 'Observaciones';
LABEL ON COLUMN POSWF.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN POSWF.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN POSWF.estado_registro IS 'Estado Reg';
LABEL ON COLUMN POSWF.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN POSWF.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN POSWF.created_at IS 'Creado';
LABEL ON COLUMN POSWF.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN POSWF.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN POSWF.updated_at IS 'Actualizado';
LABEL ON COLUMN POSWF.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_poswf_pk;
CREATE INDEX idx_poswf_pk ON POSWF (codigo_banco, codigo_moneda);
DROP INDEX IF EXISTS idx_poswf_created_at;
CREATE INDEX idx_poswf_created_at ON POSWF (created_at);

--==============================================================================
-- Nombre de la Tabla: POTLX
-- DESCRIPCION: Ordenes de Pago vía Télex.
-- Objetivo: Persistir informacion funcional de ordenes de pago vía télex en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de ordenes de pago vía
-- télex
-- Restricciones: Clave reportada: Banco, Moneda, Cliente, Tipo, Cuenta, Número
-- de Referencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE POTLX (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    codigo_moneda FOR COLUMN COMO VARCHAR(20),
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    numero_cuenta FOR COLUMN NUCU VARCHAR(24),
    numero_referencia FOR COLUMN NURE VARCHAR(30),
    fecha_operacion FOR COLUMN FEOP DATE,
    monto FOR COLUMN SMONTO DECIMAL(18,2),
    beneficiario FOR COLUMN SBENEF VARCHAR(80),
    banco_destino FOR COLUMN BADE VARCHAR(80),
    canal_pago FOR COLUMN CAPA VARCHAR(20),
    estado_pago FOR COLUMN ESPA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_potlx PRIMARY KEY (codigo_banco, codigo_moneda, id_cliente
      , tipo_registro, numero_cuenta, numero_referencia)
) RCDFMT POTLXR;

COMMENT ON TABLE POTLX IS 'Ordenes de Pago vía Télex.';
LABEL ON TABLE POTLX IS 'POTLX - Ordenes de Pago vía Télex.';
COMMENT ON COLUMN POTLX.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POTLX.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN POTLX.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POTLX.codigo_moneda IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POTLX.codigo_moneda IS 'Cod Moneda';
LABEL ON COLUMN POTLX.codigo_moneda TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POTLX.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN POTLX.id_cliente IS 'Id Cliente';
LABEL ON COLUMN POTLX.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POTLX.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POTLX.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN POTLX.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POTLX.numero_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POTLX.numero_cuenta IS 'Num Cuenta';
LABEL ON COLUMN POTLX.numero_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POTLX.numero_referencia IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN POTLX.numero_referencia IS 'Numero referencia';
LABEL ON COLUMN POTLX.numero_referencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN POTLX.fecha_operacion IS
  'Fecha de la operacion transaccional';
LABEL ON COLUMN POTLX.fecha_operacion IS 'Fecha Oper';
LABEL ON COLUMN POTLX.fecha_operacion TEXT IS
  'Fecha de la operacion transaccional';
COMMENT ON COLUMN POTLX.monto IS 'Monto monetario de la transaccion o partida';
LABEL ON COLUMN POTLX.monto IS 'Monto';
LABEL ON COLUMN POTLX.monto TEXT IS
  'Monto monetario de la transaccion o partida';
COMMENT ON COLUMN POTLX.beneficiario IS
  'Campo Beneficiario de ordenes de pago vía télex';
LABEL ON COLUMN POTLX.beneficiario IS 'Beneficiario';
LABEL ON COLUMN POTLX.beneficiario TEXT IS
  'Campo Beneficiario de ordenes de pago vía télex';
COMMENT ON COLUMN POTLX.banco_destino IS
  'Campo Banco destino de ordenes de pago vía télex';
LABEL ON COLUMN POTLX.banco_destino IS 'Banco destino';
LABEL ON COLUMN POTLX.banco_destino TEXT IS
  'Campo Banco destino de ordenes de pago vía télex';
COMMENT ON COLUMN POTLX.canal_pago IS
  'Campo Canal pago de ordenes de pago vía télex';
LABEL ON COLUMN POTLX.canal_pago IS 'Canal pago';
LABEL ON COLUMN POTLX.canal_pago TEXT IS
  'Campo Canal pago de ordenes de pago vía télex';
COMMENT ON COLUMN POTLX.estado_pago IS
  'Campo Estado pago de ordenes de pago vía télex';
LABEL ON COLUMN POTLX.estado_pago IS 'Estado pago';
LABEL ON COLUMN POTLX.estado_pago TEXT IS
  'Campo Estado pago de ordenes de pago vía télex';
COMMENT ON COLUMN POTLX.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN POTLX.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN POTLX.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN POTLX.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN POTLX.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN POTLX.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN POTLX.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN POTLX.version_registro IS 'Version';
LABEL ON COLUMN POTLX.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN POTLX.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN POTLX.observaciones IS 'Observaciones';
LABEL ON COLUMN POTLX.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN POTLX.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN POTLX.estado_registro IS 'Estado Reg';
LABEL ON COLUMN POTLX.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN POTLX.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN POTLX.created_at IS 'Creado';
LABEL ON COLUMN POTLX.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN POTLX.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN POTLX.updated_at IS 'Actualizado';
LABEL ON COLUMN POTLX.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_potlx_pk;
CREATE INDEX idx_potlx_pk ON POTLX (codigo_banco, codigo_moneda);
DROP INDEX IF EXISTS idx_potlx_created_at;
CREATE INDEX idx_potlx_created_at ON POTLX (created_at);

--==============================================================================
-- Nombre de la Tabla: SWITF
-- DESCRIPCION: Histórico de Pagos y Recibidos vía Swift.
-- Objetivo: Persistir informacion funcional de histórico de pagos y recibidos
-- vía swift en el entorno IBM i del taller.
-- Tipo de Tabla: Historico
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de histórico de pagos
-- y recibidos vía swift
-- Restricciones: Clave reportada: Banco, Número de Referencia, Formato Swift.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE SWITF (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    numero_referencia FOR COLUMN NURE VARCHAR(30),
    formato_swift FOR COLUMN FOSW VARCHAR(50),
    fecha_operacion FOR COLUMN FEOP DATE,
    monto FOR COLUMN SMONTO DECIMAL(18,2),
    beneficiario FOR COLUMN SBENEF VARCHAR(80),
    banco_destino FOR COLUMN BADE VARCHAR(80),
    canal_pago FOR COLUMN CAPA VARCHAR(20),
    estado_pago FOR COLUMN ESPA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_switf PRIMARY KEY (codigo_banco, numero_referencia
      , formato_swift)
) RCDFMT SWITFR;

COMMENT ON TABLE SWITF IS 'Histórico de Pagos y Recibidos vía Swift.';
LABEL ON TABLE SWITF IS 'SWITF - Histórico de Pagos y Recibidos vía Swift.';
COMMENT ON COLUMN SWITF.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN SWITF.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN SWITF.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN SWITF.numero_referencia IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN SWITF.numero_referencia IS 'Numero referencia';
LABEL ON COLUMN SWITF.numero_referencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN SWITF.formato_swift IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN SWITF.formato_swift IS 'Formato swift';
LABEL ON COLUMN SWITF.formato_swift TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN SWITF.fecha_operacion IS
  'Fecha de la operacion transaccional';
LABEL ON COLUMN SWITF.fecha_operacion IS 'Fecha Oper';
LABEL ON COLUMN SWITF.fecha_operacion TEXT IS
  'Fecha de la operacion transaccional';
COMMENT ON COLUMN SWITF.monto IS 'Monto monetario de la transaccion o partida';
LABEL ON COLUMN SWITF.monto IS 'Monto';
LABEL ON COLUMN SWITF.monto TEXT IS
  'Monto monetario de la transaccion o partida';
COMMENT ON COLUMN SWITF.beneficiario IS
  'Campo Beneficiario de histórico de pagos y recibidos vía swift';
LABEL ON COLUMN SWITF.beneficiario IS 'Beneficiario';
LABEL ON COLUMN SWITF.beneficiario TEXT IS
  'Campo Beneficiario de histórico de pagos y recibid';
COMMENT ON COLUMN SWITF.banco_destino IS
  'Campo Banco destino de histórico de pagos y recibidos vía swift';
LABEL ON COLUMN SWITF.banco_destino IS 'Banco destino';
LABEL ON COLUMN SWITF.banco_destino TEXT IS
  'Campo Banco destino de histórico de pagos y recibi';
COMMENT ON COLUMN SWITF.canal_pago IS
  'Campo Canal pago de histórico de pagos y recibidos vía swift';
LABEL ON COLUMN SWITF.canal_pago IS 'Canal pago';
LABEL ON COLUMN SWITF.canal_pago TEXT IS
  'Campo Canal pago de histórico de pagos y recibidos';
COMMENT ON COLUMN SWITF.estado_pago IS
  'Campo Estado pago de histórico de pagos y recibidos vía swift';
LABEL ON COLUMN SWITF.estado_pago IS 'Estado pago';
LABEL ON COLUMN SWITF.estado_pago TEXT IS
  'Campo Estado pago de histórico de pagos y recibido';
COMMENT ON COLUMN SWITF.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN SWITF.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN SWITF.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN SWITF.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN SWITF.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN SWITF.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN SWITF.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN SWITF.version_registro IS 'Version';
LABEL ON COLUMN SWITF.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN SWITF.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN SWITF.observaciones IS 'Observaciones';
LABEL ON COLUMN SWITF.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN SWITF.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN SWITF.estado_registro IS 'Estado Reg';
LABEL ON COLUMN SWITF.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN SWITF.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN SWITF.created_at IS 'Creado';
LABEL ON COLUMN SWITF.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN SWITF.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN SWITF.updated_at IS 'Actualizado';
LABEL ON COLUMN SWITF.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_switf_pk;
CREATE INDEX idx_switf_pk ON SWITF (codigo_banco, numero_referencia);
DROP INDEX IF EXISTS idx_switf_created_at;
CREATE INDEX idx_switf_created_at ON SWITF (created_at);

--==============================================================================
-- Nombre de la Tabla: CNTRLPRF
-- DESCRIPCION: Archivo de Control de Pagos y Recibos.
-- Objetivo: Persistir informacion funcional de archivo de control de pagos y
-- recibos en el entorno IBM i del taller.
-- Tipo de Tabla: Control
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de control
-- de pagos y recibos
-- Restricciones: Clave reportada: Banco, ?PAR?, Código de Tabla
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE CNTRLPRF (
    codigo_banco FOR COLUMN COBA VARCHAR(20),
    parametro FOR COLUMN SPARAM VARCHAR(20),
    codigo_tabla FOR COLUMN COTA VARCHAR(20),
    fecha_operacion FOR COLUMN FEOP DATE,
    monto FOR COLUMN SMONTO DECIMAL(18,2),
    beneficiario FOR COLUMN SBENEF VARCHAR(80),
    banco_destino FOR COLUMN BADE VARCHAR(80),
    canal_pago FOR COLUMN CAPA VARCHAR(20),
    estado_pago FOR COLUMN ESPA VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_cntrlprf PRIMARY KEY (codigo_banco, parametro, codigo_tabla)
) RCDFMT CNTRLPRFR;

COMMENT ON TABLE CNTRLPRF IS 'Archivo de Control de Pagos y Recibos.';
LABEL ON TABLE CNTRLPRF IS 'CNTRLPRF - Archivo de Control de Pagos y Recibos.';
COMMENT ON COLUMN CNTRLPRF.codigo_banco IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLPRF.codigo_banco IS 'Cod Banco';
LABEL ON COLUMN CNTRLPRF.codigo_banco TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLPRF.parametro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLPRF.parametro IS 'Parametro';
LABEL ON COLUMN CNTRLPRF.parametro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLPRF.codigo_tabla IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN CNTRLPRF.codigo_tabla IS 'Codigo tabla';
LABEL ON COLUMN CNTRLPRF.codigo_tabla TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN CNTRLPRF.fecha_operacion IS
  'Fecha de la operacion transaccional';
LABEL ON COLUMN CNTRLPRF.fecha_operacion IS 'Fecha Oper';
LABEL ON COLUMN CNTRLPRF.fecha_operacion TEXT IS
  'Fecha de la operacion transaccional';
COMMENT ON COLUMN CNTRLPRF.monto IS
  'Monto monetario de la transaccion o partida';
LABEL ON COLUMN CNTRLPRF.monto IS 'Monto';
LABEL ON COLUMN CNTRLPRF.monto TEXT IS
  'Monto monetario de la transaccion o partida';
COMMENT ON COLUMN CNTRLPRF.beneficiario IS
  'Campo Beneficiario de archivo de control de pagos y recibos';
LABEL ON COLUMN CNTRLPRF.beneficiario IS 'Beneficiario';
LABEL ON COLUMN CNTRLPRF.beneficiario TEXT IS
  'Campo Beneficiario de archivo de control de pagos';
COMMENT ON COLUMN CNTRLPRF.banco_destino IS
  'Campo Banco destino de archivo de control de pagos y recibos';
LABEL ON COLUMN CNTRLPRF.banco_destino IS 'Banco destino';
LABEL ON COLUMN CNTRLPRF.banco_destino TEXT IS
  'Campo Banco destino de archivo de control de pagos';
COMMENT ON COLUMN CNTRLPRF.canal_pago IS
  'Campo Canal pago de archivo de control de pagos y recibos';
LABEL ON COLUMN CNTRLPRF.canal_pago IS 'Canal pago';
LABEL ON COLUMN CNTRLPRF.canal_pago TEXT IS
  'Campo Canal pago de archivo de control de pagos y';
COMMENT ON COLUMN CNTRLPRF.estado_pago IS
  'Campo Estado pago de archivo de control de pagos y recibos';
LABEL ON COLUMN CNTRLPRF.estado_pago IS 'Estado pago';
LABEL ON COLUMN CNTRLPRF.estado_pago TEXT IS
  'Campo Estado pago de archivo de control de pagos y';
COMMENT ON COLUMN CNTRLPRF.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN CNTRLPRF.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN CNTRLPRF.usuario_creacion TEXT IS
  'Usuario que creo el registro';
COMMENT ON COLUMN CNTRLPRF.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN CNTRLPRF.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN CNTRLPRF.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN CNTRLPRF.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN CNTRLPRF.version_registro IS 'Version';
LABEL ON COLUMN CNTRLPRF.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN CNTRLPRF.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN CNTRLPRF.observaciones IS 'Observaciones';
LABEL ON COLUMN CNTRLPRF.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN CNTRLPRF.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN CNTRLPRF.estado_registro IS 'Estado Reg';
LABEL ON COLUMN CNTRLPRF.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN CNTRLPRF.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN CNTRLPRF.created_at IS 'Creado';
LABEL ON COLUMN CNTRLPRF.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN CNTRLPRF.updated_at IS
  'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN CNTRLPRF.updated_at IS 'Actualizado';
LABEL ON COLUMN CNTRLPRF.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_cntrlprf_pk;
CREATE INDEX idx_cntrlprf_pk ON CNTRLPRF (codigo_banco, parametro);
DROP INDEX IF EXISTS idx_cntrlprf_created_at;
CREATE INDEX idx_cntrlprf_created_at ON CNTRLPRF (created_at);

--==============================================================================
-- Nombre de la Tabla: PLPCR
-- DESCRIPCION: Propuestas de Crédito
-- Objetivo: Persistir informacion funcional de propuestas de crédito en el
-- entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de propuestas de
-- crédito
-- Restricciones: Clave reportada: Numero de Propuesta.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE PLPCR (
    numero_propuesta FOR COLUMN NUPR VARCHAR(30),
    fecha_propuesta FOR COLUMN FEPR DATE,
    monto_solicitado FOR COLUMN MOSO DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    tasa_propuesta FOR COLUMN TAPR DECIMAL(18,2),
    dictamen_credito FOR COLUMN DICR VARCHAR(120),
    estado_propuesta FOR COLUMN ESPR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_plpcr PRIMARY KEY (numero_propuesta)
) RCDFMT PLPCRR;

COMMENT ON TABLE PLPCR IS 'Propuestas de Crédito';
LABEL ON TABLE PLPCR IS 'PLPCR - Propuestas de Crédito';
COMMENT ON COLUMN PLPCR.numero_propuesta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN PLPCR.numero_propuesta IS 'Numero propuesta';
LABEL ON COLUMN PLPCR.numero_propuesta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN PLPCR.fecha_propuesta IS
  'Campo Fecha propuesta de propuestas de crédito';
LABEL ON COLUMN PLPCR.fecha_propuesta IS 'Fecha propuesta';
LABEL ON COLUMN PLPCR.fecha_propuesta TEXT IS
  'Campo Fecha propuesta de propuestas de crédito';
COMMENT ON COLUMN PLPCR.monto_solicitado IS
  'Campo Monto solicitado de propuestas de crédito';
LABEL ON COLUMN PLPCR.monto_solicitado IS 'Monto solicitado';
LABEL ON COLUMN PLPCR.monto_solicitado TEXT IS
  'Campo Monto solicitado de propuestas de crédito';
COMMENT ON COLUMN PLPCR.plazo_meses IS
  'Campo Plazo meses de propuestas de crédito';
LABEL ON COLUMN PLPCR.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN PLPCR.plazo_meses TEXT IS
  'Campo Plazo meses de propuestas de crédito';
COMMENT ON COLUMN PLPCR.tasa_propuesta IS
  'Campo Tasa propuesta de propuestas de crédito';
LABEL ON COLUMN PLPCR.tasa_propuesta IS 'Tasa propuesta';
LABEL ON COLUMN PLPCR.tasa_propuesta TEXT IS
  'Campo Tasa propuesta de propuestas de crédito';
COMMENT ON COLUMN PLPCR.dictamen_credito IS
  'Campo Dictamen credito de propuestas de crédito';
LABEL ON COLUMN PLPCR.dictamen_credito IS 'Dictamen credito';
LABEL ON COLUMN PLPCR.dictamen_credito TEXT IS
  'Campo Dictamen credito de propuestas de crédito';
COMMENT ON COLUMN PLPCR.estado_propuesta IS
  'Campo Estado propuesta de propuestas de crédito';
LABEL ON COLUMN PLPCR.estado_propuesta IS 'Estado propuesta';
LABEL ON COLUMN PLPCR.estado_propuesta TEXT IS
  'Campo Estado propuesta de propuestas de crédito';
COMMENT ON COLUMN PLPCR.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN PLPCR.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN PLPCR.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN PLPCR.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN PLPCR.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN PLPCR.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN PLPCR.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN PLPCR.version_registro IS 'Version';
LABEL ON COLUMN PLPCR.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN PLPCR.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN PLPCR.observaciones IS 'Observaciones';
LABEL ON COLUMN PLPCR.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN PLPCR.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN PLPCR.estado_registro IS 'Estado Reg';
LABEL ON COLUMN PLPCR.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN PLPCR.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN PLPCR.created_at IS 'Creado';
LABEL ON COLUMN PLPCR.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN PLPCR.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN PLPCR.updated_at IS 'Actualizado';
LABEL ON COLUMN PLPCR.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_plpcr_pk;
CREATE INDEX idx_plpcr_pk ON PLPCR (numero_propuesta);
DROP INDEX IF EXISTS idx_plpcr_created_at;
CREATE INDEX idx_plpcr_created_at ON PLPCR (created_at);

--==============================================================================
-- Nombre de la Tabla: PLPRD
-- DESCRIPCION: Detalle de Productos asociados a una propuesta.
-- Objetivo: Persistir informacion funcional de detalle de productos asociados a
-- una propuesta en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de detalle de productos
-- asociados a una propuesta
-- Restricciones: Clave reportada: Numero de Propuesta, Producto, Tipo de
-- Producto.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE PLPRD (
    numero_propuesta FOR COLUMN NUPR VARCHAR(30),
    codigo_producto FOR COLUMN COPR VARCHAR(20),
    tipo_producto FOR COLUMN TIPR VARCHAR(20),
    fecha_propuesta FOR COLUMN FEPR DATE,
    monto_solicitado FOR COLUMN MOSO DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    tasa_propuesta FOR COLUMN TAPR DECIMAL(18,2),
    dictamen_credito FOR COLUMN DICR VARCHAR(120),
    estado_propuesta FOR COLUMN ESPR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_plprd PRIMARY KEY (numero_propuesta, codigo_producto
      , tipo_producto)
) RCDFMT PLPRDR;

COMMENT ON TABLE PLPRD IS 'Detalle de Productos asociados a una propuesta.';
LABEL ON TABLE PLPRD IS 'PLPRD - Detalle de Productos asociados a una propu';
COMMENT ON COLUMN PLPRD.numero_propuesta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN PLPRD.numero_propuesta IS 'Numero propuesta';
LABEL ON COLUMN PLPRD.numero_propuesta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN PLPRD.codigo_producto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN PLPRD.codigo_producto IS 'Codigo producto';
LABEL ON COLUMN PLPRD.codigo_producto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN PLPRD.tipo_producto IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN PLPRD.tipo_producto IS 'Tipo producto';
LABEL ON COLUMN PLPRD.tipo_producto TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN PLPRD.fecha_propuesta IS
  'Campo Fecha propuesta de detalle de productos asociados a una propuesta';
LABEL ON COLUMN PLPRD.fecha_propuesta IS 'Fecha propuesta';
LABEL ON COLUMN PLPRD.fecha_propuesta TEXT IS
  'Campo Fecha propuesta de detalle de productos asoc';
COMMENT ON COLUMN PLPRD.monto_solicitado IS
  'Campo Monto solicitado de detalle de productos asociados a una propuesta';
LABEL ON COLUMN PLPRD.monto_solicitado IS 'Monto solicitado';
LABEL ON COLUMN PLPRD.monto_solicitado TEXT IS
  'Campo Monto solicitado de detalle de productos aso';
COMMENT ON COLUMN PLPRD.plazo_meses IS
  'Campo Plazo meses de detalle de productos asociados a una propuesta';
LABEL ON COLUMN PLPRD.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN PLPRD.plazo_meses TEXT IS
  'Campo Plazo meses de detalle de productos asociado';
COMMENT ON COLUMN PLPRD.tasa_propuesta IS
  'Campo Tasa propuesta de detalle de productos asociados a una propuesta';
LABEL ON COLUMN PLPRD.tasa_propuesta IS 'Tasa propuesta';
LABEL ON COLUMN PLPRD.tasa_propuesta TEXT IS
  'Campo Tasa propuesta de detalle de productos asoci';
COMMENT ON COLUMN PLPRD.dictamen_credito IS
  'Campo Dictamen credito de detalle de productos asociados a una propuesta';
LABEL ON COLUMN PLPRD.dictamen_credito IS 'Dictamen credito';
LABEL ON COLUMN PLPRD.dictamen_credito TEXT IS
  'Campo Dictamen credito de detalle de productos aso';
COMMENT ON COLUMN PLPRD.estado_propuesta IS
  'Campo Estado propuesta de detalle de productos asociados a una propuesta';
LABEL ON COLUMN PLPRD.estado_propuesta IS 'Estado propuesta';
LABEL ON COLUMN PLPRD.estado_propuesta TEXT IS
  'Campo Estado propuesta de detalle de productos aso';
COMMENT ON COLUMN PLPRD.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN PLPRD.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN PLPRD.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN PLPRD.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN PLPRD.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN PLPRD.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN PLPRD.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN PLPRD.version_registro IS 'Version';
LABEL ON COLUMN PLPRD.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN PLPRD.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN PLPRD.observaciones IS 'Observaciones';
LABEL ON COLUMN PLPRD.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN PLPRD.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN PLPRD.estado_registro IS 'Estado Reg';
LABEL ON COLUMN PLPRD.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN PLPRD.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN PLPRD.created_at IS 'Creado';
LABEL ON COLUMN PLPRD.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN PLPRD.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN PLPRD.updated_at IS 'Actualizado';
LABEL ON COLUMN PLPRD.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_plprd_pk;
CREATE INDEX idx_plprd_pk ON PLPRD (numero_propuesta, codigo_producto);
DROP INDEX IF EXISTS idx_plprd_created_at;
CREATE INDEX idx_plprd_created_at ON PLPRD (created_at);

--==============================================================================
-- Nombre de la Tabla: PLGRT
-- DESCRIPCION: Garantías asociadas a las propuestas de crédito.
-- Objetivo: Persistir informacion funcional de garantías asociadas a las
-- propuestas de crédito en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de garantías asociadas
-- a las propuestas de crédito
-- Restricciones: Clave reportada: Numero de Propuesta, Secuencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE PLGRT (
    numero_propuesta FOR COLUMN NUPR VARCHAR(30),
    secuencia FOR COLUMN SSECUE INT,
    fecha_propuesta FOR COLUMN FEPR DATE,
    monto_solicitado FOR COLUMN MOSO DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    tasa_propuesta FOR COLUMN TAPR DECIMAL(18,2),
    dictamen_credito FOR COLUMN DICR VARCHAR(120),
    estado_propuesta FOR COLUMN ESPR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_plgrt PRIMARY KEY (numero_propuesta, secuencia)
) RCDFMT PLGRTR;

COMMENT ON TABLE PLGRT IS 'Garantías asociadas a las propuestas de crédito.';
LABEL ON TABLE PLGRT IS 'PLGRT - Garantías asociadas a las propuestas de cr';
COMMENT ON COLUMN PLGRT.numero_propuesta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN PLGRT.numero_propuesta IS 'Numero propuesta';
LABEL ON COLUMN PLGRT.numero_propuesta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN PLGRT.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN PLGRT.secuencia IS 'Secuencia';
LABEL ON COLUMN PLGRT.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN PLGRT.fecha_propuesta IS
  'Campo Fecha propuesta de garantías asociadas a las propuestas de crédito';
LABEL ON COLUMN PLGRT.fecha_propuesta IS 'Fecha propuesta';
LABEL ON COLUMN PLGRT.fecha_propuesta TEXT IS
  'Campo Fecha propuesta de garantías asociadas a las';
COMMENT ON COLUMN PLGRT.monto_solicitado IS
  'Campo Monto solicitado de garantías asociadas a las propuestas de crédito';
LABEL ON COLUMN PLGRT.monto_solicitado IS 'Monto solicitado';
LABEL ON COLUMN PLGRT.monto_solicitado TEXT IS
  'Campo Monto solicitado de garantías asociadas a la';
COMMENT ON COLUMN PLGRT.plazo_meses IS
  'Campo Plazo meses de garantías asociadas a las propuestas de crédito';
LABEL ON COLUMN PLGRT.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN PLGRT.plazo_meses TEXT IS
  'Campo Plazo meses de garantías asociadas a las pro';
COMMENT ON COLUMN PLGRT.tasa_propuesta IS
  'Campo Tasa propuesta de garantías asociadas a las propuestas de crédito';
LABEL ON COLUMN PLGRT.tasa_propuesta IS 'Tasa propuesta';
LABEL ON COLUMN PLGRT.tasa_propuesta TEXT IS
  'Campo Tasa propuesta de garantías asociadas a las';
COMMENT ON COLUMN PLGRT.dictamen_credito IS
  'Campo Dictamen credito de garantías asociadas a las propuestas de crédito';
LABEL ON COLUMN PLGRT.dictamen_credito IS 'Dictamen credito';
LABEL ON COLUMN PLGRT.dictamen_credito TEXT IS
  'Campo Dictamen credito de garantías asociadas a la';
COMMENT ON COLUMN PLGRT.estado_propuesta IS
  'Campo Estado propuesta de garantías asociadas a las propuestas de crédito';
LABEL ON COLUMN PLGRT.estado_propuesta IS 'Estado propuesta';
LABEL ON COLUMN PLGRT.estado_propuesta TEXT IS
  'Campo Estado propuesta de garantías asociadas a la';
COMMENT ON COLUMN PLGRT.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN PLGRT.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN PLGRT.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN PLGRT.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN PLGRT.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN PLGRT.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN PLGRT.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN PLGRT.version_registro IS 'Version';
LABEL ON COLUMN PLGRT.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN PLGRT.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN PLGRT.observaciones IS 'Observaciones';
LABEL ON COLUMN PLGRT.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN PLGRT.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN PLGRT.estado_registro IS 'Estado Reg';
LABEL ON COLUMN PLGRT.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN PLGRT.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN PLGRT.created_at IS 'Creado';
LABEL ON COLUMN PLGRT.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN PLGRT.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN PLGRT.updated_at IS 'Actualizado';
LABEL ON COLUMN PLGRT.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_plgrt_pk;
CREATE INDEX idx_plgrt_pk ON PLGRT (numero_propuesta, secuencia);
DROP INDEX IF EXISTS idx_plgrt_created_at;
CREATE INDEX idx_plgrt_created_at ON PLGRT (created_at);

--==============================================================================
-- Nombre de la Tabla: DPMST
-- DESCRIPCION: Cabecera de la Declaración Patrimonial de Personas Naturales.
-- Objetivo: Persistir informacion funcional de cabecera de la declaración
-- patrimonial de personas naturales en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de cabecera de la
-- declaración patrimonial de personas naturales
-- Restricciones: Clave reportada: Cliente, Secuencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DPMST (
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    secuencia FOR COLUMN SSECUE INT,
    fecha_propuesta FOR COLUMN FEPR DATE,
    monto_solicitado FOR COLUMN MOSO DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    tasa_propuesta FOR COLUMN TAPR DECIMAL(18,2),
    dictamen_credito FOR COLUMN DICR VARCHAR(120),
    estado_propuesta FOR COLUMN ESPR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_dpmst PRIMARY KEY (id_cliente, secuencia)
) RCDFMT DPMSTR;

COMMENT ON TABLE DPMST IS
  'Cabecera de la Declaración Patrimonial de Personas Naturales.';
LABEL ON TABLE DPMST IS 'DPMST - Cabecera de la Declaración Patrimonial de';
COMMENT ON COLUMN DPMST.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DPMST.id_cliente IS 'Id Cliente';
LABEL ON COLUMN DPMST.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DPMST.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DPMST.secuencia IS 'Secuencia';
LABEL ON COLUMN DPMST.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DPMST.fecha_propuesta IS
  'Campo Fecha propuesta de cabecera de la declaración patrimonial de personas'
  ' naturales';
LABEL ON COLUMN DPMST.fecha_propuesta IS 'Fecha propuesta';
LABEL ON COLUMN DPMST.fecha_propuesta TEXT IS
  'Campo Fecha propuesta de cabecera de la declaració';
COMMENT ON COLUMN DPMST.monto_solicitado IS
  'Campo Monto solicitado de cabecera de la declaración patrimonial de persona'
  's naturales';
LABEL ON COLUMN DPMST.monto_solicitado IS 'Monto solicitado';
LABEL ON COLUMN DPMST.monto_solicitado TEXT IS
  'Campo Monto solicitado de cabecera de la declaraci';
COMMENT ON COLUMN DPMST.plazo_meses IS
  'Campo Plazo meses de cabecera de la declaración patrimonial de personas nat'
  'urales';
LABEL ON COLUMN DPMST.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN DPMST.plazo_meses TEXT IS
  'Campo Plazo meses de cabecera de la declaración pa';
COMMENT ON COLUMN DPMST.tasa_propuesta IS
  'Campo Tasa propuesta de cabecera de la declaración patrimonial de personas '
  'naturales';
LABEL ON COLUMN DPMST.tasa_propuesta IS 'Tasa propuesta';
LABEL ON COLUMN DPMST.tasa_propuesta TEXT IS
  'Campo Tasa propuesta de cabecera de la declaración';
COMMENT ON COLUMN DPMST.dictamen_credito IS
  'Campo Dictamen credito de cabecera de la declaración patrimonial de persona'
  's naturales';
LABEL ON COLUMN DPMST.dictamen_credito IS 'Dictamen credito';
LABEL ON COLUMN DPMST.dictamen_credito TEXT IS
  'Campo Dictamen credito de cabecera de la declaraci';
COMMENT ON COLUMN DPMST.estado_propuesta IS
  'Campo Estado propuesta de cabecera de la declaración patrimonial de persona'
  's naturales';
LABEL ON COLUMN DPMST.estado_propuesta IS 'Estado propuesta';
LABEL ON COLUMN DPMST.estado_propuesta TEXT IS
  'Campo Estado propuesta de cabecera de la declaraci';
COMMENT ON COLUMN DPMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DPMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DPMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DPMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DPMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DPMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DPMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DPMST.version_registro IS 'Version';
LABEL ON COLUMN DPMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DPMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DPMST.observaciones IS 'Observaciones';
LABEL ON COLUMN DPMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DPMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DPMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DPMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DPMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DPMST.created_at IS 'Creado';
LABEL ON COLUMN DPMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DPMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DPMST.updated_at IS 'Actualizado';
LABEL ON COLUMN DPMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_dpmst_pk;
CREATE INDEX idx_dpmst_pk ON DPMST (id_cliente, secuencia);
DROP INDEX IF EXISTS idx_dpmst_created_at;
CREATE INDEX idx_dpmst_created_at ON DPMST (created_at);

--==============================================================================
-- Nombre de la Tabla: DPDTL
-- DESCRIPCION: Detalle de la Declaración Patrimonial de Personas Naturales.
-- Objetivo: Persistir informacion funcional de detalle de la declaración
-- patrimonial de personas naturales en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de detalle de la
-- declaración patrimonial de personas naturales
-- Restricciones: Clave reportada: Cliente, Secuencia, Tipo de Registro.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DPDTL (
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    secuencia FOR COLUMN SSECUE INT,
    tipo_registro FOR COLUMN TIRE VARCHAR(20),
    fecha_propuesta FOR COLUMN FEPR DATE,
    monto_solicitado FOR COLUMN MOSO DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    tasa_propuesta FOR COLUMN TAPR DECIMAL(18,2),
    dictamen_credito FOR COLUMN DICR VARCHAR(120),
    estado_propuesta FOR COLUMN ESPR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_dpdtl PRIMARY KEY (id_cliente, secuencia, tipo_registro)
) RCDFMT DPDTLR;

COMMENT ON TABLE DPDTL IS
  'Detalle de la Declaración Patrimonial de Personas Naturales.';
LABEL ON TABLE DPDTL IS 'DPDTL - Detalle de la Declaración Patrimonial de P';
COMMENT ON COLUMN DPDTL.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DPDTL.id_cliente IS 'Id Cliente';
LABEL ON COLUMN DPDTL.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DPDTL.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DPDTL.secuencia IS 'Secuencia';
LABEL ON COLUMN DPDTL.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DPDTL.tipo_registro IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DPDTL.tipo_registro IS 'Tipo registro';
LABEL ON COLUMN DPDTL.tipo_registro TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DPDTL.fecha_propuesta IS
  'Campo Fecha propuesta de detalle de la declaración patrimonial de personas '
  'naturales';
LABEL ON COLUMN DPDTL.fecha_propuesta IS 'Fecha propuesta';
LABEL ON COLUMN DPDTL.fecha_propuesta TEXT IS
  'Campo Fecha propuesta de detalle de la declaración';
COMMENT ON COLUMN DPDTL.monto_solicitado IS
  'Campo Monto solicitado de detalle de la declaración patrimonial de personas'
  ' naturales';
LABEL ON COLUMN DPDTL.monto_solicitado IS 'Monto solicitado';
LABEL ON COLUMN DPDTL.monto_solicitado TEXT IS
  'Campo Monto solicitado de detalle de la declaració';
COMMENT ON COLUMN DPDTL.plazo_meses IS
  'Campo Plazo meses de detalle de la declaración patrimonial de personas natu'
  'rales';
LABEL ON COLUMN DPDTL.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN DPDTL.plazo_meses TEXT IS
  'Campo Plazo meses de detalle de la declaración pat';
COMMENT ON COLUMN DPDTL.tasa_propuesta IS
  'Campo Tasa propuesta de detalle de la declaración patrimonial de personas n'
  'aturales';
LABEL ON COLUMN DPDTL.tasa_propuesta IS 'Tasa propuesta';
LABEL ON COLUMN DPDTL.tasa_propuesta TEXT IS
  'Campo Tasa propuesta de detalle de la declaración';
COMMENT ON COLUMN DPDTL.dictamen_credito IS
  'Campo Dictamen credito de detalle de la declaración patrimonial de personas'
  ' naturales';
LABEL ON COLUMN DPDTL.dictamen_credito IS 'Dictamen credito';
LABEL ON COLUMN DPDTL.dictamen_credito TEXT IS
  'Campo Dictamen credito de detalle de la declaració';
COMMENT ON COLUMN DPDTL.estado_propuesta IS
  'Campo Estado propuesta de detalle de la declaración patrimonial de personas'
  ' naturales';
LABEL ON COLUMN DPDTL.estado_propuesta IS 'Estado propuesta';
LABEL ON COLUMN DPDTL.estado_propuesta TEXT IS
  'Campo Estado propuesta de detalle de la declaració';
COMMENT ON COLUMN DPDTL.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DPDTL.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DPDTL.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DPDTL.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DPDTL.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DPDTL.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DPDTL.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DPDTL.version_registro IS 'Version';
LABEL ON COLUMN DPDTL.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DPDTL.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DPDTL.observaciones IS 'Observaciones';
LABEL ON COLUMN DPDTL.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DPDTL.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DPDTL.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DPDTL.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DPDTL.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DPDTL.created_at IS 'Creado';
LABEL ON COLUMN DPDTL.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DPDTL.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DPDTL.updated_at IS 'Actualizado';
LABEL ON COLUMN DPDTL.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_dpdtl_pk;
CREATE INDEX idx_dpdtl_pk ON DPDTL (id_cliente, secuencia);
DROP INDEX IF EXISTS idx_dpdtl_created_at;
CREATE INDEX idx_dpdtl_created_at ON DPDTL (created_at);

--==============================================================================
-- Nombre de la Tabla: IFMST
-- DESCRIPCION: Cabecera de Declaración Patrimonial de Personas Jurídicas.
-- Objetivo: Persistir informacion funcional de cabecera de declaración
-- patrimonial de personas jurídicas en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de cabecera de
-- declaración patrimonial de personas jurídicas
-- Restricciones: Clave reportada: Cliente, Año, Mes, Formato de Balance.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE IFMST (
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    anio FOR COLUMN SANIO INT,
    mes FOR COLUMN SMES INT,
    formato_balance FOR COLUMN FOBA VARCHAR(50),
    fecha_propuesta FOR COLUMN FEPR DATE,
    monto_solicitado FOR COLUMN MOSO DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    tasa_propuesta FOR COLUMN TAPR DECIMAL(18,2),
    dictamen_credito FOR COLUMN DICR VARCHAR(120),
    estado_propuesta FOR COLUMN ESPR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ifmst PRIMARY KEY (id_cliente, anio, mes, formato_balance)
) RCDFMT IFMSTR;

COMMENT ON TABLE IFMST IS
  'Cabecera de Declaración Patrimonial de Personas Jurídicas.';
LABEL ON TABLE IFMST IS 'IFMST - Cabecera de Declaración Patrimonial de Per';
COMMENT ON COLUMN IFMST.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN IFMST.id_cliente IS 'Id Cliente';
LABEL ON COLUMN IFMST.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN IFMST.anio IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN IFMST.anio IS 'Anio';
LABEL ON COLUMN IFMST.anio TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN IFMST.mes IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN IFMST.mes IS 'Mes';
LABEL ON COLUMN IFMST.mes TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN IFMST.formato_balance IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN IFMST.formato_balance IS 'Formato balance';
LABEL ON COLUMN IFMST.formato_balance TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN IFMST.fecha_propuesta IS
  'Campo Fecha propuesta de cabecera de declaración patrimonial de personas ju'
  'rídicas';
LABEL ON COLUMN IFMST.fecha_propuesta IS 'Fecha propuesta';
LABEL ON COLUMN IFMST.fecha_propuesta TEXT IS
  'Campo Fecha propuesta de cabecera de declaración p';
COMMENT ON COLUMN IFMST.monto_solicitado IS
  'Campo Monto solicitado de cabecera de declaración patrimonial de personas j'
  'urídicas';
LABEL ON COLUMN IFMST.monto_solicitado IS 'Monto solicitado';
LABEL ON COLUMN IFMST.monto_solicitado TEXT IS
  'Campo Monto solicitado de cabecera de declaración';
COMMENT ON COLUMN IFMST.plazo_meses IS
  'Campo Plazo meses de cabecera de declaración patrimonial de personas juríd'
  'icas';
LABEL ON COLUMN IFMST.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN IFMST.plazo_meses TEXT IS
  'Campo Plazo meses de cabecera de declaración patri';
COMMENT ON COLUMN IFMST.tasa_propuesta IS
  'Campo Tasa propuesta de cabecera de declaración patrimonial de personas jur'
  'ídicas';
LABEL ON COLUMN IFMST.tasa_propuesta IS 'Tasa propuesta';
LABEL ON COLUMN IFMST.tasa_propuesta TEXT IS
  'Campo Tasa propuesta de cabecera de declaración pa';
COMMENT ON COLUMN IFMST.dictamen_credito IS
  'Campo Dictamen credito de cabecera de declaración patrimonial de personas j'
  'urídicas';
LABEL ON COLUMN IFMST.dictamen_credito IS 'Dictamen credito';
LABEL ON COLUMN IFMST.dictamen_credito TEXT IS
  'Campo Dictamen credito de cabecera de declaración';
COMMENT ON COLUMN IFMST.estado_propuesta IS
  'Campo Estado propuesta de cabecera de declaración patrimonial de personas j'
  'urídicas';
LABEL ON COLUMN IFMST.estado_propuesta IS 'Estado propuesta';
LABEL ON COLUMN IFMST.estado_propuesta TEXT IS
  'Campo Estado propuesta de cabecera de declaración';
COMMENT ON COLUMN IFMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN IFMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN IFMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN IFMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN IFMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN IFMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN IFMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN IFMST.version_registro IS 'Version';
LABEL ON COLUMN IFMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN IFMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN IFMST.observaciones IS 'Observaciones';
LABEL ON COLUMN IFMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN IFMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN IFMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN IFMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN IFMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN IFMST.created_at IS 'Creado';
LABEL ON COLUMN IFMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN IFMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN IFMST.updated_at IS 'Actualizado';
LABEL ON COLUMN IFMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ifmst_pk;
CREATE INDEX idx_ifmst_pk ON IFMST (id_cliente, anio);
DROP INDEX IF EXISTS idx_ifmst_created_at;
CREATE INDEX idx_ifmst_created_at ON IFMST (created_at);

--==============================================================================
-- Nombre de la Tabla: IFDTL
-- DESCRIPCION: Detalle de Declaración Patrimonial de Personas Jurídicas.
-- Objetivo: Persistir informacion funcional de detalle de declaración
-- patrimonial de personas jurídicas en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de detalle de
-- declaración patrimonial de personas jurídicas
-- Restricciones: Clave reportada: Cliente, Año, Mes, Formato de Balance,
-- Código de Línea, Código de Cuenta.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE IFDTL (
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    anio FOR COLUMN SANIO INT,
    mes FOR COLUMN SMES INT,
    formato_balance FOR COLUMN FOBA VARCHAR(50),
    codigo_linea FOR COLUMN COLI VARCHAR(20),
    codigo_cuenta FOR COLUMN COCU VARCHAR(20),
    fecha_propuesta FOR COLUMN FEPR DATE,
    monto_solicitado FOR COLUMN MOSO DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    tasa_propuesta FOR COLUMN TAPR DECIMAL(18,2),
    dictamen_credito FOR COLUMN DICR VARCHAR(120),
    estado_propuesta FOR COLUMN ESPR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ifdtl PRIMARY KEY (id_cliente, anio, mes, formato_balance
      , codigo_linea, codigo_cuenta)
) RCDFMT IFDTLR;

COMMENT ON TABLE IFDTL IS
  'Detalle de Declaración Patrimonial de Personas Jurídicas.';
LABEL ON TABLE IFDTL IS 'IFDTL - Detalle de Declaración Patrimonial de Pers';
COMMENT ON COLUMN IFDTL.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN IFDTL.id_cliente IS 'Id Cliente';
LABEL ON COLUMN IFDTL.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN IFDTL.anio IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN IFDTL.anio IS 'Anio';
LABEL ON COLUMN IFDTL.anio TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN IFDTL.mes IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN IFDTL.mes IS 'Mes';
LABEL ON COLUMN IFDTL.mes TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN IFDTL.formato_balance IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN IFDTL.formato_balance IS 'Formato balance';
LABEL ON COLUMN IFDTL.formato_balance TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN IFDTL.codigo_linea IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN IFDTL.codigo_linea IS 'Codigo linea';
LABEL ON COLUMN IFDTL.codigo_linea TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN IFDTL.codigo_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN IFDTL.codigo_cuenta IS 'Codigo cuenta';
LABEL ON COLUMN IFDTL.codigo_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN IFDTL.fecha_propuesta IS
  'Campo Fecha propuesta de detalle de declaración patrimonial de personas jur'
  'ídicas';
LABEL ON COLUMN IFDTL.fecha_propuesta IS 'Fecha propuesta';
LABEL ON COLUMN IFDTL.fecha_propuesta TEXT IS
  'Campo Fecha propuesta de detalle de declaración pa';
COMMENT ON COLUMN IFDTL.monto_solicitado IS
  'Campo Monto solicitado de detalle de declaración patrimonial de personas ju'
  'rídicas';
LABEL ON COLUMN IFDTL.monto_solicitado IS 'Monto solicitado';
LABEL ON COLUMN IFDTL.monto_solicitado TEXT IS
  'Campo Monto solicitado de detalle de declaración p';
COMMENT ON COLUMN IFDTL.plazo_meses IS
  'Campo Plazo meses de detalle de declaración patrimonial de personas jurídi'
  'cas';
LABEL ON COLUMN IFDTL.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN IFDTL.plazo_meses TEXT IS
  'Campo Plazo meses de detalle de declaración patrim';
COMMENT ON COLUMN IFDTL.tasa_propuesta IS
  'Campo Tasa propuesta de detalle de declaración patrimonial de personas jur'
  'ídicas';
LABEL ON COLUMN IFDTL.tasa_propuesta IS 'Tasa propuesta';
LABEL ON COLUMN IFDTL.tasa_propuesta TEXT IS
  'Campo Tasa propuesta de detalle de declaración pat';
COMMENT ON COLUMN IFDTL.dictamen_credito IS
  'Campo Dictamen credito de detalle de declaración patrimonial de personas ju'
  'rídicas';
LABEL ON COLUMN IFDTL.dictamen_credito IS 'Dictamen credito';
LABEL ON COLUMN IFDTL.dictamen_credito TEXT IS
  'Campo Dictamen credito de detalle de declaración p';
COMMENT ON COLUMN IFDTL.estado_propuesta IS
  'Campo Estado propuesta de detalle de declaración patrimonial de personas ju'
  'rídicas';
LABEL ON COLUMN IFDTL.estado_propuesta IS 'Estado propuesta';
LABEL ON COLUMN IFDTL.estado_propuesta TEXT IS
  'Campo Estado propuesta de detalle de declaración p';
COMMENT ON COLUMN IFDTL.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN IFDTL.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN IFDTL.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN IFDTL.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN IFDTL.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN IFDTL.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN IFDTL.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN IFDTL.version_registro IS 'Version';
LABEL ON COLUMN IFDTL.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN IFDTL.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN IFDTL.observaciones IS 'Observaciones';
LABEL ON COLUMN IFDTL.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN IFDTL.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN IFDTL.estado_registro IS 'Estado Reg';
LABEL ON COLUMN IFDTL.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN IFDTL.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN IFDTL.created_at IS 'Creado';
LABEL ON COLUMN IFDTL.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN IFDTL.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN IFDTL.updated_at IS 'Actualizado';
LABEL ON COLUMN IFDTL.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ifdtl_pk;
CREATE INDEX idx_ifdtl_pk ON IFDTL (id_cliente, anio);
DROP INDEX IF EXISTS idx_ifdtl_created_at;
CREATE INDEX idx_ifdtl_created_at ON IFDTL (created_at);

--==============================================================================
-- Nombre de la Tabla: DPGLN
-- DESCRIPCION: Plan de Cuentas de nuestros Clientes.
-- Objetivo: Persistir informacion funcional de plan de cuentas de nuestros
-- clientes en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de plan de cuentas de
-- nuestros clientes
-- Restricciones: Clave reportada: Tipo de Balance, Código de Cuenta
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DPGLN (
    tipo_balance FOR COLUMN TIBA VARCHAR(20),
    codigo_cuenta FOR COLUMN COCU VARCHAR(20),
    fecha_propuesta FOR COLUMN FEPR DATE,
    monto_solicitado FOR COLUMN MOSO DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    tasa_propuesta FOR COLUMN TAPR DECIMAL(18,2),
    dictamen_credito FOR COLUMN DICR VARCHAR(120),
    estado_propuesta FOR COLUMN ESPR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_dpgln PRIMARY KEY (tipo_balance, codigo_cuenta)
) RCDFMT DPGLNR;

COMMENT ON TABLE DPGLN IS 'Plan de Cuentas de nuestros Clientes.';
LABEL ON TABLE DPGLN IS 'DPGLN - Plan de Cuentas de nuestros Clientes.';
COMMENT ON COLUMN DPGLN.tipo_balance IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DPGLN.tipo_balance IS 'Tipo balance';
LABEL ON COLUMN DPGLN.tipo_balance TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DPGLN.codigo_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DPGLN.codigo_cuenta IS 'Codigo cuenta';
LABEL ON COLUMN DPGLN.codigo_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DPGLN.fecha_propuesta IS
  'Campo Fecha propuesta de plan de cuentas de nuestros clientes';
LABEL ON COLUMN DPGLN.fecha_propuesta IS 'Fecha propuesta';
LABEL ON COLUMN DPGLN.fecha_propuesta TEXT IS
  'Campo Fecha propuesta de plan de cuentas de nuestr';
COMMENT ON COLUMN DPGLN.monto_solicitado IS
  'Campo Monto solicitado de plan de cuentas de nuestros clientes';
LABEL ON COLUMN DPGLN.monto_solicitado IS 'Monto solicitado';
LABEL ON COLUMN DPGLN.monto_solicitado TEXT IS
  'Campo Monto solicitado de plan de cuentas de nuest';
COMMENT ON COLUMN DPGLN.plazo_meses IS
  'Campo Plazo meses de plan de cuentas de nuestros clientes';
LABEL ON COLUMN DPGLN.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN DPGLN.plazo_meses TEXT IS
  'Campo Plazo meses de plan de cuentas de nuestros c';
COMMENT ON COLUMN DPGLN.tasa_propuesta IS
  'Campo Tasa propuesta de plan de cuentas de nuestros clientes';
LABEL ON COLUMN DPGLN.tasa_propuesta IS 'Tasa propuesta';
LABEL ON COLUMN DPGLN.tasa_propuesta TEXT IS
  'Campo Tasa propuesta de plan de cuentas de nuestro';
COMMENT ON COLUMN DPGLN.dictamen_credito IS
  'Campo Dictamen credito de plan de cuentas de nuestros clientes';
LABEL ON COLUMN DPGLN.dictamen_credito IS 'Dictamen credito';
LABEL ON COLUMN DPGLN.dictamen_credito TEXT IS
  'Campo Dictamen credito de plan de cuentas de nuest';
COMMENT ON COLUMN DPGLN.estado_propuesta IS
  'Campo Estado propuesta de plan de cuentas de nuestros clientes';
LABEL ON COLUMN DPGLN.estado_propuesta IS 'Estado propuesta';
LABEL ON COLUMN DPGLN.estado_propuesta TEXT IS
  'Campo Estado propuesta de plan de cuentas de nuest';
COMMENT ON COLUMN DPGLN.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DPGLN.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DPGLN.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DPGLN.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DPGLN.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DPGLN.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DPGLN.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DPGLN.version_registro IS 'Version';
LABEL ON COLUMN DPGLN.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DPGLN.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DPGLN.observaciones IS 'Observaciones';
LABEL ON COLUMN DPGLN.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DPGLN.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DPGLN.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DPGLN.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DPGLN.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DPGLN.created_at IS 'Creado';
LABEL ON COLUMN DPGLN.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DPGLN.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DPGLN.updated_at IS 'Actualizado';
LABEL ON COLUMN DPGLN.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_dpgln_pk;
CREATE INDEX idx_dpgln_pk ON DPGLN (tipo_balance, codigo_cuenta);
DROP INDEX IF EXISTS idx_dpgln_created_at;
CREATE INDEX idx_dpgln_created_at ON DPGLN (created_at);

--==============================================================================
-- Nombre de la Tabla: LIMST
-- DESCRIPCION: Cabecera de Declaración Legal de Personas Jurídicas.
-- Objetivo: Persistir informacion funcional de cabecera de declaración legal
-- de personas jurídicas en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de cabecera de
-- declaración legal de personas jurídicas
-- Restricciones: Clave reportada: Cliente.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE LIMST (
    id_cliente FOR COLUMN IDCL VARCHAR(30),
    fecha_propuesta FOR COLUMN FEPR DATE,
    monto_solicitado FOR COLUMN MOSO DECIMAL(18,2),
    plazo_meses FOR COLUMN PLME INT,
    tasa_propuesta FOR COLUMN TAPR DECIMAL(18,2),
    dictamen_credito FOR COLUMN DICR VARCHAR(120),
    estado_propuesta FOR COLUMN ESPR VARCHAR(20),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_limst PRIMARY KEY (id_cliente)
) RCDFMT LIMSTR;

COMMENT ON TABLE LIMST IS
  'Cabecera de Declaración Legal de Personas Jurídicas.';
LABEL ON TABLE LIMST IS 'LIMST - Cabecera de Declaración Legal de Personas';
COMMENT ON COLUMN LIMST.id_cliente IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN LIMST.id_cliente IS 'Id Cliente';
LABEL ON COLUMN LIMST.id_cliente TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN LIMST.fecha_propuesta IS
  'Campo Fecha propuesta de cabecera de declaración legal de personas jurídic'
  'as';
LABEL ON COLUMN LIMST.fecha_propuesta IS 'Fecha propuesta';
LABEL ON COLUMN LIMST.fecha_propuesta TEXT IS
  'Campo Fecha propuesta de cabecera de declaración l';
COMMENT ON COLUMN LIMST.monto_solicitado IS
  'Campo Monto solicitado de cabecera de declaración legal de personas jurídi'
  'cas';
LABEL ON COLUMN LIMST.monto_solicitado IS 'Monto solicitado';
LABEL ON COLUMN LIMST.monto_solicitado TEXT IS
  'Campo Monto solicitado de cabecera de declaración';
COMMENT ON COLUMN LIMST.plazo_meses IS
  'Campo Plazo meses de cabecera de declaración legal de personas jurídicas';
LABEL ON COLUMN LIMST.plazo_meses IS 'Plazo meses';
LABEL ON COLUMN LIMST.plazo_meses TEXT IS
  'Campo Plazo meses de cabecera de declaración legal';
COMMENT ON COLUMN LIMST.tasa_propuesta IS
  'Campo Tasa propuesta de cabecera de declaración legal de personas jurídica'
  's';
LABEL ON COLUMN LIMST.tasa_propuesta IS 'Tasa propuesta';
LABEL ON COLUMN LIMST.tasa_propuesta TEXT IS
  'Campo Tasa propuesta de cabecera de declaración le';
COMMENT ON COLUMN LIMST.dictamen_credito IS
  'Campo Dictamen credito de cabecera de declaración legal de personas jurídi'
  'cas';
LABEL ON COLUMN LIMST.dictamen_credito IS 'Dictamen credito';
LABEL ON COLUMN LIMST.dictamen_credito TEXT IS
  'Campo Dictamen credito de cabecera de declaración';
COMMENT ON COLUMN LIMST.estado_propuesta IS
  'Campo Estado propuesta de cabecera de declaración legal de personas jurídi'
  'cas';
LABEL ON COLUMN LIMST.estado_propuesta IS 'Estado propuesta';
LABEL ON COLUMN LIMST.estado_propuesta TEXT IS
  'Campo Estado propuesta de cabecera de declaración';
COMMENT ON COLUMN LIMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN LIMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN LIMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN LIMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN LIMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN LIMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN LIMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN LIMST.version_registro IS 'Version';
LABEL ON COLUMN LIMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN LIMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN LIMST.observaciones IS 'Observaciones';
LABEL ON COLUMN LIMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN LIMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN LIMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN LIMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN LIMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN LIMST.created_at IS 'Creado';
LABEL ON COLUMN LIMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN LIMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN LIMST.updated_at IS 'Actualizado';
LABEL ON COLUMN LIMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_limst_pk;
CREATE INDEX idx_limst_pk ON LIMST (id_cliente);
DROP INDEX IF EXISTS idx_limst_created_at;
CREATE INDEX idx_limst_created_at ON LIMST (created_at);

--==============================================================================
-- Nombre de la Tabla: DIMST
-- DESCRIPCION: Maestro de Inventario de Documentos
-- Objetivo: Persistir informacion funcional de maestro de inventario de
-- documentos en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de maestro de
-- inventario de documentos
-- Restricciones: Clave reportada: Tipo de Cuenta, Número de Tabla, Secuencia
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DIMST (
    tipo_cuenta FOR COLUMN TICU VARCHAR(20),
    numero_tabla FOR COLUMN NUTA VARCHAR(30),
    secuencia FOR COLUMN SSECUE INT,
    tipo_documento FOR COLUMN TIDO VARCHAR(20),
    descripcion_documento FOR COLUMN DEDO VARCHAR(120),
    obligatorio FOR COLUMN SOBLIG CHAR(1) NOT NULL DEFAULT 'N',
    fecha_recepcion FOR COLUMN FERE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_dimst PRIMARY KEY (tipo_cuenta, numero_tabla, secuencia),
    CONSTRAINT chk_dimst_oblig CHECK (obligatorio IN ('Y', 'N'))
) RCDFMT DIMSTR;

COMMENT ON TABLE DIMST IS 'Maestro de Inventario de Documentos';
LABEL ON TABLE DIMST IS 'DIMST - Maestro de Inventario de Documentos';
COMMENT ON COLUMN DIMST.tipo_cuenta IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DIMST.tipo_cuenta IS 'Tipo cuenta';
LABEL ON COLUMN DIMST.tipo_cuenta TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DIMST.numero_tabla IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DIMST.numero_tabla IS 'Numero tabla';
LABEL ON COLUMN DIMST.numero_tabla TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DIMST.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DIMST.secuencia IS 'Secuencia';
LABEL ON COLUMN DIMST.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DIMST.tipo_documento IS
  'Campo Tipo documento de maestro de inventario de documentos';
LABEL ON COLUMN DIMST.tipo_documento IS 'Tipo documento';
LABEL ON COLUMN DIMST.tipo_documento TEXT IS
  'Campo Tipo documento de maestro de inventario de d';
COMMENT ON COLUMN DIMST.descripcion_documento IS
  'Campo Descripcion documento de maestro de inventario de documentos';
LABEL ON COLUMN DIMST.descripcion_documento IS 'Descripcion document';
LABEL ON COLUMN DIMST.descripcion_documento TEXT IS
  'Campo Descripcion documento de maestro de inventar';
COMMENT ON COLUMN DIMST.obligatorio IS 'Indicador Y/N de campo obligatorio';
LABEL ON COLUMN DIMST.obligatorio IS 'Obligatorio';
LABEL ON COLUMN DIMST.obligatorio TEXT IS 'Indicador Y/N de campo obligatorio';
COMMENT ON COLUMN DIMST.fecha_recepcion IS
  'Campo Fecha recepcion de maestro de inventario de documentos';
LABEL ON COLUMN DIMST.fecha_recepcion IS 'Fecha recepcion';
LABEL ON COLUMN DIMST.fecha_recepcion TEXT IS
  'Campo Fecha recepcion de maestro de inventario de';
COMMENT ON COLUMN DIMST.fecha_vencimiento IS
  'Campo Fecha vencimiento de maestro de inventario de documentos';
LABEL ON COLUMN DIMST.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN DIMST.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de maestro de inventario d';
COMMENT ON COLUMN DIMST.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DIMST.observaciones IS 'Observaciones';
LABEL ON COLUMN DIMST.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DIMST.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DIMST.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DIMST.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DIMST.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DIMST.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DIMST.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DIMST.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DIMST.version_registro IS 'Version';
LABEL ON COLUMN DIMST.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DIMST.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DIMST.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DIMST.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DIMST.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DIMST.created_at IS 'Creado';
LABEL ON COLUMN DIMST.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DIMST.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DIMST.updated_at IS 'Actualizado';
LABEL ON COLUMN DIMST.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_dimst_pk;
CREATE INDEX idx_dimst_pk ON DIMST (tipo_cuenta, numero_tabla);
DROP INDEX IF EXISTS idx_dimst_created_at;
CREATE INDEX idx_dimst_created_at ON DIMST (created_at);

--==============================================================================
-- Nombre de la Tabla: DITBL
-- DESCRIPCION: Tablas de Tipos de Documentos.
-- Objetivo: Persistir informacion funcional de tablas de tipos de documentos en
-- el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de tablas de tipos de
-- documentos
-- Restricciones: Clave reportada: Número de Tabla, Secuencia.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE DITBL (
    numero_tabla FOR COLUMN NUTA VARCHAR(30),
    secuencia FOR COLUMN SSECUE INT,
    tipo_documento FOR COLUMN TIDO VARCHAR(20),
    descripcion_documento FOR COLUMN DEDO VARCHAR(120),
    obligatorio FOR COLUMN SOBLIG CHAR(1) NOT NULL DEFAULT 'N',
    fecha_recepcion FOR COLUMN FERE DATE,
    fecha_vencimiento FOR COLUMN FEVE DATE,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_ditbl PRIMARY KEY (numero_tabla, secuencia),
    CONSTRAINT chk_ditbl_oblig CHECK (obligatorio IN ('Y', 'N'))
) RCDFMT DITBLR;

COMMENT ON TABLE DITBL IS 'Tablas de Tipos de Documentos.';
LABEL ON TABLE DITBL IS 'DITBL - Tablas de Tipos de Documentos.';
COMMENT ON COLUMN DITBL.numero_tabla IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN DITBL.numero_tabla IS 'Numero tabla';
LABEL ON COLUMN DITBL.numero_tabla TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DITBL.secuencia IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN DITBL.secuencia IS 'Secuencia';
LABEL ON COLUMN DITBL.secuencia TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN DITBL.tipo_documento IS
  'Campo Tipo documento de tablas de tipos de documentos';
LABEL ON COLUMN DITBL.tipo_documento IS 'Tipo documento';
LABEL ON COLUMN DITBL.tipo_documento TEXT IS
  'Campo Tipo documento de tablas de tipos de documen';
COMMENT ON COLUMN DITBL.descripcion_documento IS
  'Campo Descripcion documento de tablas de tipos de documentos';
LABEL ON COLUMN DITBL.descripcion_documento IS 'Descripcion document';
LABEL ON COLUMN DITBL.descripcion_documento TEXT IS
  'Campo Descripcion documento de tablas de tipos de';
COMMENT ON COLUMN DITBL.obligatorio IS 'Indicador Y/N de campo obligatorio';
LABEL ON COLUMN DITBL.obligatorio IS 'Obligatorio';
LABEL ON COLUMN DITBL.obligatorio TEXT IS 'Indicador Y/N de campo obligatorio';
COMMENT ON COLUMN DITBL.fecha_recepcion IS
  'Campo Fecha recepcion de tablas de tipos de documentos';
LABEL ON COLUMN DITBL.fecha_recepcion IS 'Fecha recepcion';
LABEL ON COLUMN DITBL.fecha_recepcion TEXT IS
  'Campo Fecha recepcion de tablas de tipos de docume';
COMMENT ON COLUMN DITBL.fecha_vencimiento IS
  'Campo Fecha vencimiento de tablas de tipos de documentos';
LABEL ON COLUMN DITBL.fecha_vencimiento IS 'Fecha vencimiento';
LABEL ON COLUMN DITBL.fecha_vencimiento TEXT IS
  'Campo Fecha vencimiento de tablas de tipos de docu';
COMMENT ON COLUMN DITBL.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN DITBL.observaciones IS 'Observaciones';
LABEL ON COLUMN DITBL.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN DITBL.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN DITBL.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN DITBL.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN DITBL.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN DITBL.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN DITBL.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN DITBL.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN DITBL.version_registro IS 'Version';
LABEL ON COLUMN DITBL.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN DITBL.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN DITBL.estado_registro IS 'Estado Reg';
LABEL ON COLUMN DITBL.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN DITBL.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN DITBL.created_at IS 'Creado';
LABEL ON COLUMN DITBL.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN DITBL.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN DITBL.updated_at IS 'Actualizado';
LABEL ON COLUMN DITBL.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_ditbl_pk;
CREATE INDEX idx_ditbl_pk ON DITBL (numero_tabla, secuencia);
DROP INDEX IF EXISTS idx_ditbl_created_at;
CREATE INDEX idx_ditbl_created_at ON DITBL (created_at);

--==============================================================================
-- Nombre de la Tabla: USERS
-- DESCRIPCION: Archivo de Autorizaciones por menús
-- Objetivo: Persistir informacion funcional de archivo de autorizaciones por
-- menús en el entorno IBM i del taller.
-- Tipo de Tabla: Maestro
-- Origen de los Datos: Sistema IBS / proceso batch del taller
-- Permanencia de Datos: Permanente
-- Uso de los datos: Consulta, conciliacion y reporteria de archivo de
-- autorizaciones por menús
-- Restricciones: Clave reportada: Código de Usuario, Menú, Opción.
-- Hecho por: Fernando Ramirez, mediante Agentes de IA
-- Fecha: 2026-06-08
-- Proyecto: Conciliacion GLBLN - Taller IBM i
--==============================================================================

CREATE OR REPLACE TABLE USERS (
    codigo_usuario FOR COLUMN COUS VARCHAR(20),
    menu FOR COLUMN SMENU VARCHAR(20),
    opcion FOR COLUMN SOPCIO VARCHAR(20),
    rol FOR COLUMN SROL VARCHAR(20),
    nivel_autorizacion FOR COLUMN NIAU INT,
    permite_consulta FOR COLUMN PECO CHAR(1) NOT NULL DEFAULT 'N',
    permite_creacion FOR COLUMN PECR CHAR(1) NOT NULL DEFAULT 'N',
    permite_actualizacion FOR COLUMN PEAC CHAR(1) NOT NULL DEFAULT 'N',
    permite_aprobacion FOR COLUMN PEAP CHAR(1) NOT NULL DEFAULT 'N',
    usuario_creacion FOR COLUMN USCR VARCHAR(30),
    usuario_actualizacion FOR COLUMN USAC VARCHAR(30),
    version_registro FOR COLUMN VERE INT,
    observaciones FOR COLUMN SOBSER VARCHAR(120),
    estado_registro FOR COLUMN ESRE CHAR(1),
    created_at FOR COLUMN CRAT TIMESTAMP,
    updated_at FOR COLUMN UPAT TIMESTAMP,
    CONSTRAINT pk_users PRIMARY KEY (codigo_usuario, menu, opcion),
    CONSTRAINT chk_users_perm_con CHECK (permite_consulta IN ('Y', 'N')),
    CONSTRAINT chk_users_perm_cre CHECK (permite_creacion IN ('Y', 'N')),
    CONSTRAINT chk_users_perm_act CHECK (permite_actualizacion IN ('Y', 'N')),
    CONSTRAINT chk_users_perm_apr CHECK (permite_aprobacion IN ('Y', 'N'))
) RCDFMT USERSR;

COMMENT ON TABLE USERS IS 'Archivo de Autorizaciones por menús';
LABEL ON TABLE USERS IS 'USERS - Archivo de Autorizaciones por menús';
COMMENT ON COLUMN USERS.codigo_usuario IS
  'Parte de la clave primaria del registro';
LABEL ON COLUMN USERS.codigo_usuario IS 'Codigo usuario';
LABEL ON COLUMN USERS.codigo_usuario TEXT IS
  'Parte de la clave primaria del registro';
COMMENT ON COLUMN USERS.menu IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN USERS.menu IS 'Menu';
LABEL ON COLUMN USERS.menu TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN USERS.opcion IS 'Parte de la clave primaria del registro';
LABEL ON COLUMN USERS.opcion IS 'Opcion';
LABEL ON COLUMN USERS.opcion TEXT IS 'Parte de la clave primaria del registro';
COMMENT ON COLUMN USERS.rol IS
  'Campo Rol de archivo de autorizaciones por menús';
LABEL ON COLUMN USERS.rol IS 'Rol';
LABEL ON COLUMN USERS.rol TEXT IS
  'Campo Rol de archivo de autorizaciones por menús';
COMMENT ON COLUMN USERS.nivel_autorizacion IS
  'Campo Nivel autorizacion de archivo de autorizaciones por menús';
LABEL ON COLUMN USERS.nivel_autorizacion IS 'Nivel autorizacion';
LABEL ON COLUMN USERS.nivel_autorizacion TEXT IS
  'Campo Nivel autorizacion de archivo de autorizacio';
COMMENT ON COLUMN USERS.permite_consulta IS
  'Indicador Y/N de permiso de consulta';
LABEL ON COLUMN USERS.permite_consulta IS 'Perm Consulta';
LABEL ON COLUMN USERS.permite_consulta TEXT IS
  'Indicador Y/N de permiso de consulta';
COMMENT ON COLUMN USERS.permite_creacion IS
  'Indicador Y/N de permiso de creacion';
LABEL ON COLUMN USERS.permite_creacion IS 'Perm Creacion';
LABEL ON COLUMN USERS.permite_creacion TEXT IS
  'Indicador Y/N de permiso de creacion';
COMMENT ON COLUMN USERS.permite_actualizacion IS
  'Indicador Y/N de permiso de actualizacion';
LABEL ON COLUMN USERS.permite_actualizacion IS 'Perm Actualiz';
LABEL ON COLUMN USERS.permite_actualizacion TEXT IS
  'Indicador Y/N de permiso de actualizacion';
COMMENT ON COLUMN USERS.permite_aprobacion IS
  'Indicador Y/N de permiso de aprobacion';
LABEL ON COLUMN USERS.permite_aprobacion IS 'Perm Aprob';
LABEL ON COLUMN USERS.permite_aprobacion TEXT IS
  'Indicador Y/N de permiso de aprobacion';
COMMENT ON COLUMN USERS.usuario_creacion IS 'Usuario que creo el registro';
LABEL ON COLUMN USERS.usuario_creacion IS 'Usr Creacion';
LABEL ON COLUMN USERS.usuario_creacion TEXT IS 'Usuario que creo el registro';
COMMENT ON COLUMN USERS.usuario_actualizacion IS
  'Usuario que actualizo el registro';
LABEL ON COLUMN USERS.usuario_actualizacion IS 'Usr Actualiz';
LABEL ON COLUMN USERS.usuario_actualizacion TEXT IS
  'Usuario que actualizo el registro';
COMMENT ON COLUMN USERS.version_registro IS
  'Version del registro para control de concurrencia';
LABEL ON COLUMN USERS.version_registro IS 'Version';
LABEL ON COLUMN USERS.version_registro TEXT IS
  'Version del registro para control de concurrencia';
COMMENT ON COLUMN USERS.observaciones IS
  'Observaciones adicionales del registro';
LABEL ON COLUMN USERS.observaciones IS 'Observaciones';
LABEL ON COLUMN USERS.observaciones TEXT IS
  'Observaciones adicionales del registro';
COMMENT ON COLUMN USERS.estado_registro IS
  'Estado del registro: A=activo, I=inactivo';
LABEL ON COLUMN USERS.estado_registro IS 'Estado Reg';
LABEL ON COLUMN USERS.estado_registro TEXT IS
  'Estado del registro: A=activo, I=inactivo';
COMMENT ON COLUMN USERS.created_at IS
  'Marca de tiempo de creacion del registro';
LABEL ON COLUMN USERS.created_at IS 'Creado';
LABEL ON COLUMN USERS.created_at TEXT IS
  'Marca de tiempo de creacion del registro';
COMMENT ON COLUMN USERS.updated_at IS 'Marca de tiempo de ultima actualizacion';
LABEL ON COLUMN USERS.updated_at IS 'Actualizado';
LABEL ON COLUMN USERS.updated_at TEXT IS
  'Marca de tiempo de ultima actualizacion';

DROP INDEX IF EXISTS idx_users_pk;
CREATE INDEX idx_users_pk ON USERS (codigo_usuario, menu);
DROP INDEX IF EXISTS idx_users_created_at;
CREATE INDEX idx_users_created_at ON USERS (created_at);

--==============================================================================
-- CLAVES UNICAS Y FORANEAS
--==============================================================================

-- Crear UNIQUE (parent keys para FKs)
ALTER TABLE ACMST ADD CONSTRAINT uq_acmst_numero_cuenta UNIQUE (numero_cuenta);
ALTER TABLE DEALS ADD CONSTRAINT uq_deals_numero_prestamo UNIQUE
  (numero_prestamo);
ALTER TABLE LCMST ADD CONSTRAINT uq_lcmst_numero_carta UNIQUE
  (numero_carta_credito);
ALTER TABLE TRANS ADD CONSTRAINT uq_trans_num_reg_rel UNIQUE
  (numero_registro_relativo);

-- Crear FKs
ALTER TABLE GLBLN ADD CONSTRAINT fk_glbln_glmst FOREIGN KEY (codigo_banco
  , codigo_moneda, cuenta_contable) REFERENCES GLMST (codigo_banco
  , codigo_moneda, cuenta_contable);
ALTER TABLE TRANS ADD CONSTRAINT fk_trans_glmst FOREIGN KEY (codigo_banco
  , codigo_moneda, cuenta_contable) REFERENCES GLMST (codigo_banco
  , codigo_moneda, cuenta_contable);
ALTER TABLE TRANS ADD CONSTRAINT fk_trans_cumst FOREIGN KEY (id_cliente)
  REFERENCES CUMST (id_cliente);
ALTER TABLE TRANS ADD CONSTRAINT fk_trans_acmst FOREIGN KEY (numero_cuenta)
  REFERENCES ACMST (numero_cuenta);
ALTER TABLE TRDSC ADD CONSTRAINT fk_trdsc_trans FOREIGN KEY
  (numero_registro_relativo) REFERENCES TRANS (numero_registro_relativo);
ALTER TABLE TTRAN ADD CONSTRAINT fk_ttran_trans FOREIGN KEY
  (numero_registro_relativo) REFERENCES TRANS (numero_registro_relativo);
ALTER TABLE TTRAN ADD CONSTRAINT fk_ttran_glmst FOREIGN KEY (codigo_banco
  , codigo_moneda, cuenta_contable) REFERENCES GLMST (codigo_banco
  , codigo_moneda, cuenta_contable);
ALTER TABLE TTRAN ADD CONSTRAINT fk_ttran_cumst FOREIGN KEY (id_cliente)
  REFERENCES CUMST (id_cliente);
ALTER TABLE TTRAN ADD CONSTRAINT fk_ttran_acmst FOREIGN KEY (numero_cuenta)
  REFERENCES ACMST (numero_cuenta);
ALTER TABLE CUMAD ADD CONSTRAINT fk_cumad_cumst FOREIGN KEY
  (id_cliente_operacion) REFERENCES CUMST (id_cliente);
ALTER TABLE CUMSD ADD CONSTRAINT fk_cumsd_cumst FOREIGN KEY (id_cliente)
  REFERENCES CUMST (id_cliente);
ALTER TABLE STPMT ADD CONSTRAINT fk_stpmt_acmst FOREIGN KEY (numero_cuenta)
  REFERENCES ACMST (numero_cuenta);
ALTER TABLE PBTRN ADD CONSTRAINT fk_pbtrn_acmst FOREIGN KEY (numero_cuenta)
  REFERENCES ACMST (numero_cuenta);
ALTER TABLE RCLNB ADD CONSTRAINT fk_rclnb_acmst FOREIGN KEY (numero_cuenta)
  REFERENCES ACMST (numero_cuenta);
ALTER TABLE CHMST ADD CONSTRAINT fk_chmst_acmst FOREIGN KEY (numero_cuenta)
  REFERENCES ACMST (numero_cuenta);
ALTER TABLE CMRIN ADD CONSTRAINT fk_cmrin_acmst FOREIGN KEY (numero_cuenta)
  REFERENCES ACMST (numero_cuenta);
ALTER TABLE DLPMT ADD CONSTRAINT fk_dlpmt_deals FOREIGN KEY (numero_prestamo)
  REFERENCES DEALS (numero_prestamo);
ALTER TABLE DLDRF ADD CONSTRAINT fk_dldrf_deals FOREIGN KEY (numero_prestamo)
  REFERENCES DEALS (numero_prestamo);
ALTER TABLE DLSDE ADD CONSTRAINT fk_dlsde_deals FOREIGN KEY (numero_prestamo)
  REFERENCES DEALS (numero_prestamo);
ALTER TABLE DDCPN ADD CONSTRAINT fk_ddcpn_deals FOREIGN KEY (numero_prestamo)
  REFERENCES DEALS (numero_prestamo);
ALTER TABLE DLITP ADD CONSTRAINT fk_dlitp_deals FOREIGN KEY (numero_prestamo)
  REFERENCES DEALS (numero_prestamo);
ALTER TABLE LCDOC ADD CONSTRAINT fk_lcdoc_lcmst FOREIGN KEY
  (numero_carta_credito) REFERENCES LCMST (numero_carta_credito);
ALTER TABLE LCADM ADD CONSTRAINT fk_lcadm_lcmst FOREIGN KEY
  (numero_carta_credito) REFERENCES LCMST (numero_carta_credito);
ALTER TABLE LCCOV ADD CONSTRAINT fk_lccov_lcmst FOREIGN KEY
  (numero_carta_credito) REFERENCES LCMST (numero_carta_credito);
ALTER TABLE LCDIN ADD CONSTRAINT fk_lcdin_lcmst FOREIGN KEY
  (numero_carta_credito) REFERENCES LCMST (numero_carta_credito);
ALTER TABLE APPRV ADD CONSTRAINT fk_apprv_lcmst FOREIGN KEY
  (numero_carta_credito) REFERENCES LCMST (numero_carta_credito);
ALTER TABLE LCFEE ADD CONSTRAINT fk_lcfee_lcmst FOREIGN KEY
  (numero_carta_credito) REFERENCES LCMST (numero_carta_credito);
ALTER TABLE DLCLP ADD CONSTRAINT fk_dlclp_cumst FOREIGN KEY (id_cliente)
  REFERENCES CUMST (id_cliente);
ALTER TABLE ROCOL ADD CONSTRAINT fk_rocol_cumst FOREIGN KEY (id_cliente)
  REFERENCES CUMST (id_cliente);
ALTER TABLE LNECR ADD CONSTRAINT fk_lnecr_cumst FOREIGN KEY (id_cliente)
  REFERENCES CUMST (id_cliente);
ALTER TABLE BAPRC ADD CONSTRAINT fk_baprc_cumst FOREIGN KEY (id_cliente)
  REFERENCES CUMST (id_cliente);
ALTER TABLE BAMOR ADD CONSTRAINT fk_bamor_baprc FOREIGN KEY (codigo_banco
  , codigo_sucursal, origen_cuenta, tipo_cuenta, id_cliente, numero_referencia
  , tipo_registro) REFERENCES BAPRC (codigo_banco, codigo_sucursal
  , origen_cuenta, tipo_cuenta, id_cliente, numero_referencia, tipo_registro);
ALTER TABLE PLPRD ADD CONSTRAINT fk_plprd_plpcr FOREIGN KEY (numero_propuesta)
  REFERENCES PLPCR (numero_propuesta);
ALTER TABLE PLGRT ADD CONSTRAINT fk_plgrt_plpcr FOREIGN KEY (numero_propuesta)
  REFERENCES PLPCR (numero_propuesta);
ALTER TABLE DPDTL ADD CONSTRAINT fk_dpdtl_dpmst FOREIGN KEY (id_cliente
  , secuencia) REFERENCES DPMST (id_cliente, secuencia);
ALTER TABLE IFDTL ADD CONSTRAINT fk_ifdtl_ifmst FOREIGN KEY (id_cliente, anio
  , mes, formato_balance) REFERENCES IFMST (id_cliente, anio, mes
  , formato_balance);
ALTER TABLE DIMST ADD CONSTRAINT fk_dimst_ditbl FOREIGN KEY (numero_tabla
  , secuencia) REFERENCES DITBL (numero_tabla, secuencia);
ALTER TABLE SPINS ADD CONSTRAINT fk_spins_cumst FOREIGN KEY (id_cliente)
  REFERENCES CUMST (id_cliente);
ALTER TABLE SPINS ADD CONSTRAINT fk_spins_acmst FOREIGN KEY (numero_cuenta)
  REFERENCES ACMST (numero_cuenta);
ALTER TABLE CHPER ADD CONSTRAINT fk_chper_acmst FOREIGN KEY (numero_cuenta)
  REFERENCES ACMST (numero_cuenta);
ALTER TABLE BAHIS ADD CONSTRAINT fk_bahis_baprc FOREIGN KEY (codigo_banco
  , codigo_sucursal, origen_cuenta, tipo_cuenta, id_cliente, numero_referencia
  , tipo_registro) REFERENCES BAPRC (codigo_banco, codigo_sucursal
  , origen_cuenta, tipo_cuenta, id_cliente, numero_referencia, tipo_registro);


