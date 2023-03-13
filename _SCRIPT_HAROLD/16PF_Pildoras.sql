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
SET @hFechaInicio = '20190101';
SET @hFechaFin = '20220101';
-- SET @hFechaFin = @hFechaHoy; 
-- SET @hDistrito='COJATA'
-- SET @hMicrored = 'PUTINA';
-- SET @hEstablecimiento = 'PUTINA';
-- SET @hUPS='ATENCION PSICOLOGICA Y SALUD MENTAL EN EMERGENCIAS Y DESASTRES';

/*******************************************************************
	FIN DEL SETEO DE LOS FILTROS, NO ALTERAR EL CODIGO
	MAESTRO SIGUIENTE CREADO EN 07 DE ENERO DEL 2022
********************************************************************/
SELECT
    N.ANIO AS [AÑO],
    UPPER(DATENAME(MONTH,'01/'+MES+'/'+@hAnioAct)) AS [MES],
	N.DIA AS [DIA],

	ISNULL(ME.DISTRITO,'') AS [DISTRITO],
    IIF(ME.MICRORED='NO PERTENECE A NINGUNA MICRORED','REDESS HNE',ME.MICRORED) AS [MICRORED],
	ISNULL(ME.Codigo_Unico,'') AS [IPRESS],
    IIF(ME.NOMBRE_ESTABLECIMIENTO='HOSPITAL LUCIO ALDAZABAL PAUCA','HOSPITAL LAP',ME.NOMBRE_ESTABLECIMIENTO) AS [ESTABLECIMIENTO],
    ISNULL(TD.ABREV_TIPO_DOC,'') AS [TIPO DOC],
    ISNULL(MP.NUMERO_DOCUMENTO_PACIENTE,'') AS [DNI PACIENTE],
	ISNULL(N.Id_Paciente,'') AS [ID PACIENTE],
	ISNULL(CONCAT(MP.APELLIDO_PATERNO_PACIENTE,' ',MP.APELLIDO_MATERNO_PACIENTE,' ',MP.NOMBRES_PACIENTE),'') AS [PACIENTE ATENDIDO],
    ISNULL(MP.ID_GENERO,'') AS [SEXO],
    ISNULL(N.EDAD_REG,'') AS [EDAD],
    ISNULL(N.TIPO_EDAD,'') AS [TIPO EDAD],

	-- N.Id_Cita AS [ID CITA],
	-- N.LOTE,
    -- N.NUM_PAG AS [PAG],
    -- N.NUM_REG AS [REG],
    MU.DESCRIPCION_UPS AS [SERVICIO UPS],
   
    ISNULL(MA.NUMERO_DOCUMENTO_PERSONAL,'') AS [DNI PROFESIONAL],
    ISNULL(CONCAT(MA.APELLIDO_PATERNO_PERSONAL,' ',MA.APELLIDO_MATERNO_PERSONAL,' ',MA.NOMBRES_PERSONAL),'') AS [NOMBRE PROFESIONAL],
    ISNULL(PR.DESCRIPCION_PROFESION,'') AS [PROFESION],
    N.FECHA_ATENCION AS [FECHA DE ATENCION],
    N.CODIGO_ITEM AS [CODIGO CIE-X],
    ISNULL(CX.DESCRIPCION_ITEM,'') AS [DETALLE CIE-X],
    ISNULL(N.VALOR_LAB, '') AS [LAB],
    N.TIPO_DIAGNOSTICO AS [DX],
    N.ID_CORRELATIVO_ITEM AS [ORDEN ITEM]
FROM
    NOMINAL_TRAMA_NUEVO AS N
    INNER JOIN MAESTRO_HIS_ESTABLECIMIENTO AS ME ON N.ID_ESTABLECIMIENTO = ME.ID_ESTABLECIMIENTO
    INNER JOIN MAESTRO_PACIENTE AS MP ON N.ID_PACIENTE = MP.ID_PACIENTE
    INNER JOIN MAESTRO_PERSONAL AS MA ON N.ID_PERSONAL = MA.ID_PERSONAL
    INNER JOIN MAESTRO_HIS_UPS AS MU ON N.ID_UPS = MU.ID_UPS
    INNER JOIN MAESTRO_HIS_CIE_CPMS AS CX ON N.CODIGO_ITEM = CX.CODIGO_ITEM
    INNER JOIN MAESTRO_HIS_TIPO_DOC AS TD ON MP.ID_TIPO_DOCUMENTO_PACIENTE = TD.ID_TIPO_DOCUMENTO
    INNER JOIN MAESTRO_HIS_PROFESION AS PR ON MA.ID_PROFESION = PR.ID_PROFESION
WHERE    
	N.FECHA_ATENCION>=@hFechaInicio AND N.FECHA_ATENCION<=@hFechaFin
	AND
	ME.DISTRITO LIKE @hDistrito AND ME.MICRORED LIKE @hMicrored AND ME.Nombre_Establecimiento LIKE @hEstablecimiento
	AND
	MU.DESCRIPCION_UPS LIKE @hUPS
	AND N.CODIGO_ITEM IN ('99208.11',',99208.12') /** ACTIVAME PARA CODIGOS MULTIPLES **/
ORDER BY
    ANIO,
    CAST(MES AS INT),
	ME.DISTRITO,
    ME.MICRORED,
    ME.NOMBRE_ESTABLECIMIENTO,
	N.FECHA_ATENCION,
	N.CODIGO_ITEM,
	[PACIENTE ATENDIDO]
	ASC;
