
/*==============================================================================
Indicadores DL1153

Nombre: Porcentaje de mujeres de 25 a 64 a�os con tamizaje para la detecci�n de lesiones premalignas
 e incipientes de c�ncer de cuello uterino, que se atendieron en el EESS

Sintaxis:
Numerador: Mujeres de 25 a 64 a�os con resultado entregado de PAP (Registro HIS: c�digo "88141" y Lab "N" y "A") 
	+ Mujeres de 30 a 49 a�os con resultado de Inspecci�n visual con �cido ac�tico (IVAA) (Registro HIS: c�digo 88141.01 y Lab "N" y "A") 
	o Prueba Molecular Virus Papiloma Humano (VPH) con resultados normal y anormal (Registro HIS: c�digo 87621 y Lab "N" y "A") 

Denominador: 50% de mujeres de 25 a 64 a�os afiliadas al SIS

Fuente: HIS
�mbito de medici�n: IPRESS.
Periodicidad: Mensual
==============================================================================*/
use BDHIS_MINSA
go

 DROP TABLE #CNV
 DROP TABLE #CNV2
 DROP TABLE #CNV_FINAL
 DROP TABLE #CNV_20210710
 DROP TABLE #TRAMA_HIS
 DROP TABLE #HIS_MINSA
 DROP TABLE #2019
 DROP TABLE #2020
 DROP TABLE #2021
 DROP TABLE #PN_DNI
 DROP TABLE #PADRON
 DROP TABLE #BPN
 DROP TABLE #PADRON_03
 DROP TABLE #PADRONF_03
 DROP TABLE #PADRON_NOMINAL
 DROP TABLE #ATENDIDOS
 DROP TABLE #TMP_1
 DROP TABLE #TMP_01
 DROP TABLE #TMP_02
 DROP TABLE #TMP_2
 DROP TABLE #TMP_3
 DROP TABLE #TMP_4
 DROP TABLE #CRED1_03
 DROP TABLE #CRED2_03
 DROP TABLE #TEMP1
 DROP TABLE #TEMP2
 DROP TABLE #TEMP3
 DROP TABLE #TEMP4
 DROP TABLE #TEMP5
 DROP TABLE #TEMP6
 DROP TABLE #TEMP7
 DROP TABLE #TEMP8
 DROP TABLE #TEMP9
 DROP TABLE #TEMP_10
 DROP TABLE #TEMP_11
 DROP TABLE #TEMP_12
 DROP TABLE #TEMP_19
 DROP TABLE #TEMP_19_1
 DROP TABLE #TEMP_20
 DROP TABLE #TEMP_21
 DROP TABLE #TEMP_22
 DROP TABLE #TEMP_23
 DROP TABLE #TEMP_24
 DROP TABLE #TEMP_25
 DROP TABLE #PRE_COLLAPSE
 DROP TABLE #COLLAPSE_FINAL
 DROP TABLE #COLLAPSE2
 DROP TABLE #COLLAPSE3
 DROP TABLE #COLLAPSE_3
 DROP TABLE #DL1153_2021_09_NOMINAL
 DROP TABLE #DL1153_2021_09_CONSOLIDADO
 DROP TABLE #TRAMAHIS_CG_09_CONSOLIDADO
 DROP TABLE #TRAMAHIS_CG_09_NOMINAL
 DROP TABLE #ELIMINA_MENOR
 DROP TABLE #TRAMA_CANCER_CONTINUO
 DROP TABLE #TEMPORAL_2

--=============================================================================
 DROP TABLE #TRAMAHISMINSA_202106_20210720
SELECT
	N.ANIO + RIGHT('00' + N.MES, 2) AS ANIOMES,
	MP.ID_TIPO_DOCUMENTO_PACIENTE 	AS ID_TIPO_DOC,
	MP.ID_GENERO					AS ID_GENERO,
	N.CODIGO_ITEM 					AS COD_ITEM,
	N.VALOR_LAB						AS VALOR_LAB,
	N.TIPO_DIAGNOSTICO				AS ID_TIPITEM,
	ME.CODIGO_UNICO					AS RENAES,
	N.EDAD_REG,
	N.ID_CITA,
	N.FECHA_REGISTRO,

	MP.NUMERO_DOCUMENTO_PACIENTE 	AS NUM_DOC,
	N.FECHA_ATENCION 				AS FECHA_CITA,
	N.FECHA_ATENCION 				AS PERIODO,
	(MP.APELLIDO_PATERNO_PACIENTE + ' ' + MP.APELLIDO_MATERNO_PACIENTE + ' ' + MP.NOMBRES_PACIENTE) AS PACIENTE
