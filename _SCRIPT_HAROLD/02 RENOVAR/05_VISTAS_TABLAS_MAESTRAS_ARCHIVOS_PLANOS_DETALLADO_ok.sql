USE [BDHIS_MINSA]
-- ====================================================================
-- Creador			:	Martin Juan Gerardo Jaramillo Morales
-- Apoyo			:	
-- Fecha Creación	:	20200618
-- Descripcion		:	Elimina todas las tablas para que no existan errores al momento de crearlas.
-- ====================================================================
GO
PRINT '=================>>>>>>>>> INICIO DE PROCESO HISMINSA_LOCAL_004_SCRIPT_VISTAS_TABLAS_MAESTRAS_ARCHIVOS_PLANOS_DETALLADO <<<<<<<<<================='
GO
IF OBJECT_ID('[dbo].[V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO]', 'V') IS NOT NULL
BEGIN
	DROP VIEW V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO
	PRINT 'SE ELIMINO V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO]', 'U') IS NOT NULL
BEGIN
	DROP TABLE T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO
	PRINT 'SE ELIMINO T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_ATENCIONES_ATENDIDOS_DETALLADO]', 'V') IS NOT NULL
BEGIN
	DROP VIEW V_REPORTE_ATENCIONES_ATENDIDOS_DETALLADO
	PRINT 'SE ELIMINO V_REPORTE_ATENCIONES_ATENDIDOS_DETALLADO <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_PRODUCCION_ATENCION_DIARIO_DETALLADO]', 'V') IS NOT NULL
BEGIN
	DROP VIEW V_REPORTE_PRODUCCION_ATENCION_DIARIO_DETALLADO
	PRINT 'SE ELIMINO V_REPORTE_PRODUCCION_ATENCION_DIARIO_DETALLADO <<<<<<<<<================='	
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_PRODUCCION_ATENCION_DETALLADO]', 'V') IS NOT NULL
BEGIN
	DROP VIEW V_REPORTE_PRODUCCION_ATENCION_DETALLADO
	PRINT 'SE ELIMINO V_REPORTE_PRODUCCION_ATENCION_DETALLADO <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_PRODUCCION_DIGITADOR_DIARIO_DETALLADO]', 'V') IS NOT NULL
BEGIN
	DROP VIEW V_REPORTE_PRODUCCION_DIGITADOR_DIARIO_DETALLADO
	PRINT 'SE ELIMINO V_REPORTE_PRODUCCION_DIGITADOR_DIARIO_DETALLADO <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_PRODUCCION_DIGITADOR_DETALLADO]', 'V') IS NOT NULL
BEGIN
	DROP VIEW V_REPORTE_PRODUCCION_DIGITADOR_DETALLADO
	PRINT 'SE ELIMINO V_REPORTE_PRODUCCION_DIGITADOR_DETALLADO <<<<<<<<<================='
END
GO
IF OBJECT_ID('[dbo].[V_REPORTE_REPORTE40A_DETALLADO]', 'V') IS NOT NULL
BEGIN
	DROP VIEW V_REPORTE_REPORTE40A_DETALLADO
	PRINT 'SE ELIMINO V_REPORTE_REPORTE40A_DETALLADO <<<<<<<<<================='
