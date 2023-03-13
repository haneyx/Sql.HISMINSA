USE [BDHIS_MINSA]
--========================================================================--
--==	1. RENOMBRAR LOS ARCHIVOS DESCARGADOS A:						==--
--==		- MAESTRO_REGISTRADOR										==--
--==		- MAESTRO_PERSONAL											==--
--==		- MAESTRO_PACIENTE											==--
--==		- NOMINAL_TRAMA_NUEVO_SECTOR_ANIO_MES, EJEMPLOS:			==--
--==		- NOMINAL_TRAMA_NUEVO_GENERAL_2020_1						==--
--==		- NOMINAL_TRAMA_NUEVO_EJERCITO_2020_1						==--
--==			EJERCITO	ESSALUD		FAP								==--
--==			GENERAL		GOBLOCAL	GOBPROVI						==--
--==			INPE		MIXTO		NAVAL							==--
--==			OTRO		PNP			PRIVADO							==--
--==	2. CAMBIAR AL NOMBRE DE LA BASE DE DATOS POR EL DE USTEDES		==--
--==	3. SELECCIONAR CON CODEPAGE O SIN CODEPAGE						==--
--==																	==--
--==																	==--
--========================================================================--

-- ====================================================================
-- Creador			:	Martin Juan Gerardo Jaramillo Morales
-- Apoyo			:	
-- Fecha Creación	:	20200618
-- Descripcion		:	Elimina todas las tablas para que no existan errores al momento de crearlas.
-- ====================================================================
GO
PRINT '=================>>>>>>>>> INICIO DE PROCESO HISMINSA_LOCAL_003_SCRIPT_IMPORTAR_ARCHIVOS_PLANOS <<<<<<<<<================='
GO
IF OBJECT_ID('[dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO_TMP]', 'U') IS NOT NULL
BEGIN
	DROP TABLE TBM_ANIOS_MES_ARCHIVO_PLANO_TMP
	PRINT 'SE ELIMINO LA TABLA TBM_ANIOS_MES_ARCHIVO_PLANO_TMP'
    PRINT '=================>>>>>>>>> <<<<<<<<<================='	
END
GO
IF OBJECT_ID('[dbo].[MAESTRO_REGISTRADOR]', 'U') IS NOT NULL
BEGIN
	DROP TABLE MAESTRO_REGISTRADOR
	PRINT 'SE ELIMINO LA TABLA MAESTRO_REGISTRADOR'
    PRINT '=================>>>>>>>>> <<<<<<<<<================='	
END
GO
IF OBJECT_ID('[dbo].[MAESTRO_PERSONAL]', 'U') IS NOT NULL
BEGIN
	DROP TABLE MAESTRO_PERSONAL
	PRINT 'SE ELIMINO LA TABLA MAESTRO_PERSONAL'
    PRINT '=================>>>>>>>>> <<<<<<<<<================='	
END  
GO
IF OBJECT_ID('[dbo].[MAESTRO_PACIENTE]', 'U') IS NOT NULL
BEGIN
	DROP TABLE MAESTRO_PACIENTE
	PRINT 'SE ELIMINO LA TABLA MAESTRO_PACIENTE'
    PRINT '=================>>>>>>>>> <<<<<<<<<================='		
