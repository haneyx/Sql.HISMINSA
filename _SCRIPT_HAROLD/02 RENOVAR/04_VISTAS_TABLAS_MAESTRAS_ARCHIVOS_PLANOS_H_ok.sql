USE [BDHIS_MINSA]
-- ====================================================================
-- Creador			:	Martin Juan Gerardo Jaramillo Morales
-- Apoyo			:	
-- Fecha Creación	:	20200618
-- Descripcion		:	Elimina todas las tablas para que no existan errores al momento de crearlas.
-- ====================================================================
-- Creador			:	Martin Juan Gerardo Jaramillo Morales
-- Apoyo			:	
-- Fecha Creación	:	20210210
-- Descripcion		:	Se crea una tabla TRAMA_DTSG.
-- ====================================================================
GO
PRINT '=================>>>>>>>>> INICIO DE PROCESO HISMINSA_LOCAL_004_SCRIPT_VISTAS_TABLAS_MAESTRAS_ARCHIVOS_PLANOS <<<<<<<<<================='
GO
IF OBJECT_ID('[dbo].[V_TRAMAHIS_DTSG]', 'V') IS NOT NULL
BEGIN
    DROP VIEW V_TRAMAHIS_DTSG
    PRINT 'SE ELIMINO V_TRAMAHIS_DTSG <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA]', 'V') IS NOT NULL
BEGIN
    DROP VIEW V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
    PRINT 'SE ELIMINO V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA]', 'U') IS NOT NULL
BEGIN
    DROP TABLE T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
    PRINT 'SE ELIMINO T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[TRAMAHIS_DTSG]', 'U') IS NOT NULL
BEGIN
    TRUNCATE TABLE TRAMAHIS_DTSG
    PRINT 'SE LIMPIO TRAMAHIS_DTSG <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_ATENCIONES_ATENDIDOS]', 'V') IS NOT NULL
BEGIN
    DROP VIEW V_REPORTE_ATENCIONES_ATENDIDOS
    PRINT 'SE ELIMINO V_REPORTE_ATENCIONES_ATENDIDOS <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_PRODUCCION_ATENCION_DIARIO]', 'V') IS NOT NULL
BEGIN
    DROP VIEW V_REPORTE_PRODUCCION_ATENCION_DIARIO
    PRINT 'SE ELIMINO V_REPORTE_PRODUCCION_ATENCION_DIARIO <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_PRODUCCION_ATENCION]', 'V') IS NOT NULL
BEGIN
    DROP VIEW V_REPORTE_PRODUCCION_ATENCION
    PRINT 'SE ELIMINO V_REPORTE_PRODUCCION_ATENCION <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_PRODUCCION_DIGITADOR_DIARIO]', 'V') IS NOT NULL
BEGIN
    DROP VIEW V_REPORTE_PRODUCCION_DIGITADOR_DIARIO
    PRINT 'SE ELIMINO V_REPORTE_PRODUCCION_DIGITADOR_DIARIO <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_PRODUCCION_DIGITADOR]', 'V') IS NOT NULL
BEGIN
    DROP VIEW V_REPORTE_PRODUCCION_DIGITADOR
    PRINT 'SE ELIMINO V_REPORTE_PRODUCCION_DIGITADOR <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_REPORTE40A]', 'V') IS NOT NULL
BEGIN
    DROP VIEW V_REPORTE_REPORTE40A
    PRINT 'SE ELIMINO V_REPORTE_REPORTE40A <<<<<<<<<================='