END
GO
CREATE VIEW V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO AS
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
MHES.Disa Descripcion_Disa,
MHES.Codigo_Red,
MHES.Red Descripcion_Red,
MHES.Codigo_MicroRed,
MHES.MicroRed Descripcion_MicroRed,
MHES.Codigo_Unico,
MHES.Nombre_Establecimiento,
MHES.Ubigueo_Establecimiento,
MHES.Departamento Departamento_Establecimiento,
MHES.Provincia Provincia_Establecimiento,
MHES.Distrito Distrito_Establecimiento,
--PACIENTE
NTN.Id_Paciente,
HTDPA.Id_Tipo_Documento Tipo_Doc_Paciente,
HTDPA.Abrev_Tipo_Doc Abrev_Tipo_Doc_Paciente,
MPA.Numero_Documento_Paciente,
MPA.Apellido_Paterno_Paciente,
MPA.Apellido_Materno_Paciente,
MPA.Nombres_Paciente,
MPA.Fecha_Nacimiento_Paciente,
-- MPA.Genero,
MPA.Historia_Clinica,
CASE WHEN (NTN.Id_Paciente LIKE 'A%') THEN NTN.Id_Paciente ELSE MPA.Ficha_Familiar END Ficha_Familiar,
MPA.Id_Etnia,
MHE.Descripcion_Etnia,
NTN.Id_Financiador,
MHF.Descripcion_Financiador,
MPA.Id_Pais,
MHP.Descripcion_Pais,
--PERSONAL
NTN.Id_Personal,
HTDPE.Id_Tipo_Documento Tipo_Doc_Personal,
HTDPE.Abrev_Tipo_Doc Abrev_Tipo_Doc_Personal,
MP.Numero_Documento_Personal,
MP.Apellido_Paterno_Personal,
MP.Apellido_Materno_Personal,
MP.Nombres_Personal,
MP.Fecha_Nacimiento_Personal,
MHCC.Id_Condicion,
MHCC.Descripcion_Condicion,
MHPR.Id_Profesion,
MHPR.Descripcion_Profesion,
MHC.Id_Colegio,
MHC.Descripcion_Colegio,
MP.Numero_Colegiatura,
--REGISTRADOR
NTN.Id_Registrador,
HTDRE.Id_Tipo_Documento Tipo_Doc_Registrador,
HTDRE.Abrev_Tipo_Doc Abrev_Tipo_Doc_Registrador,
MR.Numero_Documento_Registrador,
MR.Apellido_Paterno_Registrador,
MR.Apellido_Materno_Registrador,
MR.Nombres_Registrador,
MR.Fecha_Nacimiento_Registrador,
--ATENCION
NTN.Id_Condicion_Establecimiento,
NTN.Id_Condicion_Servicio,
NTN.Edad_Reg,
NTN.Tipo_Edad,
NTN.Anio_Actual_Paciente,
NTN.Mes_Actual_Paciente,
NTN.Dia_Actual_Paciente,
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
END Grupo_Edad,
NTN.Id_Turno,
MCC.Fg_Tipo,
NTN.Codigo_Item,
MCC.Descripcion_Item,
NTN.Tipo_Diagnostico,
NTN.Valor_Lab,
NTN.Id_Correlativo_Item,
NTN.Id_Correlativo_Lab,
NTN.Peso,
NTN.Talla,
NTN.Hemoglobina,
NTN.Perimetro_Abdominal,
NTN.Perimetro_Cefalico,
NTN.Id_Otra_Condicion,
MOC.Descripcion_Otra_Condicion,
--CENTRO POBLADO
NTN.Id_Centro_Poblado,
MHCP.Descripcion_Centro_Poblado,
MHCP.Id_Codigo_Centro_Poblado,
-- MHCP.Id_Ubigueo_Centro_Poblado,
-- MHCP.Altitud_Centro_Poblado,
NTN.Fecha_Ultima_Regla,
NTN.Fecha_Solicitud_Hb,
NTN.Fecha_Resultado_Hb,
NTN.Fecha_Registro,
NTN.Fecha_Modificacion
FROM NOMINAL_TRAMA_NUEVO NTN
LEFT JOIN MAESTRO_PERSONAL MP ON MP.Id_Personal=NTN.Id_Personal
LEFT JOIN MAESTRO_PACIENTE MPA ON MPA.Id_Paciente=NTN.Id_Paciente
LEFT JOIN MAESTRO_REGISTRADOR MR ON MR.Id_Registrador=NTN.Id_Registrador
LEFT JOIN MAESTRO_HIS_OTRA_CONDICION MOC ON MOC.Id_Otra_Condicion=NTN.Id_Otra_Condicion
LEFT JOIN MAESTRO_HIS_CIE_CPMS MCC ON MCC.Codigo_Item=NTN.Codigo_Item
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDPE ON HTDPE.Id_Tipo_Documento=MP.Id_Tipo_Documento_Personal
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDPA ON HTDPA.Id_Tipo_Documento=MPA.Id_Tipo_Documento_Paciente
LEFT JOIN MAESTRO_HIS_TIPO_DOC HTDRE ON HTDRE.Id_Tipo_Documento=MR.Id_Tipo_Documento_Registrador
LEFT JOIN MAESTRO_HIS_PAIS MHP ON MHP.Id_Pais=MPA.Id_Pais
LEFT JOIN MAESTRO_HIS_FINANCIADOR MHF ON MHF.Id_Financiador=NTN.Id_Financiador
LEFT JOIN MAESTRO_HIS_ETNIA MHE ON MHE.Id_Etnia=MPA.Id_Etnia
LEFT JOIN MAESTRO_HIS_COLEGIO MHC ON MHC.Id_Colegio=MP.Id_Colegio
LEFT JOIN MAESTRO_HIS_PROFESION MHPR ON MHPR.Id_Profesion=MP.Id_Profesion
LEFT JOIN MAESTRO_HIS_UPS MHU ON MHU.Id_Ups=NTN.Id_Ups
LEFT JOIN MAESTRO_HIS_ESTABLECIMIENTO MHES ON MHES.Id_Establecimiento=NTN.Id_Establecimiento
LEFT JOIN MAESTRO_HIS_CONDICION_CONTRATO MHCC ON MHCC.Id_Condicion=MP.Id_Condicion
LEFT JOIN MAESTRO_HIS_CENTRO_POBLADO MHCP ON MHCP.Id_Centro_Poblado=NTN.Id_Centro_Poblado
GO
PRINT 'VISTA CREADA V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO <<<<<<<<<================='
-- GO
-- SELECT *INTO T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO
-- FROM V_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO
GO
PRINT 'TABLA CREADA T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_ATENCIONES_ATENDIDOS_DETALLADO AS
SELECT 
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento,
rp.Abrev_Tipo_Doc_Personal,
rp.Numero_Documento_Personal,
rp.Apellido_Paterno_Personal,
rp.Apellido_Materno_Personal,
rp.Nombres_Personal,
rp.Fecha_Nacimiento_Personal,
rp.Id_Condicion,
rp.Descripcion_Condicion,
rp.Id_Profesion,
rp.Descripcion_Profesion,
rp.Id_Colegio,
rp.Descripcion_Colegio,
rp.Numero_Colegiatura,
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
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO rp
WHERE  rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1 AND rp.Id_Paciente IS NOT NULL
GROUP BY 
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento, 
rp.Abrev_Tipo_Doc_Personal,
rp.Numero_Documento_Personal,
rp.Apellido_Paterno_Personal,
rp.Apellido_Materno_Personal,
rp.Nombres_Personal,
rp.Fecha_Nacimiento_Personal,
rp.Id_Condicion,
rp.Descripcion_Condicion,
rp.Id_Profesion,
rp.Descripcion_Profesion,
rp.Id_Colegio,
rp.Descripcion_Colegio,
rp.Numero_Colegiatura,
rp.Anio, 
rp.Mes
GO
PRINT 'VISTA CREADA V_REPORTE_ATENCIONES_ATENDIDOS_DETALLADO <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_PRODUCCION_ATENCION_DIARIO_DETALLADO AS
SELECT
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento,
rp.Anio,
rp.Mes,
rp.Id_Ups,
rp.Abrev_Tipo_Doc_Personal,
rp.Numero_Documento_Personal,
rp.Apellido_Paterno_Personal,
rp.Apellido_Materno_Personal,
rp.Nombres_Personal,
rp.Fecha_Nacimiento_Personal,
rp.Id_Condicion,
rp.Descripcion_Condicion,
rp.Id_Profesion,
rp.Descripcion_Profesion,
rp.Id_Colegio,
rp.Descripcion_Colegio,
rp.Numero_Colegiatura,
rp.Fecha_Atencion,
rp.Id_Turno,
COUNT(rp.Id_Cita) Cantidad_Atenciones
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO rp
WHERE rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1
GROUP BY
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento,
rp.Anio,
rp.Mes,
rp.Id_Ups,
rp.Abrev_Tipo_Doc_Personal,
rp.Numero_Documento_Personal,
rp.Apellido_Paterno_Personal,
rp.Apellido_Materno_Personal,
rp.Nombres_Personal,
rp.Fecha_Nacimiento_Personal,
rp.Id_Condicion,
rp.Descripcion_Condicion,
rp.Id_Profesion,
rp.Descripcion_Profesion,
rp.Id_Colegio,
rp.Descripcion_Colegio,
rp.Numero_Colegiatura,
rp.Fecha_Atencion,
rp.Id_Turno
GO
PRINT 'VISTA CREADA V_REPORTE_PRODUCCION_ATENCION_DIARIO_DETALLADO <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_PRODUCCION_ATENCION_DETALLADO AS
SELECT
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento,
rp.Anio,
rp.Mes,
rp.Id_Ups,
rp.Abrev_Tipo_Doc_Personal,
rp.Numero_Documento_Personal,
rp.Apellido_Paterno_Personal,
rp.Apellido_Materno_Personal,
rp.Nombres_Personal,
rp.Fecha_Nacimiento_Personal,
rp.Id_Condicion,
rp.Descripcion_Condicion,
rp.Id_Profesion,
rp.Descripcion_Profesion,
rp.Id_Colegio,
rp.Descripcion_Colegio,
rp.Numero_Colegiatura,
COUNT(rp.Id_Cita) Cantidad_Atenciones
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO rp
WHERE rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1
GROUP BY 
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento,
rp.Anio,
rp.Mes,
rp.Id_Ups,
rp.Abrev_Tipo_Doc_Personal,
rp.Numero_Documento_Personal,
rp.Apellido_Paterno_Personal,
rp.Apellido_Materno_Personal,
rp.Nombres_Personal,
rp.Fecha_Nacimiento_Personal,
rp.Id_Condicion,
rp.Descripcion_Condicion,
rp.Id_Profesion,
rp.Descripcion_Profesion,
rp.Id_Colegio,
rp.Descripcion_Colegio,
rp.Numero_Colegiatura
GO
PRINT 'VISTA CREADA V_REPORTE_PRODUCCION_ATENCION_DETALLADO <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_PRODUCCION_DIGITADOR_DIARIO_DETALLADO AS
SELECT
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento,
rp.Anio,
rp.Mes,
rp.Abrev_Tipo_Doc_Registrador,
rp.Numero_Documento_Registrador,
rp.Apellido_Paterno_Registrador,
rp.Apellido_Materno_Registrador,
rp.Nombres_Registrador,
rp.Fecha_Nacimiento_Registrador,
CONVERT(VARCHAR,rp.Fecha_Registro,120) Fecha_Digitacion,
CONVERT(VARCHAR,rp.Fecha_Registro,108) Hora_Digitacion,
rp.Lote,
rp.Num_Pag,
rp.Num_Reg	
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO rp
WHERE rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1
GO
PRINT 'VISTA CREADA V_REPORTE_PRODUCCION_DIGITADOR_DIARIO_DETALLADO <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_PRODUCCION_DIGITADOR_DETALLADO AS
SELECT
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento,
rp.Anio,
rp.Mes,
rp.Abrev_Tipo_Doc_Registrador,
rp.Numero_Documento_Registrador,
rp.Apellido_Paterno_Registrador,
rp.Apellido_Materno_Registrador,
rp.Nombres_Registrador,
rp.Fecha_Nacimiento_Registrador,
COUNT(rp.Id_Cita) Cantidad_Registros
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO rp
WHERE rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1
GROUP BY 
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento,
rp.Anio,
rp.Mes,
rp.Abrev_Tipo_Doc_Registrador,
rp.Numero_Documento_Registrador,
rp.Apellido_Paterno_Registrador,
rp.Apellido_Materno_Registrador,
rp.Nombres_Registrador,
rp.Fecha_Nacimiento_Registrador
GO
PRINT 'VISTA CREADA V_REPORTE_PRODUCCION_DIGITADOR_DETALLADO <<<<<<<<<================='
GO
CREATE VIEW V_REPORTE_REPORTE40A_DETALLADO AS
SELECT
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento,
rp.Abrev_Tipo_Doc_Personal,
rp.Numero_Documento_Personal,
rp.Apellido_Paterno_Personal,
rp.Apellido_Materno_Personal,
rp.Nombres_Personal,
rp.Fecha_Nacimiento_Personal,
rp.Id_Condicion,
rp.Descripcion_Condicion,
rp.Id_Profesion,
rp.Descripcion_Profesion,
rp.Id_Colegio,
rp.Descripcion_Colegio,
rp.Numero_Colegiatura,
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
FROM T_CONSOLIDADO_NUEVA_TRAMA_HISMINSA_DETALLADO rp
WHERE rp.Id_Correlativo_Item=1 AND rp.Id_Correlativo_Lab=1
GROUP BY
rp.Descripcion_Sector,
rp.Descripcion_Disa,
rp.Descripcion_Red,
rp.Descripcion_MicroRed,
rp.Codigo_Unico,
rp.Nombre_Establecimiento,
rp.Abrev_Tipo_Doc_Personal,
rp.Numero_Documento_Personal,
rp.Apellido_Paterno_Personal,
rp.Apellido_Materno_Personal,
rp.Nombres_Personal,
rp.Fecha_Nacimiento_Personal,
rp.Id_Condicion,
rp.Descripcion_Condicion,
rp.Id_Profesion,
rp.Descripcion_Profesion,
rp.Id_Colegio,
rp.Descripcion_Colegio,
rp.Numero_Colegiatura,
rp.Anio,
rp.Mes
GO
PRINT 'VISTA CREADA V_REPORTE_REPORTE40A_DETALLADO  <<<<<<<<<================='
PRINT '=================>>>>>>>>> FIN DE PROCESO HISMINSA_LOCAL_004_SCRIPT_VISTAS_TABLAS_MAESTRAS_ARCHIVOS_PLANOS_DETALLADO <<<<<<<<<================='