INTO
	#TRAMAHISMINSA_202106_20210720
FROM
	NOMINAL_TRAMA_NUEVO AS N
		INNER JOIN MAESTRO_PACIENTE AS MP
			ON N.ID_PACIENTE = MP.ID_PACIENTE
		INNER JOIN MAESTRO_HIS_ESTABLECIMIENTO AS ME
			ON N.ID_ESTABLECIMIENTO = ME.ID_ESTABLECIMIENTO

--=============================================================================
 DROP TABLE #PADRON_NOMINAL_30062021
SELECT
	DNI AS [NU_DNI_MENOR]
	, CNV AS NU_CNV
	, (APELLIDO_PATERNO_MENOR + ' ' + APELLIDO_MATERNO_MENOR + ' ' + NOMBRES_MENOR) AS [NIÑO PADRON]
	, FECHA_DE_NACIMIENTO_MENOR AS [FE_NAC_MENOR]
	, UBIGEO_DISTRITO AS CO_UBIGEO_INEI
	, PROVINCIA
	, DISTRITO
	, TI_DOC_IDENTIDAD = CASE	WHEN CHARINDEX('1', TIPO_DOCUMENTO, 1) != 0 THEN '1'
							WHEN CHARINDEX('3', TIPO_DOCUMENTO, 1) != 0 THEN '3'
					END
	, TI_SEGURO_MENOR = CASE WHEN CHARINDEX('1', TIPO_DE_SEGURO, 1) != 0 THEN '1'
					WHEN CHARINDEX('2', TIPO_DE_SEGURO, 1) != 0 THEN '2'
					WHEN CHARINDEX('3', TIPO_DE_SEGURO, 1) != 0 THEN '3'
					WHEN CHARINDEX('4', TIPO_DE_SEGURO, 1) != 0 THEN '4'
					ELSE '9'
					END
	-- , TI_SEGURO_MENOR = CASE WHEN CHARINDEX('1', TIPO_DE_SEGURO, 1) != 0 THEN 'MINSA'
	--				 WHEN CHARINDEX('2', TIPO_DE_SEGURO, 1) != 0 THEN 'ESSALUD'
	--				 WHEN CHARINDEX('3', TIPO_DE_SEGURO, 1) != 0 THEN 'SANIDAD FFAA/PNP'
	--				 WHEN CHARINDEX('4', TIPO_DE_SEGURO, 1) != 0 THEN 'PRIVADO'
	--				 ELSE 'SIN REGISTRO'
	--				 END
INTO
	#PADRON_NOMINAL_30062021
FROM
	PADRON_NOMINAL
--=============================================================================
 DROP TABLE #RENAES
SELECT
	*
INTO
	#RENAES
FROM
	RENAES_20210720
--=============================================================================
 DROP TABLE #CNV_20210710
SELECT
    YEAR(FECHA_PARTO) AS [AÑO CNV]
	, RIGHT(CONCAT('00', MONTH(FECHA_PARTO)), 2) + ' - ' + UPPER(DATENAME(MM, '01/' + CAST(MONTH(FECHA_PARTO) AS NVARCHAR) + '/2021')) AS [MES EVALUACION CNV]
	, CNV AS [NU_CNV]
    , EESS AS [EESS PARTO]
    , CASE WHEN TIPO_DOC = 'DNI/LE' THEN 1 ELSE 0 END AS [TIP_DOC_MADRE]
	, CONT_DOM_MADRE = 92
	, PAIS_DOM_MADRE = 33
	, TIP_LUGAR_NACIDO = 1
	, COD_EESS_PRENATAL AS CO_LOCAL
	, DPTO_DOM_MADRE = '21'
	, PROV_DOM_MADRE = '04'
	, DIST_DOM_MADRE = '01'
    , DNI_G AS [NU_DOC_MADRE]
    , (APELLIDO_PATERNO_GESTANTE + ' ' + APELLIDO_MATERNO_GESTANTE + ' ' + NOMBRES_GESTANTE) AS GESTANTE
    , EESS_PRENATAL AS [EESS PRENATAL]
    , FECHA_PARTO AS [FE_NACIDO]
    , SEMANAS AS [DUR_EMB_PARTO]
	, PESO_NACIDO
