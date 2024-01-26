USE GD2C2023
GO

CREATE SCHEMA DATAMINDS
GO



-- CREACION DE TABLAS
CREATE TABLE DATAMINDS.TIPO_INMUEBLE (
	id decimal(18,0) not null identity(1,1),
	descripcion varchar(255) not null
)

CREATE TABLE DATAMINDS.DIRECCION (
	id decimal(18,0) not null identity(1,1),
	descripcion varchar(255) not null,
	barrio_id decimal(18,0) not null
)

CREATE TABLE DATAMINDS.BARRIO (
	id decimal(18,0) not null identity(1,1),
	nombre varchar(255) null,
	localidad_id decimal(18,0) not null
)

CREATE TABLE DATAMINDS.LOCALIDAD (
	id decimal(18,0) not null identity(1,1),
	nombre varchar(255) not null,
	provincia_id decimal(18,0) not null
)

CREATE TABLE DATAMINDS.PROVINCIA (
	id decimal(18,0) not null identity(1,1),
	nombre varchar(255) not null,
)

CREATE TABLE DATAMINDS.INMUEBLE (
	codigo_inmueble decimal(18,0) not null, 
	nombre varchar(255) not null,
	descripcion varchar(100) not null,
	superficie_total numeric(18,2) not null,
	antiguedad numeric(18,0) not null,
	expensas numeric(18,2) not null,
	tipo_inmueble_id decimal(18,0) not null,
	direccion_id decimal(18,0) not null,
	disposicion_id decimal(18,0) not null,
	orientacion_id decimal(18,0) not null,
	estado_id decimal(18,0) not null,
	tipo_ambiente_id decimal(18,0) not null
)

CREATE TABLE DATAMINDS.ESTADO_INMUEBLE (
	id decimal(18,0) not null identity(1,1),
	descripcion varchar(255) not null,
)

CREATE TABLE DATAMINDS.ORIENTACION (
	id decimal(18,0) not null identity(1,1),
	descripcion varchar(255) not null,
)

CREATE TABLE DATAMINDS.DISPOSICION (
	id decimal(18,0) not null identity(1,1),
	descripcion varchar(255) not null,
)

CREATE TABLE DATAMINDS.TIPO_AMBIENTE (
	id decimal(18,0) not null identity(1,1),
	descripcion varchar(255) not null,
)

CREATE TABLE DATAMINDS.CARACTERISTICA_X_INMUEBLE (
	inmueble_id decimal(18,0) not null,
	caracteristica_id decimal(18,0) not null,
)

CREATE TABLE DATAMINDS.CARACTERISTICAS (
	id decimal(18,0) not null identity(1,1),
	descripcion varchar(255) not null,
)

CREATE TABLE DATAMINDS.MONEDA (
	id decimal(18,0) not null identity(1,1),
	nombre varchar(255) not null,
)

CREATE TABLE DATAMINDS.VENTA (
	codigo_venta decimal(18,0) not null, 
	precio_venta numeric(18,2) not null,
	comision_inmobiliaria numeric(18,2) not null,
	fecha_venta datetime not null,
	anuncio_id decimal(18,0) not null,
	moneda_id decimal(18,0) not null,
	comprador_id decimal(18,0) not null
)

CREATE TABLE DATAMINDS.PAGO_VENTA (
	codigo_pago decimal(18,0) not null identity(1,1),
	importe numeric(18,2) not null,
	medio_de_pago_id decimal(18,0) not null,
	venta_id decimal(18,0) not null,
	moneda_id decimal(18,0) not null,
	cotizacion_con_peso numeric(18,2) not null
)

CREATE TABLE DATAMINDS.ANUNCIO (
	codigo_anuncio decimal(18,0) not null,
	fecha_publicacion datetime not null,
	fecha_finalizacion datetime not null,
	precio numeric(18,2) not null,
	costo_publicacion numeric(18,2) not null,
	agente_sucursal_id decimal(18,0) not null,
	agente_persona_id decimal(18,0) not null,
	inmueble_id decimal(18,0) not null,
	tipo_operacion_id decimal(18,0) not null,
	tipo_periodo_id decimal(18,0) not null,
	moneda_id decimal(18,0) not null,
	estado_id decimal(18,0) not null
)

CREATE TABLE DATAMINDS.TIPO_OPERACION (
	id decimal(18,0) not null identity(1,1),
	descripcion varchar(255) not null,
)

CREATE TABLE DATAMINDS.ALQUILER (
	codigo_alquiler decimal(18,0) not null,
	fecha_inicio datetime not null,
	fecha_fin datetime not null,
	cantidad_periodos decimal(18,0) not null,
	deposito numeric(18,2) not null,
	comision numeric(18,2) not null,
	gasto_averiguaciones numeric(18,2) not null,
	anuncio_id decimal(18,0) not null,
	estado_alquiler_id decimal(18,0) not null,
	inquilino_id decimal(18,0) not null,
)

CREATE TABLE DATAMINDS.MEDIO_DE_PAGO (
  id decimal(18,0) not null identity(1,1),
  descripcion nvarchar(100) not null,
)

CREATE TABLE DATAMINDS.PAGO_ALQUILER (
  codigo_pago decimal(18,0) not null,
  alquiler_id decimal(18,0) not null,
  periodo_id decimal(18,0) not null,
  fecha_vencimiento datetime not null,
  descripcion nvarchar(255) not null,
  fecha_pago datetime not null,
  importe numeric(18,2) not null,
  medio_de_pago_id decimal(18,0) not null
)

CREATE TABLE DATAMINDS.PERIODO (
  id decimal(18,0) not null identity(1,1),
  inicio_periodo datetime not null,
  fin_periodo datetime not null,
  numero_periodo numeric(18,0) not null,
  alquiler_id decimal(18,0) not null
)

CREATE TABLE DATAMINDS.DETALLE_ALQUILER (
  id decimal(18,0) not null identity(1,1),
  precio numeric(18,2) not null,
  periodo_inicial_id decimal(18,0) not null,
  periodo_final_id decimal(18,0)
)

CREATE TABLE DATAMINDS.PROPIETARIO (
  id decimal(18,0) not null identity(1,1),
  persona_id decimal(18,0) not null,
)

CREATE TABLE DATAMINDS.PROPIETARIO_X_INMUEBLE (
  inmueble_id decimal(18,0) not null,
  persona_id decimal(18,0) not null,
)

CREATE TABLE DATAMINDS.INQUILINO ( 
  id decimal(18,0) not null identity(1,1),
  persona_id decimal(18,0) not null,
)

CREATE TABLE DATAMINDS.COMPRADOR (
  id decimal(18,0) not null identity(1,1),
  persona_id decimal(18,0) not null,
)

CREATE TABLE DATAMINDS.AGENTE (
  sucursal_id decimal(18,0) not null,
  persona_id decimal(18,0) not null,
)