END
GO
IF OBJECT_ID('[dbo].[NOMINAL_TRAMA_NUEVO]', 'U') IS NOT NULL
BEGIN
	DROP TABLE NOMINAL_TRAMA_NUEVO
	PRINT 'SE ELIMINO LA TABLA NOMINAL_TRAMA_NUEVO'
    PRINT '=================>>>>>>>>> <<<<<<<<<================='			
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
CREATE TABLE TBM_ANIOS_MES_ARCHIVO_PLANO_TMP(
I_ID INT IDENTITY,
V_SECTOR VARCHAR(8),
I_ANNIO INT,
I_MES INT,
I_FG_ESTADO INT)
GO
PRINT 'SE CREO LA TABLA TBM_ANIOS_MES_ARCHIVO_PLANO_TMP'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON	
CREATE TABLE MAESTRO_REGISTRADOR(
Id_Registrador VARCHAR(50),
Id_Tipo_Documento_Registrador INT,
Numero_Documento_Registrador VARCHAR(15),
Apellido_Paterno_Registrador VARCHAR(50),
Apellido_Materno_Registrador VARCHAR(50),
Nombres_Registrador VARCHAR(150),
Fecha_Nacimiento_Registrador DATE
)
GO
PRINT 'SE CREO LA TABLA MAESTRO_REGISTRADOR'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
CREATE TABLE MAESTRO_PERSONAL(
Id_Personal VARCHAR(50),
Id_Tipo_Documento_Personal INT,
Numero_Documento_Personal VARCHAR(15),
Apellido_Paterno_Personal VARCHAR(50),
Apellido_Materno_Personal VARCHAR(50),
Nombres_Personal VARCHAR(150),
Fecha_Nacimiento_Personal DATE,
Id_Condicion VARCHAR(2),
Id_Profesion VARCHAR(2),
Id_Colegio VARCHAR(2),
Numero_Colegiatura VARCHAR(20),
Id_Establecimiento INT,
Fecha_Alta DATETIME,
Fecha_Baja DATETIME
)
GO
PRINT 'SE CREO LA TABLA MAESTRO_PERSONAL'
GO
CREATE TABLE MAESTRO_PACIENTE(
Id_Paciente VARCHAR(50),
Id_Tipo_Documento_Paciente INT,
Numero_Documento_Paciente VARCHAR(15),
Apellido_Paterno_Paciente VARCHAR(50),
Apellido_Materno_Paciente VARCHAR(50),
Nombres_Paciente VARCHAR (150),
Fecha_Nacimiento_Paciente DATE,
Id_Genero VARCHAR(1),
Id_Etnia VARCHAR(2),
Historia_Clinica VARCHAR(15),
Ficha_Familiar VARCHAR(15),
Ubigeo_Nacimiento VARCHAR(6),
Ubigeo_Reniec VARCHAR(6),
Domicilio_Reniec VARCHAR(250),
Ubigeo_Declarado VARCHAR(6),
Domicilio_Declarado VARCHAR(250),
Referencia_Domicilio VARCHAR(500),
Id_Pais VARCHAR(3),
Id_Establecimiento INT,
Fecha_Alta DATETIME,
Fecha_Modificacion DATETIME
)
GO
PRINT 'SE CREO LA TABLA MAESTRO_PACIENTE'
GO
CREATE TABLE NOMINAL_TRAMA_NUEVO(
Id_Cita VARCHAR(50),
Anio VARCHAR(4),
Mes VARCHAR(2),
Dia VARCHAR(2),
Fecha_Atencion DATE,
Lote VARCHAR(3),
Num_Pag INT,
Num_Reg INT,
Id_Ups VARCHAR(6),
Id_Establecimiento INT,
Id_Paciente VARCHAR(50),
Id_Personal VARCHAR(50),
Id_Registrador VARCHAR(50),
Id_Financiador VARCHAR(2),
Id_Condicion_Establecimiento VARCHAR(1),
Id_Condicion_Servicio VARCHAR(1),
Edad_Reg INT,
Tipo_Edad VARCHAR(1),
Anio_Actual_Paciente INT,
Mes_Actual_Paciente INT,
Dia_Actual_Paciente INT,
Id_Turno VARCHAR(1),
Codigo_Item VARCHAR (15),
Tipo_Diagnostico VARCHAR(1),
Valor_Lab VARCHAR(3),
Id_Correlativo_Item INT,
Id_Correlativo_Lab INT,
Peso DECIMAL(10,3),
Talla DECIMAL(10,2),
Hemoglobina DECIMAL(6,2),
Perimetro_Abdominal DECIMAL(10,2),
Perimetro_Cefalico DECIMAL(10,2),
Id_Otra_Condicion INT,
Id_Centro_Poblado VARCHAR(10),
Fecha_Ultima_Regla DATE,
Fecha_Solicitud_Hb DATE,
Fecha_Resultado_Hb DATE,
Fecha_Registro DATETIME,
Fecha_Modificacion DATETIME,
Id_Pais VARCHAR(3)
)
GO
PRINT 'SE CREO LA TABLA NOMINAL_TRAMA_NUEVO'
GO
-- SI SE TIENE PROBLEMAS CON EL CODEPAGE = '65001' DEBE QUITARLO
DECLARE @NombreRuta VARCHAR(250), 
		@NombreRutaArchivoRegistrador VARCHAR(250), 
		@NombreRutaArchivoPersonal VARCHAR(250), 
		@NombreRutaArchivoPaciente VARCHAR(250), 
		@NombreRutaArchivoPlano VARCHAR(250), 
		@StrExe NVARCHAR(MAX),
		@Existe INT,
		@Sector VARCHAR(8),
		@AnnioArchivo VARCHAR(4),
		@MesArchivo VARCHAR(2),
		@InicioNombreArchivo INT,
		@FinNombreArchivo INT,
		@Codepage INT