INTO
    #CNV_20210710
FROM
    CNV
WHERE
    (
        DNI_G IS NOT NULL
        OR
        DNI_G != ''
    )
--=============================================================================

-- **** CAMBIAR BASE DE DATOS ACTUALIZADAS **** 
------------------------------------------------------------------------------------
-- REDUCIENDO BASE DE DATOS.
SELECT *
INTO #HIS_MINSA
FROM #TRAMAHISMINSA_202106_20210720
WHERE LTRIM(RTRIM(COD_ITEM)) IN ('88141', '88141.01','87621')
AND ID_TIPEDAD_REG='A' --> EDAD EN A�OS. 
AND ID_GENERO='F' --> MUJERES
AND CONVERT(INT,EDAD_REG) BETWEEN 25 AND 64 --> ENTRE 25 Y 64 A�OS

SELECT * 
INTO #RENAES 
FROM Renaes_20210720

SELECT *
, CEILING([TOTAL_MUJERES_25_64]/2) DEN -->  50% DE MUJERES DE 25 A 64 A�OS AFILIADAS AL SIS (VALOR ENTERO HACIA ARRIBA)
INTO #SIS_CANCER 
FROM (
		SELECT A.*, ISNULL(CONVERT(INT,B.CAMAS),0) CAMAS
		FROM DL1153_2021_06_SISCANCER_2020 A 
		LEFT JOIN
		#RENAES B ON CONVERT(INT,A.EESS_COD)=CONVERT(INT,B.COD_ESTAB)
		WHERE A.FLAG_IND=1
) AS T
WHERE [TOTAL_MUJERES_25_64]>0 --> SOLO ESTABLECIMIENTO CON NUMERO DE MUJERES AFILIADAS DE 25 A 64 MAYOR A 0.

--=================================================================
--	INDICADOR 
--==================================================================

---- DENOMINADOR. 

DECLARE @MES_INICIO INT ,
		@MES_FINAL INT , 
		@YEAR INT