CREATE TABLE DATAMINDS.TIPO_PERIODO (
    id decimal(18,0) not null identity(1,1),
    descripcion nvarchar(100) not null,
)

CREATE TABLE DATAMINDS.ESTADO_ANUNCIO (
    id decimal(18,0) not null identity(1,1),
    descripcion nvarchar(100) not null,
)

CREATE TABLE DATAMINDS.ESTADO_ALQUILER (
    id decimal(18,0) not null identity(1,1),
    descripcion nvarchar(100) not null,
)

CREATE TABLE DATAMINDS.PERSONA (
    id decimal(18,0) not null identity(1,1),
    nombre nvarchar(100) not null,
    apellido nvarchar(100) not null,
    dni numeric(18,0) not null,
    fecha_registro datetime not null,
    telefono numeric(18,0) not null,
    mail nvarchar(255) not null,
    fecha_nacimiento datetime not null,
)

CREATE TABLE DATAMINDS.SUCURSAL (
    codigo_sucursal decimal(18,0) not null,
    nombre nvarchar(100) not null,
    direccion_id decimal(18,0) not null,
    telefono nvarchar(100) not null,
)



--Agregar PK
ALTER TABLE DATAMINDS.TIPO_INMUEBLE add constraint pk_tipo_inmueble primary key (id)
ALTER TABLE DATAMINDS.DIRECCION add constraint pk_direccion primary key (id)
ALTER TABLE DATAMINDS.BARRIO add constraint pk_barrio primary key (id)
ALTER TABLE DATAMINDS.LOCALIDAD add constraint pk_localidad primary key (id)
ALTER TABLE DATAMINDS.PROVINCIA add constraint pk_provincia primary key (id)
ALTER TABLE DATAMINDS.INMUEBLE add constraint pk_inmueble primary key (codigo_inmueble)
ALTER TABLE DATAMINDS.ESTADO_INMUEBLE add constraint pk_estado_inmueble primary key (id)
ALTER TABLE DATAMINDS.ORIENTACION add constraint pk_orientacion primary key (id)
ALTER TABLE DATAMINDS.SUCURSAL add constraint pk_sucursal primary key (codigo_sucursal)
ALTER TABLE DATAMINDS.TIPO_OPERACION add constraint pk_tipo_operacion primary key (id)
ALTER TABLE DATAMINDS.AGENTE add constraint pk_agente primary key (sucursal_id, persona_id)
ALTER TABLE DATAMINDS.ANUNCIO add constraint pk_anuncio primary key (codigo_anuncio)
ALTER TABLE DATAMINDS.VENTA add constraint pk_venta primary key (codigo_venta)
ALTER TABLE DATAMINDS.MONEDA add constraint pk_moneda primary key (id)
ALTER TABLE DATAMINDS.PAGO_VENTA add constraint pk_pago_venta primary key (codigo_pago)
ALTER TABLE DATAMINDS.COMPRADOR add constraint pk_comprador primary key (id)
ALTER TABLE DATAMINDS.INQUILINO add constraint pk_inquilino primary key (id) 
ALTER TABLE DATAMINDS.MEDIO_DE_PAGO add constraint pk_medio_de_pago primary key (id)
ALTER TABLE DATAMINDS.PAGO_ALQUILER add constraint pk_pago_alquiler primary key (codigo_pago)
ALTER TABLE DATAMINDS.PERIODO add constraint pk_periodo primary key (id)
ALTER TABLE DATAMINDS.DETALLE_ALQUILER add constraint pk_detalle_alquiler primary key (id)
ALTER TABLE DATAMINDS.ALQUILER add constraint pk_alquiler primary key (codigo_alquiler)
ALTER TABLE DATAMINDS.PROPIETARIO add constraint pk_propietario primary key (id)
ALTER TABLE DATAMINDS.TIPO_AMBIENTE add constraint pk_tipo_ambiente primary key (id)
ALTER TABLE DATAMINDS.DISPOSICION add constraint pk_disposicion primary key (id)
ALTER TABLE DATAMINDS.TIPO_PERIODO add constraint pk_tipo_periodo primary key (id)
ALTER TABLE DATAMINDS.ESTADO_ANUNCIO add constraint pk_estado_anuncio primary key (id)
ALTER TABLE DATAMINDS.ESTADO_ALQUILER add constraint pk_estado_alquiler primary key (id)
ALTER TABLE DATAMINDS.PERSONA add constraint pk_persona primary key (id)
ALTER TABLE DATAMINDS.CARACTERISTICAS add constraint pk_caracteristica primary key (id)
ALTER TABLE DATAMINDS.CARACTERISTICA_X_INMUEBLE add constraint pk_caracteristica_inmueble primary key (inmueble_id, caracteristica_id) 
ALTER TABLE DATAMINDS.PROPIETARIO_X_INMUEBLE add constraint pk_propietario_inmueble_inmueble primary key (inmueble_id, persona_id)



