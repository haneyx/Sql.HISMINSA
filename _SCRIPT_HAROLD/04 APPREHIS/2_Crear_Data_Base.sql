USE [master]
GO

xp_create_subdir 'C:\DataHIS'
GO
IF EXISTS(SELECT name FROM sys.databases WHERE name = N'DataHIS')
BEGIN  
	PRINT 'YA EXISTE LA BASE DE DATOS DataHIS'
	ALTER DATABASE [DataHIS] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE [DataHIS]
	PRINT'LA BASE DE DATOS FUE ELIMINADA'
	
	PRINT 'CREANDO LA BASE DE DATOS DataHIS'

	CREATE DATABASE [DataHIS] 
	on Primary
	(name = 'DataHIS1', Filename = 'C:\DataHIS\DataHIS1.mdf'),
	(name = 'DataHIS2', Filename = 'C:\DataHIS\DataHIS2.ndf'),
	Filegroup MAESTROS
	(name = 'DataHIS3', Filename = 'C:\DataHIS\DataHIS3.ndf'),
	(name = 'DataHIS4', Filename = 'C:\DataHIS\DataHIS4.ndf'),
	Filegroup REPORTES
	(name = 'DataHIS5', Filename = 'C:\DataHIS\DataHIS5.ndf'),
	(name = 'DataHIS6', Filename = 'C:\DataHIS\DataHIS6.ndf')
	log on
	(name = 'DataHIS_log1', Filename = 'C:\DataHIS\DataHIS_log1.ldf'),
	(name = 'DataHIS_log2', Filename = 'C:\DataHIS\DataHIS_log2.ldf')
	-- WITH CATALOG_COLLATION = DATABASE_DEFAULT

END
ELSE
BEGIN
    PRINT 'CREANDO LA BASE DE DATOS DataHIS'
	CREATE DATABASE [DataHIS] 
	on Primary
(name = 'DataHIS1', Filename = 'C:\DataHIS\DataHIS1.mdf'),
	(name = 'DataHIS2', Filename = 'C:\DataHIS\DataHIS2.ndf'),
	Filegroup MAESTROS
	(name = 'DataHIS3', Filename = 'C:\DataHIS\DataHIS3.ndf'),
	(name = 'DataHIS4', Filename = 'C:\DataHIS\DataHIS4.ndf'),
	Filegroup REPORTES
	(name = 'DataHIS5', Filename = 'C:\DataHIS\DataHIS5.ndf'),
	(name = 'DataHIS6', Filename = 'C:\DataHIS\DataHIS6.ndf')
	log on
	(name = 'DataHIS_log1', Filename = 'C:\DataHIS\DataHIS_log1.ldf'),
	(name = 'DataHIS_log2', Filename = 'C:\DataHIS\DataHIS_log2.ldf')

END
GO
USE [DataHIS]
GO

