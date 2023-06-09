USE [BDHIS_MINSA]
-- ====================================================================
-- Creador			:	Martin Juan Gerardo Jaramillo Morales
-- Apoyo			:	
-- Fecha Creación	:	20200618
-- Descripcion		:	Elimina todas las tablas para que no existan errores al momento de crearlas.
-- ====================================================================
GO
PRINT '=================>>>>>>>>> INICIO DE PROCESO HISMINSA_LOCAL_002_SCRIPT_VALIDACION_TABLAS <<<<<<<<<================='
GO
IF OBJECT_ID('[dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO]', 'U') IS NOT NULL
BEGIN
	DROP TABLE TBM_ANIOS_MES_ARCHIVO_PLANO
	PRINT 'SE ELIMINO LA TABLA TBM_ANIOS_MES_ARCHIVO_PLANO'
    PRINT '=================>>>>>>>>> <<<<<<<<<================='
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
CREATE TABLE TBM_ANIOS_MES_ARCHIVO_PLANO(
I_ID INT IDENTITY,
V_SECTOR VARCHAR(8),
I_ANNIO INT,
I_MES INT,
I_FG_ESTADO INT)
GO
PRINT 'SE CREO LA TABLA TBM_ANIOS_MES_ARCHIVO_PLANO'
GO

DECLARE @FECHADESDE AS SMALLDATETIME, @FECHAHASTA AS SMALLDATETIME
DECLARE @PERIODO VARCHAR(6), @PERIODO_DETALLADO DATE
DECLARE @ANIO VARCHAR(4), @SEMESTRE VARCHAR(11), @TRIMESTRE VARCHAR(12), @BIMESTRE VARCHAR(11), @MES VARCHAR(2), @MESLETRAS VARCHAR(20)

--RANGO DE FECHAS A GENERAR: DEL 01/01/2020 AL 31/12/2020 
SELECT @FECHADESDE = CAST('20160101' AS SMALLDATETIME)
SELECT @FECHAHASTA = CAST(CONCAT(YEAR(GETDATE()), '1231') AS SMALLDATETIME)

WHILE (@FECHADESDE <= @FECHAHASTA) BEGIN

	SELECT @ANIO = YEAR(@FECHADESDE)
	SELECT @MES = MONTH(@FECHADESDE)

	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'GENERAL', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'ESSALUD', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'EJERCITO', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'FAP', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'PNP', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'NAVAL', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'GOBPROVI', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'GOBLOCAL', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'PRIVADO', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'OTRO', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'MIXTO', @ANIO, @MES, 1)
	INSERT [dbo].[TBM_ANIOS_MES_ARCHIVO_PLANO] ([V_SECTOR], [I_ANNIO], [I_MES], [I_FG_ESTADO]) VALUES (N'INPE', @ANIO, @MES, 1)

	--INCREMENTO DEL BUCLE
	SELECT @FECHADESDE = DATEADD(MONTH, 1, @FECHADESDE)
END
SELECT * FROM TBM_ANIOS_MES_ARCHIVO_PLANO
GO
PRINT '=================>>>>>>>>> FIN DE PROCESO HISMINSA_LOCAL_002_SCRIPT_VALIDACION_TABLAS <<<<<<<<<================='