--Agregar FK
ALTER TABLE DATAMINDS.INMUEBLE add constraint fk_tipo_inmueble foreign key (tipo_inmueble_id) references DATAMINDS.TIPO_INMUEBLE (id)
ALTER TABLE DATAMINDS.INMUEBLE add constraint fk_direccion foreign key (direccion_id) references DATAMINDS.DIRECCION (id)
ALTER TABLE DATAMINDS.INMUEBLE add constraint fk_disposicion foreign key (disposicion_id) references DATAMINDS.DISPOSICION (id)
ALTER TABLE DATAMINDS.INMUEBLE add constraint fk_orientacion foreign key (orientacion_id) references DATAMINDS.ORIENTACION (id)
ALTER TABLE DATAMINDS.INMUEBLE add constraint fk_estado_inmueble foreign key (estado_id) references DATAMINDS.ESTADO_INMUEBLE (id)
ALTER TABLE DATAMINDS.INMUEBLE add constraint fk_tipo_ambiente foreign key (tipo_ambiente_id) references DATAMINDS.TIPO_AMBIENTE (id)
ALTER TABLE DATAMINDS.ANUNCIO add constraint fk_agente foreign key (agente_sucursal_id, agente_persona_id) references DATAMINDS.AGENTE (sucursal_id, persona_id)
ALTER TABLE DATAMINDS.DIRECCION add constraint fk_barrio foreign key (barrio_id) references DATAMINDS.BARRIO (id)
ALTER TABLE DATAMINDS.BARRIO add constraint fk_localidad foreign key (localidad_id) references DATAMINDS.LOCALIDAD(id)
ALTER TABLE DATAMINDS.LOCALIDAD add constraint fk_provincia foreign key (provincia_id) references DATAMINDS.PROVINCIA(id)
ALTER TABLE DATAMINDS.PROPIETARIO add constraint fk_persona foreign key (persona_id) references DATAMINDS.PERSONA(id)
ALTER TABLE DATAMINDS.SUCURSAL add constraint fk_direccion_sucursal foreign key (direccion_id) references DATAMINDS.DIRECCION(id)
ALTER TABLE DATAMINDS.COMPRADOR add constraint fk_comprador_persona foreign key (persona_id) references DATAMINDS.PERSONA(id)
ALTER TABLE DATAMINDS.VENTA add constraint fk_moneda foreign key (moneda_id) references DATAMINDS.MONEDA(id)
ALTER TABLE DATAMINDS.VENTA add constraint fk_comprador foreign key (comprador_id) references DATAMINDS.COMPRADOR(id)
ALTER TABLE DATAMINDS.VENTA add constraint fk_anuncio foreign key (anuncio_id) references DATAMINDS.ANUNCIO(codigo_anuncio)
ALTER TABLE DATAMINDS.PROPIETARIO_X_INMUEBLE add constraint fk_inmueble foreign key (inmueble_id) references DATAMINDS.INMUEBLE(codigo_inmueble)
ALTER TABLE DATAMINDS.PROPIETARIO_X_INMUEBLE add constraint fk_propietario_x_inmueble foreign key (persona_id) references DATAMINDS.PROPIETARIO(id)
ALTER TABLE DATAMINDS.CARACTERISTICA_X_INMUEBLE add constraint fk_inmueble_x_caracteristica foreign key (inmueble_id) references DATAMINDS.INMUEBLE(codigo_inmueble)
ALTER TABLE DATAMINDS.CARACTERISTICA_X_INMUEBLE add constraint fk_caracteristica foreign key (caracteristica_id) references DATAMINDS.CARACTERISTICAS(id)
ALTER TABLE DATAMINDS.AGENTE add constraint fk_sucursal_agente foreign key (sucursal_id) references DATAMINDS.SUCURSAL(codigo_sucursal)
ALTER TABLE DATAMINDS.AGENTE add constraint fk_persona_agente foreign key (persona_id) references DATAMINDS.PERSONA(id)
ALTER TABLE DATAMINDS.PAGO_ALQUILER add constraint fk_alquiler_pago foreign key (alquiler_id) references DATAMINDS.ALQUILER (codigo_alquiler)
ALTER TABLE DATAMINDS.PAGO_ALQUILER add constraint fk_periodo foreign key (periodo_id) references DATAMINDS.PERIODO (id)
ALTER TABLE DATAMINDS.DETALLE_ALQUILER add constraint fk_periodo_inicial foreign key (periodo_inicial_id) references DATAMINDS.PERIODO (id)
ALTER TABLE DATAMINDS.DETALLE_ALQUILER add constraint fk_periodo_final foreign key (periodo_final_id) references DATAMINDS.PERIODO (id)
ALTER TABLE DATAMINDS.PERIODO add constraint fk_alquiler foreign key (alquiler_id) references DATAMINDS.ALQUILER (codigo_alquiler)
ALTER TABLE DATAMINDS.ALQUILER add constraint fk_anuncio_alquiler foreign key (anuncio_id) references DATAMINDS.ANUNCIO (codigo_anuncio)
ALTER TABLE DATAMINDS.ALQUILER add constraint fk_estado foreign key (estado_alquiler_id) references DATAMINDS.ESTADO_ALQUILER (id)
ALTER TABLE DATAMINDS.ALQUILER add constraint fk_inquilino foreign key (inquilino_id) references DATAMINDS.INQUILINO (id) 
ALTER TABLE DATAMINDS.ANUNCIO add constraint fk_inmueble_anuncio foreign key (inmueble_id) references DATAMINDS.INMUEBLE (codigo_inmueble)
ALTER TABLE DATAMINDS.ANUNCIO add constraint fk_tipo_operacion foreign key (tipo_operacion_id) references DATAMINDS.TIPO_OPERACION (id)
ALTER TABLE DATAMINDS.ANUNCIO add constraint fk_tipo_periodo foreign key (tipo_periodo_id) references DATAMINDS.TIPO_PERIODO (id)
ALTER TABLE DATAMINDS.ANUNCIO add constraint fk_moneda_anuncio foreign key (moneda_id) references DATAMINDS.MONEDA (id)
ALTER TABLE DATAMINDS.ANUNCIO add constraint fk_estado_anuncio foreign key (estado_id) references DATAMINDS.ESTADO_ANUNCIO (id)
ALTER TABLE DATAMINDS.PAGO_VENTA add constraint fk_venta_pago foreign key (venta_id) references DATAMINDS.VENTA (codigo_venta) 
ALTER TABLE DATAMINDS.PAGO_VENTA add constraint fk_moneda_pago_venta foreign key (moneda_id) references DATAMINDS.MONEDA (id)
ALTER TABLE DATAMINDS.INQUILINO add constraint fk_inquilino_persona foreign key (persona_id) references DATAMINDS.PERSONA (id)
GO



--STORED PROCEDURES
CREATE PROCEDURE DATAMINDS.MIGRACION_TIPO_INMUEBLE
AS
BEGIN
	SET NOCOUNT ON;
	insert DATAMINDS.TIPO_INMUEBLE 
	SELECT DISTINCT INMUEBLE_TIPO_INMUEBLE 
	from gd_esquema.Maestra with (nolock) 
	WHERE INMUEBLE_TIPO_INMUEBLE IS NOT NULL
	
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_ESTADO_INMUEBLE
AS
BEGIN
	SET NOCOUNT ON;
	insert DATAMINDS.ESTADO_INMUEBLE 
	SELECT DISTINCT INMUEBLE_ESTADO from gd_esquema.Maestra with (nolock) WHERE INMUEBLE_ESTADO IS NOT NULL
	
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_PROVINCIA
AS
BEGIN
	SET NOCOUNT ON;
	insert DATAMINDS.PROVINCIA 
	SELECT DISTINCT INMUEBLE_PROVINCIA from gd_esquema.Maestra with (nolock) WHERE INMUEBLE_PROVINCIA IS NOT NULL
	
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_LOCALIDAD
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.LOCALIDAD ([nombre], [provincia_id])
	SELECT DISTINCT Q.INMUEBLE_LOCALIDAD, P.id FROM
	(SELECT DISTINCT INMUEBLE_LOCALIDAD, INMUEBLE_PROVINCIA from gd_esquema.Maestra with (nolock) WHERE INMUEBLE_LOCALIDAD IS NOT NULL 
	UNION
	SELECT DISTINCT SUCURSAL_LOCALIDAD, SUCURSAL_PROVINCIA from gd_esquema.Maestra with (nolock) WHERE SUCURSAL_LOCALIDAD IS NOT NULL) Q
	INNER JOIN DATAMINDS.PROVINCIA P ON P.nombre = Q.INMUEBLE_PROVINCIA
	
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_BARRIO
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.BARRIO (nombre, localidad_id)
	SELECT INMUEBLE_BARRIO, L.id
	FROM (
		SELECT DISTINCT INMUEBLE_BARRIO, INMUEBLE_LOCALIDAD, INMUEBLE_PROVINCIA
		FROM gd_esquema.Maestra with (nolock)
		WHERE INMUEBLE_BARRIO IS NOT NULL
		UNION
		SELECT DISTINCT 'FALTA BARRIO', SUCURSAL_LOCALIDAD, SUCURSAL_PROVINCIA
		FROM gd_esquema.Maestra  with (nolock)
		WHERE SUCURSAL_LOCALIDAD IS NOT NULL
	) Q
	INNER JOIN DATAMINDS.PROVINCIA P ON P.nombre = Q.INMUEBLE_PROVINCIA
	INNER JOIN DATAMINDS.LOCALIDAD L ON L.nombre = Q.INMUEBLE_LOCALIDAD AND P.id = L.provincia_id
	ORDER BY INMUEBLE_BARRIO
	
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_DIRECCION
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.DIRECCION (descripcion, barrio_id)
	SELECT INMUEBLE_DIRECCION, B.id FROM
	(
	SELECT DISTINCT INMUEBLE_DIRECCION,INMUEBLE_BARRIO, INMUEBLE_LOCALIDAD, INMUEBLE_PROVINCIA
	FROM gd_esquema.Maestra with (nolock)
	WHERE INMUEBLE_DIRECCION IS NOT NULL
	UNION
	SELECT DISTINCT SUCURSAL_DIRECCION ,'FALTA BARRIO', SUCURSAL_LOCALIDAD, SUCURSAL_PROVINCIA
	FROM gd_esquema.Maestra  with (nolock)
	WHERE SUCURSAL_DIRECCION IS NOT NULL
	) Q
	INNER JOIN DATAMINDS.PROVINCIA P ON P.nombre = Q.INMUEBLE_PROVINCIA
	INNER JOIN DATAMINDS.LOCALIDAD L ON L.nombre = Q.INMUEBLE_LOCALIDAD AND P.id = L.provincia_id
	INNER JOIN DATAMINDS.BARRIO B ON B.nombre = Q.INMUEBLE_BARRIO AND B.localidad_id = L.id