--TABLAS
CREATE TABLE [dbo].[PERIODO_TMP](
	[I_ID] [int] IDENTITY(1,1) NOT NULL,
	[I_ANIO] [int] NULL,
	[I_MES] [int] NULL,
	[I_ESTADO] [int] NULL
) ON [PRIMARY]
PRINT 'SE CREO LA TABLA PERIODO_TMP'
GO
CREATE TABLE [dbo].[PERIODO](
	[I_ID] [int] IDENTITY(1,1) NOT NULL,
	[I_ANIO] [int] NULL,
	[I_MES] [int] NULL,
	[I_ESTADO] [int] NULL
) ON [PRIMARY]
PRINT 'SE CREO LA TABLA PERIODO'
GO
CREATE TABLE [dbo].[CIEX](
	[CODIGO] [varchar](10) NULL,
	[DIAGNOSTICO] [varchar](255) NULL,
	[SEXO] [char](7) NULL,
	[M_1] [varchar](1) NULL,
	[1_4] [varchar](1) NULL,
	[5_9] [varchar](1) NULL,
	[10_14] [varchar](1) NULL,
	[15_19] [varchar](1) NULL,
	[20_24] [varchar](1) NULL,
	[25_29] [varchar](1) NULL,
	[30_34] [varchar](1) NULL,
	[35_39] [varchar](1) NULL,
	[40_44] [varchar](1) NULL,
	[45_49] [varchar](1) NULL,
	[50_54] [varchar](1) NULL,
	[55_59] [varchar](1) NULL,
	[60_64] [varchar](1) NULL,
	[65_M] [varchar](1) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA CIEX'
GO
CREATE TABLE [dbo].[CIE_CPMS](
	[CODIGO] [varchar](10) NOT NULL,
	[DIAGNOSTICO] [nvarchar](450) NULL,
	[Fg_Tipo] [varchar](2) NULL,
	[Descripcion_Tipo] [nvarchar](100) NULL,
	[Fg_Estado] [int] NOT NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA CIE_CPMS'
GO
CREATE TABLE [dbo].[MAESTRO_HIS_TIPO_DOC](
	[Id_Tipo_Documento] [int] NOT NULL,
	[Abrev_Tipo_Doc] [nvarchar](20) NULL,
	[Descripcion_Tipo_Documento] [nvarchar](250) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA MAESTRO_HIS_TIPO_DOC'
GO
CREATE TABLE [dbo].[MAESTRO_HIS_CP](
	[Id_Centro_Poblado] [varchar](10) NOT NULL,
	[Descripcion_Centro_Poblado] [nvarchar](350) NULL,
	[Id_Codigo_Centro_Poblado] [varchar](4) NULL,
	[Id_Ubigueo] [varchar](6) NULL,
	[Altitud] [decimal](7, 2) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA MAESTRO_HIS_CP'
GO
CREATE TABLE [dbo].[ESTABLECIMIENTOS](
	[Id_Establecimiento] [int] NOT NULL,
	[Nombre_Establecimiento] [nvarchar](100) NULL,
	[Ubigueo_Establecimiento] [char](6) NULL,
	[Codigo_Disa] [int] NULL,
	[Disa] [nvarchar](80) NULL,
	[Codigo_Red] [char](2) NULL,
	[Red] [nvarchar](70) NULL,
	[Codigo_MicroRed] [char](2) NULL,
	[MicroRed] [nvarchar](70) NULL,
	[Codigo_Unico] [varchar](9) NOT NULL,
	[Codigo_Sector] [int] NULL,
	[Descripcion_Sector] [nvarchar](50) NULL,
	[Departamento] [nvarchar](150) NULL,
	[Provincia] [nvarchar](150) NULL,
	[Distrito] [nvarchar](150) NULL,
	[Categoria_Establecimiento] [varchar](10) NOT NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA ESTABLECIMIENTOS'
CREATE TABLE [dbo].[MAESTRO_HIS_UPS](
	[Id_Ups] [varchar](10) NOT NULL,
	[Descripcion_Ups] [nvarchar](100) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA MAESTRO_HIS_UPS'
GO
CREATE TABLE [dbo].[MAESTRO_HIS_PROFESION](
	[Id_Profesion] [varchar](2) NOT NULL,
	[Descripcion_Profesion] [nvarchar](200) NULL,
	[Id_Colegio] [varchar](2) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA MAESTRO_HIS_PROFESION'
GO
CREATE TABLE [dbo].[MAESTRO_HIS_PAIS](
	[Id_Pais] [varchar](3) NOT NULL,
	[Descripcion_Pais] [nvarchar](300) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA MAESTRO_HIS_PAIS'
GO
CREATE TABLE [dbo].[MAESTRO_HIS_FINANCIADOR](
	[Id_Financiador] [varchar](2) NOT NULL,
	[Descripcion_Financiador] [nvarchar](100) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA MAESTRO_HIS_FINANCIADOR'
GO
CREATE TABLE [dbo].[MAESTRO_HIS_ETNIA](
	[Id_Etnia] [varchar](3) NOT NULL,
	[Descripcion_Etnia] [nvarchar](100) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA MAESTRO_HIS_ETNIA'
GO
CREATE TABLE [dbo].[MAESTRO_HIS_CONTRATO](
	[Id_Condicion] [int] NOT NULL,
	[Descripcion_Condicion] [nvarchar](500) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA MAESTRO_HIS_CONTRATO'
GO
CREATE TABLE [dbo].[MAESTRO_HIS_COLEGIO](
	[Id_Colegio] [varchar](2) NOT NULL,
	[Descripcion_Colegio] [nvarchar](800) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA MAESTRO_HIS_COLEGIO'
GO
CREATE TABLE REGISTRADOR(
ID_REGISTRADOR VARCHAR (50),
ID_TIPO_DOCUMENTO VARCHAR (2),
NUMERO_DOCUMENTO VARCHAR (15),
APELLIDO_PATERNO_REGISTRADOR NVARCHAR (50),
APELLIDO_MATERNO_REGISTRADOR NVARCHAR (50),
NOMBRES_REGISTRADOR NVARCHAR (50),
FECHA_NACIMIENTO DATE
)ON [REPORTES]
PRINT 'SE CREO LA TABLA REGISTRADOR'
GO
CREATE TABLE PERSONAL(
ID_PERSONAL VARCHAR(50),
ID_TIPO_DOCUMENTO VARCHAR(2),
NUMERO_DOCUMENTO VARCHAR(15),
APELLIDO_PATERNO_PERSONAL NVARCHAR(50),
APELLIDO_MATERNO_PERSONAL NVARCHAR(50),
NOMBRES_PERSONAL NVARCHAR(50),
FECHA_NACIMIENTO DATE,
ID_CONDICION VARCHAR(2),
ID_PROFESION VARCHAR(2),
ID_COLEGIO VARCHAR(2),
NUMERO_COLEGIATURA VARCHAR(15),
ID_ESTABLECIMIENTO INT,
FECHA_ALTA DATETIME,
FECHA_BAJA DATETIME
)ON [REPORTES]
PRINT 'SE CREO LA TABLA PERSONAL'
GO
CREATE TABLE PACIENTE(
ID_PACIENTE VARCHAR(50),
ID_TIPO_DOCUMENTO VARCHAR(2),
NUMERO_DOCUMENTO VARCHAR(15),
APELLIDO_PATERNO_PACIENTE NVARCHAR(50),
APELLIDO_MATERNO_PACIENTE NVARCHAR(50),
NOMBRES_PACIENTE NVARCHAR(50),
FECHA_NACIMIENTO DATE,
GENERO VARCHAR(1),
ID_ETNIA VARCHAR(2),
HISTORIA_CLINICA VARCHAR(15),
FICHA_FAMILIAR VARCHAR(15),
UBIGEO_NACIMIENTO VARCHAR(6),
UBIGEO_RENIEC VARCHAR(6),
DOMICILIO_RENIEC NVARCHAR(100),
UBIGEO_DECLARADO VARCHAR(6),
DOMICILIO_DECLARADO NVARCHAR(200),
REFERENCIA_DOMICILIO NVARCHAR(200),
ID_PAIS VARCHAR(3),
ID_ESTABLECIMIENTO INT,
FECHA_ALTA DATETIME,
FECHA_MODIFICACION DATETIME
)ON [REPORTES]
PRINT 'SE CREO LA TABLA PACIENTE'
GO
CREATE TABLE HIS_Nominal(
ID_CITA VARCHAR(50),
ANIO VARCHAR(4),
MES VARCHAR(2),
DIA VARCHAR(2),
FECHA_ATENCION DATE,
LOTE VARCHAR(3),
NUM_PAG INT,
NUM_REG INT,
ID_UPS VARCHAR(6),
ID_ESTABLECIMIENTO INT,
ID_PACIENTE VARCHAR(50),
ID_PERSONAL VARCHAR(50),
ID_REGISTRADOR VARCHAR(50),
ID_FINANCIADOR VARCHAR(2),
ID_CONDICION_ESTABLECIMIENTO VARCHAR(1),
ID_CONDICION_SERVICIO VARCHAR(1),
EDAD_REG INT,
TIPO_EDAD VARCHAR(1),
ANIO_ACTUAL_PACIENTE INT,
MES_ACTUAL_PACIENTE INT,
DIA_ACTUAL_PACIENTE INT,
ID_TURNO VARCHAR(1),
CODIGO_ITEM VARCHAR (15),
TIPO_DIAGNOSTICO VARCHAR(1),
VALOR_LAB VARCHAR(3),
ID_CORRELATIVO INT,
ID_CORRELATIVO_LAB INT,
PESO DECIMAL(6,3),
TALLA DECIMAL(5,2),
HEMOGLOBINA DECIMAL(5,2),
PAC DECIMAL(5,2),
PC DECIMAL(5,2),
ID_OTRA_CONDICION INT,
ID_CENTRO_POBLADO VARCHAR(10),
FECHA_ULTIMA_REGLA DATE,
FECHA_SOLICITUD_HB DATE,
FECHA_RESULTADO_HB DATE,
FECHA_REGISTRO DATETIME,
FECHA_MODIFICACION DATETIME,
ID_PAIS VARCHAR(3)
)ON [REPORTES]
PRINT 'SE CREO LA TABLA HIS_Nominal'
GO

CREATE TABLE HIS(
	ID_CITA varchar(20),
	ANIO int,
	MES int,
	DIA int,
	FECHA date,
	LOTE varchar(5),
	NUM_PAG int,
	NUM_REG int,
	UPS varchar(6),
	COD_RED int,
	COD_DISA int,
	COD_MIC int,
	RENAES varchar(9),
	NOM_ESTABLEC nvarchar(100),
	ID_PACIENTE varchar(15),
	TIP_DOC int,
	NRO_DOC varchar(15),
	NOMBRE_PACIENTE nvarchar(100),
	FECHA_NAC date,
	SEXO char(1),
	HCL varchar(15),
	FI int,
	COND_EESS char(1),
	COND_SERV char(1),
	TIP_EDAD char(1),
	EDAD int,
	EDAD_A int,
	EDAD_M int,
	EDAD_D int,
	TIP_DIAG char(1),
	LAB varchar(4),
	COD_ITEM varchar(8),
	ID_C int,
	ID_L int,
	PESO real,
	TALLA real,
	HB real,
	ETNIA varchar(2),
	PAC varchar(6),
	PC real,
	COND varchar(2),
	FECHA_REG date,
	PAIS varchar(3),
	TURNO char(1),
	DOC_ATIENDE varchar(15),
	COLEGIO varchar(2),
	PROF varchar(2),
	DOC_REGISTRA varchar(15) 
) ON [PRIMARY]
PRINT 'SE CREO LA TABLA HIS'
GO
CREATE TABLE [dbo].[HTEMP](
	[ID_CITA] [varchar](20) NULL,
	[ANIO] [int] NULL,
	[MES] [int] NULL,
	[DIA] [int] NULL,
	[FECHA] [date] NULL,
	[LOTE] [varchar](5) NULL,
	[NUM_PAG] [int] NULL,
	[NUM_REG] [int] NULL,
	[UPS] [varchar](6) NULL,
	[COD_RED] [int] NULL,
	[COD_DISA] [int] NULL,
	[COD_MIC] [int] NULL,
	[RENAES] [varchar](9) NULL,
	[NOM_ESTABLEC] [nvarchar](100) NULL,
	[ID_PACIENTE] [varchar](15) NULL,
	[TIP_DOC] [int] NULL,
	[NRO_DOC] [varchar](15) NULL,
	[NOMBRE_PACIENTE] [nvarchar](100) NULL,
	[FECHA_NAC] [date] NULL,
	[SEXO] [char](1) NULL,
	[HCL] [varchar](15) NULL,
	[FI] [int] NULL,
	[COND_EESS] [char](1) NULL,
	[COND_SERV] [char](1) NULL,
	[TIP_EDAD] [char](1) NULL,
	[EDAD] [int] NULL,
	[EDAD_A] [int] NULL,
	[EDAD_M] [int] NULL,
	[EDAD_D] [int] NULL,
	[TIP_DIAG] [char](1) NULL,
	[LAB] [varchar](4) NULL,
	[COD_ITEM] [varchar](8) NULL,
	[ID_C] [int] NULL,
	[ID_L] [int] NULL,
	[PESO] [real] NULL,
	[TALLA] [real] NULL,
	[HB] [real] NULL,
	[ETNIA] [varchar](2) NULL,
	[PAC] [varchar](6) NULL,
	[PC] [real] NULL,
	[COND] [varchar](2) NULL,
	[FECHA_REG] [date] NULL,
	[PAIS] [varchar](3) NULL,
	[TURNO] [char](1) NULL,
	[DOC_ATIENDE] [varchar](15) NULL,
	[COLEGIO] [varchar](2) NULL,
	[PROF] [varchar](2) NULL,
	[DOC_REGISTRA] [varchar](15) NULL
) ON [PRIMARY]
PRINT 'SE CREO LA TABLA HTEMP'
GO
CREATE TABLE [dbo].[HTEMP_M](
	[ID_CITA] [varchar](20) NULL,
	[ANIO] [int] NULL,
	[MES] [int] NULL,
	[DIA] [int] NULL,
	[FECHA] [date] NULL,
	[LOTE] [varchar](5) NULL,
	[NUM_PAG] [int] NULL,
	[NUM_REG] [int] NULL,
	[UPS] [varchar](6) NULL,
	[COD_RED] [int] NULL,
	[COD_DISA] [int] NULL,
	[COD_MIC] [int] NULL,
	[RENAES] [varchar](9) NULL,
	[NOM_ESTABLEC] [nvarchar](100) NULL,
	[ID_PACIENTE] [varchar](15) NULL,
	[TIP_DOC] [int] NULL,
	[NRO_DOC] [varchar](15) NULL,
	[NOMBRE_PACIENTE] [nvarchar](100) NULL,
	[FECHA_NAC] [date] NULL,
	[SEXO] [char](1) NULL,
	[HCL] [varchar](15) NULL,
	[FI] [int] NULL,
	[COND_EESS] [char](1) NULL,
	[COND_SERV] [char](1) NULL,
	[TIP_EDAD] [char](1) NULL,
	[EDAD] [int] NULL,
	[EDAD_A] [int] NULL,
	[EDAD_M] [int] NULL,
	[EDAD_D] [int] NULL,
	[TIP_DIAG] [char](1) NULL,
	[LAB] [varchar](4) NULL,
	[COD_ITEM] [varchar](8) NULL,
	[ID_C] [int] NULL,
	[ID_L] [int] NULL,
	[PESO] [real] NULL,
	[TALLA] [real] NULL,
	[HB] [real] NULL,
	[ETNIA] [varchar](2) NULL,
	[PAC] [varchar](6) NULL,
	[PC] [real] NULL,
	[COND] [varchar](2) NULL,
	[FECHA_REG] [date] NULL,
	[PAIS] [varchar](3) NULL,
	[TURNO] [char](1) NULL,
	[DOC_ATIENDE] [varchar](15) NULL,
	[COLEGIO] [varchar](2) NULL,
	[PROF] [varchar](2) NULL,
	[DOC_REGISTRA] [varchar](15) NULL
) ON [PRIMARY]
PRINT 'SE CREO LA TABLA HTEMP_M'
GO
CREATE TABLE [dbo].[HTEMP_A](
	[ID_CITA] [varchar](20) NULL,
	[ANIO] [int] NULL,
	[MES] [int] NULL,
	[DIA] [int] NULL,
	[FECHA] [date] NULL,
	[LOTE] [varchar](5) NULL,
	[NUM_PAG] [int] NULL,
	[NUM_REG] [int] NULL,
	[UPS] [varchar](6) NULL,
	[COD_RED] [int] NULL,
	[COD_DISA] [int] NULL,
	[COD_MIC] [int] NULL,
	[RENAES] [varchar](9) NULL,
	[NOM_ESTABLEC] [nvarchar](100) NULL,
	[ID_PACIENTE] [varchar](15) NULL,
	[TIP_DOC] [int] NULL,
	[NRO_DOC] [varchar](15) NULL,
	[NOMBRE_PACIENTE] [nvarchar](100) NULL,
	[FECHA_NAC] [date] NULL,
	[SEXO] [char](1) NULL,
	[HCL] [varchar](15) NULL,
	[FI] [int] NULL,
	[COND_EESS] [char](1) NULL,
	[COND_SERV] [char](1) NULL,
	[TIP_EDAD] [char](1) NULL,
	[EDAD] [int] NULL,
	[EDAD_A] [int] NULL,
	[EDAD_M] [int] NULL,
	[EDAD_D] [int] NULL,
	[TIP_DIAG] [char](1) NULL,
	[LAB] [varchar](4) NULL,
	[COD_ITEM] [varchar](8) NULL,
	[ID_C] [int] NULL,
	[ID_L] [int] NULL,
	[PESO] [real] NULL,
	[TALLA] [real] NULL,
	[HB] [real] NULL,
	[ETNIA] [varchar](2) NULL,
	[PAC] [varchar](6) NULL,
	[PC] [real] NULL,
	[COND] [varchar](2) NULL,
	[FECHA_REG] [date] NULL,
	[PAIS] [varchar](3) NULL,
	[TURNO] [char](1) NULL,
	[DOC_ATIENDE] [varchar](15) NULL,
	[COLEGIO] [varchar](2) NULL,
	[PROF] [varchar](2) NULL,
	[DOC_REGISTRA] [varchar](15) NULL
) ON [PRIMARY]
PRINT 'SE CREO LA TABLA HTEMP_A'
GO
--CREATE TABLE [dbo].[HisPlano](
--	[ID_CITA] [varchar](20) NOT NULL,
--	[ANIO] [int] NULL,
--	[MES] [int] NULL,
--	[DIA] [int] NULL,
--	[LOTE] [varchar](10) NULL,
--	[NUM_PAG] [int] NULL,
--	[NUM_REG] [int] NULL,
--	[SERVICIO] [varchar](20) NULL,
--	[DISA] [varchar](50) NULL,
--	[RED] [varchar](50) NULL,
--	[MICRORED] [varchar](50) NULL,
--	[RENAES] [varchar](15) NULL,
--	[ESTABLECIMIENTO] [varchar](50) NULL,
--	[TIPO_DOC] [varchar](20) NULL,
--	[IDENTIFICADOR] [varchar](20) NULL,
--	[NRO_DOC] [varchar](20) NULL,
--	[NOMBRE] [varchar](60) NULL,
--	[PATERNO] [varchar](50) NULL,
--	[MATERNO] [varchar](50) NULL,
--	[FECHA_NAC] [date] NULL,
--	[HCL] [varchar](15) NULL,
--	[FICHAFAM] [varchar](15) NULL,
--	[FINANCIADOR] [varchar](15) NULL,
--	[NRO_AFILIACION] [varchar](15) NULL,
--	[COND_EESS] [char](1) NULL,
--	[COND_SERV] [char](1) NULL,
--	[TIPO_EDAD] [varchar](1) NULL,
--	[EDAD_A] [int] NULL,
--	[EDAD_M] [int] NULL,
--	[EDAD_D] [int] NULL,
--	[UBIGEO] [varchar](10) NULL,
--	[DOMICILIO] [varchar](255) NULL,
--	[TURNO_ATEN] [char](1) NULL,
--	[GENERO] [char](1) NULL,
--	[ETNIA] [char](2) NULL,
--	[DIAG1] [char](1) NULL,
--	[LAB1] [varchar](5) NULL,
--	[CIEX1] [varchar](10) NULL,
--	[DIAG2] [char](1) NULL,
--	[LAB2] [varchar](5) NULL,
--	[CIEX2] [varchar](10) NULL,
--	[DIAG3] [char](1) NULL,
--	[LAB3] [varchar](5) NULL,
--	[CIEX3] [varchar](10) NULL,
--	[DIAG4] [char](1) NULL,
--	[LAB4] [varchar](5) NULL,
--	[CIEX4] [varchar](10) NULL,
--	[DIAG5] [char](1) NULL,
--	[LAB5] [varchar](5) NULL,
--	[CIEX5] [varchar](10) NULL,
--	[DIAG6] [char](1) NULL,
--	[LAB6] [varchar](4) NULL,
--	[CIEX6] [varchar](10) NULL,
--	[FECHA_RES_HEM] [date] NULL,
--	[FECHA_SOLIC_H] [date] NULL,
--	[DOC_ATIENDE] [varchar](15) NULL,
--	[ATIENDE] [varchar](200) NULL,
--	[DOC_REGISTRA] [varchar](15) NULL,
--	[REGISTRADOR] [varchar](200) NULL,
--	[FECHA_REGISTRO] [date] NULL,
--	[ULT_MODIFICACION] [date] NULL,
--	[PESO] [decimal](7, 2) NULL,
--	[TALLA] [decimal](6, 2) NULL,
--	[HB] [varchar](6) NULL,
--	[PAB] [varchar](6) NULL,
--	[PC] [decimal](7, 2) NULL,
--	[ICM] [decimal](6, 2) NULL,
--	[FECHA] [date] NULL
--) ON [PRIMARY]
--PRINT 'SE CREO LA TABLA HisPlano'
--GO
CREATE TABLE [dbo].[HISA](
	[COD_2000] [varchar](9) NULL,
	[ANO] [numeric](4, 0) NULL,
	[MES] [numeric](2, 0) NULL,
	[NOM_LOTE] [varchar](3) NULL,
	[NUM_PAG] [numeric](3, 0) NULL,
	[NUM_REG] [numeric](2, 0) NULL,
	[DIA] [numeric](2, 0) NULL,
	[FICHAFAM] [varchar](10) NULL,
	[COD_DPTO] [char](2) NULL,
	[COD_PROV] [char](2) NULL,
	[COD_DIST] [char](2) NULL,
	[EDAD] [numeric](3, 0) NULL,
	[TIP_EDAD] [char](1) NULL,
	[SEXO] [char](1) NULL,
	[ESTABLEC] [char](1) NULL,
	[SERVICIO] [char](1) NULL,
	[DIAGNOST1] [char](1) NULL,
	[LABCONF1] [varchar](4) NULL,
	[CODIGO1] [varchar](8) NULL,
	[DIAGNOST2] [varchar](1) NULL,
	[LABCONF2] [varchar](4) NULL,
	[CODIGO2] [varchar](8) NULL,
	[DIAGNOST3] [varchar](1) NULL,
	[LABCONF3] [varchar](4) NULL,
	[CODIGO3] [varchar](8) NULL,
	[DIAGNOST4] [varchar](1) NULL,
	[LABCONF4] [varchar](4) NULL,
	[CODIGO4] [varchar](8) NULL,
	[DIAGNOST5] [varchar](1) NULL,
	[LABCONF5] [varchar](4) NULL,
	[CODIGO5] [varchar](8) NULL,
	[DIAGNOST6] [varchar](1) NULL,
	[LABCONF6] [varchar](4) NULL,
	[CODIGO6] [varchar](8) NULL,
	[ESTA_REG] [varchar](1) NULL,
	[MT] [char](1) NULL,
	[DNI] [varchar](18) NULL,
	[FI] [varchar](2) NULL,
	[ET] [varchar](3) NULL,
	[ST] [varchar](1) NULL,
	[FECHA] [date] NULL
) ON [PRIMARY]
PRINT 'SE CREO LA TABLA HISA'
GO
CREATE TABLE [HISATEMP](
	[COD_2000] [varchar](9) NULL,
	[ANO] [numeric](4, 0) NULL,
	[MES] [numeric](2, 0) NULL,
	[NOM_LOTE] [varchar](3) NULL,
	[NUM_PAG] [numeric](3, 0) NULL,
	[NUM_REG] [numeric](2, 0) NULL,
	[DIA] [numeric](2, 0) NULL,
	[FICHAFAM] [varchar](10) NULL,
	[COD_DPTO] [char](2) NULL,
	[COD_PROV] [char](2) NULL,
	[COD_DIST] [char](2) NULL,
	[EDAD] [numeric](3, 0) NULL,
	[TIP_EDAD] [char](1) NULL,
	[SEXO] [char](1) NULL,
	[ESTABLEC] [char](1) NULL,
	[SERVICIO] [char](1) NULL,
	[DIAGNOST1] [char](1) NULL,
	[LABCONF1] [varchar](4) NULL,
	[CODIGO1] [varchar](8) NULL,
	[DIAGNOST2] [varchar](1) NULL,
	[LABCONF2] [varchar](4) NULL,
	[CODIGO2] [varchar](8) NULL,
	[DIAGNOST3] [varchar](1) NULL,
	[LABCONF3] [varchar](4) NULL,
	[CODIGO3] [varchar](8) NULL,
	[DIAGNOST4] [varchar](1) NULL,
	[LABCONF4] [varchar](4) NULL,
	[CODIGO4] [varchar](8) NULL,
	[DIAGNOST5] [varchar](1) NULL,
	[LABCONF5] [varchar](4) NULL,
	[CODIGO5] [varchar](8) NULL,
	[DIAGNOST6] [varchar](1) NULL,
	[LABCONF6] [varchar](4) NULL,
	[CODIGO6] [varchar](8) NULL,
	[ESTA_REG] [varchar](1) NULL,
	[MT] [char](1) NULL,
	[DNI] [varchar](18) NULL,
	[FI] [varchar](2) NULL,
	[ET] [varchar](3) NULL,
	[ST] [varchar](1) NULL,
	[FECHA]  AS ((((CONVERT([varchar](4),[ANO],(0))+'-')+CONVERT([varchar](2),[MES],(0)))+'-')+CONVERT([varchar](2),[DIA],(0)))
) ON [PRIMARY]
PRINT 'SE CREO LA TABLA HISATEMP'
GO
CREATE TABLE [dbo].[CNV](
  [Nro] int  NULL,
  [NUM_CNV] varchar(10)   NULL,
  [Estado] varchar(7)   NULL,
  [Cod_EESS] varchar(8)   NULL,
  [EESS] varchar(100)   NULL,
  [Ap_Paterno_Madre] nvarchar(50)   NULL,
  [Ap_Materno_Madre] nvarchar(50)   NULL,
  [Nombres_Madre] nvarchar(50)   NULL,
  [Edad_Madre] int  NULL,
  [Fec_Nac_Madre] date  NULL,
  [Sem_Gest] int  NULL,
  [Tipo_Doc_Madre] varchar(25)   NULL,
  [Doc_Madre] varchar(15)   NULL,
  [Cod_EESS_Prenatal] varchar(8)   NULL,
  [EESS_Prenatal] nvarchar(80)   NULL,
  [Fecha] date  NULL,
  [Hora] varchar(8)   NULL,
  [Sexo] varchar(1)   NULL,
  [Peso_g] varchar(5)   NULL,
  [Talla_cm] varchar(5)   NULL,
  [Apgar] varchar(6)   NULL,
  [PC] varchar(5)   NULL,
  [PT] varchar(5)   NULL,
  [Malf_cong] varchar(2)   NULL,
  [Tiempo_Lig_Cord] varchar(16)   NULL,
  [Lactancia_precoz] varchar(2)   NULL,
  [Ap_Paterno_Prof] nvarchar(50)   NULL,
  [Ap_Materno_Prof] nvarchar(50)   NULL,
  [Nombres_Prof] nvarchar(50)   NULL,
  [Profesion_Prof] varchar(30)   NULL,
  [Nro_Colegio] varchar(15)   NULL,
  [Fecha_Registro] datetime  NULL,
  [Ap_Paterno_Reg] nvarchar(50)   NULL,
  [Ap_Materno_Reg] nvarchar(50)   NULL,
  [Nombres_Reg] nvarchar(50)   NULL,
  [Tipo] nvarchar(7)   NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA CNV'
GO
CREATE TABLE [dbo].[Padron_Nominal](
	[NRO] [int] NULL,
	[TIP_DOC_NINO] [varchar](15) NULL,
	[COD_PADRON] [varchar](15) NULL,
	[NUM_CNV] [varchar](10) NULL,
	[CUI_NINO] [varchar](8) NULL,
	[DNI_NINO] [varchar](8) NULL,
	[AP_PATERNO_NINO] [nvarchar](50) NULL,
	[AP_MATERNO_NINO] [nvarchar](50) NULL,
	[NOMBRES_NINO] [nvarchar](70) NULL,
	[COD_SEXO] [varchar](1) NULL,
	[FECHA_NAC_NINO] [date] NULL,
	[EDAD_NINO] [nvarchar](90) NULL,
	[EJE_VIAL] [nvarchar](255) NULL,
	[DESCRIPCION] [nvarchar](255) NULL,
	[REFERENCIA_DIRECCION] [nvarchar](255) NULL,
	[UBIGEO_DISTRITO] [varchar](7) NULL,
	[DEPARTAMENTO] [nvarchar](50) NULL,
	[PROVINCIA] [nvarchar](50) NULL,
	[DISTRITO] [nvarchar](50) NULL,
	[CODIGO_CP] [varchar](12) NULL,
	[NOMBRE_CP] [nvarchar](100) NULL,
	[AREA_CP] [varchar](10) NULL,
	[MENOR_VISITADO] [varchar](15) NULL,
	[MENOR_ENCONTRADO] [varchar](15) NULL,
	[FECHA_VISITA] [date] NULL,
	[FUENTE_DATOS] [varchar](100) NULL,
	[FECHA_FUENTE_DATOS] [date] NULL,
	[COD_EESS_NACIMIENTO] [varchar](9) NULL,
	[NOMBRE_EESS_NACIMIENTO] [nvarchar](200) NULL,
	[COD_EESS_ATENCION] [varchar](9) NULL,
	[NOMBRE_EESS_ATENCION] [nvarchar](200) NULL,
	[FRECUENCIA_ATENCION] [varchar](30) NULL,
	[COD_EESS_ADSCRIPCION] [varchar](9) NULL,
	[NOMBRE_EESS_ADSCRIPCION] [nvarchar](200) NULL,
	[TIP_SEGURO_NINO] [varchar](15) NULL,
	[TIP_PROGRAMA_SOCIAL] [varchar](18) NULL,
	[COD_IE] [varchar](10) NULL,
	[NOMBRE_INSTITUCION_EDUCATIVA] [varchar](100) NULL,
	[REL_APODERADO_MENOR] [varchar](1) NULL,
	[DNI_MADRE] [varchar](10) NULL,
	[AP_PATERNO_MADRE] [nvarchar](50) NULL,
	[AP_MATERNO_MADRE] [nvarchar](50) NULL,
	[NOMBRES_MADRE] [varchar](70) NULL,
	[TELEFONO_MADRE] [varchar](25) NULL,
	[EMAIL_MADRE] [varchar](100) NULL,
	[GRADO_INSTRUCCION_MADRE] [varchar](30) NULL,
	[LENGUA_HABITUAL_MADRE] [varchar](20) NULL,
	[REL_JEFEFAMILIA] [varchar](1) NULL,
	[DNI_JEFEFAMILIA] [varchar](12) NULL,
	[AP_PATERNO_JEFEFAMILIA] [varchar](50) NULL,
	[AP_MATERNO_JEFEFAMILIA] [varchar](50) NULL,
	[NOMBRES_JEFEFAMILIA] [varchar](70) NULL,
	[ESTADO_REGISTRO] [varchar](1) NULL,
	[FECHA_CREACION] [date] NULL,
	[USUARIO_CREA] [varchar](20) NULL,
	[FECHA_MODIFICACION] [date] NULL,
	[USUARIO_MODIFICA] [varchar](20) NULL,
	[ENTIDAD] [nvarchar](30) NULL,
	[TIPO_REGISTRO] [varchar](20) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA Padron_Nominal'
GO
CREATE TABLE [dbo].[FED](
	[id_Indicador] [int] PRIMARY KEY,
	[indicador] [nvarchar](50) NULL,
	[descripcion] [nvarchar](200) NULL,
	[consulta] [nvarchar](max) NULL
) ON [PRIMARY] 
PRINT 'SE CREO LA TABLA FED'
GO
CREATE TABLE [dbo].[MAESTRO_HIS_UBIGEO_INEI_RENIEC](
	[Id_Ubigueo_Inei] [varchar](6) NOT NULL,
	[Id_Ubigueo_Reniec] [varchar](6) NOT NULL,
	[Departamento] [nvarchar](100) NOT NULL,
	[Provincia] [nvarchar](100) NOT NULL,
	[Distrito] [nvarchar](100) NOT NULL,
	[Codigo_Departamento_Inei] [char](2) NULL,
	[Codigo_Provincia_Inei] [char](2) NULL,
	[Codigo_Distrito_Inei] [char](2) NULL,
	[Codigo_Departamento_Reniec] [varchar](2) NULL,
	[Codigo_Provincia_Reniec] [varchar](2) NULL,
	[Codigo_Distrito_Reniec] [varchar](2) NULL
) ON [MAESTROS]
PRINT 'SE CREO LA TABLA MAESTRO_HIS_UBIGEO_INEI_RENIEC'
GO

CREATE TABLE [dbo].[T_HISMINSA](
	[ID_CITA] [varchar](50) NULL,
	[ANIO] [varchar](4) NULL,
	[MES] [varchar](2) NULL,
	[DIA] [varchar](2) NULL,
	[FECHA] [date] NULL,
	[LOTE] [varchar](3) NULL,
	[NUM_PAG] [int] NULL,
	[NUM_REG] [int] NULL,
	[UPS] [varchar](6) NULL,
	[DESCRIPCION_UPS] [nvarchar](100) NULL,
	[ID_ESTABLECIMIENTO] [int] NULL,
	[CODIGO_RED] [char](2) NULL,
	[DESCRIPCION_RED] [nvarchar](70) NULL,
	[CODIGO_MICRORED] [char](2) NULL,
	[DESCRIPCION_MICRORED] [nvarchar](70) NULL,
	[RENAES] [varchar](9) NULL,
	[ESTABLECIMIENTO] [nvarchar](100) NULL,
	[UBIGEO_EESS] [char](6) NULL,
	[ID_PACIENTE] [varchar](50) NULL,
	[NRO_DOC_PACIENTE] [varchar](15) NULL,
	[PACIENTE] [nvarchar](152) NULL,
	[FECHA_NAC_PACIENTE] [date] NULL,
	[SEXO] [varchar](1) NULL,
	[HCL] [varchar](15) NULL,
	[FICHA_FAMILIAR] [varchar](50) NULL,
	[ETNIA] [varchar](3) NULL,
	[DESCRIPCION_ETNIA] [nvarchar](100) NULL,
	[FI] [varchar](2) NULL,
	[FINANCIADOR] [nvarchar](100) NULL,
	[PAIS] [varchar](3) NULL,
	[COND_EESS] [varchar](1) NULL,
	[COND_SERV] [varchar](1) NULL,
	[EDAD] [int] NULL,
	[TIP_EDAD] [varchar](1) NULL,
	[TURNO] [varchar](1) NULL,
	[Fg_Tipo] [varchar](2) NULL,
	[COD_ITEM] [varchar](15) NULL,
	[DIAGNOSTICO] [varchar](400) NULL,
	[TIP_DIAG] [varchar](1) NULL,
	[LAB] [varchar](3) NULL,
	[ID_C] [int] NULL,
	[ID_L] [int] NULL,
	[PESO] [decimal](6, 3) NULL,
	[TALLA] [decimal](5, 2) NULL,
	[HB] [decimal](5, 2) NULL,
	[PAC] [decimal](5, 2) NULL,
	[PC] [decimal](5, 2) NULL,
	[Id_Otra_Condicion] [int] NULL,
	[DESCRIPCION_CENTRO_POBLADO] [nvarchar](350) NULL,
	[CODIGO_CP] [varchar](4) NULL,
	[UBIGUEO_CP] [varchar](6) NULL,
	[ALTITUD] [decimal](7, 2) NULL,
	[FECHA_ULTIMA_REGLA] [date] NULL,
	[FECHA_SOLICITUD_HB] [date] NULL,
	[FECHA_RESULTADO_HB] [date] NULL,
	[FECHA_REGISTRO] [datetime] NULL,
	[FECHA_REG] [date] NULL,
	[FECHA_MODIFICACION] [datetime] NULL,
	[NRO_DOC_PERSONAL] [varchar](15) NULL,
	[PERSONAL] [nvarchar](152) NULL,
	[DESCRIPCION_CONDICION] [nvarchar](500) NULL,
	[PROF] [varchar](2) NULL,
	[DESCRIPCION_PROFESION] [nvarchar](200) NULL,
	[COLEGIO] [varchar](2) NULL,
	[DESCRIPCION_COLEGIO] [nvarchar](800) NULL,
	[NRO_DOC_REGISTRADOR] [varchar](15) NULL,
	[REGISTRADOR] [nvarchar](152) NULL
) ON [PRIMARY]
PRINT 'SE CREO LA TABLA T_HISMINSA'
GO

--VISTAS
CREATE VIEW [dbo].[V_PN_Menor5] AS SELECT
--	ES.Disa, 
--	ES.Codigo_Disa, 
ES.Codigo_Red COD_RED, 
	ES.RED, 
    ES.CODIGO_MICRORED COD_MR,
    ES.MICRORED,
	RIGHT(replicate('0',9) + rtrim(P.COD_EESS_ATENCION),9) RENAES,
	P.NOMBRE_EESS_ATENCION ESTABLECIMIENTO, 
	P.DNI_NINO, 
	P.FECHA_NAC_NINO,
	Floor(Cast(DATEDIFF(dd,P.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))) As 'EDAD_A', 
	Floor(Cast(DATEDIFF(dd,P.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))*12) -
	Floor(Cast(DATEDIFF(dd,P.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))) *12 As 'EDAD_M', 
	
	Floor(Cast(DATEDIFF(dd,P.FECHA_NAC_NINO, GetDate()) As Numeric(9,2)) 
	 - DATEDIFF(dd,P.FECHA_NAC_NINO,DATEADD(yy,Floor(Cast(DATEDIFF(dd,P.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))),P.FECHA_NAC_NINO) )
	 - Datediff(dd,DATEADD(yy,Floor(Cast(DATEDIFF(dd,P.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))),P.FECHA_NAC_NINO),
	 DateAdd(mm, Floor(Cast(DATEDIFF(dd,P.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))*12)- Floor(Cast(DATEDIFF(dd,P.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))) *12,
	 DATEADD(yy,Floor(Cast(DATEDIFF(dd,P.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))),P.FECHA_NAC_NINO)	)))	 As 'EDAD_D',

	P.AP_PATERNO_NINO + ' ' + P.AP_MATERNO_NINO+' '+ P.NOMBRES_NINO APELLIDOS_NOMBRES
	
FROM
	dbo.Padron_Nominal AS P
	INNER JOIN 	dbo.ESTABLECIMIENTOS AS ES ON RIGHT(replicate('0',9) + rtrim(P.COD_EESS_ATENCION),9) = ES.Codigo_Unico
	WHERE GETDATE()< DATEADD(YEAR,5,P.FECHA_NAC_NINO) AND ES.Codigo_Disa=30
	GROUP BY
--	ES.Disa, 
--	ES.Codigo_Disa, 
	ES.Codigo_Red, 
	ES.Red, 
    ES.CODIGO_MICRORED,
    ES.MICRORED,
	P.COD_EESS_ATENCION, 
	P.NOMBRE_EESS_ATENCION, 
	P.DNI_NINO, 
	P.FECHA_NAC_NINO,
	P.AP_PATERNO_NINO, 
	P.AP_MATERNO_NINO, 
	P.NOMBRES_NINO
GO
PRINT 'VISTA CREADA V_PN_Menor5'
GO
CREATE VIEW [dbo].[V_CNV_PN] AS SELECT
	ES.Codigo_Red COD_RED,
	ES.RED, 
    ES.Codigo_MicroRed COD_MR,
    ES.MICRORED,
	ES.Codigo_Unico RENAES, 
	ES.Nombre_Establecimiento ESTABLECIMIENTO, 
	PN.NUM_CNV, 
	PN.DNI_NINO, 
	PN.FECHA_NAC_NINO, 
	Floor(Cast(DATEDIFF(dd,PN.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))) As 'EDAD_A', 
	Floor(Cast(DATEDIFF(dd,PN.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))*12) -
	Floor(Cast(DATEDIFF(dd,PN.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))) *12 As 'EDAD_M', 
	
	Floor(Cast(DATEDIFF(dd,PN.FECHA_NAC_NINO, GetDate()) As Numeric(9,2)) 
	 - DATEDIFF(dd,PN.FECHA_NAC_NINO,DATEADD(yy,Floor(Cast(DATEDIFF(dd,PN.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))),PN.FECHA_NAC_NINO) )
	 - Datediff(dd,DATEADD(yy,Floor(Cast(DATEDIFF(dd,PN.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))),PN.FECHA_NAC_NINO),
	 DateAdd(mm, Floor(Cast(DATEDIFF(dd,PN.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))*12)- Floor(Cast(DATEDIFF(dd,PN.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))) *12,
	 DATEADD(yy,Floor(Cast(DATEDIFF(dd,PN.FECHA_NAC_NINO, GetDate())/365.25 As Numeric(9,2))),PN.FECHA_NAC_NINO)	)))	 As 'EDAD_D',

	PN.AP_PATERNO_NINO + ' ' + PN.AP_MATERNO_NINO+' '+ PN.NOMBRES_NINO APELLIDOS_NOMBRES,
	CNV.Sem_Gest, 
	CNV.Peso_g 
	--CNV.Fechaa
FROM dbo.Padron_Nominal AS PN
	INNER JOIN 	dbo.ESTABLECIMIENTOS AS ES ON RIGHT(replicate('0',9) + rtrim(PN.COD_EESS_ATENCION),9) = ES.Codigo_Unico
	INNER JOIN	dbo.CNV ON CNV.NUM_CNV = PN.NUM_CNV
GO
PRINT 'VISTA CREADA V_CNV_PN'
GO
CREATE VIEW [dbo].[T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA] AS
SELECT
--ATENCION 
NTN.Id_Cita,
NTN.Anio,
NTN.Mes,
NTN.Dia,
NTN.Fecha_Atencion,
NTN.Lote,
NTN.Num_Pag,
NTN.Num_Reg,
NTN.Id_Ups,
MHU.Descripcion_Ups,
--ESTABLECIMIENTO
NTN.Id_Establecimiento,
MHES.Codigo_Sector,
MHES.Descripcion_Sector,
MHES.Codigo_Disa,
MHES.Disa,
MHES.Codigo_Red,
MHES.Red,
MHES.Codigo_MicroRed,
MHES.MicroRed,
MHES.Codigo_Unico,
MHES.Nombre_Establecimiento,
MHES.Categoria_Establecimiento,
MHES.Ubigueo_Establecimiento,
MHES.Departamento Departamento_Establecimiento,
MHES.Provincia Provincia_Establecimiento,
MHES.Distrito Distrito_Establecimiento,
--PACIENTE
NTN.Id_Paciente,
HTDPA.Id_Tipo_Documento,
HTDPA.Abrev_Tipo_Doc Abrev_Tipo_Documento_Paciente,
MPA.Numero_Documento Numero_Documento_Paciente,
MPA.Apellido_Paterno_Paciente,
MPA.Apellido_Materno_Paciente,
MPA.Nombres_Paciente,
MPA.Fecha_Nacimiento Fecha_Nacimiento_Paciente,
MPA.Genero,
MPA.Historia_Clinica,
CASE WHEN (NTN.Id_Paciente LIKE 'A%') THEN NTN.Id_Paciente ELSE MPA.Ficha_Familiar END Ficha_Familiar,
MHE.Id_Etnia,
MHE.Descripcion_Etnia,
MHF.Id_Financiador,
MHF.Descripcion_Financiador,
MHP.Id_Pais,
MHP.Descripcion_Pais,
--PERSONAL
NTN.Id_Personal,
HTDPE.Id_Tipo_Documento Tipo_Documento_Personal,
HTDPE.Abrev_Tipo_Doc Abrev_Tipo_Documento_Personal,
MP.Numero_Documento Numero_Documento_Personal,
MP.Apellido_Paterno_Personal,
MP.Apellido_Materno_Personal,
MP.Nombres_Personal,
MP.Fecha_Nacimiento Fecha_Nacimiento_Personal,
MHCC.Id_Condicion,
MHCC.Descripcion_Condicion,
MHPR.Id_Profesion,
MHPR.Descripcion_Profesion,
MHC.Id_Colegio,
MHC.Descripcion_Colegio,
MP.Numero_Colegiatura,
--REGISTRADOR
NTN.Id_Registrador,
HTDRE.Id_Tipo_Documento Tipo_Documento_Registrador,
HTDRE.Abrev_Tipo_Doc Abrev_Tipo_Documento_Registrador,
MR.Numero_Documento Numero_Documento_Registrador,
MR.Apellido_Paterno_Registrador,
MR.Apellido_Materno_Registrador,
MR.Nombres_Registrador,
MR.Fecha_Nacimiento Fecha_Nacimiento_Registrador,
--ATENCION
NTN.Id_Condicion_Establecimiento,
NTN.Id_Condicion_Servicio,
NTN.Edad_Reg,
NTN.Tipo_Edad,
NTN.Anio_Actual_Paciente,
NTN.Mes_Actual_Paciente,
NTN.Dia_Actual_Paciente,
DATEDIFF(DAY, MPA.Fecha_Nacimiento, NTN.Fecha_Atencion) Edad_Dias_Paciente_FechaAtencion, 
DATEDIFF(MONTH, MPA.Fecha_Nacimiento, NTN.Fecha_Atencion) Edad_Meses_Paciente_FechaAtencion, 
DATEDIFF(YEAR, MPA.Fecha_Nacimiento, NTN.Fecha_Atencion) Edad_Anios_Paciente_FechaAtencion,
DATEDIFF(DAY, MPA.Fecha_Nacimiento, GETDATE()) Edad_Dias_Paciente_FechaActual, 
DATEDIFF(MONTH, MPA.Fecha_Nacimiento, GETDATE()) Edad_Meses_Paciente_FechaActual, 
DATEDIFF(YEAR, MPA.Fecha_Nacimiento, GETDATE()) Edad_Anios_Paciente_FechaActual,
CASE 	WHEN (NTN.Tipo_Edad='D' AND NTN.Edad_Reg BETWEEN 1 AND 29 ) THEN '01 a 29 días'
		WHEN (NTN.Tipo_Edad='M' AND NTN.Edad_Reg BETWEEN 1 AND 11 ) THEN '01 a 11 meses'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 1 AND 4 ) THEN '01 a 04 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 5 AND 11 ) THEN '05 a 11 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 12 AND 17 ) THEN '12 a 17 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 18 AND 29 ) THEN '18 a 29 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 30 AND 59 ) THEN '30 a 59 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg > 59) THEN '60 años a más'
END Grupo_Edad,
NTN.Id_Turno,
MCC.Fg_Tipo,
NTN.Codigo_Item,
MCC.Diagnostico Descripcion_Item,
NTN.Tipo_Diagnostico,
NTN.Valor_Lab,
NTN.Id_Correlativo Id_Correlativo_Item,
NTN.Id_Correlativo_Lab,
NTN.Peso,
NTN.Talla,
NTN.Hemoglobina,
NTN.Pac,
NTN.Pc,
NTN.Id_Otra_Condicion,
--MOC.Descripcion_Otra_Condicion,
--CENTRO POBLADO
NTN.Id_Centro_Poblado,
--MHCP.Descripcion_Centro_Poblado,
--MHCP.Id_Codigo_Centro_Poblado,
--MHCP.Id_Ubigueo,
--MHCP.Altitud,
NTN.Fecha_Ultima_Regla,
NTN.Fecha_Solicitud_Hb,
NTN.Fecha_Resultado_Hb,
NTN.Fecha_Registro,
NTN.Fecha_Modificacion
FROM HIS_Nominal NTN
LEFT JOIN PERSONAL MP ON MP.Id_Personal=NTN.Id_Personal
LEFT JOIN PACIENTE MPA ON MPA.Id_Paciente=NTN.Id_Paciente
LEFT JOIN REGISTRADOR MR ON MR.Id_Registrador=NTN.Id_Registrador
--LEFT JOIN MAESTRO_HIS_OTRA_CONDICION MOC ON MOC.Id_Otra_Condicion=NTN.Id_Otra_Condicion
LEFT JOIN CIE_CPMS MCC ON MCC.Codigo=NTN.Codigo_Item
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDPE ON HTDPE.Id_Tipo_Documento=MP.Id_Tipo_Documento
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDPA ON HTDPA.Id_Tipo_Documento=MPA.Id_Tipo_Documento
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDRE ON HTDRE.Id_Tipo_Documento=MR.Id_Tipo_Documento
LEFT JOIN MAESTRO_HIS_PAIS MHP ON MHP.Id_Pais=MPA.Id_Pais
LEFT JOIN MAESTRO_HIS_FINANCIADOR MHF ON MHF.Id_Financiador=NTN.Id_Financiador
LEFT JOIN MAESTRO_HIS_ETNIA MHE ON MHE.Id_Etnia=MPA.Id_Etnia
LEFT JOIN MAESTRO_HIS_COLEGIO MHC ON MHC.Id_Colegio=MP.Id_Colegio
LEFT JOIN MAESTRO_HIS_PROFESION MHPR ON MHPR.Id_Profesion=MP.Id_Profesion
LEFT JOIN MAESTRO_HIS_UPS MHU ON MHU.Id_Ups=NTN.Id_Ups
LEFT JOIN ESTABLECIMIENTOS MHES ON MHES.Id_Establecimiento=NTN.Id_Establecimiento
LEFT JOIN MAESTRO_HIS_CONTRATO MHCC ON MHCC.Id_Condicion=MP.Id_Condicion
--LEFT JOIN MAESTRO_HIS_CP MHCP ON MHCP.Id_Centro_Poblado=NTN.Id_Centro_Poblado
GO
PRINT 'VISTA CREADA T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA'
GO
CREATE VIEW [dbo].[V_HISMINSA]AS
SELECT
NTN.ID_CITA,
NTN.ANIO,
NTN.MES,
NTN.DIA,
NTN.Fecha_Atencion AS FECHA,
--CONVERT ( CHAR ( 6 ), NTN.FECHA_ATENCION, 112 ) AS Anio_Mes,
NTN.LOTE,
NTN.NUM_PAG,
NTN.NUM_REG,
NTN.Id_Ups AS UPS,
MHU.DESCRIPCION_UPS,
--ESTABLECIMIENTO
NTN.ID_ESTABLECIMIENTO,
MHES.CODIGO_SECTOR,
MHES.DESCRIPCION_SECTOR,
MHES.CODIGO_DISA,
MHES.Disa DESCRIPCION_DISA,
MHES.CODIGO_RED,
MHES.Red DESCRIPCION_RED,
MHES.CODIGO_MICRORED,
MHES.MicroRed DESCRIPCION_MICRORED,
MHES.Codigo_Unico AS RENAES,
MHES.Nombre_Establecimiento AS ESTABLECIMIENTO,
MHES.Ubigueo_Establecimiento AS UBIGEO_EESS,
MHES.Departamento DEPARTAMENTO_EESS,
MHES.Provincia PROVINCIA_EESS,
MHES.Distrito DISTRITO_EESS,
NTN.ID_PACIENTE,
HTDPA.Id_Tipo_Documento Tip_Doc_Paciente,
HTDPA.Abrev_Tipo_Doc Abrev_Tip_Doc_Paciente,
MPA.Numero_Documento NRO_DOC_PACIENTE,
MPA.NOMBRES_PACIENTE + ' ' + MPA.APELLIDO_PATERNO_PACIENTE + ' ' + MPA.APELLIDO_MATERNO_PACIENTE AS PACIENTE,
MPA.FECHA_NACIMIENTO AS FECHA_NAC_PACIENTE,
MPA.GENERO AS SEXO,
MPA.Historia_Clinica HCL,
CASE WHEN (NTN.Id_Paciente LIKE 'A%') THEN NTN.Id_Paciente ELSE MPA.Ficha_Familiar END FICHA_FAMILIAR,
MHE.Id_Etnia ETNIA,
MHE.Descripcion_Etnia DESCRIPCION_ETNIA,
MHF.Id_Financiador FI,
MHF.Descripcion_Financiador FINANCIADOR,
MHP.Id_Pais PAIS,
MHP.Descripcion_Pais DESCRIPCION_PAIS,
NTN.Id_Condicion_Establecimiento  COND_EESS,
NTN.Id_Condicion_Servicio COND_SERV,
NTN.Edad_Reg EDAD,
NTN.Tipo_Edad TIP_EDAD,
NTN.Dia_Actual_Paciente EDAD_D_FAC,
NTN.Mes_Actual_Paciente EDAD_M_FAC,
NTN.Anio_Actual_Paciente EDAD_A_FAC,
DATEDIFF(DAY, MPA.Fecha_Nacimiento, NTN.Fecha_Atencion) EDAD_D_FAT, 
DATEDIFF(MONTH, MPA.Fecha_Nacimiento, NTN.Fecha_Atencion) EDAD_M_FAT, 
DATEDIFF(YEAR, MPA.Fecha_Nacimiento, NTN.Fecha_Atencion) EDAD_A_FAT,
CASE 	WHEN (NTN.Tipo_Edad='D' AND NTN.Edad_Reg BETWEEN 1 AND 29 ) THEN '01 a 29 días'
		WHEN (NTN.Tipo_Edad='M' AND NTN.Edad_Reg BETWEEN 1 AND 11 ) THEN '01 a 11 meses'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 1 AND 4 ) THEN '01 a 04 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 5 AND 11 ) THEN '05 a 11 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 12 AND 17 ) THEN '12 a 17 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 18 AND 29 ) THEN '18 a 29 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 30 AND 59 ) THEN '30 a 59 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg > 59) THEN '60 años a más'
END GRUPO_EDAD,
NTN.Id_Turno TURNO,
MCC.Fg_Tipo,
NTN.Codigo_Item COD_ITEM,
MCC.Diagnostico DIAGNOSTICO,
NTN.Tipo_Diagnostico TIP_DIAG,
NTN.Valor_Lab LAB,
NTN.Id_Correlativo ID_C,
NTN.Id_Correlativo_Lab ID_L,
NTN.PESO,
NTN.TALLA,
NTN.Hemoglobina HB,
NTN.PAC,
NTN.PC,
NTN.Id_Otra_Condicion,
NTN.ID_CENTRO_POBLADO,
MHCP.DESCRIPCION_CENTRO_POBLADO,
MHCP.Id_Codigo_Centro_Poblado CODIGO_CP,
MHCP.Id_Ubigueo UBIGUEO_CP,
MHCP.ALTITUD,
NTN.FECHA_ULTIMA_REGLA,
NTN.FECHA_SOLICITUD_HB,
NTN.FECHA_RESULTADO_HB,
NTN.FECHA_REGISTRO,
CONVERT ( date, NTN.FECHA_REGISTRO) AS FECHA_REG,
NTN.FECHA_MODIFICACION,
NTN.ID_PERSONAL,
HTDPE.Id_Tipo_Documento Tip_Doc_Personal,
HTDPE.Abrev_Tipo_Doc Abrev_Tip_Doc_Personal,
MP.NUMERO_DOCUMENTO AS NRO_DOC_PERSONAL,
MP.NOMBRES_PERSONAL + ' ' + MP.APELLIDO_PATERNO_PERSONAL + ' ' + MP.APELLIDO_MATERNO_PERSONAL AS PERSONAL,
MP.FECHA_NACIMIENTO AS FECHA_NAC_PERSONAL,
MHCC.ID_CONDICION,
MHCC.DESCRIPCION_CONDICION,
MHPR.Id_Profesion PROF,
MHPR.DESCRIPCION_PROFESION ,
MHC.Id_Colegio COLEGIO,
MHC.DESCRIPCION_COLEGIO ,
MP.NUMERO_COLEGIATURA,
NTN.ID_REGISTRADOR,
HTDRE.Id_Tipo_Documento Tip_Doc_Registrador,
HTDRE.Abrev_Tipo_Doc Abrev_Tip_Doc_Registrador,
MR.NUMERO_DOCUMENTO AS NRO_DOC_REGISTRADOR,
MR.NOMBRES_REGISTRADOR + ' ' + MR.APELLIDO_PATERNO_REGISTRADOR + ' ' + MR.APELLIDO_MATERNO_REGISTRADOR AS REGISTRADOR,
MR.FECHA_NACIMIENTO AS FECHA_NAC_REGISTRADOR 

FROM HIS_Nominal NTN
LEFT JOIN PERSONAL MP ON MP.Id_Personal=NTN.Id_Personal
LEFT JOIN PACIENTE MPA ON MPA.Id_Paciente=NTN.Id_Paciente
LEFT JOIN REGISTRADOR MR ON MR.Id_Registrador=NTN.Id_Registrador
LEFT JOIN CIE_CPMS MCC ON MCC.Codigo=NTN.Codigo_Item
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDPE ON HTDPE.Id_Tipo_Documento=MP.Id_Tipo_Documento
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDPA ON HTDPA.Id_Tipo_Documento=MPA.Id_Tipo_Documento
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDRE ON HTDRE.Id_Tipo_Documento=MR.Id_Tipo_Documento
LEFT JOIN MAESTRO_HIS_PAIS MHP ON MHP.Id_Pais=MPA.Id_Pais
LEFT JOIN MAESTRO_HIS_FINANCIADOR MHF ON MHF.Id_Financiador=NTN.Id_Financiador
LEFT JOIN MAESTRO_HIS_ETNIA MHE ON MHE.Id_Etnia=MPA.Id_Etnia
LEFT JOIN MAESTRO_HIS_COLEGIO MHC ON MHC.Id_Colegio=MP.Id_Colegio
LEFT JOIN MAESTRO_HIS_PROFESION MHPR ON MHPR.Id_Profesion=MP.Id_Profesion
LEFT JOIN MAESTRO_HIS_UPS MHU ON MHU.Id_Ups=NTN.Id_Ups
LEFT JOIN ESTABLECIMIENTOS MHES ON MHES.Id_Establecimiento=NTN.Id_Establecimiento
LEFT JOIN MAESTRO_HIS_CONTRATO MHCC ON MHCC.Id_Condicion=MP.Id_Condicion
LEFT JOIN MAESTRO_HIS_CP MHCP ON MHCP.Id_Centro_Poblado=NTN.Id_Centro_Poblado
GO
PRINT 'VISTA CREADA V_HISMINSA'
GO
CREATE VIEW [dbo].[V_ATENDIDOS]AS
SELECT        Descripcion_Red AS RED, Descripcion_MicroRed AS MicroRed, RENAES, ESTABLECIMIENTO, Nro_Doc_Personal AS DOC_ATIENDE,PERSONAL, 
						Descripcion_Colegio AS COLEGIO, Descripcion_Profesion AS PROFESION, Descripcion_Ups AS SERVICIO, 
                         FECHA, Anio, Mes, 
                         SUM(CASE WHEN (DIA = 1 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [01_EESS], 
                         SUM(CASE WHEN (DIA = 2 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [02_EESS], 
                         SUM(CASE WHEN (DIA = 3 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [03_EESS], 
                         SUM(CASE WHEN (DIA = 4 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [04_EESS], 
                         SUM(CASE WHEN (DIA = 5 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [05_EESS], 
                         SUM(CASE WHEN (DIA = 6 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [06_EESS], 
                         SUM(CASE WHEN (DIA = 7 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [07_EESS], 
                         SUM(CASE WHEN (DIA = 8 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [08_EESS], 
                         SUM(CASE WHEN (DIA = 9 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [09_EESS], 
                         SUM(CASE WHEN (DIA = 10 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [10_EESS], 
                         SUM(CASE WHEN (DIA = 11 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [11_EESS], 
                         SUM(CASE WHEN (DIA = 12 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [12_EESS], 
                         SUM(CASE WHEN (DIA = 13 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [13_EESS], 
                         SUM(CASE WHEN (DIA = 14 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [14_EESS], 
                         SUM(CASE WHEN (DIA = 15 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [15_EESS], 
                         SUM(CASE WHEN (DIA = 16 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [16_EESS], 
                         SUM(CASE WHEN (DIA = 17 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [17_EESS], 
                         SUM(CASE WHEN (DIA = 18 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [18_EESS], 
                         SUM(CASE WHEN (DIA = 19 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [19_EESS], 
                         SUM(CASE WHEN (DIA = 20 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [20_EESS], 
                         SUM(CASE WHEN (DIA = 21 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [21_EESS], 
                         SUM(CASE WHEN (DIA = 22 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [22_EESS], 
                         SUM(CASE WHEN (DIA = 23 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [23_EESS], 
                         SUM(CASE WHEN (DIA = 24 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [24_EESS], 
                         SUM(CASE WHEN (DIA = 25 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [25_EESS], 
                         SUM(CASE WHEN (DIA = 26 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [26_EESS], 
                         SUM(CASE WHEN (DIA = 27 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [27_EESS], 
                         SUM(CASE WHEN (DIA = 28 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [28_EESS], 
                         SUM(CASE WHEN (DIA = 29 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [29_EESS], 
                         SUM(CASE WHEN (DIA = 30 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [30_EESS], 
                         SUM(CASE WHEN (DIA = 31 AND COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [31_EESS], 
                         SUM(CASE WHEN (COND_EESS IN ('N', 'R')) THEN 1 ELSE 0 END) AS [Total Atendidos EESS],
                         
                         SUM(CASE WHEN (DIA = 1 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [01_Serv], 
                         SUM(CASE WHEN (DIA = 2 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [02_Serv], 
                         SUM(CASE WHEN (DIA = 3 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [03_Serv], 
                         SUM(CASE WHEN (DIA = 4 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [04_Serv], 
                         SUM(CASE WHEN (DIA = 5 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [05_Serv], 
                         SUM(CASE WHEN (DIA = 6 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [06_Serv], 
                         SUM(CASE WHEN (DIA = 7 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [07_Serv], 
                         SUM(CASE WHEN (DIA = 8 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [08_Serv], 
                         SUM(CASE WHEN (DIA = 9 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [09_Serv], 
                         SUM(CASE WHEN (DIA = 10 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [10_Serv], 
                         SUM(CASE WHEN (DIA = 11 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [11_Serv], 
                         SUM(CASE WHEN (DIA = 12 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [12_Serv], 
                         SUM(CASE WHEN (DIA = 13 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [13_Serv], 
                         SUM(CASE WHEN (DIA = 14 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [14_Serv], 
                         SUM(CASE WHEN (DIA = 15 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [15_Serv], 
                         SUM(CASE WHEN (DIA = 16 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [16_Serv], 
                         SUM(CASE WHEN (DIA = 17 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [17_Serv], 
                         SUM(CASE WHEN (DIA = 18 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [18_Serv], 
                         SUM(CASE WHEN (DIA = 19 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [19_Serv], 
                         SUM(CASE WHEN (DIA = 20 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [20_Serv], 
                         SUM(CASE WHEN (DIA = 21 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [21_Serv], 
                         SUM(CASE WHEN (DIA = 22 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [22_Serv], 
                         SUM(CASE WHEN (DIA = 23 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [23_Serv], 
                         SUM(CASE WHEN (DIA = 24 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [24_Serv], 
                         SUM(CASE WHEN (DIA = 25 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [25_Serv], 
                         SUM(CASE WHEN (DIA = 26 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [26_Serv], 
                         SUM(CASE WHEN (DIA = 27 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [27_Serv], 
                         SUM(CASE WHEN (DIA = 28 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [28_Serv], 
                         SUM(CASE WHEN (DIA = 29 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [29_Serv], 
                         SUM(CASE WHEN (DIA = 30 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [30_Serv], 
                         SUM(CASE WHEN (DIA = 31 AND COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [31_Serv], 
                         SUM(CASE WHEN (COND_SERV IN ('N', 'R')) THEN 1 ELSE 0 END) AS [Total Atendidos Servicios]
FROM            dbo.V_HISMINSA
WHERE        (Id_Paciente IS NOT NULL) AND (Id_C = 1 AND ID_L=1)
GROUP BY Descripcion_Red, Descripcion_MicroRed, RENAES, Establecimiento, Nro_Doc_Personal, Personal, Descripcion_Colegio, 
                         Descripcion_Profesion, Descripcion_Ups, Fecha, Anio, Mes
HAVING        (SUM(CASE WHEN (Cond_Serv IN ('N', 'R')) THEN 1 ELSE 0 END) > 0)

GO
PRINT 'VISTA CREADA V_ATENDIDOS'
GO
CREATE VIEW [dbo].[V_ATENCIONES]AS
SELECT        Descripcion_Red AS RED, Descripcion_MicroRed AS MicroRed, RENAES, ESTABLECIMIENTO, Nro_Doc_Personal AS DOC_ATIENDE, 
                         PERSONAL, Descripcion_Colegio AS COLEGIO, Descripcion_Profesion AS PROFESION, Descripcion_Ups AS SERVICIO, 
                         Fecha AS FECHA, Anio, Mes, 
                         SUM(CASE WHEN (DIA = 1 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [01_EESS], 
                         SUM(CASE WHEN (DIA = 2 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [02_EESS], 
                         SUM(CASE WHEN (DIA = 3 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [03_EESS], 
                         SUM(CASE WHEN (DIA = 4 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [04_EESS], 
                         SUM(CASE WHEN (DIA = 5 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [05_EESS], 
                         SUM(CASE WHEN (DIA = 6 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [06_EESS], 
                         SUM(CASE WHEN (DIA = 7 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [07_EESS], 
                         SUM(CASE WHEN (DIA = 8 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [08_EESS], 
                         SUM(CASE WHEN (DIA = 9 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [09_EESS], 
                         SUM(CASE WHEN (DIA = 10 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [10_EESS], 
                         SUM(CASE WHEN (DIA = 11 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [11_EESS], 
                         SUM(CASE WHEN (DIA = 12 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [12_EESS], 
                         SUM(CASE WHEN (DIA = 13 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [13_EESS], 
                         SUM(CASE WHEN (DIA = 14 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [14_EESS], 
                         SUM(CASE WHEN (DIA = 15 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [15_EESS], 
                         SUM(CASE WHEN (DIA = 16 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [16_EESS], 
                         SUM(CASE WHEN (DIA = 17 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [17_EESS], 
                         SUM(CASE WHEN (DIA = 18 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [18_EESS], 
                         SUM(CASE WHEN (DIA = 19 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [19_EESS], 
                         SUM(CASE WHEN (DIA = 20 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [20_EESS], 
                         SUM(CASE WHEN (DIA = 21 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [21_EESS], 
                         SUM(CASE WHEN (DIA = 22 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [22_EESS], 
                         SUM(CASE WHEN (DIA = 23 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [23_EESS], 
                         SUM(CASE WHEN (DIA = 24 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [24_EESS], 
                         SUM(CASE WHEN (DIA = 25 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [25_EESS], 
                         SUM(CASE WHEN (DIA = 26 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [26_EESS], 
                         SUM(CASE WHEN (DIA = 27 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [27_EESS], 
                         SUM(CASE WHEN (DIA = 28 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [28_EESS], 
                         SUM(CASE WHEN (DIA = 29 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [29_EESS], 
                         SUM(CASE WHEN (DIA = 30 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [30_EESS], 
                         SUM(CASE WHEN (DIA = 31 AND COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [31_EESS], 
                         SUM(CASE WHEN (COND_EESS IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [Total Atenciones EESS],
                         
                         SUM(CASE WHEN (DIA = 1 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [01_Serv], 
                         SUM(CASE WHEN (DIA = 2 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [02_Serv], 
                         SUM(CASE WHEN (DIA = 3 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [03_Serv], 
                         SUM(CASE WHEN (DIA = 4 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [04_Serv], 
                         SUM(CASE WHEN (DIA = 5 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [05_Serv], 
                         SUM(CASE WHEN (DIA = 6 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [06_Serv], 
                         SUM(CASE WHEN (DIA = 7 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [07_Serv], 
                         SUM(CASE WHEN (DIA = 8 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [08_Serv], 
                         SUM(CASE WHEN (DIA = 9 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [09_Serv], 
                         SUM(CASE WHEN (DIA = 10 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [10_Serv], 
                         SUM(CASE WHEN (DIA = 11 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [11_Serv], 
                         SUM(CASE WHEN (DIA = 12 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [12_Serv], 
                         SUM(CASE WHEN (DIA = 13 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [13_Serv], 
                         SUM(CASE WHEN (DIA = 14 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [14_Serv], 
                         SUM(CASE WHEN (DIA = 15 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [15_Serv], 
                         SUM(CASE WHEN (DIA = 16 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [16_Serv], 
                         SUM(CASE WHEN (DIA = 17 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [17_Serv], 
                         SUM(CASE WHEN (DIA = 18 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [18_Serv], 
                         SUM(CASE WHEN (DIA = 19 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [19_Serv], 
                         SUM(CASE WHEN (DIA = 20 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [20_Serv], 
                         SUM(CASE WHEN (DIA = 21 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [21_Serv], 
                         SUM(CASE WHEN (DIA = 22 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [22_Serv], 
                         SUM(CASE WHEN (DIA = 23 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [23_Serv], 
                         SUM(CASE WHEN (DIA = 24 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [24_Serv], 
                         SUM(CASE WHEN (DIA = 25 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [25_Serv], 
                         SUM(CASE WHEN (DIA = 26 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [26_Serv], 
                         SUM(CASE WHEN (DIA = 27 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [27_Serv], 
                         SUM(CASE WHEN (DIA = 28 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [28_Serv], 
                         SUM(CASE WHEN (DIA = 29 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [29_Serv], 
                         SUM(CASE WHEN (DIA = 30 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [30_Serv], 
                         SUM(CASE WHEN (DIA = 31 AND Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [31_Serv], 
                         SUM(CASE WHEN (Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) AS [Total Atenciones Servicios]
                         
FROM            dbo.V_HISMINSA h
WHERE        (Id_Paciente IS NOT NULL) AND (Id_C = 1 AND ID_L=1)
GROUP BY Descripcion_Red, Descripcion_MicroRed, RENAES, Establecimiento, Nro_Doc_Personal, Personal, Descripcion_Colegio, 
                         Descripcion_Profesion, Descripcion_Ups, Fecha, Anio, Mes
HAVING        (SUM(CASE WHEN (Cond_Serv IN ('N', 'R', 'C')) THEN 1 ELSE 0 END) > 0)
GO
PRINT 'VISTA CREADA V_ATENCIONES'
GO

CREATE VIEW [dbo].[V_HIS_DBF]AS
SELECT        H.ANO AS ANIO, H.MES, H.DIA, H.NOM_LOTE AS LOTE, H.NUM_PAG AS PAG, H.NUM_REG AS REG, H.COD_2000 AS RENAES, ES.Nombre_Establecimiento AS ESTABLECIMIENTO, ES.Codigo_MicroRed AS COD_MIC, 
                         ES.MicroRed, H.DNI, H.FICHAFAM AS HCL, H.TIP_EDAD, H.EDAD, H.SEXO, H.DIAGNOST1 AS DIAG1, H.LABCONF1 AS LAB1, H.CODIGO1, H.DIAGNOST2 AS DIAG2, H.LABCONF2 AS LAB2, H.CODIGO2, H.DIAGNOST3 AS DIAG3, 
                         H.LABCONF3, H.CODIGO3, H.DIAGNOST4 AS DIAG4, H.LABCONF4 AS LAB4, H.CODIGO4, H.DIAGNOST5 AS DIAG5, H.LABCONF5 AS LAB5, H.CODIGO5, H.DIAGNOST6 AS DIAG6, H.LABCONF6 AS LAB6, H.CODIGO6, H.FECHA
FROM            dbo.HISA AS H INNER JOIN
                         dbo.ESTABLECIMIENTOS AS ES ON H.COD_2000 = ES.Codigo_Unico
GO
PRINT 'VISTA CREADA V_HIS_DBF'
GO
CREATE VIEW [dbo].[V_PACIENTE]AS
SELECT Pac.ID_PACIENTE, Pac.ID_TIPO_DOCUMENTO AS TIP_DOC, Pac.NUMERO_DOCUMENTO AS NRO_DOC, 
               Pac.NOMBRES_PACIENTE + ' ' + Pac.APELLIDO_PATERNO_PACIENTE + ' ' + Pac.APELLIDO_MATERNO_PACIENTE AS PACIENTE, Pac.FECHA_NACIMIENTO, 
               Pac.GENERO, Et.Descripcion_Etnia AS ETNIA, Pac.HISTORIA_CLINICA AS HCL, Pac.UBIGEO_RENIEC, Pac.DOMICILIO_RENIEC, Pac.UBIGEO_DECLARADO, 
               Pac.DOMICILIO_DECLARADO, Pais.Descripcion_Pais AS PAIS, Pac.ID_ESTABLECIMIENTO AS ID_ESTAB, Es.Codigo_Unico AS RENAES, 
               Es.Nombre_Establecimiento AS ESTABLECIMIENTO, Es.MicroRed AS MICRORED
FROM  dbo.PACIENTE AS Pac LEFT JOIN
               dbo.MAESTRO_HIS_ETNIA AS Et ON Pac.ID_ETNIA = Et.Id_Etnia LEFT OUTER JOIN
               dbo.MAESTRO_HIS_PAIS AS Pais ON Pac.ID_PAIS = Pais.Id_Pais LEFT OUTER JOIN
               dbo.ESTABLECIMIENTOS AS Es ON Pac.ID_ESTABLECIMIENTO = Es.Id_Establecimiento

GO
PRINT 'VISTA CREADA V_PACIENTE'
GO
CREATE VIEW [dbo].[VIEWHIS] AS 
SELECT
H.ID_CITA,
H.ANIO,
H.MES,
H.DIA,
H.FECHA_ATENCION AS FECHA,
H.LOTE,
H.NUM_PAG,
H.NUM_REG,
H.ID_UPS AS UPS,
ES.Codigo_Red AS COD_RED,
ES.Codigo_Disa AS COD_DISA,
ES.Codigo_MicroRed AS COD_MIC,
ES.Codigo_Unico AS RENAES,
ES.Nombre_Establecimiento AS NOM_ESTABLEC,
( CASE WHEN ( H.ID_PACIENTE LIKE '%[a-z]%' ) THEN H.ID_PACIENTE ELSE NULL END ) AS ID_PACIENTE,
PAC.ID_TIPO_DOCUMENTO AS TIP_DOC,
(CASE WHEN PAC.Id_Tipo_Documento = 1 THEN RIGHT ( replicate ( '0', 8 ) + rtrim( PAC.Numero_Documento ), 8 ) ELSE PAC.Numero_Documento END) AS NRO_DOC,
PAC.NOMBRES_PACIENTE + ' ' + PAC.APELLIDO_PATERNO_PACIENTE + ' ' + PAC.APELLIDO_MATERNO_PACIENTE AS NOMBRE_PACIENTE,
PAC.FECHA_NACIMIENTO AS FECHA_NAC,
PAC.GENERO AS SEXO,
PAC.HISTORIA_CLINICA AS HCL,
H.ID_FINANCIADOR AS FI,
H.ID_CONDICION_ESTABLECIMIENTO AS COND_EESS,
H.ID_CONDICION_SERVICIO AS COND_SERV,
H.TIPO_EDAD AS TIP_EDAD,
H.EDAD_REG AS EDAD,
H.ANIO_ACTUAL_PACIENTE AS EDAD_A,
H.MES_ACTUAL_PACIENTE AS EDAD_M,
H.DIA_ACTUAL_PACIENTE AS EDAD_D,
H.TIPO_DIAGNOSTICO AS TIP_DIAG,
H.VALOR_LAB AS LAB,
H.CODIGO_ITEM AS COD_ITEM,
H.ID_CORRELATIVO AS ID_C,
H.ID_CORRELATIVO_LAB AS ID_L,
H.PESO,
H.TALLA,
H.HEMOGLOBINA AS HB,
PAC.ID_ETNIA AS ETNIA,
H.PAC,
H.PC,
H.ID_OTRA_CONDICION AS COND,
H.FECHA_REGISTRO AS FECHA_REGISTRO,
H.ID_PAIS AS PAIS,
H.ID_TURNO AS TURNO,
RIGHT ( REPLICATE ( '0', 8 ) + RTRIM( PER.NUMERO_DOCUMENTO ), 8 ) AS DOC_ATIENDE,
PER.ID_COLEGIO AS COLEGIO,
PER.ID_PROFESION AS PROF,
RIGHT ( REPLICATE ( '0', 8 ) + RTRIM( REG.NUMERO_DOCUMENTO ), 8 ) AS DOC_REGISTRA 
FROM dbo.HIS_Nominal AS H
INNER JOIN dbo.ESTABLECIMIENTOS AS ES ON H.ID_ESTABLECIMIENTO = ES.Id_Establecimiento
LEFT JOIN dbo.PACIENTE AS PAC ON H.ID_PACIENTE = PAC.ID_PACIENTE
INNER JOIN dbo.PERSONAL AS PER ON H.ID_PERSONAL = PER.ID_PERSONAL
LEFT OUTER JOIN dbo.REGISTRADOR AS REG ON H.ID_REGISTRADOR = REG.ID_REGISTRADOR 
GO 
PRINT 'VISTA CREADA VIEWHIS' 
GO
CREATE VIEW V_DIGITACION_DIARIO AS
SELECT
Descripcion_Red [NOMBRE RED],
Descripcion_MicroRed MICRORED,
RENAES,
ESTABLECIMIENTO,
FECHA FECHA_ATENCION,
MES,
ANIO,
Nro_Doc_Registrador [DNI DIGITADOR],
REGISTRADOR [NOMBRES DIGITADOR],
--CONVERT(VARCHAR,Fecha_Registro,120) Fecha_Digitacion,
--CONVERT(VARCHAR,Fecha_Registro,108) Hora_Digitacion,
FECHA_REG FECHA_DIGITACION,
CONVERT(VARCHAR,Fecha_Registro,108) Hora_Digitacion,
--DATENAME(MM, FECHA_REGISTRO)Mes_Reg,
--DATEPART(yyyy, FECHA_REGISTRO)Anio_Reg,
Lote,
Num_Pag,
Num_Reg	
FROM V_HISMINSA
WHERE Id_C=1 AND ID_L=1
GO
PRINT 'VISTA CREADA V_DIGITACION_DIARIO'
GO
CREATE VIEW V_DIGITACION AS
SELECT
Descripcion_Red [NOMBRE RED],
Descripcion_MicroRed MICRORED,
RENAES,
ESTABLECIMIENTO,
FECHA FECHA_ATENCION,
MES,
ANIO,
FECHA_REG,
Nro_Doc_Registrador [DNI DIGITADOR],
REGISTRADOR [NOMBRES DIGITADOR],
COUNT(Id_Cita) Cantidad_Registros
FROM V_HISMINSA
WHERE Id_C=1 AND ID_L=1
GROUP BY 
Descripcion_Disa,
Descripcion_Red,
Descripcion_MicroRed,
Renaes,
Establecimiento,
FECHA,
MES,
ANIO,
FECHA_REG,
Nro_Doc_Registrador,
Registrador
GO
PRINT 'VISTA CREADA V_DIGITACION'
GO
CREATE VIEW V_REPORTE40 AS
SELECT
--Descripcion_Sector,
--Descripcion_Disa,
Descripcion_Red,
Descripcion_MicroRed,
Renaes,
Establecimiento,
Abrev_Tip_Doc_Personal,
Nro_Doc_Personal,
Personal,
Fecha_Nac_Personal,
Id_Condicion,
Descripcion_Condicion,
Prof,
Descripcion_Profesion,
Colegio,
Descripcion_Colegio,
Numero_Colegiatura,
Anio,
Mes,		
SUM(CASE WHEN (Id_Paciente IS NOT NULL AND COND_EESS IN ('N', 'R') ) THEN 1 ELSE 0 END) Atendidos_EESS_Total,				
SUM(CASE WHEN (Id_Paciente IS NOT NULL AND Cond_Serv IN ('N', 'R') ) THEN 1 ELSE 0 END) Atendidos_Servicios_Total,
SUM(CASE WHEN (Id_Paciente IS NOT NULL AND Cond_Serv IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) Atenciones_Total,
SUM(CASE WHEN (Id_Paciente IS NOT NULL AND Cond_Serv IN ('N') ) THEN 1 ELSE 0 END) Nuevo_Servicio_Total,
SUM(CASE WHEN (Id_Paciente IS NOT NULL AND Cond_Serv IN ('C') ) THEN 1 ELSE 0 END) Continuador_Servicio_Total,
SUM(CASE WHEN (Id_Paciente IS NOT NULL AND Cond_Serv IN ('R') ) THEN 1 ELSE 0 END) Reingresante_Servicio_Total,
SUM(CASE WHEN (Id_Paciente LIKE 'APP%' ) THEN 1 ELSE 0 END) APP_Total,
SUM(CASE WHEN (Id_Paciente LIKE 'AAA%' ) THEN 1 ELSE 0 END) AAA_Total

FROM V_HISMINSA
WHERE Id_C=1 AND Id_L=1
GROUP BY
Descripcion_Red,
Descripcion_MicroRed,
Renaes,
Establecimiento,
Abrev_Tip_Doc_Personal,
Nro_Doc_Personal,
Personal,
Fecha_Nac_Personal,
Id_Condicion,
Descripcion_Condicion,
Prof,
Descripcion_Profesion,
Colegio,
Descripcion_Colegio,
Numero_Colegiatura,
Anio,
Mes

GO
PRINT 'VISTA CREADA V_REPORTE40'
GO
CREATE VIEW [dbo].[V_PERSONAL]AS
SELECT 
P.ID_PERSONAL, 
P.NUMERO_DOCUMENTO Num_Doc, 
(P.NOMBRES_PERSONAL+' '+P.APELLIDO_PATERNO_PERSONAL+' '+P.APELLIDO_MATERNO_PERSONAL)as PERSONAL,
P.FECHA_NACIMIENTO FechaNac, 
Cond.Descripcion_Condicion CONDICION, 
Prof.Descripcion_Profesion PROFESION, 
Col.Descripcion_Colegio COLEGIO, 
--P.NUMERO_COLEGIATURA, 
EeSS.Codigo_Unico RENAES, 
EeSS.Nombre_Establecimiento ESTABLECIMIENTO, 
CONVERT(VARCHAR,P.FECHA_ALTA,103) FECHA_ALTA,
CONVERT(VARCHAR,P.FECHA_BAJA,105) FECHA_BAJA
FROM  dbo.PERSONAL AS P 
LEFT JOIN dbo.MAESTRO_HIS_COLEGIO AS Col ON P.ID_COLEGIO = Col.Id_Colegio 
LEFT JOIN dbo.MAESTRO_HIS_PROFESION AS Prof ON P.ID_PROFESION = Prof.Id_Profesion 
LEFT JOIN dbo.MAESTRO_HIS_CONTRATO AS Cond ON P.ID_CONDICION = Cond.Id_Condicion 
LEFT JOIN dbo.ESTABLECIMIENTOS AS EeSS ON P.ID_ESTABLECIMIENTO = EeSS.Id_Establecimiento
GO
PRINT 'VISTA CREADA V_PERSONAL'
GO
CREATE VIEW [dbo].[V_PRODUCCION]AS
SELECT
--Descripcion_Sector,
--Descripcion_Disa,
Descripcion_Red,
Descripcion_MicroRed,
Renaes,
Establecimiento,
Anio,
Mes,
Ups,
Abrev_Tip_Doc_Personal,
Nro_Doc_Personal,
Personal,
Fecha_Nac_Personal,
Id_Condicion,
Descripcion_Condicion,
Prof,
Descripcion_Profesion,
Colegio,
Descripcion_Colegio,
Numero_Colegiatura,
Fecha,
Turno,
COUNT(Id_Cita) Cantidad_Atenciones
FROM dbo.V_HISMINSA 
WHERE Id_C=1 AND Id_L=1
GROUP BY
Descripcion_Red,
Descripcion_MicroRed,
Renaes,
Establecimiento,
Anio,
Mes,
Ups,
Abrev_Tip_Doc_Personal,
Nro_Doc_Personal,
Personal,
Fecha_Nac_Personal,
Id_Condicion,
Descripcion_Condicion,
Prof,
Descripcion_Profesion,
Colegio,
Descripcion_Colegio,
Numero_Colegiatura,
Fecha,
Turno
HAVING (COUNT(Id_Cita)>0)
GO
PRINT 'VISTA CREADA V_PRODUCCION'
GO

-- PROCEDIMIENTOS ALMACENADOS
CREATE PROCEDURE Sp_Procedimientos  

@fini char(10),
@ffin char(10),
@filtro char(2)

with encryption
AS    
    SET NOCOUNT ON;  
      SELECT DESCRIPCION_RED RED
,CODIGO_MICRORED Cod_Mr
,DESCRIPCION_MICRORED MicroRed
,Renaes
,Establecimiento
,Ubigeo_EESS
,Departamento_EESS
,Provincia_EESS
,Distrito_EESS
,Fecha
,Grupo_Edad
,Paciente
,SEXO
,Etnia
,DESCRIPCION_UPS Servicio
,Personal
,Turno
,Fg_Tipo Tipo
,Cod_Item
--,ID_C
--,ID_L
,DIAGNOSTICO
,Anio
,Mes 
    FROM V_HISMINSA 
    WHERE Fg_Tipo=@filtro AND FECHA BETWEEN @fini AND @ffin AND ID_C=1 and ID_L=1; 
GO
PRINT 'STORED PROCEDURE CREADO Sp_Procedimientos'
GO
CREATE PROCEDURE SP_Anemia  
@fini char(10),
@ffin char(10)

with encryption
AS    
    SET NOCOUNT ON;  
SELECT
H.FECHA_ATENCION AS [FECHA ATENCION],
H.LOTE,
H.NUM_PAG,
H.NUM_REG,
ES.MicroRed AS[MICRO RED],
ES.Codigo_Unico AS RENAES,
ES.Nombre_Establecimiento AS NOM_ESTABLEC,
(case when PAC.Id_Tipo_Documento = 1 then right(replicate('0', 8) + rtrim(PAC.Numero_Documento), 8)else PAC.Numero_Documento end)AS DNI,
PAC.Nombres_Paciente + ' ' + PAC.Apellido_Paterno_Paciente + ' ' + PAC.Apellido_Materno_Paciente AS NOMBRE_PACIENTE,
PAC.DOMICILIO_DECLARADO,
PAC.Fecha_Nacimiento AS FECHA_NAC,
PAC.Genero AS SEXO,
PAC.Historia_Clinica AS HCL,
H.TIPO_EDAD AS TIP_EDAD,
H.ANIO_ACTUAL_PACIENTE AS AÑOS,
H.MES_ACTUAL_PACIENTE AS MESES,
H.DIA_ACTUAL_PACIENTE AS DIAS,
H.TIPO_DIAGNOSTICO AS TIP_DIAG,
H.VALOR_LAB AS LAB,
H.CODIGO_ITEM AS CODIGO,
H.PESO,
H.TALLA,
H.HEMOGLOBINA AS[VALOR HB],
(right(replicate('0', 8) + rtrim(PER.Numero_Documento), 8))AS DOC_ATIENDE,
(right(replicate('0', 8) + rtrim(REG.Numero_Documento), 8))AS DOC_REGISTRA,
H.ANIO,
H.MES
FROM
dbo.HIS_Nominal AS H
INNER JOIN dbo.ESTABLECIMIENTOS AS ES ON H.ID_ESTABLECIMIENTO = ES.Id_Establecimiento
LEFT JOIN dbo.PACIENTE AS PAC ON H.ID_PACIENTE = PAC.Id_Paciente
INNER JOIN dbo.PERSONAL AS PER ON H.ID_PERSONAL = PER.Id_Personal
LEFT JOIN dbo.REGISTRADOR AS REG ON H.ID_REGISTRADOR = REG.Id_Registrador
WHERE H.CODIGO_ITEM IN('D500','D508','D509','D649','O990')AND H.FECHA_ATENCION BETWEEN @fini AND @ffin
GO
PRINT 'STORED PROCEDURE CREADO SP_Anemia'
GO
CREATE PROCEDURE Sp_HIS  
with encryption
AS    
    SET NOCOUNT ON;  
SELECT
H.ID_CITA,
H.ANIO,
H.MES,
H.DIA,
H.FECHA_ATENCION AS FECHA,
H.LOTE,
H.NUM_PAG,
H.NUM_REG,
H.ID_UPS AS UPS,
ES.Codigo_Red AS COD_RED,
ES.Codigo_Disa AS COD_DISA,
ES.Codigo_MicroRed AS COD_MIC,
ES.Codigo_Unico AS RENAES,
ES.Nombre_Establecimiento AS NOM_ESTABLEC,
( CASE WHEN ( H.ID_PACIENTE LIKE '%[a-z]%' ) THEN H.ID_PACIENTE ELSE NULL END ) AS ID_PACIENTE,
PAC.ID_TIPO_DOCUMENTO AS TIP_DOC,
(CASE WHEN PAC.Id_Tipo_Documento = 1 THEN RIGHT ( replicate ( '0', 8 ) + rtrim( PAC.Numero_Documento ), 8 ) ELSE PAC.Numero_Documento END) AS NRO_DOC,
PAC.NOMBRES_PACIENTE + ' ' + PAC.APELLIDO_PATERNO_PACIENTE + ' ' + PAC.APELLIDO_MATERNO_PACIENTE AS NOMBRE_PACIENTE,
PAC.FECHA_NACIMIENTO AS FECHA_NAC,
PAC.GENERO AS SEXO,
PAC.HISTORIA_CLINICA AS HCL,
H.ID_FINANCIADOR AS FI,
H.ID_CONDICION_ESTABLECIMIENTO AS COND_EESS,
H.ID_CONDICION_SERVICIO AS COND_SERV,
H.TIPO_EDAD AS TIP_EDAD,
H.EDAD_REG AS EDAD,
H.ANIO_ACTUAL_PACIENTE AS EDAD_A,
H.MES_ACTUAL_PACIENTE AS EDAD_M,
H.DIA_ACTUAL_PACIENTE AS EDAD_D,
H.TIPO_DIAGNOSTICO AS TIP_DIAG,
H.VALOR_LAB AS LAB,
H.CODIGO_ITEM AS COD_ITEM,
H.ID_CORRELATIVO AS ID_C,
H.ID_CORRELATIVO_LAB AS ID_L,
H.PESO,
H.TALLA,
H.HEMOGLOBINA AS HB,
PAC.ID_ETNIA AS ETNIA,
H.PAC,
H.PC,
H.ID_OTRA_CONDICION AS COND,
H.FECHA_REGISTRO AS FECHA_REGISTRO,
H.ID_PAIS AS PAIS,
H.ID_TURNO AS TURNO,
RIGHT ( REPLICATE ( '0', 8 ) + RTRIM( PER.NUMERO_DOCUMENTO ), 8 ) AS DOC_ATIENDE,
PER.ID_COLEGIO AS COLEGIO,
PER.ID_PROFESION AS PROF,
RIGHT ( REPLICATE ( '0', 8 ) + RTRIM( REG.NUMERO_DOCUMENTO ), 8 ) AS DOC_REGISTRA 
FROM dbo.HIS_Nominal AS H
INNER JOIN dbo.ESTABLECIMIENTOS AS ES ON H.ID_ESTABLECIMIENTO = ES.Id_Establecimiento
LEFT JOIN dbo.PACIENTE AS PAC ON H.ID_PACIENTE = PAC.ID_PACIENTE
INNER JOIN dbo.PERSONAL AS PER ON H.ID_PERSONAL = PER.ID_PERSONAL
LEFT JOIN dbo.REGISTRADOR AS REG ON H.ID_REGISTRADOR = REG.ID_REGISTRADOR
GO
PRINT 'STORED PROCEDURE CREADO Sp_HIS'
GO
CREATE PROCEDURE Sp_HisMinsa
with encryption
AS    
    SET NOCOUNT ON; 
SELECT
NTN.ID_CITA,
NTN.ANIO,
NTN.MES,
NTN.DIA,
NTN.Fecha_Atencion AS FECHA,
--CONVERT ( CHAR ( 6 ), NTN.FECHA_ATENCION, 112 ) AS Anio_Mes,
NTN.LOTE,
NTN.NUM_PAG,
NTN.NUM_REG,
NTN.Id_Ups AS UPS,
MHU.DESCRIPCION_UPS,
--ESTABLECIMIENTO
NTN.ID_ESTABLECIMIENTO,
MHES.CODIGO_SECTOR,
MHES.DESCRIPCION_SECTOR,
MHES.CODIGO_DISA,
MHES.Disa DESCRIPCION_DISA,
MHES.CODIGO_RED,
MHES.Red DESCRIPCION_RED,
MHES.CODIGO_MICRORED,
MHES.MicroRed DESCRIPCION_MICRORED,
MHES.Codigo_Unico AS RENAES,
MHES.Nombre_Establecimiento AS ESTABLECIMIENTO,
MHES.Ubigueo_Establecimiento AS UBIGEO_EESS,
MHES.Departamento DEPARTAMENTO_EESS,
MHES.Provincia PROVINCIA_EESS,
MHES.Distrito DISTRITO_EESS,
NTN.ID_PACIENTE,
HTDPA.Id_Tipo_Documento Tip_Doc_Paciente,
HTDPA.Abrev_Tipo_Doc Abrev_Tip_Doc_Paciente,
MPA.Numero_Documento NRO_DOC_PACIENTE,
MPA.NOMBRES_PACIENTE + ' ' + MPA.APELLIDO_PATERNO_PACIENTE + ' ' + MPA.APELLIDO_MATERNO_PACIENTE AS PACIENTE,
MPA.FECHA_NACIMIENTO AS FECHA_NAC_PACIENTE,
MPA.GENERO AS SEXO,
MPA.Historia_Clinica HCL,
CASE WHEN (NTN.Id_Paciente LIKE 'A%') THEN NTN.Id_Paciente ELSE MPA.Ficha_Familiar END FICHA_FAMILIAR,
MHE.Id_Etnia ETNIA,
MHE.Descripcion_Etnia DESCRIPCION_ETNIA,
MHF.Id_Financiador FI,
MHF.Descripcion_Financiador FINANCIADOR,
MHP.Id_Pais PAIS,
MHP.Descripcion_Pais DESCRIPCION_PAIS,
NTN.Id_Condicion_Establecimiento  COND_EESS,
NTN.Id_Condicion_Servicio COND_SERV,
NTN.Edad_Reg EDAD,
NTN.Tipo_Edad TIP_EDAD,
NTN.Dia_Actual_Paciente EDAD_D_FAT,
NTN.Mes_Actual_Paciente EDAD_M_FAT,
NTN.Anio_Actual_Paciente EDAD_A_FAT,
--DATEDIFF(DAY, MPA.Fecha_Nacimiento, NTN.Fecha_Atencion) Edad_Dias_Paciente_FechaAtencion, 
--DATEDIFF(MONTH, MPA.Fecha_Nacimiento, NTN.Fecha_Atencion) Edad_Meses_Paciente_FechaAtencion, 
--DATEDIFF(YEAR, MPA.Fecha_Nacimiento, NTN.Fecha_Atencion) Edad_Anios_Paciente_FechaAtencion,
DATEDIFF(DAY, MPA.Fecha_Nacimiento, GETDATE()) EDAD_D_FAC, 
DATEDIFF(MONTH, MPA.Fecha_Nacimiento, GETDATE()) EDAD_M_FAC, 
DATEDIFF(YEAR, MPA.Fecha_Nacimiento, GETDATE()) EDAD_A_FAC,
CASE 	WHEN (NTN.Tipo_Edad='D' AND NTN.Edad_Reg BETWEEN 1 AND 29 ) THEN '01 a 29 días'
		WHEN (NTN.Tipo_Edad='M' AND NTN.Edad_Reg BETWEEN 1 AND 11 ) THEN '01 a 11 meses'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 1 AND 4 ) THEN '01 a 04 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 5 AND 11 ) THEN '05 a 11 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 12 AND 17 ) THEN '12 a 17 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 18 AND 29 ) THEN '18 a 29 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 30 AND 59 ) THEN '30 a 59 años'
		WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg > 59) THEN '60 años a más'
END GRUPO_EDAD,
NTN.Id_Turno TURNO,
MCC.Fg_Tipo,
NTN.Codigo_Item COD_ITEM,
MCC.Diagnostico DIAGNOSTICO,
NTN.Tipo_Diagnostico TIP_DIAG,
NTN.Valor_Lab LAB,
NTN.Id_Correlativo ID_C,
NTN.Id_Correlativo_Lab ID_L,
NTN.PESO,
NTN.TALLA,
NTN.Hemoglobina HB,
NTN.PAC,
NTN.PC,
NTN.Id_Otra_Condicion,
NTN.ID_CENTRO_POBLADO,
MHCP.DESCRIPCION_CENTRO_POBLADO,
MHCP.Id_Codigo_Centro_Poblado CODIGO_CP,
MHCP.Id_Ubigueo UBIGUEO_CP,
MHCP.ALTITUD,
NTN.FECHA_ULTIMA_REGLA,
NTN.FECHA_SOLICITUD_HB,
NTN.FECHA_RESULTADO_HB,
NTN.FECHA_REGISTRO,
CONVERT ( date, NTN.FECHA_REGISTRO) AS FECHA_REG,
NTN.FECHA_MODIFICACION,
NTN.ID_PERSONAL,
HTDPE.Id_Tipo_Documento Tip_Doc_Personal,
HTDPE.Abrev_Tipo_Doc Abrev_Tip_Doc_Personal,
MP.NUMERO_DOCUMENTO AS NRO_DOC_PERSONAL,
MP.NOMBRES_PERSONAL + ' ' + MP.APELLIDO_PATERNO_PERSONAL + ' ' + MP.APELLIDO_MATERNO_PERSONAL AS PERSONAL,
MP.FECHA_NACIMIENTO AS FECHA_NAC_PERSONAL,
MHCC.ID_CONDICION,
MHCC.DESCRIPCION_CONDICION,
MHPR.Id_Profesion PROF,
MHPR.DESCRIPCION_PROFESION ,
MHC.Id_Colegio COLEGIO,
MHC.DESCRIPCION_COLEGIO ,
MP.NUMERO_COLEGIATURA,
NTN.ID_REGISTRADOR,
HTDRE.Id_Tipo_Documento Tip_Doc_Registrador,
HTDRE.Abrev_Tipo_Doc Abrev_Tip_Doc_Registrador,
MR.NUMERO_DOCUMENTO AS NRO_DOC_REGISTRADOR,
MR.NOMBRES_REGISTRADOR + ' ' + MR.APELLIDO_PATERNO_REGISTRADOR + ' ' + MR.APELLIDO_MATERNO_REGISTRADOR AS REGISTRADOR,
MR.FECHA_NACIMIENTO AS FECHA_NAC_REGISTRADOR 

FROM HIS_Nominal NTN
LEFT JOIN PERSONAL MP ON MP.Id_Personal=NTN.Id_Personal
LEFT JOIN PACIENTE MPA ON MPA.Id_Paciente=NTN.Id_Paciente
LEFT JOIN REGISTRADOR MR ON MR.Id_Registrador=NTN.Id_Registrador
LEFT JOIN CIE_CPMS MCC ON MCC.Codigo=NTN.Codigo_Item
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDPE ON HTDPE.Id_Tipo_Documento=MP.Id_Tipo_Documento
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDPA ON HTDPA.Id_Tipo_Documento=MPA.Id_Tipo_Documento
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDRE ON HTDRE.Id_Tipo_Documento=MR.Id_Tipo_Documento
LEFT JOIN MAESTRO_HIS_PAIS MHP ON MHP.Id_Pais=MPA.Id_Pais
LEFT JOIN MAESTRO_HIS_FINANCIADOR MHF ON MHF.Id_Financiador=NTN.Id_Financiador
LEFT JOIN MAESTRO_HIS_ETNIA MHE ON MHE.Id_Etnia=MPA.Id_Etnia
LEFT JOIN MAESTRO_HIS_COLEGIO MHC ON MHC.Id_Colegio=MP.Id_Colegio
LEFT JOIN MAESTRO_HIS_PROFESION MHPR ON MHPR.Id_Profesion=MP.Id_Profesion
LEFT JOIN MAESTRO_HIS_UPS MHU ON MHU.Id_Ups=NTN.Id_Ups
LEFT JOIN ESTABLECIMIENTOS MHES ON MHES.Id_Establecimiento=NTN.Id_Establecimiento
LEFT JOIN MAESTRO_HIS_CONTRATO MHCC ON MHCC.Id_Condicion=MP.Id_Condicion
LEFT JOIN MAESTRO_HIS_CP MHCP ON MHCP.Id_Centro_Poblado=NTN.Id_Centro_Poblado
GO
PRINT 'STORED PROCEDURE CREADO Sp_HisMinsa'
GO
CREATE PROCEDURE Sp_Morbilidad 
@fini char(10),
@ffin char(10)
with encryption
AS    
    SET NOCOUNT ON;
SELECT
B.Descripcion_Red RED,
B.Codigo_MicroRed Cod_Mr,
B.Descripcion_MicroRed MicroRed,
B.Renaes,
B.Establecimiento,
B.Ubigeo_EESS,
B.Departamento_EESS,
B.Provincia_EESS,
B.Distrito_EESS,
B.FECHA Fecha_Atencion,
B.Grupo_Edad,
B.SEXO,
B.Descripcion_Etnia Etnia,
B.Descripcion_Ups Servicio,
B.Personal,
B.Turno,
B.Cod_Item,
B.DIAGNOSTICO,
B.Anio,
B.Mes,
COUNT ( * ) Casos 
FROM
	(
	SELECT
		A.Descripcion_Red,
		A.Codigo_MicroRed,
		A.Descripcion_MicroRed,
		A.RENAES,
		A.Establecimiento,
		A.Ubigeo_EESS,
		A.Departamento_EESS,
		A.Provincia_EESS,
		A.Distrito_EESS,
		A.Fecha,
		A.Grupo_Edad,
		A.SEXO,
		A.Descripcion_Etnia,
		A.Descripcion_Ups,
		A.Personal,
		A.Turno,
		A.Cod_Item,
		A.DIAGNOSTICO,
		A.ANIO,
		A.MES,
		ROW_NUMBER ( ) OVER ( PARTITION BY A.Id_Cita, A.Cod_Item ORDER BY A.Id_Cita, A.Cod_Item, A.Id_C ) Num 
	FROM
		V_HISMINSA A 
	WHERE
		A.Fg_Tipo NOT IN ( 'CP', 'EX', 'PL' ) 
		AND A.Tip_Diag= 'D' 
		AND NOT SUBSTRING ( A.Cod_Item, 1, 1 ) IN ( 'C','U', 'V', 'W', 'X', 'Y', 'Z' ) 
		AND NOT SUBSTRING ( A.Cod_Item, 1, 3 ) IN ( 'O80', 'O81', 'O82', 'O83', 'O84', 'O85', 'O86', 'O87', 'O88', 'O89' ) 
		AND A.Cod_Item NOT IN ( SELECT Cod_Item FROM V_HISMINSA WHERE Cod_Item BETWEEN 'D000' AND 'D489' ) 
		AND A.Cod_Item<> '9999' 
		AND A.SEXO IS NOT NULL 
		AND A.Grupo_Edad IS NOT NULL 
	) B 
WHERE
	B.Num= 1 AND (B.FECHA BETWEEN @fini AND @ffin)
GROUP BY
	B.Descripcion_Red,
	B.Codigo_MicroRed,
	B.Descripcion_MicroRed,
	B.RENAES,
	B.Establecimiento,
	B.Ubigeo_EESS,
	B.Departamento_EESS,
	B.Provincia_EESS,
	B.Distrito_EESS,
	B.Fecha,
	B.Grupo_Edad,
	B.SEXO,
	B.Descripcion_Etnia,
	B.Descripcion_Ups,
	B.Personal,
	B.Turno,
	B.Cod_Item,
	B.DIAGNOSTICO,
	B.Anio,
	B.Mes 
GO
PRINT 'STORED PROCEDURE CREADO Sp_Morbilidad'
GO
CREATE PROCEDURE [dbo].[editCompFED]
@p_id int,
@indicador nvarchar(50),
@descripcion nvarchar(200),
@consulta nvarchar(MAX)
with encryption
AS
BEGIN
update  FED	
	set 
	indicador=@indicador, 
	descripcion=@descripcion, 
	consulta=@consulta
	
	where id_Indicador=@p_id; 
END
GO
PRINT 'STORED PROCEDURE CREADO editCompFED'
GO
create PROCEDURE [dbo].[InsertCompFED]
@p_id int,
@indicador nvarchar(50),
@descripcion nvarchar(200),
@consulta nvarchar(MAX)
with encryption
AS
BEGIN
insert into  FED	
	values(@p_id,@indicador,@descripcion,@consulta)
	--values(@p_id,EncryptByPassPhrase('ws0710*',@indicador),@descripcion,@consulta)

END
GO
PRINT 'STORED PROCEDURE CREADO InsertCompFED'
GO
CREATE PROCEDURE [dbo].[Sp_Eqhali]  
@fini char(10),
@ffin char(10),
@filtro char(3)
with encryption
AS    
    SET NOCOUNT ON;  
      SELECT DESCRIPCION_RED RED
		,CODIGO_MICRORED Cod_Mr
		,DESCRIPCION_MICRORED MicroRed
		,Renaes
		,Establecimiento
		--,Ubigeo_EESS
		--,Departamento_EESS
		--,Provincia_EESS
		--,Distrito_EESS
		,LOTE
		,NUM_PAG
		,Fecha
		,Grupo_Edad
		,Paciente
		,SEXO
		,Etnia
		,DESCRIPCION_UPS Servicio
		,Personal
		,Turno
		,Fg_Tipo Tipo
		,Cod_Item
		,DIAGNOSTICO 
    FROM V_HISMINSA 
    WHERE Lote=@filtro AND FECHA BETWEEN @fini AND @ffin AND ID_C=1 and ID_L=1; 
GO
PRINT 'STORED PROCEDURE CREADO Sp_Eqhali'
GO

