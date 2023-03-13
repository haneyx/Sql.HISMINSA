/*==============================================================================
	Indicadores DL1153

Nombre: Porcentaje de gestantes con paquete preventivo completo. 
Sintaxis:

Numerador:Total de mujeres del denominador que reciben (1) al menos una entrega de ácido fólico en el primer trimestre; (2) haber realizado en el primer trimestre del embarazo,
 al menos una vez, los siguientes exámenes auxiliares: hemoglobina o hematocrito + examen de orina + tamizaje para descarte de sífilis + tamizaje para descarte de VIH;
  (3) al menos 6 atenciones prenatales en el transcurso del embarazo; y (4) al menos 4 entregas de suplemento (compuesto por sulfato ferroso + ácido fólico) en el transcurso del embarazo.

		Sintaxis: Número de mujeres del denominador que reciben:
		1. Al menos una entrega de ácido fólico en el primer trimestre del embarazo CPMS: 59401.03 ò CIE: Z298 con LAB: AF o (AF1-AF7) 
		Y
		2. Haber realizado en el primer trimestre del embarazo al menos una vez, los siguientes exámenes auxiliares:
		2.1 Exámenes auxiliares con tipo de diagnóstico "D": hemoglobina CPMS: 85018 ò Z017; examen de orina CPMS: 81002 ò 81007 o 82044;
		 tamizaje para descarte de sífilis CPMS: 86593 o 86780 ò 86592; tamizaje para descarte de VIH CPMS: 86703.
		Ó
		2.2 Perfil obstétrico (hasta la semana gestacional 17) CPMS: 80055.01 ò CIE: Z0177 con tipo de diagnóstico "D".
		Y
		3. Al menos 6 atenciones prenatales en el transcurso del embarazo CPMS: Z3491 ò Z3492 ò Z3493 ò Z3591 ò Z3592 ò Z3593.
		Y
		4. Al menos 4 entregas de suplemento (compuesto por sulfato ferroso + ácido fólico) en el transcurso del embarazo CPMS: 59401.04 ò CIE: Z298 con LAB: SF1...SF4 ò O990 + U310 con LAB: 1...4.
		*Las prestaciones evaluadas en los puntos 1., 2.1, 2.2 y 4. Deben registrar además algún código de control de embarazo
		 (CIE: Z349 ó Z359) o de atención prenatal (Z3491 ó Z3492 ó Z3493 ó Z3591 ó Z3592 ó Z3593) en la cita de la prestación.

Denominador: Total de partos institucionales de mujeres cuya edad gestacional es mayor o igual a 37 semanas, en una IPRESS del Minsa o Gobierno regional,
en el periodo de evaluación, registrados con DNI según la base de datos del CNV en línea 

		Sintaxis: Suma de DNIs únicos de mujeres con parto institucional, con edad gestacional mayor o igual a 37 semanas, en una IPRESS del Minsa o Gobierno regional,
		en el periodo de evaluación según la base de datos del CNV.

Fuente: HIS
Ámbito de medición: IPRESS.
Periodicidad: Mensual
==============================================================================*/

USE BDHIS_MINSA
GO

/*
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CNV' AND TABLE_SCHEMA = 'dbo')  
    DROP TABLE #CNV  
GO

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
 DROP TABLE #DL1153_2021_05_NOMINAL
 DROP TABLE #DL1153_2021_05_CONSOLIDADO
 DROP TABLE #TRAMAHIS_CG_05_CONSOLIDADO
 DROP TABLE #TRAMAHIS_CG_05_NOMINAL
 DROP TABLE #ELIMINA_MENOR
 */
--=============================================================================
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CNV' AND TABLE_SCHEMA = 'dbo')
DROP TABLE #TRAMAHISMINSA_202106_20210720
GO

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

DECLARE @MES_INICIO INT ,
		@MES_FINAL INT , 
		@YEAR INT

SET @MES_INICIO=1 -- <========= CAMBIAR MES INICIO
SET @MES_FINAL=6 -- <========= CAMBIAR MES FINAL
SET @YEAR=2021 -- <========= CAMBIAR AÑO.