END
GO
CREATE VIEW V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA AS
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
NTN.Id_Establecimiento,
NTN.Id_Paciente,
NTN.Id_Personal,
NTN.Id_Registrador,
NTN.Id_Financiador,
NTN.Id_Condicion_Establecimiento,
NTN.Id_Condicion_Servicio,
--NTN.Ubigeo_Inei,
NTN.Edad_Reg,
NTN.Tipo_Edad,
NTN.Anio_Actual_Paciente,
NTN.Mes_Actual_Paciente,
NTN.Dia_Actual_Paciente,
NTN.Id_Turno,
NTN.Codigo_Item,
LEFT(NTN.Codigo_Item,3) Codigo_Item_F,
NTN.Tipo_Diagnostico,
NTN.Valor_Lab,
NTN.Id_Correlativo_Item,
NTN.Id_Correlativo_Lab,
NTN.Peso,
NTN.Talla,
NTN.Hemoglobina,
NTN.Fecha_Solicitud_Hb,
NTN.Fecha_Resultado_Hb,
NTN.Perimetro_Abdominal,
NTN.Perimetro_Cefalico,
NTN.Id_Otra_Condicion,
NTN.Fecha_Ultima_Regla,
NTN.Id_Centro_Poblado,
NTN.Fecha_Registro,
NTN.Fecha_Modificacion,
MPA.Id_Pais,
NULL Id_Gruporiesgo,
--VALORES NUEVO
CONVERT(VARCHAR(6), NTN.Fecha_Atencion, 112) Id_Periodo,
MPA.Id_Genero,
MPA.Id_Etnia,
MPA.Historia_Clinica,
MP.Id_Profesion,
MHC.Fg_Tipo,
CASE WHEN (NTN.Id_Paciente LIKE 'A%') THEN NTN.Id_Paciente ELSE MPA.Ficha_Familiar END Ficha_Familiar,
DATEDIFF(DAY, MPA.Fecha_Nacimiento_Paciente, NTN.Fecha_Atencion) Edad_Dias_Paciente_FechaAtencion, 
DATEDIFF(MONTH, MPA.Fecha_Nacimiento_Paciente, NTN.Fecha_Atencion) Edad_Meses_Paciente_FechaAtencion, 
DATEDIFF(YEAR, MPA.Fecha_Nacimiento_Paciente, NTN.Fecha_Atencion) Edad_Anios_Paciente_FechaAtencion,
DATEDIFF(DAY, MPA.Fecha_Nacimiento_Paciente, GETDATE()) Edad_Dias_Paciente_FechaActual, 
DATEDIFF(MONTH, MPA.Fecha_Nacimiento_Paciente, GETDATE()) Edad_Meses_Paciente_FechaActual, 
DATEDIFF(YEAR, MPA.Fecha_Nacimiento_Paciente, GETDATE()) Edad_Anios_Paciente_FechaActual,
CASE 	WHEN (NTN.Tipo_Edad='D' AND NTN.Edad_Reg BETWEEN 1 AND 29 ) THEN 1
        WHEN (NTN.Tipo_Edad='M' AND NTN.Edad_Reg BETWEEN 1 AND 11 ) THEN 2
        WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 1 AND 4 ) THEN 3
        WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 5 AND 11 ) THEN 4
        WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 12 AND 17 ) THEN 5
        WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 18 AND 29 ) THEN 6
        WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg BETWEEN 30 AND 59 ) THEN 7
        WHEN (NTN.Tipo_Edad='A' AND NTN.Edad_Reg > 59) THEN 8
