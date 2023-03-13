/******************************************************************
	SCRIPT CREADO POR MG.SC.ING. SISTEMAS HAROLD N. COILA VILLENA
	JEFE DE LA UNIDAD DE ESTADISTICA E INFORMATICA 2022
*******************************************************************/
USE [BDHIS_MINSA]; SET LANGUAGE SPANISH; DECLARE @hAnioAct VARCHAR(4); SET @hAnioAct=YEAR(GETDATE());
DECLARE @hFechaInicio VARCHAR(8),@hFechaFin VARCHAR(8),@hFechaHoy VARCHAR(8)=REPLACE(CAST(GETDATE() AS Date),'-','');
DECLARE @hDistrito VARCHAR(255)='%',@hMicrored VARCHAR(200)='%',@hEstablecimiento VARCHAR(200)='%',@hUPS VARCHAR(255)='%';
/******************************************************************
	DESIGNE LOS FILTROS QUE DESEA OBVIAR A CONTINUACION
	AGREGANDO '-- ', sin comillas ANTES DE ETIQUETA 'SET'
*******************************************************************/
SET @hFechaInicio = '20220101';
SET @hFechaFin = '20220131';
-- SET @hFechaFin = @hFechaHoy;

/*******************************************************************
	FIN DEL SETEO DE LOS FILTROS, NO ALTERAR EL CODIGO
	MAESTRO SIGUIENTE CREADO EN 07 DE ENERO DEL 2022
********************************************************************/
SELECT
	T.ANIO AS AÑO, 
	UPPER(DATENAME(MONTH,'01/'+MES+'/'+@hAnioAct)) AS [MES],
	ISNULL(DISTRITO,'') AS [DISTRITO],
	IIF(MICRORED='NO PERTENECE A NINGUNA MICRORED','REDESS HNE',MICRORED) AS [MICRORED],
	IIF(T.NOMBRE_ESTABLECIMIENTO='HOSPITAL LUCIO ALDAZABAL PAUCA','HOSPITAL LAP',T.NOMBRE_ESTABLECIMIENTO) AS [ESTABLECIMIENTO],
	ISNULL(T.NUMERO_DOCUMENTO_PACIENTE,'') AS [DNI],
	ISNULL((SELECT TOP 1 P.Apellido_Materno_Paciente + ' ' + P.Apellido_Materno_Paciente + ', ' + P.Nombres_Paciente FROM MAESTRO_PACIENTE AS P WHERE P.Id_Paciente = T.ID_PACIENTE),'') AS [PROFESIONAL VACUNADO],
	ISNULL((SELECT TOP 1 PR.Descripcion_Profesion FROM MAESTRO_PERSONAL AS S LEFT JOIN MAESTRO_HIS_PROFESION AS PR ON S.Id_Profesion = PR.Id_Profesion WHERE S.Numero_Documento_Personal = T.Numero_Documento_Paciente),'') AS [PROFESION]
FROM
(
	SELECT 
		N.ANIO, 
		N.MES, 
		ME.DISTRITO, 
		[MICRORED], 
		ME.NOMBRE_ESTABLECIMIENTO, 
		N.ID_PACIENTE, 
		MP.NUMERO_DOCUMENTO_PACIENTE, 
		COUNT(DISTINCT MP.NUMERO_DOCUMENTO_PACIENTE) AS UNICO
	FROM
		NOMINAL_TRAMA_NUEVO AS N
		INNER JOIN MAESTRO_HIS_ESTABLECIMIENTO AS ME ON N.ID_ESTABLECIMIENTO = ME.ID_ESTABLECIMIENTO
		INNER JOIN MAESTRO_PACIENTE AS MP ON N.ID_PACIENTE = MP.ID_PACIENTE
	WHERE
		N.FECHA_ATENCION>=@hFechaInicio AND N.FECHA_ATENCION<=@hFechaFin
		AND
		N.Id_Ups = '301204'
		AND	
		N.VALOR_LAB = 'ST'
	GROUP BY
		N.ANIO, 
		N.MES, 
		ME.DISTRITO, 
		ME.MICRORED, 
		ME.NOMBRE_ESTABLECIMIENTO, 
		N.ID_PACIENTE, 
		MP.NUMERO_DOCUMENTO_PACIENTE
) AS T
ORDER BY
	1, 2, 3, 4, 5, 7