-- **** CAMBIAR BASE DE DATOS ACTUALIZADAS **** 
------------------------------------------------------------------------------------
-- REDUCIENDO BASE DE DATOS.
--SELECT * 
--INTO #CNV
--FROM BD_HISINDICADORES.DBO.CNV_20210610
--WHERE NU_DOC_MADRE IS NOT NULL  -- NO SE CONSIDERAN DOCUMENTOS NULOS 
--AND NU_DOC_MADRE NOT IN ('','NULL')  -- NO SE CONSIDERAN DOCUMENTOS VACIOS. 
--AND TRY_CONVERT(INT,TIP_DOC_MADRE)=1 -- SE CONSIDERAN SOLO TIPO DE DOCUMENTO: DNI. 
--AND CONT_DOM_MADRE='92' AND PAIS_DOM_MADRE='33' --> SOLO PARTOS DE GESTANTES DOMICILIADAS EN PERÚ.
--AND MONTH(CONVERT(DATE,FE_NACIDO))>=@MES_INICIO
--AND MONTH(CONVERT(DATE,FE_NACIDO))<=@MES_FINAL
--AND YEAR(CONVERT(DATE,FE_NACIDO))=@YEAR
--AND len(replace(ltrim(rtrim(NU_DOC_MADRE)),LEFT(ltrim(rtrim(NU_DOC_MADRE)),1),''))>0
--AND TRY_CONVERT(INT,NU_DOC_MADRE) IS NOT NULL 

-- SELECT *
-- INTO #RENAES
-- FROM BD_HISINDICADORES.DBO.Renaes_20210720