SET @MES_INICIO=1 -- <========= CAMBIAR MES INICIO
SET @MES_FINAL=6 -- <========= CAMBIAR MES FINAL
SET @YEAR=2021 -- <========= CAMBIAR AÑO.

			--- Informaci�n del DEN.
			SELECT *	
			, @YEAR AÑO
			INTO #DEN_2
			FROM #SIS_CANCER 

			--- Resultado Entregado de PAP
			SELECT *, NUM_PAP=1 
			INTO #PAP_2
			FROM (
					SELECT DISTINCT RENAES , CONVERT(VARCHAR,ID_TIPO_DOC)+CONVERT(VARCHAR,NUM_DOC) ID_PERSONA 
 					FROM #HIS_MINSA
					WHERE YEAR(CONVERT(DATE,PERIODO))=@YEAR
					AND MONTH(CONVERT(DATE,PERIODO))>=@MES_INICIO AND MONTH(CONVERT(DATE,PERIODO))<=@MES_FINAL
					AND (CONVERT(INT,EDAD_REG) BETWEEN 25 AND 64)
					AND LTRIM(RTRIM(COD_ITEM))='88141'
					AND LTRIM(RTRIM(VALOR_LAB)) IN ('N','A')
					AND LTRIM(RTRIM(id_tipitem)) IN ('D')
			) AS T 
	
			--- Resultado Entregado de IVAA
			SELECT *, NUM_IVAA=1 
			INTO #IVAA_2
			FROM (
					SELECT DISTINCT RENAES , CONVERT(VARCHAR,ID_TIPO_DOC)+CONVERT(VARCHAR,NUM_DOC) ID_PERSONA 
					FROM #HIS_MINSA
					WHERE YEAR(CONVERT(DATE,PERIODO))=@YEAR
					AND MONTH(CONVERT(DATE,PERIODO))>=@MES_INICIO AND MONTH(CONVERT(DATE,PERIODO))<=@MES_FINAL
					AND (CONVERT(INT,EDAD_REG) BETWEEN 30 AND 49)
					AND LTRIM(RTRIM(COD_ITEM))='88141.01'
					AND LTRIM(RTRIM(VALOR_LAB)) IN ('N','A')
					AND LTRIM(RTRIM(id_tipitem)) IN ('D')
			) AS T

			--- Resultado Entregado de VPH
			SELECT *, NUM_VPH=1 
			INTO #VPH_2 
			FROM (
					SELECT DISTINCT RENAES , CONVERT(VARCHAR,ID_TIPO_DOC)+CONVERT(VARCHAR,NUM_DOC) ID_PERSONA 
					FROM #HIS_MINSA
					WHERE YEAR(CONVERT(DATE,PERIODO))=@YEAR
					AND MONTH(CONVERT(DATE,PERIODO))>=@MES_INICIO AND MONTH(CONVERT(DATE,PERIODO))<=@MES_FINAL
					AND (CONVERT(INT,EDAD_REG) BETWEEN 30 AND 49)
					AND LTRIM(RTRIM(COD_ITEM))='87621'
					AND LTRIM(RTRIM(VALOR_LAB)) IN ('N','A')
					AND LTRIM(RTRIM(id_tipitem)) IN ('D')
			) AS T 
	
			--- Union y distinct de todos los documentos. 
			SELECT DISTINCT RENAES, ID_PERSONA
			INTO #TEMP_2 
			FROM (
					SELECT * FROM #IVAA_2
					UNION ALL
					SELECT * FROM #PAP_2
					UNION ALL
					SELECT * FROM #VPH_2
			) AS T 


			-- NUMERADOR 
			SELECT A.*,
			ISNULL(B.NUM_IVAA,0) NUM_IVAA , 
			ISNULL(C.NUM_PAP,0) NUM_PAP ,
			ISNULL(D.NUM_VPH,0) NUM_VPH
			INTO #TEMP_FINAL_2
			FROM #TEMP_2 A
			LEFT JOIN 
			#IVAA_2 B ON A.renaes=B.renaes AND A.ID_PERSONA=B.ID_PERSONA
			LEFT JOIN 
			#PAP_2 C ON A.renaes=C.renaes AND A.ID_PERSONA=C.ID_PERSONA
			LEFT JOIN 
			#VPH_2 D ON A.renaes=D.renaes AND A.ID_PERSONA=D.ID_PERSONA


		--- NUMERADOR FINAL 
		select renaes, count(*) Casos, sum(NUM_IVAA) num_ivaa, sum(num_pap) num_pap, sum(num_vph) num_vph 
		into #NUM_2
		from #TEMP_FINAL_2
		group by renaes 

		--- INDICADOR FINAL. 
		SELECT A.*, ISNULL(B.Casos,0) NUM , ISNULL(B.NUM_IVAA,0) NUM_IVAA , ISNULL(B.NUM_PAP,0) NUM_PAP , ISNULL(B.NUM_VPH,0) NUM_VPH
		INTO #TEMPORAL_2 
		FROM #DEN_2 A 
		LEFT JOIN
		#NUM_2 B ON CONVERT(INT,A.EESS_COD)=CONVERT(INT,B.renaes)

		SELECT DIRIS, DEPARTAMENTO, PROVINCIA, DISTRITO, UBIGEO, EESS_CAT, TRY_CONVERT(INT,EESS_COD) EESS_RENAES
		, EESS_NOMBRE, CONVERT(INT,CAMAS) CAMAS, AÑO, CONVERT(INT,[TOTAL_MUJERES_25_64]) DEN_TOTAL, CONVERT(INT,DEN) DEN , NUM , NUM_IVAA, NUM_PAP, NUM_VPH	
		INTO #TRAMA_CANCER_CONTINUO
		FROM #TEMPORAL_2

SELECT * from  #TRAMA_CANCER_CONTINUO