END Grupo_Edad
FROM NOMINAL_TRAMA_NUEVO NTN
LEFT JOIN MAESTRO_PACIENTE MPA ON MPA.Id_Paciente=NTN.Id_Paciente
LEFT JOIN MAESTRO_PERSONAL MP ON MP.Id_Personal=NTN.Id_Personal
LEFT JOIN MAESTRO_HIS_CIE_CPMS MHC ON MHC.Codigo_Item=NTN.Codigo_Item
GO
PRINT 'VISTA CREADA V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA <<<<<<<<<================='
GO
SELECT *INTO T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
FROM V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
GO
PRINT 'TABLA CREADA T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_ATENCIONES_ATENDIDOS AS
SELECT 
rp.Id_Establecimiento,
rp.Id_Personal,
rp.Anio,
rp.Mes,
SUM(CASE WHEN ( rp.Dia=1 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_1',
SUM(CASE WHEN ( rp.Dia=2 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_2',
SUM(CASE WHEN ( rp.Dia=3 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_3',
SUM(CASE WHEN ( rp.Dia=4 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_4',
SUM(CASE WHEN ( rp.Dia=5 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_5',
SUM(CASE WHEN ( rp.Dia=6 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_6',
SUM(CASE WHEN ( rp.Dia=7 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_7',
SUM(CASE WHEN ( rp.Dia=8 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_8',
SUM(CASE WHEN ( rp.Dia=9 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_9',
SUM(CASE WHEN ( rp.Dia=10 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_10',
SUM(CASE WHEN ( rp.Dia=11 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_11',
SUM(CASE WHEN ( rp.Dia=12 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_12',
SUM(CASE WHEN ( rp.Dia=13 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_13',
SUM(CASE WHEN ( rp.Dia=14 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_14',
SUM(CASE WHEN ( rp.Dia=15 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_15',
SUM(CASE WHEN ( rp.Dia=16 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_16',
SUM(CASE WHEN ( rp.Dia=17 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_17',
SUM(CASE WHEN ( rp.Dia=18 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_18',
SUM(CASE WHEN ( rp.Dia=19 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_19',
SUM(CASE WHEN ( rp.Dia=20 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_20',
SUM(CASE WHEN ( rp.Dia=21 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_21',
SUM(CASE WHEN ( rp.Dia=22 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_22',
SUM(CASE WHEN ( rp.Dia=23 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_23',
SUM(CASE WHEN ( rp.Dia=24 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_24',
SUM(CASE WHEN ( rp.Dia=25 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_25',
SUM(CASE WHEN ( rp.Dia=26 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_26',
SUM(CASE WHEN ( rp.Dia=27 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_27',
SUM(CASE WHEN ( rp.Dia=28 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_28',
SUM(CASE WHEN ( rp.Dia=29 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_29',
SUM(CASE WHEN ( rp.Dia=30 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_30',
SUM(CASE WHEN ( rp.Dia=31 AND	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_EESS_31',			
SUM(CASE WHEN (	rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) Atendidos_EESS_Total,
                    
SUM(CASE WHEN ( rp.Dia=1 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_1',
SUM(CASE WHEN ( rp.Dia=2 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_2',
SUM(CASE WHEN ( rp.Dia=3 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_3',
SUM(CASE WHEN ( rp.Dia=4 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_4',
SUM(CASE WHEN ( rp.Dia=5 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_5',
SUM(CASE WHEN ( rp.Dia=6 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_6',
SUM(CASE WHEN ( rp.Dia=7 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_7',
SUM(CASE WHEN ( rp.Dia=8 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_8',
SUM(CASE WHEN ( rp.Dia=9 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_9',
SUM(CASE WHEN ( rp.Dia=10 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_10',
SUM(CASE WHEN ( rp.Dia=11 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_11',
SUM(CASE WHEN ( rp.Dia=12 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_12',
SUM(CASE WHEN ( rp.Dia=13 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_13',
SUM(CASE WHEN ( rp.Dia=14 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_14',
SUM(CASE WHEN ( rp.Dia=15 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_15',
SUM(CASE WHEN ( rp.Dia=16 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_16',
SUM(CASE WHEN ( rp.Dia=17 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_17',
SUM(CASE WHEN ( rp.Dia=18 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_18',
SUM(CASE WHEN ( rp.Dia=19 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_19',
SUM(CASE WHEN ( rp.Dia=20 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_20',
SUM(CASE WHEN ( rp.Dia=21 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_21',
SUM(CASE WHEN ( rp.Dia=22 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_22',
SUM(CASE WHEN ( rp.Dia=23 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_23',
SUM(CASE WHEN ( rp.Dia=24 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_24',
SUM(CASE WHEN ( rp.Dia=25 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_25',
SUM(CASE WHEN ( rp.Dia=26 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_26',
SUM(CASE WHEN ( rp.Dia=27 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_27',
SUM(CASE WHEN ( rp.Dia=28 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_28',
SUM(CASE WHEN ( rp.Dia=29 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_29',
SUM(CASE WHEN ( rp.Dia=30 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_30',
SUM(CASE WHEN ( rp.Dia=31 AND	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) 'Atendidos_Servicios_31',	
SUM(CASE WHEN (	rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) Atendidos_Servicios_Total,

SUM(CASE WHEN ( rp.Dia=1 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_1',
SUM(CASE WHEN ( rp.Dia=2 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_2',
SUM(CASE WHEN ( rp.Dia=3 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_3',
SUM(CASE WHEN ( rp.Dia=4 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_4',
SUM(CASE WHEN ( rp.Dia=5 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_5',
SUM(CASE WHEN ( rp.Dia=6 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_6',
SUM(CASE WHEN ( rp.Dia=7 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_7',
SUM(CASE WHEN ( rp.Dia=8 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_8',
SUM(CASE WHEN ( rp.Dia=9 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_9',
SUM(CASE WHEN ( rp.Dia=10 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_10',
SUM(CASE WHEN ( rp.Dia=11 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_11',
SUM(CASE WHEN ( rp.Dia=12 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_12',
SUM(CASE WHEN ( rp.Dia=13 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_13',
SUM(CASE WHEN ( rp.Dia=14 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_14',
SUM(CASE WHEN ( rp.Dia=15 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_15',
SUM(CASE WHEN ( rp.Dia=16 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_16',
SUM(CASE WHEN ( rp.Dia=17 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_17',
SUM(CASE WHEN ( rp.Dia=18 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_18',
SUM(CASE WHEN ( rp.Dia=19 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_19',
SUM(CASE WHEN ( rp.Dia=20 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_20',
SUM(CASE WHEN ( rp.Dia=21 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_21',
SUM(CASE WHEN ( rp.Dia=22 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_22',
SUM(CASE WHEN ( rp.Dia=23 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_23',
SUM(CASE WHEN ( rp.Dia=24 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_24',
SUM(CASE WHEN ( rp.Dia=25 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_25',
SUM(CASE WHEN ( rp.Dia=26 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_26',
SUM(CASE WHEN ( rp.Dia=27 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_27',
SUM(CASE WHEN ( rp.Dia=28 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_28',
SUM(CASE WHEN ( rp.Dia=29 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_29',
SUM(CASE WHEN ( rp.Dia=30 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_30',
SUM(CASE WHEN ( rp.Dia=31 AND	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) 'Atenciones_31',	
SUM(CASE WHEN (	rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) Atenciones_Total
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA rp
WHERE  rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1 AND rp.Id_Paciente IS NOT NULL
GROUP BY 
rp.Id_Establecimiento,
rp.Id_Personal,
rp.Anio,
rp.Mes
GO
PRINT 'VISTA CREADA V_REPORTE_ATENCIONES_ATENDIDOS <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_PRODUCCION_ATENCION_DIARIO AS
SELECT
rp.Id_Establecimiento,
rp.Anio,
rp.Mes,
rp.Id_Ups,
rp.Id_Personal,
rp.Fecha_Atencion,
rp.Id_Turno,
COUNT(rp.Id_Cita) Cantidad_Atenciones
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA rp
WHERE rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1
GROUP BY
rp.Id_Establecimiento,
rp.Anio,
rp.Mes,
rp.Id_Ups,
rp.Id_Personal,
rp.Fecha_Atencion,
rp.Id_Turno
GO
PRINT 'VISTA CREADA V_REPORTE_PRODUCCION_ATENCION_DIARIO <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_PRODUCCION_ATENCION AS
SELECT
rp.Id_Establecimiento,
rp.Anio,
rp.Mes,
rp.Id_Ups,
rp.Id_Personal,
COUNT(rp.Id_Cita) Cantidad_Atenciones
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA rp
WHERE rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1
GROUP BY 
rp.Id_Establecimiento,
rp.Anio,
rp.Mes,
rp.Id_Ups,
rp.Id_Personal
GO
PRINT 'VISTA CREADA V_REPORTE_PRODUCCION_ATENCION <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_PRODUCCION_DIGITADOR_DIARIO AS
SELECT
rp.Id_Establecimiento,
rp.Anio,
rp.Mes,
rp.Id_Registrador,
CONVERT(VARCHAR,rp.Fecha_Registro,120) Fecha_Digitacion,
CONVERT(VARCHAR,rp.Fecha_Registro,108) Hora_Digitacion,
rp.Lote,
rp.Num_Pag,
rp.Num_Reg	
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA rp
WHERE rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1
GO
PRINT 'VISTA CREADA V_REPORTE_PRODUCCION_DIGITADOR_DIARIO <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_PRODUCCION_DIGITADOR AS
SELECT
rp.Id_Establecimiento,
rp.Anio,
rp.Mes,
Id_Registrador,
COUNT(rp.Id_Cita) Cantidad_Registros
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA rp
WHERE rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1
GROUP BY 
rp.Id_Establecimiento,
rp.Anio,
rp.Mes,
Id_Registrador
GO
PRINT 'VISTA CREADA V_REPORTE_PRODUCCION_DIGITADOR <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_REPORTE40A AS
SELECT
rp.Id_Establecimiento,
rp.Id_Personal,
rp.Anio,
rp.Mes,
SUM(CASE WHEN (rp.Id_Paciente IS NOT NULL AND rp.Id_Condicion_Establecimiento IN ('N', 'R') ) THEN 1 ELSE 0 END) Atendidos_EESS_Total,				
SUM(CASE WHEN (rp.Id_Paciente IS NOT NULL AND rp.Id_Condicion_Servicio IN ('N', 'R') ) THEN 1 ELSE 0 END) Atendidos_Servicios_Total,
SUM(CASE WHEN (rp.Id_Paciente IS NOT NULL AND rp.Id_Condicion_Servicio IN ('N', 'R', 'C') ) THEN 1 ELSE 0 END) Atenciones_Total,
SUM(CASE WHEN (rp.Id_Paciente IS NOT NULL AND rp.Id_Condicion_Servicio IN ('N') ) THEN 1 ELSE 0 END) Nuevo_Servicio_Total,
SUM(CASE WHEN (rp.Id_Paciente IS NOT NULL AND rp.Id_Condicion_Servicio IN ('C') ) THEN 1 ELSE 0 END) Continuador_Servicio_Total,
SUM(CASE WHEN (rp.Id_Paciente IS NOT NULL AND rp.Id_Condicion_Servicio IN ('R') ) THEN 1 ELSE 0 END) Reingresante_Servicio_Total,
SUM(CASE WHEN (rp.Id_Paciente LIKE 'APP%' ) THEN 1 ELSE 0 END) APP_Total,
SUM(CASE WHEN (rp.Id_Paciente LIKE 'AAA%' ) THEN 1 ELSE 0 END) AAA_Total
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA rp
WHERE rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1
GROUP BY
rp.Id_Establecimiento,
rp.Id_Personal,
rp.Anio,
rp.Mes
GO
PRINT 'VISTA CREADA V_REPORTE_REPORTE40A <<<<<<<<<================='
GO
CREATE VIEW V_TRAMAHIS_DTSG AS
SELECT
MHE.Codigo_Unico,
MHE.Codigo_Sector,
MHE.Codigo_Disa,
MHE.Codigo_Red,
MHE.Codigo_MicroRed,
NULL id_punto,
CONVERT(VARCHAR(8),NTN.Fecha_Atencion, 112) periodo,
CONVERT(VARCHAR(6),NTN.Fecha_Atencion, 112) aniomes,
CONVERT(VARCHAR(6),NTN.Fecha_Atencion, 112) aniomeshh,
CASE WHEN (NTN.Id_Paciente LIKE 'A%') THEN NTN.Ficha_Familiar ELSE NTN.Id_Paciente END fichafam,
NULL ubigeo,
NTN.Edad_Reg,
NTN.Tipo_Edad,
NTN.Id_Genero,
NTN.Id_Condicion_Establecimiento,
NTN.Id_Condicion_Servicio,
NTN.Id_Financiador,
NTN.Id_Etnia,
NTN.Id_Cita,
NTN.Id_Personal,
NTN.Id_Ups,
NTN.Id_Profesion,
NULL clasificacion,
-- CASE WHEN (EXISTS (SELECT Id_lote FROM MAESTRO_HIS_SISTEMA WHERE Id_lote=NTN.Lote AND Id_lote IS NOT NULL) ) THEN MHS.Id_Sistema  ELSE 1 END Id_Sistema,
--NTN.Id_Paciente,
CASE WHEN (NTN.Id_Paciente LIKE 'A%') THEN NULL ELSE NTN.Id_Paciente END id_persona,
NTN.Id_Establecimiento,
NTN.Id_Correlativo_Item,
NULL id_corr_diag,
NTN.Codigo_Item,
NTN.Tipo_Diagnostico,
NTN.Fg_Tipo,
NTN.Valor_Lab,
NULL id_corr_lab,
NTN.Id_Correlativo_Lab,
NULL id_gruporiesgo,
NULL id_comorbilidad,
NULL id_colegio,
NULL etapa,
NTN.Codigo_Item_F,
NTN.Perimetro_Cefalico,
NTN.Perimetro_Abdominal,
NTN.Peso,
NTN.Talla,
NTN.Hemoglobina,
NULL fecha_exfisico,
NTN.Fecha_Resultado_Hb,
NTN.Fecha_Solicitud_Hb,
NULL id_progact,
NTN.Id_Registrador,
NTN.Lote,
NTN.Num_Pag,
NTN.Num_Reg,
NTN.Historia_Clinica,
NTN.Ficha_Familiar fichafamiliar,
NTN.Fecha_Registro,
NTN.Id_Turno,
NTN.Fecha_Modificacion,
NTN.Id_Pais,
NTN.Anio_Actual_Paciente,
NTN.Mes_Actual_Paciente,
NTN.Dia_Actual_Paciente,
NTN.Id_Otra_Condicion,
NTN.Fecha_Ultima_Regla,
NTN.Id_Centro_Poblado
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA NTN
INNER JOIN MAESTRO_HIS_ESTABLECIMIENTO MHE ON MHE.Id_Establecimiento=NTN.Id_Establecimiento
LEFT JOIN MAESTRO_PACIENTE MPA ON MPA.Id_Paciente=NTN.Id_Paciente
-- LEFT JOIN MAESTRO_HIS_SISTEMA MHS ON MHS.Id_lote=NTN.Lote AND MHS.Id_lote IS NOT NULL
GO
PRINT 'VISTA CREADA V_TRAMAHIS_DTSG <<<<<<<<<================='
-- GO
-- INSERT INTO TRAMAHIS_DTSG
-- SELECT *FROM V_TRAMAHIS_DTSG
-- GO
-- PRINT 'TABLA CREADA TRAMAHIS_DTSG <<<<<<<<<================='
GO
PRINT '=================>>>>>>>>> FIN DE PROCESO HISMINSA_LOCAL_004_SCRIPT_VISTAS_TABLAS_MAESTRAS_ARCHIVOS_PLANOS <<<<<<<<<================='
GO

PRINT '=================>>>>>>>>> CREACION DE INDICES <<<<<<<<<================='
IF EXISTS(SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID('T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA') AND NAME ='IDX_CITA_TRAMA_TMP')
BEGIN
    DROP INDEX IDX_CITA_TRAMA_TMP ON CITA_TRAMA_TMP WITH ( ONLINE = OFF )
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID('T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA') AND NAME ='IDX_Codigo_Item_Tipo_Diagnostico_Valor_Lab_T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA')
BEGIN
    CREATE NONCLUSTERED INDEX IDX_Codigo_Item_Tipo_Diagnostico_Valor_Lab_T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
    ON [dbo].[T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA] ([Codigo_Item],[Tipo_Diagnostico],[Valor_Lab])
    INCLUDE ([Id_Cita])
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID('T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA') AND NAME ='IDX_Valor_Lab_T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA')
BEGIN
    CREATE NONCLUSTERED INDEX IDX_Valor_Lab_T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
    ON [dbo].[T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA] ([Valor_Lab])
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID('T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA') AND NAME ='IDX_Tipo_Diagnostico_Id_Correlativo_Lab_Codigo_Item_F_Genero_T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA')
BEGIN
    CREATE NONCLUSTERED INDEX IDX_Tipo_Diagnostico_Id_Correlativo_Lab_Codigo_Item_F_Genero_T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
    ON [dbo].[T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA] ([Tipo_Diagnostico],[Id_Correlativo_Lab],[Codigo_Item_F],[Id_Genero])
    INCLUDE ([Id_Cita],[Fecha_Atencion],[Id_Establecimiento],[Id_Paciente],[Id_Personal],[Id_Financiador],[Edad_Reg],[Id_Etnia],[Id_Profesion],[Ficha_Familiar])
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID('T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA') AND NAME ='IDX_Codigo_Item_F_T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA')
BEGIN
    CREATE NONCLUSTERED INDEX IDX_Codigo_Item_F_T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA
    ON [dbo].[T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA] ([Codigo_Item_F])
    INCLUDE ([Id_Cita])
END