--- Agregar la condicion codepage permite que las letras ñ o tildes se puedan ver de manera correcta
--- Por default esta en 0(CERO), si deseas ver de manera correcta @Codepage 1(UNO)
SET @Codepage=0
--==============================================================================================

--PARA QUE NINGUN AÑO SE PUEDA PROCESAR
--UPDATE TBM_ANIOS_MES_ARCHIVO_PLANO SET I_FG_ESTADO=0

--PARA QUE TODOS LOS AÑOS SE PUEDAN PROCESAR
--UPDATE TBM_ANIOS_MES_ARCHIVO_PLANO SET I_FG_ESTADO=1

--PARA QUE SOLO UN AÑO SE PUEDA PROCESAR
--UPDATE TBM_ANIOS_MES_ARCHIVO_PLANO SET I_FG_ESTADO=1 WHERE I_ANNIO=2020

--==============================================================================================



PRINT '<===================INICIO DE IMPORTACION===================>'

SET @NombreRuta = 'C:\HISMINSA\ArchivosPlanosMaestros'
SET @NombreRutaArchivoRegistrador = @NombreRuta + '\MAESTRO_REGISTRADOR.csv'
SET @NombreRutaArchivoPersonal = @NombreRuta + '\MAESTRO_PERSONAL.csv'
SET @NombreRutaArchivoPaciente = @NombreRuta + '\MAESTRO_PACIENTE.csv'