select ndoc DNI, fecha_nac, ubigeoreniec , MAX(semana_nac) semana_nac 
into #cnv
from (
		select
		LTRIM(rtrim(NU_DOC_MADRE)) ndoc 
		,convert(date,fe_nacido) fecha_nac 
		, convert(int,dur_emb_parto) semana_nac
		, DPTO_DOM_MADRE + PROV_DOM_MADRE + DIST_DOM_MADRE ubigeoreniec 
		from #CNV_20210710
		where 
		convert(int,TIP_DOC_MADRE)=1  -- SE CONSIDERAN SOLO TIPO DE DOCUMENTO: DNI.
		and try_convert(int,CONT_DOM_MADRE)=92 and try_convert(int,PAIS_DOM_MADRE)=33   --> SOLO PARTOS DE GESTANTES DOMICILIADAS EN PERÚ.
		and convert(int,dur_emb_parto)>=37 and dur_emb_parto is not null --> PARTOS CON EDAD GESTACIONAL MAYOR O IGUAL A 37 SEMANAS.
		and convert(int,tip_lugar_nacido)=1 --> PARTOS REALIZADOS EN ESTABLECIMIENTOS DE SALUD. 
		and convert(int,co_local) in (select distinct convert(int,COD_ESTAB) from #renaes where convert(int,ambito)=1)  --> PARTOS REALIZADOS EN ESTABLECIMIENTOS DEL MINSA.
		and month(convert(date,fe_nacido))>=@mes_inicio
		and month(convert(date,fe_nacido))<=@mes_final
		and year(convert(date,fe_nacido))=@year
) as t group by ndoc, fecha_nac, ubigeoreniec

SELECT *
INTO #2020
FROM #TRAMAHISMINSA_202106_20210720
WHERE YEAR(CONVERT(DATE,PERIODO))=@YEAR-1
AND LTRIM(RTRIM(COD_ITEM)) IN (
								'59401.03','Z298'
								,'85018','Z017','85018.01','81002','81007','82044','81000.02','86593','86780'
								,'86592','86318.01','86703','86703.02','87389','86318.01','80055.01','Z0177'
								,'Z3491','Z3492','Z3493','Z3591','Z3592','Z3593','Z359','Z349'
								,'59401.04','U310','O990','99199.17','99199.11','99199.26')
AND CONVERT(INT,id_tipo_doc)=1 
AND len(replace(ltrim(rtrim(NUM_DOC)),LEFT(ltrim(rtrim(NUM_DOC)),1),''))>0
AND TRY_CONVERT(INT,NUM_DOC) IS NOT NULL 

SELECT *
INTO #2021
FROM #TRAMAHISMINSA_202106_20210720
WHERE YEAR(CONVERT(DATE,PERIODO))=@YEAR
AND MONTH(CONVERT(DATE,PERIODO))>=@MES_INICIO AND MONTH(CONVERT(DATE,PERIODO))<=@MES_FINAL
AND LTRIM(RTRIM(COD_ITEM)) IN (
								'59401.03','Z298'
								,'85018','Z017','85018.01','81002','81007','82044','81000.02','86593','86780'
								,'86592','86318.01','86703','86703.02','87389','86318.01','80055.01','Z0177'
								,'Z3491','Z3492','Z3493','Z3591','Z3592','Z3593','Z359','Z349'
								,'59401.04','U310','O990','99199.17','99199.11','99199.26')
AND CONVERT(INT,id_tipo_doc)=1 
AND len(replace(ltrim(rtrim(NUM_DOC)),LEFT(ltrim(rtrim(NUM_DOC)),1),''))>0
AND TRY_CONVERT(INT,NUM_DOC) IS NOT NULL 

------------------------------------------------------------------------------------

--================
-- CNV
--================
--1. Variables del CNV elegidas para el indicador. 
--SELECT 
--NU_DOC_MADRE DNI
--, TIP_DOC_MADRE TDOC
--, MONTH(CONVERT(DATE,FE_NACIDO)) MES
--, AÑO=@YEAR
--, CONVERT(DATE,FE_NACIDO) FECHA_NAC
--, TIP_PARTO
--, CONVERT(INT,DUR_EMB_PARTO) SEMANA_NAC
--, TIP_LUGAR_NACIDO
--, CO_LOCAL RENAES 
--, DPTO_DOM_MADRE + PROV_DOM_MADRE + DIST_DOM_MADRE UBIGEORENIEC
--INTO #CNV2 
--FROM #CNV
--WHERE CONVERT(INT,DUR_EMB_PARTO)>=37  --> PARTOS CON EDAD GESTACIONAL MAYOR O IGUAL A 37 SEMANAS. 
--AND DUR_EMB_PARTO IS NOT NULL 
--AND CONVERT(INT,TIP_LUGAR_NACIDO)=1 --> PARTOS REALIZADOS EN ESTABLECIMIENTOS DE SALUD. 

--- eliminar niño ---
				select DNI
					,min(fecha_nac) minfecha_nac
					--,min(semanas_embarazo) as semanas_embarazo
				into #elimina_menor
				from #cnv
				where convert(varchar,DNI)+'-'+convert(varchar(6), month(fecha_nac),112)+ubigeoreniec
											in (select DNI+'-'+convert(varchar(6), month(fecha_nac),112)+ubigeoreniec
												from #cnv
												group by DNI+'-'+convert(varchar(6), month(fecha_nac),112)+ubigeoreniec
												having count(*) >1
												)
				group by DNI
				--------------------------------------------

delete from #cnv
where convert(varchar,DNI)+'-'+convert(varchar(8),fecha_nac,112) 		IN (
			select convert(varchar,DNI)+'-'+convert(varchar(8),minfecha_nac,112) ---+'_'+convert(varchar(5),semanas_embarazo)
			FROM #elimina_menor
			)


--2. Estableciento la ubicacion de residencia segun CNV y Partos en Establecimientos del MINSA Y REGIONALES.
SELECT *
INTO #CNV_FINAL
FROM (
	SELECT 
	A.* 
	, B.UBIGEO
	, CASE WHEN B.DESC_DPTO='LIMA' AND B.DESC_PROV NOT IN ('LIMA') THEN 'LIMA PROVINCIAS'
			WHEN B.DESC_DPTO='LIMA' AND B.DESC_PROV IN ('LIMA') THEN 'LIMA METROPOLITANA'
			ELSE B.DESC_DPTO END DESC_DPTO 
	, B.DESC_PROV
	, B.DESC_DIST
	, B.DIRIS
	, B.RED
	, MONTH(A.fecha_nac) MES
	, YEAR(A.FECHA_NAC) AÑO
	, DEN=1
	--, C.AMBITO
	FROM #CNV A 
	INNER JOIN 
	Maestro_UBIGEO_20200407 B ON CONVERT(INT,A.UBIGEORENIEC)=CONVERT(INT,B.UBIGEORENIEC)
	--INNER JOIN 
	--#Renaes C ON CONVERT(INT,A.RENAES)=CONVERT(INT,C.COD_ESTAB)
) AS T 
--WHERE CONVERT(INT,AMBITO)=1 --> PARTOS EN ESTABLECIMIENTOS DEL MINSA. 


-- LIMPIANDO DUPLICADOS. (DNIS UNICOS) 
--SELECT * 
--, DEN=1 
--INTO #CNV_FINAL 
--FROM (
--		SELECT *
--		, ROW_NUMBER() OVER (PARTITION BY DNI, MES ORDER BY FECHA_NAC DESC) ID_3
--		FROM (
--				SELECT * 
--				FROM (
--						SELECT *
--						, ROW_NUMBER() OVER (PARTITION BY DNI, MES, FECHA_NAC ORDER BY SEMANA_NAC DESC) ID_2 
--						FROM (
--								SELECT * 
--								FROM (
--										SELECT *
--										, ROW_NUMBER() OVER (PARTITION BY DNI, FECHA_NAC, SEMANA_NAC ORDER BY DNI) ID_1
--										FROM #CNV3
--								) AS T0
--								WHERE ID_1=1 
--						) AS T1 
--				) AS T2
--				WHERE ID_2=1
--		) AS T3
--) AS T2 WHERE ID_3=1 

--ALTER TABLE #CNV_FINAL DROP COLUMN ID_1, ID_2 ,ID_3, UBIGEORENIEC 

--================-- ´HIS MINSA
--================
SELECT 
CONVERT(VARCHAR,ID_CITA) COLLATE SQL_Latin1_General_CP1_CI_AS ID_CITA
, CONVERT(DATE,PERIODO) FECHA_ATENDIDO
, NUM_DOC COLLATE SQL_Latin1_General_CP1_CI_AS DNI
, LTRIM(RTRIM(ID_TIPITEM)) COLLATE SQL_Latin1_General_CP1_CI_AS TIPO
, LTRIM(RTRIM(COD_ITEM)) COLLATE SQL_Latin1_General_CP1_CI_AS COD_ITEM
, LTRIM(RTRIM(VALOR_LAB)) COLLATE SQL_Latin1_General_CP1_CI_AS VALOR_LAB 
INTO #HIS_MINSA
FROM #2020

INSERT INTO #HIS_MINSA
SELECT 	
CONVERT(VARCHAR,ID_CITA) ID_CITA
, CONVERT(DATE,PERIODO) FECHA_ATENDIDO
, NUM_DOC COLLATE SQL_Latin1_General_CP1_CI_AS DNI
, LTRIM(RTRIM(ID_TIPITEM)) TIPO
, LTRIM(RTRIM(COD_ITEM)) COD_ITEM
, LTRIM(RTRIM(VALOR_LAB)) VALOR_LAB 
FROM #2021

--==========================
-- ATENDIDOS
--=========================
--UNION DE BASE DE HIS Y CNV
SELECT *		
INTO #ATENDIDOS 
FROM (
		SELECT  A.*
		, B.FECHA_ATENDIDO
		, B.ID_CITA
		, B.TIPO
		, B.COD_ITEM
		, B.VALOR_LAB
		FROM #CNV_FINAL A 
		LEFT JOIN 
		#HIS_MINSA B ON TRY_CONVERT(INT,A.DNI)=TRY_CONVERT(INT,B.DNI) 
) AS T 

---*** GENERACION DE SEMANAS DE GESTANTE (TRIMESTRES GESTANTES) ***---INTO #atendidos_0
SELECT *
, DATEADD(DD,97 - SEMANA_NAC*7,FECHA_NAC) FECHA_TRIMESTRE_1  --> TRIMESTRE 1 = 13 SEMANAS + 6 dias = 97 DIAS. (ESTIMACION)
, DATEADD(DD,195 - SEMANA_NAC*7,FECHA_NAC) FECHA_TRIMESTRE_2 --> TRIMESTRE 2 = 27 SEMANAS + 6 dias = 195 DIAS. (ESTIMACION)
, DATEADD(DD,-((SEMANA_NAC*7)+6),FECHA_NAC) FECHA_CORTE
INTO #TEMP1 
FROM #ATENDIDOS 

--*** GENERACION DE ATENCION DE GESTANTES POR CITA *****
SELECT * 
, MAX(TEMP_GEST) OVER (PARTITION BY ID_CITA, DNI) DUMMY_GESTANTE 
INTO #TEMP2
FROM (
		SELECT *
		,IIF(COD_ITEM IN ('Z349','Z3491','Z3492','Z3493'
						,'Z359','Z3591','Z3592','Z3593'),1,0) TEMP_GEST
		FROM #TEMP1
) AS T

--================================================================
--                      INDICADORES 
--================================================================

--1. ENTREGA DE ACIDO FOLICO EN EL PRIMER TRIMESTRE.
SELECT *
,IIF (FECHA_TRIMESTRE_1>=FECHA_ATENDIDO
AND DEN=1 
AND FECHA_ATENDIDO<FECHA_NAC 
AND FECHA_ATENDIDO IS NOT NULL
AND FECHA_TRIMESTRE_1 IS NOT NULL
AND DUMMY_GESTANTE=1
AND FECHA_ATENDIDO>=FECHA_CORTE 
AND ( 
	(COD_ITEM IN ('59401.03')) 
	OR 
	(COD_ITEM IN ('Z298') AND VALOR_LAB IN ('AF','AF1','AF2','AF3','AF4','AF5','AF6','AF7'))
	)
, 1, 0) TEMP_EXAM_1 
INTO #TEMP3
FROM #TEMP2 

--2. REALIZAR LOS SIGUIENTES EXMAMENES. Examenes auxiliares o perfil obstetrico. 
SELECT *
,IIF (FECHA_TRIMESTRE_1>=FECHA_ATENDIDO AND DEN=1  AND FECHA_ATENDIDO IS NOT NULL AND FECHA_TRIMESTRE_1 IS NOT NULL AND FECHA_ATENDIDO<FECHA_NAC  AND FECHA_ATENDIDO>=FECHA_CORTE 
													AND DUMMY_GESTANTE=1 AND TIPO='D'AND COD_ITEM IN ('85018','Z017','85018.01'),1,0) temp_Exam_hemoglobina
,IIF (FECHA_TRIMESTRE_1>=FECHA_ATENDIDO AND DEN=1 AND FECHA_ATENDIDO IS NOT NULL AND FECHA_TRIMESTRE_1 IS NOT NULL AND FECHA_ATENDIDO<FECHA_NAC AND FECHA_ATENDIDO>=FECHA_CORTE 
											AND DUMMY_GESTANTE =1 AND TIPO='D'AND COD_ITEM IN ('81002','81007','82044','81000.02'),1,0) temp_Exam_orina
,IIF (FECHA_TRIMESTRE_1>=FECHA_ATENDIDO AND DEN=1 AND FECHA_ATENDIDO IS NOT NULL AND FECHA_TRIMESTRE_1 IS NOT NULL AND FECHA_ATENDIDO<FECHA_NAC AND FECHA_ATENDIDO>=FECHA_CORTE 
											AND DUMMY_GESTANTE =1 AND TIPO='D'AND COD_ITEM IN ('86593','86780','86592','86318.01'),1,0) temp_Exam_sifilis
,IIF (FECHA_TRIMESTRE_1>=FECHA_ATENDIDO AND DEN=1 AND FECHA_ATENDIDO IS NOT NULL AND FECHA_TRIMESTRE_1 IS NOT NULL AND FECHA_ATENDIDO<FECHA_NAC AND FECHA_ATENDIDO>=FECHA_CORTE 		 		
															AND DUMMY_GESTANTE =1 AND TIPO='D'AND COD_ITEM IN ('86703','86703.02','87389','86318.01'),1,0) temp_Exam_vih
,IIF (DATEADD(DD,28,FECHA_TRIMESTRE_1)>=FECHA_ATENDIDO AND DEN=1 AND FECHA_ATENDIDO IS NOT NULL	AND FECHA_TRIMESTRE_1 IS NOT NULL AND FECHA_ATENDIDO<FECHA_NAC AND FECHA_ATENDIDO>=FECHA_CORTE  
															AND DUMMY_GESTANTE =1 AND TIPO='D'AND COD_ITEM IN ('80055.01','Z0177'),1,0) temp_exam_bateria
INTO #TEMP4
FROM #TEMP3

--3. Realizar al menos 6 atenciones prenatales en el transcurso del embarazo.
SELECT *
, IIF(
		DEN=1  
		AND FECHA_ATENDIDO<FECHA_NAC 
		AND FECHA_ATENDIDO IS NOT NULL AND FECHA_ATENDIDO>=FECHA_CORTE 
		AND COD_ITEM IN ('Z3491','Z3492','Z3493','Z3591','Z3592','Z3593'),1,0) temp_prenatal
INTO #TEMP5
FROM #TEMP4

--4. Al menos 4 entregas de suplementos en el transcurso del embarazo. 
--- ***** ATENCION SUPLEMENTO *****
SELECT *
, MAX(IIF(COD_ITEM='O990',1,0)) OVER (PARTITION BY ID_CITA, DNI) TEMP_SUP
INTO #TEMP6
FROM #TEMP5

SELECT *
, IIF(
		DEN=1  
		AND FECHA_ATENDIDO<FECHA_NAC 
		AND FECHA_ATENDIDO IS NOT NULL
		AND FECHA_ATENDIDO>=FECHA_CORTE 
		AND DUMMY_GESTANTE=1 
		AND (
			COD_ITEM IN ('59401.04')
			OR 
			COD_ITEM IN ('99199.26')
			OR 
			(
			
					COD_ITEM IN ('Z298','99199.17') AND VALOR_LAB IN ('SF','SF1','SF2','SF3','SF4','SF5','SF6','SF7','SF8','SF9','S10','S11','S12'
													,'P0','P01','P02','P03','P04','P05','P06','P07','P08','P09'
													,'PO','PO1','PO2','PO3','PO4','PO5','PO6','PO7','PO8','PO9','P10','P11','P12') 
			)
			OR 
			(
				(
					(COD_ITEM IN ('U310','99199.11') AND (TRY_CONVERT(INT,VALOR_LAB) IN ('1','2','3','4','5','6','7','8','9','10','11','12')
												OR VALOR_LAB  IN ('SF','SF1','SF2','SF3','SF4','SF5','SF6','SF7','SF8','SF9','S10','S11','S12'
																	,'P0','P01','P02','P03','P04','P05','P06','P07','P08','P09'
																	,'PO','PO1','PO2','PO3','PO4','PO5','PO6','PO7','PO8','PO9','P10','P11','P12')))
				) AND TEMP_SUP=1 							
			)
		),1,0) TEMP_SUPLEMENTO 
INTO #TEMP7
FROM #TEMP6

--================================================================
--                      INDICADORES 
--===============================================================

SELECT
FECHA_ATENDIDO
, DNI
, UBIGEO
, DESC_DPTO 
, desc_prov 
, desc_dist 
, DIRIS
, RED
, AÑO
, MES 
, MAX(DEN) DEN, MAX(TEMP_EXAM_1) sup_afolico
, MAX(TEMP_EXAM_HEMOGLOBINA) ex_aux_hemoglobina, MAX(TEMP_EXAM_ORINA) ex_aux_orina, MAX(TEMP_EXAM_SIFILIS) ex_aux_sifilis, MAX(TEMP_EXAM_VIH) ex_aux_vih, MAX(TEMP_EXAM_BATERIA) ex_bateria
, MAX(temp_prenatal) prenatal
, MAX(temp_suplemento) sup_compuesto
INTO #TEMP8
FROM #TEMP7
GROUP BY 
FECHA_ATENDIDO
, DNI
, UBIGEO
, DESC_DPTO 
, desc_prov 
, desc_dist 
, DIRIS
, RED
, AÑO
, MES 


SELECT
 DNI
, UBIGEO
, DESC_DPTO 
, desc_prov 
, desc_dist 
, DIRIS
, RED
, AÑO
, MES 
, MAX(DEN) DEN, SUM(sup_afolico) sup_afolico
, MAX(ex_aux_hemoglobina) ex_aux_hemoglobina, MAX(ex_aux_orina) ex_aux_orina, MAX(ex_aux_sifilis) ex_aux_sifilis, MAX(ex_aux_vih) ex_aux_vih, MAX(ex_bateria) ex_bateria
, SUM(prenatal) prenatal
, SUM(sup_compuesto) sup_compuesto
INTO #TEMP9
FROM #TEMP8
GROUP BY 
 DNI
, UBIGEO
, DESC_DPTO 
, desc_prov 
, desc_dist 
, DIRIS
, RED
, AÑO
, MES 


--==========================
-- GENERACION INDICADORES2
--=========================
--Indicador
select *,
IIF(num1=1 and num2=1 and num3=1 and num4_c=1,1,0) num
,IIF(num1=1 and num2=1 and num3=1 and num4_a=1,1,0) num_a, IIF(num1=1 and num2=1 and num4_a=1,1,0) num_124_a,IIF(num2=1 and num3=1 and num4_a=1,1,0) num_234_a
,IIF(num1=1 and num2=1 and num3=1 and num4_b=1,1,0) num_b, IIF(num1=1 and num2=1 and num4_b=1,1,0) num_124_b, IIF(num2=1 and num3=1 and num4_b=1,1,0) num_234_b
,IIF(num1=1 and num2=1 and num4_c=1,1,0) num_124_c, IIF(num2=1 and num3=1 and num4_c=1,1,0) num_234_c 
into #DL1153_2021_05_NOMINAL
from(
	select *, 
	IIF(sup_compuesto>=6,1,0) num4_a, IIF(sup_compuesto>=5,1,0) num4_b, IIF(sup_compuesto>=4,1,0) num4_c 
	from (
		select *, 
		IIF(num1=1 and num2=1 and num3=1,1,0) num_123, IIF(num2=1 and num3=1,1,0) num_23 
		from (
			select *, 
			IIF(ex_bateria=1 or ex_aux=1,1,0) num2, IIF(prenatal>=6,1,0) num3 
			from (
				select * , 
				iif(sup_afolico>=1,1,0) num1 ,
				iif(ex_aux_hemoglobina=1 and ex_aux_orina=1 and ex_aux_sifilis=1 and ex_aux_vih=1,1,0) ex_aux,
				iif(ex_aux_hemoglobina=1 and ex_aux_orina=1 and ex_aux_sifilis=1,1,0) ex_aux_hos,
				iif(ex_aux_hemoglobina=1 and ex_aux_orina=1 and ex_aux_vih=1,1,0) ex_aux_hov,
				iif(ex_aux_hemoglobina=1 and ex_aux_sifilis=1 and ex_aux_vih=1,1,0) ex_aux_hsv,
				iif(ex_aux_orina=1 and ex_aux_sifilis=1 and ex_aux_vih=1,1,0) ex_aux_osv
			    from #TEMP9
			)as t0
		)as t1
	) as t2
 ) as t3


 --==========================
-- COLLAPSE2
--=========================
select ubigeo, desc_dpto, desc_prov, desc_dist, diris, red ,mes ,año,
sum(den) denominador,  SUM(num) numerador, SUM(num1) num1, SUM(num2) num2, SUM(num3) num3, SUM(num_123) num_123, SUM(num_23) num_23, 
SUM(num4_a) num4_a, SUM(num_a) num_a, SUM(num_124_a) num_124_a, SUM(num_234_a) num_234_a , 
SUM(num4_b) num4_b, SUM(num_b) num_b, SUM(num_124_b) num_124_b, SUM(num_234_b) num_234_b ,
SUM(num4_c) num4_c, SUM(num_124_c) num_124_c, SUM(num_234_c) num_234_c 
into #collapse_3
from #DL1153_2021_05_NOMINAL
group by ubigeo, desc_dpto, desc_prov, desc_dist, diris, red ,mes ,año


--*********************************************************************************************************************************
-- CALCULO DE NOMINALES
--*********************************************************************************************************************************
SELECT
	N.*
	, MES = case
when N.mes=1 then 'ENERO'
when N.mes=2 then 'FEBRERO'
when N.mes=3 then 'MARZO'
when N.mes=4 then 'ABRIL'
when N.mes=5 then 'MAYO'
when N.mes=6 then 'JUNIO'
when N.mes=7 then 'JULIO' 
when N.mes=8 then 'AGOSTO'
when N.mes=9 then 'SETIEMBRE'
when N.mes=10 then 'OCTUBRE'
when N.mes=11 then 'NOVIEMBRE'
when N.mes=12 then 'DICIEMBRE' end
	, P.[NIÑO PADRON]
FROM
	#DL1153_2020_05_NOMINAL AS N
		LEFT JOIN #CNV_20210710 AS P
			ON N.DNI = P.NU_DOC_MADRE
--*********************************************************************************************************************************


--==============================
--BASE FINAL 
--==============================
select ubigeo, desc_dpto departamento, desc_prov provincia, desc_dist distrito, diris, red, año,
mes= case
when mes=1 then 'Enero'
when mes=2 then 'Febrero'
when mes=3 then 'Marzo'
when mes=4 then 'Abril'
when mes=5 then 'Mayo'
when mes=6 then 'Junio'
when mes=7 then 'Julio' 
when mes=8 then 'Agosto'
when mes=9 then 'Setiembre'
when mes=10 then 'Octubre'
when mes=11 then 'Noviembre'
when mes=12 then 'Diciembre' end, denominador, numerador, num1, num2, num3, num_123, num_23, num4_a, num_a, num_124_a, num_234_a , 
num4_b, num_b, num_124_b, num_234_b ,num4_c, num_124_c, num_234_c
INTO #DL1153_2021_05_CONSOLIDADO
from #collapse_3

SELECT * FROM #DL1153_2021_05_CONSOLIDADO