END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_TIPO_AMBIENTE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.TIPO_AMBIENTE
	SELECT DISTINCT INMUEBLE_CANT_AMBIENTES from gd_esquema.Maestra with (nolock) WHERE INMUEBLE_CANT_AMBIENTES IS NOT NULL
	
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_CARACTERISTICAS
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.CARACTERISTICAS (descripcion)
	VALUES
	('WI-FI'),
	('CABLE'),
	('CALEFACCION'),
	('GAS')
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_PERSONA
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.PERSONA (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
	SELECT DISTINCT * FROM ( 
	SELECT DISTINCT INQUILINO_NOMBRE,INQUILINO_APELLIDO, INQUILINO_DNI, INQUILINO_FECHA_REGISTRO, INQUILINO_TELEFONO, INQUILINO_MAIL, INQUILINO_FECHA_NAC FROM gd_esquema.Maestra with (nolock)
	WHERE INQUILINO_NOMBRE IS NOT NULL
	UNION
	SELECT DISTINCT COMPRADOR_NOMBRE,COMPRADOR_APELLIDO, COMPRADOR_DNI, COMPRADOR_FECHA_REGISTRO, COMPRADOR_TELEFONO, COMPRADOR_MAIL, COMPRADOR_FECHA_NAC FROM gd_esquema.Maestra with (nolock)
	WHERE COMPRADOR_NOMBRE IS NOT NULL
	UNION
	SELECT DISTINCT AGENTE_NOMBRE,AGENTE_APELLIDO, AGENTE_DNI, AGENTE_FECHA_REGISTRO, AGENTE_TELEFONO, AGENTE_MAIL, AGENTE_FECHA_NAC FROM gd_esquema.Maestra with (nolock)
	WHERE AGENTE_NOMBRE IS NOT NULL
	UNION
	SELECT DISTINCT PROPIETARIO_NOMBRE,PROPIETARIO_APELLIDO, PROPIETARIO_DNI, PROPIETARIO_FECHA_REGISTRO, PROPIETARIO_TELEFONO, PROPIETARIO_MAIL, PROPIETARIO_FECHA_NAC FROM gd_esquema.Maestra with (nolock)
	WHERE PROPIETARIO_NOMBRE IS NOT NULL
	) Q 

END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_SUCURSAL
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.SUCURSAL (codigo_sucursal ,nombre, telefono, direccion_id) 
	SELECT SUCURSAL_CODIGO, SUCURSAL_NOMBRE, SUCURSAL_TELEFONO, D.id FROM
	(SELECT DISTINCT SUCURSAL_CODIGO, SUCURSAL_NOMBRE, SUCURSAL_TELEFONO, SUCURSAL_DIRECCION, 'FALTA BARRIO' AS SUCURSAL_BARRIO ,SUCURSAL_LOCALIDAD, SUCURSAL_PROVINCIA
	FROM gd_esquema.Maestra with (nolock)
	WHERE SUCURSAL_CODIGO IS NOT NULL) Q
	INNER JOIN DATAMINDS.PROVINCIA P ON P.nombre = Q.SUCURSAL_PROVINCIA
	INNER JOIN DATAMINDS.LOCALIDAD L ON L.nombre = Q.SUCURSAL_LOCALIDAD AND P.id = L.provincia_id
	INNER JOIN DATAMINDS.BARRIO B ON B.nombre = 'FALTA BARRIO' AND B.localidad_id = L.id
	INNER JOIN DATAMINDS.DIRECCION D ON D.descripcion = Q.SUCURSAL_DIRECCION AND D.barrio_id = B.id 

END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_AGENTE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.AGENTE (persona_id, sucursal_id)
	SELECT P.id, S.codigo_sucursal FROM
	(SELECT DISTINCT AGENTE_NOMBRE,AGENTE_APELLIDO, AGENTE_DNI, AGENTE_MAIL, SUCURSAL_CODIGO FROM gd_esquema.Maestra with (nolock)
	WHERE AGENTE_NOMBRE IS NOT NULL) Q
	INNER JOIN DATAMINDS.SUCURSAL S ON S.codigo_sucursal = Q.SUCURSAL_CODIGO
	INNER JOIN DATAMINDS.PERSONA P ON P.dni = Q.AGENTE_DNI AND P.nombre = Q.AGENTE_NOMBRE AND P.apellido = Q.AGENTE_APELLIDO AND P.mail = Q.AGENTE_MAIL 
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_ORIENTACION
AS
BEGIN
    SET NOCOUNT ON;
    insert DATAMINDS.ORIENTACION
    SELECT DISTINCT INMUEBLE_ORIENTACION from gd_esquema.Maestra with (nolock) WHERE INMUEBLE_ORIENTACION IS NOT NULL
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_ESTADO_ALQUILER
AS
BEGIN
    SET NOCOUNT ON;
    insert DATAMINDS.ESTADO_ALQUILER
    SELECT DISTINCT ALQUILER_ESTADO from gd_esquema.Maestra with (nolock) WHERE ALQUILER_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_MONEDA
AS
BEGIN
    SET NOCOUNT ON;
    INSERT DATAMINDS.MONEDA (nombre)
    SELECT DISTINCT PAGO_VENTA_MONEDA AS nombre
    FROM gd_esquema.Maestra with (nolock)
    WHERE PAGO_VENTA_MONEDA IS NOT NULL
    UNION
    SELECT DISTINCT VENTA_MONEDA AS nombre
    FROM gd_esquema.Maestra with (nolock)
    WHERE VENTA_MONEDA IS NOT NULL
    UNION
    SELECT DISTINCT ANUNCIO_MONEDA AS nombre
    FROM gd_esquema.Maestra with (nolock)
    WHERE ANUNCIO_MONEDA IS NOT NULL

END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_TIPO_PERIODO
AS
BEGIN
    SET NOCOUNT ON;
    INSERT DATAMINDS. TIPO_PERIODO (descripcion)
    SELECT DISTINCT ANUNCIO_TIPO_PERIODO AS descripcion
    FROM gd_esquema.Maestra with (nolock)
    WHERE ANUNCIO_TIPO_PERIODO IS NOT NULL

END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_ESTADO_ANUNCIO
AS
BEGIN
    SET NOCOUNT ON;
    INSERT DATAMINDS. ESTADO_ANUNCIO (descripcion)
    SELECT DISTINCT ANUNCIO_ESTADO AS descripcion
    FROM gd_esquema.Maestra with (nolock)
    WHERE ANUNCIO_ESTADO IS NOT NULL

END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_TIPO_OPERACION
AS
BEGIN
    SET NOCOUNT ON;
    INSERT DATAMINDS. TIPO_OPERACION (descripcion)
    SELECT DISTINCT ANUNCIO_TIPO_OPERACION AS descripcion
    FROM gd_esquema.Maestra with (nolock)
    WHERE ANUNCIO_TIPO_OPERACION IS NOT NULL

END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_MEDIO_DE_PAGO
AS
BEGIN
    SET NOCOUNT ON;
    INSERT DATAMINDS. MEDIO_DE_PAGO (descripcion)
    SELECT DISTINCT PAGO_ALQUILER_MEDIO_PAGO AS descripcion
    FROM gd_esquema.Maestra with (nolock)
    WHERE PAGO_ALQUILER_MEDIO_PAGO IS NOT NULL
	UNION
    SELECT DISTINCT PAGO_VENTA_MEDIO_PAGO AS descripcion
    FROM gd_esquema.Maestra with (nolock)
    WHERE PAGO_VENTA_MEDIO_PAGO IS NOT NULL
END
GO 

CREATE PROCEDURE DATAMINDS.MIGRACION_DISPOSICION
AS
BEGIN
    SET NOCOUNT ON;
    INSERT DATAMINDS.DISPOSICION (descripcion)
    SELECT DISTINCT INMUEBLE_DISPOSICION AS descripcion
    FROM gd_esquema.Maestra with (nolock)
    WHERE INMUEBLE_DISPOSICION IS NOT NULL

END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_PROPIETARIO
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO DATAMINDS.PROPIETARIO (persona_id)
    SELECT DISTINCT P.id 
    FROM gd_esquema.Maestra M with (nolock)
    INNER JOIN DATAMINDS.PERSONA P ON P.dni = M.PROPIETARIO_DNI AND P.nombre = M.PROPIETARIO_NOMBRE AND P.apellido = M.PROPIETARIO_APELLIDO AND P.mail = M.PROPIETARIO_MAIL
    WHERE M.PROPIETARIO_DNI IS NOT NULL;
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_COMPRADOR
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO DATAMINDS.COMPRADOR (persona_id)
    SELECT DISTINCT P.id 
    FROM gd_esquema.Maestra M with (nolock)
    INNER JOIN DATAMINDS.PERSONA P ON P.dni = M.COMPRADOR_DNI AND P.nombre = M.COMPRADOR_NOMBRE AND P.apellido = M.COMPRADOR_APELLIDO AND P.mail = M.COMPRADOR_MAIL
    WHERE M.COMPRADOR_DNI IS NOT NULL;
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_INQUILINO
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO DATAMINDS.INQUILINO (persona_id) 
    SELECT DISTINCT P.id 
    FROM gd_esquema.Maestra M with (nolock)
    INNER JOIN DATAMINDS.PERSONA P ON P.dni = M.INQUILINO_DNI AND P.nombre = M.INQUILINO_NOMBRE AND P.apellido = M.INQUILINO_APELLIDO AND P.mail = M.INQUILINO_MAIL
    WHERE M.INQUILINO_DNI IS NOT NULL 
	
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_INMUEBLE 
AS
BEGIN
    SET NOCOUNT ON;
	INSERT INTO DATAMINDS.INMUEBLE (codigo_inmueble, nombre, descripcion, superficie_total, antiguedad, 
	expensas, tipo_inmueble_id, direccion_id, disposicion_id, orientacion_id, estado_id, tipo_ambiente_id)
	SELECT 
		INMUEBLE_CODIGO, INMUEBLE_NOMBRE, INMUEBLE_DESCRIPCION, INMUEBLE_SUPERFICIETOTAL, INMUEBLE_ANTIGUEDAD, 
		INMUEBLE_EXPESAS, TIPO.id AS TIPO_INMUEBLE_ID, D.id AS DIRECCION_ID, DISPOSICION.id AS DISPOSICION_ID, 
		ORIENTACION.id AS ORIENTACION_ID, ESTADO_INMUEBLE.id AS ESTADO_ID, TIPO_AMBIENTE.id AS CANT_AMBIENTES 
	FROM 
	(SELECT DISTINCT INMUEBLE_CODIGO, INMUEBLE_NOMBRE, INMUEBLE_DESCRIPCION, INMUEBLE_SUPERFICIETOTAL, INMUEBLE_ANTIGUEDAD ,INMUEBLE_EXPESAS, 
	INMUEBLE_TIPO_INMUEBLE, INMUEBLE_DIRECCION, INMUEBLE_DISPOSICION, INMUEBLE_ORIENTACION, INMUEBLE_ESTADO, INMUEBLE_CANT_AMBIENTES, INMUEBLE_LOCALIDAD, INMUEBLE_PROVINCIA, INMUEBLE_BARRIO
	FROM gd_esquema.Maestra with (nolock) WHERE INMUEBLE_CODIGO IS NOT NULL) Q

	INNER JOIN DATAMINDS.TIPO_INMUEBLE TIPO ON TIPO.descripcion = Q.INMUEBLE_TIPO_INMUEBLE
	INNER JOIN DATAMINDS.DISPOSICION DISPOSICION ON DISPOSICION.descripcion = Q.INMUEBLE_DISPOSICION
	INNER JOIN DATAMINDS.ORIENTACION ORIENTACION ON ORIENTACION.descripcion = Q.INMUEBLE_ORIENTACION
	INNER JOIN DATAMINDS.ESTADO_INMUEBLE ESTADO_INMUEBLE ON ESTADO_INMUEBLE.descripcion = Q.INMUEBLE_ESTADO
	INNER JOIN DATAMINDS.TIPO_AMBIENTE TIPO_AMBIENTE ON TIPO_AMBIENTE.descripcion = Q.INMUEBLE_CANT_AMBIENTES
	INNER JOIN DATAMINDS.PROVINCIA P ON P.nombre = Q.INMUEBLE_PROVINCIA
	INNER JOIN DATAMINDS.LOCALIDAD L ON L.nombre = Q.INMUEBLE_LOCALIDAD AND P.id = L.provincia_id
	INNER JOIN DATAMINDS.BARRIO B ON B.nombre = INMUEBLE_BARRIO AND B.localidad_id = L.id
	INNER JOIN DATAMINDS.DIRECCION D ON D.descripcion = Q.INMUEBLE_DIRECCION AND B.id = D.barrio_id
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_CARACTERISTICA_X_INMUEBLE
AS
BEGIN
    SET NOCOUNT ON;
	INSERT DATAMINDS.CARACTERISTICA_X_INMUEBLE (caracteristica_id, inmueble_id)
	SELECT C.id, Q.INMUEBLE_CODIGO
	FROM
	(SELECT DISTINCT INMUEBLE_CODIGO, INMUEBLE_CARACTERISTICA_WIFI
	FROM gd_esquema.Maestra with (nolock) WHERE INMUEBLE_CODIGO IS NOT NULL AND INMUEBLE_CARACTERISTICA_WIFI = 1) Q
	INNER JOIN DATAMINDS.CARACTERISTICAS C ON C.descripcion = 'WI-FI'

	INSERT DATAMINDS.CARACTERISTICA_X_INMUEBLE (caracteristica_id, inmueble_id)
	SELECT C.id, Q.INMUEBLE_CODIGO
	FROM
	(SELECT DISTINCT INMUEBLE_CODIGO, INMUEBLE_CARACTERISTICA_CABLE
	FROM gd_esquema.Maestra with (nolock) WHERE INMUEBLE_CODIGO IS NOT NULL AND INMUEBLE_CARACTERISTICA_CABLE = 1) Q
	INNER JOIN DATAMINDS.CARACTERISTICAS C ON C.descripcion = 'CABLE'

	INSERT DATAMINDS.CARACTERISTICA_X_INMUEBLE (caracteristica_id, inmueble_id)
	SELECT C.id, Q.INMUEBLE_CODIGO
	FROM
	(SELECT DISTINCT INMUEBLE_CODIGO, INMUEBLE_CARACTERISTICA_CALEFACCION
	FROM gd_esquema.Maestra with (nolock) WHERE INMUEBLE_CODIGO IS NOT NULL AND INMUEBLE_CARACTERISTICA_CALEFACCION = 1) Q
	INNER JOIN DATAMINDS.CARACTERISTICAS C ON C.descripcion = 'CALEFACCION'

	INSERT DATAMINDS.CARACTERISTICA_X_INMUEBLE (caracteristica_id, inmueble_id)
	SELECT C.id, Q.INMUEBLE_CODIGO
	FROM
	(SELECT DISTINCT INMUEBLE_CODIGO, INMUEBLE_CARACTERISTICA_GAS
	FROM gd_esquema.Maestra with (nolock) WHERE INMUEBLE_CODIGO IS NOT NULL AND INMUEBLE_CARACTERISTICA_GAS = 1) Q
	INNER JOIN DATAMINDS.CARACTERISTICAS C ON C.descripcion = 'GAS'
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_ANUNCIO
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO DATAMINDS.ANUNCIO (codigo_anuncio, fecha_publicacion, fecha_finalizacion, agente_persona_id, agente_sucursal_id, inmueble_id,
    precio, costo_publicacion, tipo_operacion_id, tipo_periodo_id, moneda_id, estado_id)
    SELECT 
        ANUNCIO_CODIGO, ANUNCIO_FECHA_PUBLICACION AS FECHA_PUBLICACION, ANUNCIO_FECHA_FINALIZACION AS FECHA_FINALIZACION, 
        AGENTE.persona_id PERSONA_ID, AGENTE.sucursal_id SUCURSAL_ID, INMUEBLE.codigo_inmueble AS INMUEBLE_ID, 
        ANUNCIO_PRECIO_PUBLICADO AS PRECIO, ANUNCIO_COSTO_ANUNCIO, TIPO_OPERACION.id AS TIPO_OPERACION_ID, 
        TIPO_PERIODO.id AS TIPO_PERIODO_ID, MONEDA.id AS MONEDA_ID, ESTADO_ANUNCIO.id AS ESTADO_ID
    FROM 
        (SELECT DISTINCT ANUNCIO_CODIGO, ANUNCIO_FECHA_PUBLICACION, ANUNCIO_FECHA_FINALIZACION, AGENTE_DNI, AGENTE_NOMBRE, AGENTE_APELLIDO, AGENTE_MAIL, 
        SUCURSAL_CODIGO, INMUEBLE_CODIGO, ANUNCIO_PRECIO_PUBLICADO, ANUNCIO_COSTO_ANUNCIO, ANUNCIO_TIPO_OPERACION, ANUNCIO_TIPO_PERIODO, ANUNCIO_MONEDA, ANUNCIO_ESTADO
        FROM gd_esquema.Maestra with (nolock) WHERE INMUEBLE_CODIGO IS NOT NULL) Q

    INNER JOIN DATAMINDS.PERSONA PERSONA ON PERSONA.dni = Q.AGENTE_DNI AND PERSONA.nombre = Q.AGENTE_NOMBRE AND PERSONA.apellido = Q.AGENTE_APELLIDO AND PERSONA.mail = Q.AGENTE_MAIL
    INNER JOIN DATAMINDS.AGENTE AGENTE ON AGENTE.persona_id = PERSONA.id
    INNER JOIN DATAMINDS.INMUEBLE INMUEBLE ON INMUEBLE.codigo_inmueble = Q.INMUEBLE_CODIGO
    INNER JOIN DATAMINDS.TIPO_OPERACION TIPO_OPERACION ON TIPO_OPERACION.descripcion = Q.ANUNCIO_TIPO_OPERACION
    INNER JOIN DATAMINDS.TIPO_PERIODO TIPO_PERIODO ON TIPO_PERIODO.descripcion = Q.ANUNCIO_TIPO_PERIODO
    INNER JOIN DATAMINDS.MONEDA MONEDA ON MONEDA.nombre = q.ANUNCIO_MONEDA
    INNER JOIN DATAMINDS.ESTADO_ANUNCIO ESTADO_ANUNCIO ON ESTADO_ANUNCIO.descripcion = q.ANUNCIO_ESTADO
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_VENTA
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.VENTA (codigo_venta, fecha_venta, precio_venta, comision_inmobiliaria, anuncio_id, moneda_id, comprador_id)
    SELECT 
        VENTA_CODIGO, VENTA_FECHA, VENTA_PRECIO_VENTA, VENTA_COMISION, ANUNCIO_CODIGO, M.id, C.id
    FROM 
        (SELECT DISTINCT VENTA_CODIGO, VENTA_FECHA, VENTA_PRECIO_VENTA, VENTA_COMISION, ANUNCIO_CODIGO
		, COMPRADOR_DNI,COMPRADOR_APELLIDO,COMPRADOR_NOMBRE,COMPRADOR_MAIL, VENTA_MONEDA
        FROM gd_esquema.Maestra with (nolock) WHERE VENTA_CODIGO IS NOT NULL) Q

    INNER JOIN DATAMINDS.PERSONA PERSONA ON PERSONA.dni = Q.COMPRADOR_DNI AND PERSONA.nombre = Q.COMPRADOR_NOMBRE AND PERSONA.apellido = Q.COMPRADOR_APELLIDO AND PERSONA.mail = Q.COMPRADOR_MAIL
    INNER JOIN DATAMINDS.COMPRADOR C ON C.persona_id = PERSONA.id
	INNER JOIN DATAMINDS.MONEDA M ON M.nombre = Q.VENTA_MONEDA
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_PROPIETARIO_X_INMUEBLE 
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO DATAMINDS. PROPIETARIO_X_INMUEBLE (inmueble_id, persona_id) 
    SELECT I.codigo_inmueble, PR.id  FROM
    (SELECT DISTINCT PROPIETARIO_NOMBRE, PROPIETARIO_APELLIDO, PROPIETARIO_DNI, PROPIETARIO_MAIL, INMUEBLE_CODIGO FROM gd_esquema.Maestra with (nolock)
    WHERE PROPIETARIO_DNI IS NOT NULL AND PROPIETARIO_NOMBRE IS NOT NULL AND PROPIETARIO_APELLIDO IS NOT NULL) Q
    INNER JOIN DATAMINDS.INMUEBLE I ON I.codigo_inmueble = Q.INMUEBLE_CODIGO
    INNER JOIN DATAMINDS.PERSONA P ON P.dni = Q. PROPIETARIO_DNI AND P.nombre = Q. PROPIETARIO_NOMBRE AND P.apellido = Q. PROPIETARIO_APELLIDO AND P.mail = Q. PROPIETARIO_MAIL
    INNER JOIN DATAMINDS.PROPIETARIO PR ON PR.persona_id=P.id
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_PAGO_VENTA
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO DATAMINDS.PAGO_VENTA (importe, cotizacion_con_peso, venta_id, moneda_id, medio_de_pago_id)
    SELECT 
        PAGO_VENTA_IMPORTE, PAGO_VENTA_COTIZACION, V.codigo_venta, M.id, MP.id
    FROM 
        (SELECT DISTINCT PAGO_VENTA_IMPORTE, PAGO_VENTA_COTIZACION, VENTA_CODIGO, VENTA_FECHA, VENTA_PRECIO_VENTA
        , PAGO_VENTA_MONEDA, PAGO_VENTA_MEDIO_PAGO
        FROM gd_esquema.Maestra with (nolock) WHERE PAGO_VENTA_IMPORTE IS NOT NULL) Q

    INNER JOIN DATAMINDS.VENTA V ON V.codigo_venta = Q.VENTA_CODIGO AND V.fecha_venta = Q.VENTA_FECHA AND V.precio_venta = Q.VENTA_PRECIO_VENTA 
    INNER JOIN DATAMINDS.MONEDA M ON M.nombre = Q.PAGO_VENTA_MONEDA
    INNER JOIN DATAMINDS.MEDIO_DE_PAGO MP ON MP.descripcion = Q.PAGO_VENTA_MEDIO_PAGO
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_ALQUILER
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO DATAMINDS.ALQUILER (codigo_alquiler, fecha_inicio, fecha_fin, cantidad_periodos, deposito, comision,
    gasto_averiguaciones, anuncio_id, estado_alquiler_id, inquilino_id)
    SELECT 
        ALQUILER_CODIGO, ALQUILER_FECHA_INICIO AS FECHA_INICIO, ALQUILER_FECHA_FIN AS FECHA_FIN, 
        ALQUILER_CANT_PERIODOS AS CANT_PERIODOS, ALQUILER_DEPOSITO AS DEPOSITO, ALQUILER_COMISION AS COMISION, 
        ALQUILER_GASTOS_AVERIGUA AS GASTOS_AVERIGUACIONES, ANUNCIO.codigo_anuncio AS ANUNCIO_ID, ESTADO_ALQUILER.id AS ESTADO_ID, 
        INQUILINO.id AS INQUILINO_ID
    FROM 
        (SELECT DISTINCT ALQUILER_CODIGO, ALQUILER_FECHA_INICIO, ALQUILER_FECHA_FIN, ALQUILER_CANT_PERIODOS, ALQUILER_DEPOSITO, ALQUILER_COMISION, ALQUILER_GASTOS_AVERIGUA, 
        ANUNCIO_CODIGO, ALQUILER_ESTADO, INQUILINO_DNI, INQUILINO_NOMBRE, INQUILINO_APELLIDO, INQUILINO_MAIL
        FROM gd_esquema.Maestra with (nolock) WHERE ALQUILER_CODIGO IS NOT NULL) Q
    INNER JOIN DATAMINDS.PERSONA PERSONA ON PERSONA.dni = Q.INQUILINO_DNI AND PERSONA.nombre = Q.INQUILINO_NOMBRE AND PERSONA.apellido = Q.INQUILINO_APELLIDO AND PERSONA.mail = Q.INQUILINO_MAIL
    INNER JOIN DATAMINDS.INQUILINO INQUILINO ON INQUILINO.persona_id = PERSONA.id
    INNER JOIN DATAMINDS.ANUNCIO ANUNCIO ON ANUNCIO.codigo_anuncio = Q.ANUNCIO_CODIGO
    INNER JOIN DATAMINDS.ESTADO_ALQUILER ESTADO_ALQUILER ON ESTADO_ALQUILER.descripcion = Q.ALQUILER_ESTADO
   
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_PERIODO
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.PERIODO (inicio_periodo, fin_periodo, numero_periodo, alquiler_id)
	SELECT PAGO_ALQUILER_FEC_INI, PAGO_ALQUILER_FEC_FIN, PAGO_ALQUILER_NRO_PERIODO, ALQUILER.codigo_alquiler AS ALQUILER_ID FROM
		(SELECT DISTINCT PAGO_ALQUILER_FEC_INI, PAGO_ALQUILER_FEC_FIN, PAGO_ALQUILER_NRO_PERIODO, ALQUILER_CODIGO FROM gd_esquema.Maestra with (nolock)
		WHERE PAGO_ALQUILER_FEC_INI IS NOT NULL AND PAGO_ALQUILER_FEC_FIN IS NOT NULL AND PAGO_ALQUILER_NRO_PERIODO IS NOT NULL AND ALQUILER_CODIGO IS NOT NULL) Q
	INNER JOIN DATAMINDS.ALQUILER ALQUILER ON ALQUILER.codigo_alquiler = Q.ALQUILER_CODIGO
END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_DETALLE_ALQUILER
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO DATAMINDS.DETALLE_ALQUILER (precio, periodo_inicial_id, periodo_final_id)
	SELECT DETALLE_ALQ_PRECIO, PERIODO_INICIAL.id AS PERIODO_INICIAL_ID, PERIODO_FINAL.id AS PERIODO_FINAL_ID FROM
		(SELECT DISTINCT DETALLE_ALQ_PRECIO, DETALLE_ALQ_NRO_PERIODO_INI, DETALLE_ALQ_NRO_PERIODO_FIN, ALQUILER_CODIGO FROM gd_esquema.Maestra with (nolock)
		WHERE DETALLE_ALQ_PRECIO IS NOT NULL AND ALQUILER_CODIGO IS NOT NULL) Q
	LEFT JOIN DATAMINDS.PERIODO PERIODO_INICIAL ON PERIODO_INICIAL.numero_periodo = DETALLE_ALQ_NRO_PERIODO_INI AND PERIODO_INICIAL.alquiler_id = ALQUILER_CODIGO
	LEFT JOIN DATAMINDS.PERIODO PERIODO_FINAL ON PERIODO_FINAL.numero_periodo = DETALLE_ALQ_NRO_PERIODO_FIN AND PERIODO_FINAL.alquiler_id = ALQUILER_CODIGO

END
GO

CREATE PROCEDURE DATAMINDS.MIGRACION_PAGO_ALQUILER
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO DATAMINDS.PAGO_ALQUILER(codigo_pago, alquiler_id, periodo_id, fecha_vencimiento, descripcion, fecha_pago, importe, medio_de_pago_id)
    SELECT 
        PAGO_ALQUILER_CODIGO, ALQUILER.codigo_alquiler AS CODIGO_ALQUILER, PERIODO.id AS PERIODO_ID, PAGO_ALQUILER_FECHA_VENCIMIENTO AS FECHA_VENCIMIENTO, PAGO_ALQUILER_DESC AS DESCRIPCION,
        PAGO_ALQUILER_FECHA AS FECHA_PAGO, PAGO_ALQUILER_IMPORTE AS IMPORTE, MEDIO_DE_PAGO.id AS MEDIO_DE_PAGO
    FROM 
        (SELECT DISTINCT PAGO_ALQUILER_CODIGO, ALQUILER_CODIGO, PAGO_ALQUILER_MEDIO_PAGO, PAGO_ALQUILER_IMPORTE, PAGO_ALQUILER_DESC, 
        PAGO_ALQUILER_FECHA_VENCIMIENTO, PAGO_ALQUILER_FECHA, PAGO_ALQUILER_FEC_INI, PAGO_ALQUILER_FEC_FIN, PAGO_ALQUILER_NRO_PERIODO
        FROM gd_esquema.Maestra with (nolock) WHERE PAGO_ALQUILER_CODIGO IS NOT NULL) Q
    INNER JOIN DATAMINDS.ALQUILER ALQUILER ON ALQUILER.codigo_alquiler = Q.alquiler_codigo
    INNER JOIN DATAMINDS.PERIODO PERIODO ON PERIODO.numero_periodo = Q.PAGO_ALQUILER_NRO_PERIODO AND PERIODO.alquiler_id = ALQUILER_CODIGO
    INNER JOIN DATAMINDS.MEDIO_DE_PAGO MEDIO_DE_PAGO ON MEDIO_DE_PAGO.descripcion = Q.PAGO_ALQUILER_MEDIO_PAGO
END
GO



--INDICES
CREATE INDEX LOCALIDAD_nombre ON DATAMINDS.LOCALIDAD (nombre)
CREATE INDEX ALQUILER_codigo_alquiler ON DATAMINDS.ALQUILER (codigo_alquiler)
CREATE INDEX PERIODO_numero_periodo ON DATAMINDS.PERIODO (numero_periodo)
CREATE INDEX MEDIO_DE_PAGO_descripcion ON DATAMINDS.MEDIO_DE_PAGO (descripcion)



--EJECUCIONES
EXEC DATAMINDS.MIGRACION_TIPO_INMUEBLE
EXEC DATAMINDS.MIGRACION_ESTADO_INMUEBLE
EXEC DATAMINDS.MIGRACION_PROVINCIA
EXEC DATAMINDS.MIGRACION_LOCALIDAD
EXEC DATAMINDS.MIGRACION_BARRIO
EXEC DATAMINDS.MIGRACION_DIRECCION
EXEC DATAMINDS.MIGRACION_TIPO_AMBIENTE
EXEC DATAMINDS.MIGRACION_CARACTERISTICAS
EXEC DATAMINDS.MIGRACION_PERSONA
ALTER TABLE DATAMINDS.PERSONA add constraint unc_persona unique (nombre, apellido, dni, mail)
EXEC DATAMINDS.MIGRACION_SUCURSAL
EXEC DATAMINDS.MIGRACION_AGENTE
EXEC DATAMINDS.MIGRACION_ORIENTACION
EXEC DATAMINDS.MIGRACION_ESTADO_ALQUILER
EXEC DATAMINDS.MIGRACION_MONEDA
EXEC DATAMINDS.MIGRACION_TIPO_PERIODO
EXEC DATAMINDS.MIGRACION_ESTADO_ANUNCIO
EXEC DATAMINDS.MIGRACION_TIPO_OPERACION
EXEC DATAMINDS.MIGRACION_MEDIO_DE_PAGO
EXEC DATAMINDS.MIGRACION_DISPOSICION
EXEC DATAMINDS.MIGRACION_PROPIETARIO
EXEC DATAMINDS.MIGRACION_COMPRADOR
EXEC DATAMINDS.MIGRACION_INQUILINO
EXEC DATAMINDS.MIGRACION_INMUEBLE
EXEC DATAMINDS.MIGRACION_CARACTERISTICA_X_INMUEBLE
EXEC DATAMINDS.MIGRACION_ANUNCIO
EXEC DATAMINDS.MIGRACION_VENTA
EXEC DATAMINDS.MIGRACION_PROPIETARIO_X_INMUEBLE
EXEC DATAMINDS.MIGRACION_PAGO_VENTA
EXEC DATAMINDS.MIGRACION_ALQUILER
EXEC DATAMINDS.MIGRACION_PERIODO
ALTER TABLE DATAMINDS.PERIODO add constraint unc_periodo unique (alquiler_id, numero_periodo)
EXEC DATAMINDS.MIGRACION_DETALLE_ALQUILER
EXEC DATAMINDS.MIGRACION_PAGO_ALQUILER