-- INSERT MAESTRO_REGISTRADOR
SET @Existe = 0
EXEC Master.dbo.xp_fileexist @NombreRutaArchivoRegistrador , @Existe OUT
IF @Existe = 1
BEGIN
	SET @StrExe = 	' BULK INSERT MAESTRO_REGISTRADOR ' +
					' FROM ''' + @NombreRutaArchivoRegistrador + ''''
	IF(@Codepage=1)
	BEGIN
		SET @StrExe = @StrExe + ' WITH (CODEPAGE = ''65001'', FIRSTROW =2, FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'', TABLOCK)'
	END
	ELSE
	BEGIN
		SET @StrExe = @StrExe + ' WITH (FIRSTROW =2, FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'', TABLOCK)'
	END
	
	EXEC SP_EXECUTESQL @StrExe
	PRINT 'EXISTE EL ARCHIVO ' + @NombreRutaArchivoRegistrador
END
ELSE
BEGIN
	PRINT 'NO EXISTE EL ARCHIVO ' + @NombreRutaArchivoRegistrador
END

-- INSERT MAESTRO_PERSONAL
SET @Existe = 0
EXEC Master.dbo.xp_fileexist @NombreRutaArchivoPersonal , @Existe OUT
IF @Existe = 1
BEGIN
	SET @StrExe = 	' BULK INSERT MAESTRO_PERSONAL ' +
					' FROM ''' + @NombreRutaArchivoPersonal + ''''
	
	IF(@Codepage=1)
	BEGIN
		SET @StrExe = @StrExe + ' WITH (CODEPAGE = ''65001'', FIRSTROW =2, FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'', TABLOCK)'
	END
	ELSE
	BEGIN
		SET @StrExe = @StrExe + ' WITH (FIRSTROW =2, FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'', TABLOCK)'
	END
		
	EXEC SP_EXECUTESQL @StrExe
	PRINT 'EXISTE EL ARCHIVO ' + @NombreRutaArchivoPersonal
END
ELSE
BEGIN
	PRINT 'NO EXISTE EL ARCHIVO ' + @NombreRutaArchivoPersonal
END

-- INSERT MAESTRO_PACIENTE
SET @Existe = 0
EXEC Master.dbo.xp_fileexist @NombreRutaArchivoPaciente , @Existe OUT
IF @Existe = 1
BEGIN
	SET @StrExe = 	' BULK INSERT MAESTRO_PACIENTE ' +
					' FROM ''' + @NombreRutaArchivoPaciente + ''''
	
	IF(@Codepage=1)
	BEGIN
		SET @StrExe = @StrExe + ' WITH (CODEPAGE = ''65001'', FIRSTROW =2, FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'', TABLOCK)'
	END
	ELSE
	BEGIN
		SET @StrExe = @StrExe + ' WITH (FIRSTROW =2, FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'', TABLOCK)'
	END
		
	EXEC SP_EXECUTESQL @StrExe
	PRINT 'EXISTE EL ARCHIVO ' + @NombreRutaArchivoPaciente
END
ELSE
BEGIN
	PRINT 'NO EXISTE EL ARCHIVO ' + @NombreRutaArchivoPaciente
END

-- INSERT NOMINAL_TRAMA_NUEVO
INSERT INTO TBM_ANIOS_MES_ARCHIVO_PLANO_TMP (V_SECTOR, I_ANNIO, I_MES, I_FG_ESTADO)
SELECT V_SECTOR, I_ANNIO, I_MES, I_FG_ESTADO FROM TBM_ANIOS_MES_ARCHIVO_PLANO WHERE I_FG_ESTADO=1

SELECT @InicioNombreArchivo=MIN(I_ID), @FinNombreArchivo=MAX(I_ID) FROM TBM_ANIOS_MES_ARCHIVO_PLANO_TMP

WHILE(@InicioNombreArchivo<=@FinNombreArchivo)
BEGIN
	SELECT @AnnioArchivo=I_ANNIO, @MesArchivo=I_MES, @Sector=V_SECTOR FROM TBM_ANIOS_MES_ARCHIVO_PLANO_TMP WHERE I_ID=@InicioNombreArchivo

	SET @NombreRutaArchivoPlano = @NombreRuta + '\NOMINAL_TRAMA_NUEVO_' + @Sector + '_' + @AnnioArchivo + '_' + @MesArchivo + '.csv'

	SET @Existe = 0
	EXEC Master.dbo.xp_fileexist @NombreRutaArchivoPlano , @Existe OUT
	IF @Existe = 1
	BEGIN
		SET @StrExe = 	' BULK INSERT NOMINAL_TRAMA_NUEVO ' +
						' FROM ''' + @NombreRutaArchivoPlano + '''' 

	IF(@Codepage=1)
	BEGIN
		SET @StrExe = @StrExe + ' WITH (CODEPAGE = ''65001'', FIRSTROW =2, FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'', TABLOCK)'
	END
	ELSE
	BEGIN
		SET @StrExe = @StrExe + ' WITH (FIRSTROW =2, FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'', TABLOCK)'
	END

		EXEC SP_EXECUTESQL @StrExe
		PRINT 'EXISTE EL ARCHIVO ' + @NombreRutaArchivoPlano
	END
	ELSE
	BEGIN
		PRINT 'NO EXISTE EL ARCHIVO ' + @NombreRutaArchivoPlano
	END
	
	SET @InicioNombreArchivo = @InicioNombreArchivo + 1
END

GO
/*IF OBJECT_ID('[dbo].[V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA]', 'V') IS NOT NULL
BEGIN
	IF OBJECT_ID('[dbo].[T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA]', 'U') IS NOT NULL
	BEGIN
		DROP TABLE T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
		PRINT 'SE ELIMINO T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA'
	END

	SELECT *INTO T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
	FROM V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
	PRINT 'TABLA CREADA T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA'
END
GO*/
PRINT '<===================FIN DE IMPORTACION===================>'
GO
PRINT '=================>>>>>>>>> FIN DE PROCESO HISMINSA_LOCAL_003_SCRIPT_IMPORTAR_ARCHIVOS_PLANOS <<<<<<<<<================='