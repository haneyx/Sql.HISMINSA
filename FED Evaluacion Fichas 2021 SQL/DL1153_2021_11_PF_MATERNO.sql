/*==============================================================================
	Indicadores DL1153

Nombre: Porcentaje de mujeres que acceden a m�todos de planificaci�n familiar post parto institucional 
Sintaxis:

Numerador. Total de mujeres que accedieron al uso de m�todos anticonceptivos en una IPRESS despu�s de tener un parto institucional hasta los 42 d�as post parto (2 control puerperal) 
considerando los siguientes m�todos anticonceptivos: DIU, implante, inyectable trimestral, preservativos masculinos, preservativos femeninos y ligadura de trompas.

Sintaxis: N�mero de mujeres del denominador que reciben un m�todo anticonceptivo luego de tener un parto institucional va desde el intraparto hasta los 42 d�as de puerperio. p
udiendo ser seg�n su codificaci�n los siguientes m�todos anticonceptivos:

� Ligadura de trompa(s) cuando se realiza al mismo tiempo que la ces�rea tipo de diagn�stico �D� CPMS 58611
� Ligadura de trompa(s) cuando se realiza durante la misma hospitalizaci�n post parto vaginal CPMS 58605 tipo de diagn�stico �D�
� Ces�rea, incluyendo atenci�n postparto tipo de diagn�stico �D� CPMS 59515 + Inserci�n de Implante tipo de diagn�stico �D� CPMS 11975 � Inserci�n de dispositivo intrauterino (DIU) tipo de diagn�stico �D� CPMS 58300 � Administraci�n y uso de m�todo inyectable 
Trimestral tipo de diagn�stico �D� CPMS 99208.05 � Provisi�n de preservativos masculinos tipo de diagn�stico �D� CPMS 99208.02 � Provisi�n de preservativos femeninos tipo de diagn�stico �D� CPMS 99208.06.

� Atenci�n de parto vaginal (con o sin episiotom�a), incluyendo atenci�n postparto CPMS 59410 + Inserci�n de Implante CPMS 11975 � Inserci�n de dispositivo intrauterino CPMS (DIU) 58300 � 
Administraci�n y uso de m�todo inyectable Trimestral CPMS 99208.05 � Provisi�n de preservativos masculinos CPMS 99208.02 � Provisi�n de preservativos femeninos CPMS 99208.06

*Atenci�n postparto Control de pu�rpera c�digo CPMS 59430 tipo de diagn�stico �D� Lab �2� + Inserci�n de Implante tipo de diagn�stico �D� CPMS 11975 � Inserci�n de dispositivo intrauterino (DIU) tipo de diagn�stico �D� CPMS 58300 � Administraci�n 
y uso de m�todo inyectable Trimestral tipo de diagn�stico �D� CPMS 99208.05 � Provisi�n de preservativos masculinos tipo de diagn�stico �D� CPMS 99208.02 � Provisi�n de preservativos femeninos tipo de diagn�stico �D� CPMS 99208.06.

Denominador: Total de partos institucionales de mujeres de cualquier edad gestacional, en una IPRESS del MINSA o Gobierno Regional, en el periodo de evaluaci�n, registrados con DNI seg�n la base de datos del CNV en l�nea del periodo que dieron 
su parto 42 d�as antes de la evaluaci�n.

Fuente: HIS
�mbito de medici�n: DIRESA
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
 DROP TABLE #TEMP3_1
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
 DROP TABLE #BASE_FINAL
 DROP TABLE #DEN
 DROP TABLE #NUM
 DROP TABLE #BASE_HIS_NO_TLM
 DROP TABLE #ALTA
 DROP TABLE #NOALTA
 DROP TABLE #PRE_COLLAPSE
 DROP TABLE #COLLAPSE_FINAL
 DROP TABLE #COLLAPSE2
 DROP TABLE #COLLAPSE3
 DROP TABLE #COLLAPSE_3
 DROP TABLE #DL1153_2021_11_NOMINAL
 DROP TABLE #DL1153_2021_11_CONSOLIDADO
 DROP TABLE #TRAMAHIS_CG_11_CONSOLIDADO
 DROP TABLE #TRAMAHIS_CG_11_NOMINAL
 DROP TABLE #ELIMINA_MENOR

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
	N.TIPO_EDAD						AS ID_TIPEDAD_REG,
	N.ID_CITA,
	N.FECHA_REGISTRO,
	N.ID_UPS,
	N.ID_CONDICION_SERVICIO			AS ID_TIPCOND_SERV,
	N.ID_CONDICION_ESTABLECIMIENTO	AS ID_TIPCOND_ESTAB,

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
  , CESARIA AS TIP_PARTO
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
SELECT * 
INTO #CNV
FROM #CNV_20210710
WHERE NU_DOC_MADRE IS NOT NULL  -- NO SE CONSIDERAN DOCUMENTOS NULOS 
AND NU_DOC_MADRE NOT IN ('','NULL')  -- NO SE CONSIDERAN DOCUMENTOS VACIOS. 
AND TRY_CONVERT(INT,TIP_DOC_MADRE)=1 -- SE CONSIDERAN SOLO TIPO DE DOCUMENTO: DNI. 
AND CONT_DOM_MADRE='92' AND PAIS_DOM_MADRE='33' --> SOLO PARTOS DE GESTANTES DOMICILIADAS EN PER�.
AND MONTH(CONVERT(DATE,DATEADD(DD,42,FE_NACIDO)))>=@MES_INICIO
AND MONTH(CONVERT(DATE,DATEADD(DD,42,FE_NACIDO)))<=@MES_FINAL
AND YEAR(CONVERT(DATE,DATEADD(DD,42,FE_NACIDO)))=@YEAR
AND len(replace(ltrim(rtrim(NU_DOC_MADRE)),LEFT(ltrim(rtrim(NU_DOC_MADRE)),1),''))>0
AND TRY_CONVERT(INT,NU_DOC_MADRE) IS NOT NULL 

-- SELECT *
-- INTO #RENAES
-- FROM BD_HISINDICADORES.DBO.Renaes_20210720

SELECT *
INTO #2020
FROM #TRAMAHISMINSA_202106_20210720
WHERE TRY_CONVERT(INT,ID_TIPO_DOC)=1 AND YEAR(CONVERT(DATE,PERIODO))=@YEAR-1
AND MONTH(CONVERT(DATE,PERIODO))>=MONTH(DATEADD(MM,-2,'2021-01-01'))
AND LTRIM(RTRIM(COD_ITEM)) IN (
         '58611' --> ligadura de trompa (Cesarea) 
         ,'58605' --> ligadura de trompa (hospitalizacion post parto institucional.
         ,'59515' --> Cesarea
         ,'59410' --> Post parto
         ,'59430' --> Atencion puerpera
         ,'11975','58300','99208.05','99208.02','99208.06' --> Provision de preservativos. (Cesarea)/(post parto vaginal)
)
AND len(replace(ltrim(rtrim(NUM_DOC)),LEFT(ltrim(rtrim(NUM_DOC)),1),''))>0
AND TRY_CONVERT(INT,NUM_DOC) IS NOT NULL 

SELECT *
INTO #2021
FROM #TRAMAHISMINSA_202106_20210720
WHERE TRY_CONVERT(INT,ID_TIPO_DOC)=1 AND YEAR(CONVERT(DATE,PERIODO))=@YEAR
AND MONTH(CONVERT(DATE,PERIODO))>=@MES_INICIO AND MONTH(CONVERT(DATE,PERIODO))<=@MES_FINAL
AND LTRIM(RTRIM(COD_ITEM)) IN (
         '58611' --> ligadura de trompa (Cesarea) 
         ,'58605' --> ligadura de trompa (hospitalizacion post parto institucional.
         ,'59515' --> Cesarea
         ,'59410' --> Post parto
         ,'59430' --> Atencion puerpera
         ,'11975','58300','99208.05','99208.02','99208.06' --> Provision de preservativos. (Cesarea)/(post parto vaginal)
)
AND len(replace(ltrim(rtrim(NUM_DOC)),LEFT(ltrim(rtrim(NUM_DOC)),1),''))>0
AND TRY_CONVERT(INT,NUM_DOC) IS NOT NULL 

------------------------------------------------------------------------------------

--================
-- CNV
--================
--1. Variables del CNV elegidas para el indicador. 
SELECT 
NU_DOC_MADRE DNI
, TIP_DOC_MADRE TDOC
, MONTH(CONVERT(DATE,DATEADD(DD,42,FE_NACIDO))) MES
, AÑO=@YEAR
, CONVERT(DATE,FE_NACIDO) FECHA_NAC
, TIP_PARTO
, CONVERT(INT,DUR_EMB_PARTO) SEMANA_NAC
, TIP_LUGAR_NACIDO
, CO_LOCAL RENAES 
, DPTO_DOM_MADRE + PROV_DOM_MADRE + DIST_DOM_MADRE UBIGEORENIEC
INTO #CNV2 
FROM #CNV
WHERE CONVERT(INT,TIP_LUGAR_NACIDO)=1 --> PARTOS REALIZADOS EN ESTABLECIMIENTOS DE SALUD. 

--2. Estableciento la ubicacion de residencia segun CNV y Partos en Establecimientos del MINSA Y REGIONALES.
SELECT *
INTO #CNV3
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
 , C.AMBITO
 FROM #CNV2 A 
 INNER JOIN 
 Maestro_UBIGEO_20200407 B ON CONVERT(INT,A.UBIGEORENIEC)=CONVERT(INT,B.UBIGEORENIEC)
 INNER JOIN 
 #Renaes C ON CONVERT(INT,A.RENAES)=CONVERT(INT,C.COD_ESTAB)
) AS T 
WHERE CONVERT(INT,AMBITO)=1 --> PARTOS EN ESTABLECIMIENTOS DEL MINSA. 

-- LIMPIANDO DUPLICADOS. (DNIS UNICOS) 
SELECT * 
, DEN=1 
INTO #CNV_FINAL 
FROM (
 SELECT *
 , ROW_NUMBER() OVER (PARTITION BY DNI, FECHA_NAC ORDER BY DNI) ID_1
 FROM #CNV3
) AS T0 WHERE ID_1=1 

ALTER TABLE #CNV_FINAL DROP COLUMN ID_1, UBIGEORENIEC 

--================
-- �HIS MINSA
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

 INSERT INTO  #HIS_MINSA
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
  , IIF(DATEDIFF(DD,A.FECHA_NAC,B.FECHA_ATENDIDO)>=0 AND DATEDIFF(DD,A.FECHA_NAC,B.FECHA_ATENDIDO)<=42,1,0) ID_ATENCION 
  --IIF(DATEDIFF(DD,A.FECHA_NAC,B.FECHA_ATENDIDO)>42 OR DATEDIFF(DD,A.FECHA_NAC,B.FECHA_ATENDIDO)<0,0,1) ID_ATENCION
  FROM #CNV_FINAL A 
  LEFT JOIN 
  #HIS_MINSA B ON TRY_CONVERT(INT,A.DNI)=TRY_CONVERT(INT,B.DNI) 
) AS T 
WHERE ID_ATENCION=1 --> ATENCIONES DESDE EL PARTO HASTA 42 DIAS DESPUES DEL PARTO. 

--================================================================
--                      INDICADORES 
--================================================================

--1. Ligadura de trompa(s) cuando se realiza al mismo tiempo que la ces�rea tipo de diagn�stico �D� CPMS 58611
SELECT *
, MAX(TEMP_NUM1) OVER (PARTITION BY DNI) NUM1 
INTO #TEMP1 
FROM (
  SELECT *
  , IIF(COD_ITEM IN ('58611') 
     AND TIPO='D'
     ,1,0) TEMP_NUM1
  FROM #ATENDIDOS
) AS T 

--2. Ligadura de trompa(s) cuando se realiza durante la misma hospitalizaci�n post parto vaginal CPMS 58605 tipo de diagn�stico �D�
SELECT *
, MAX(TEMP_NUM2) OVER (PARTITION BY DNI) NUM2
INTO #TEMP2  
FROM (
  SELECT *
  , IIF(COD_ITEM IN ('58605') 
     AND TIPO='D'
    ,1,0) TEMP_NUM2
  FROM #TEMP1 
) AS T 

/*
--3.� Ces�rea, incluyendo atenci�n postparto tipo de diagn�stico �D� CPMS 59515 + Inserci�n de Implante tipo de diagn�stico �D� CPMS 11975 
� Inserci�n de dispositivo intrauterino (DIU) tipo de diagn�stico �D� CPMS 58300 � Administraci�n y uso de m�todo inyectable Trimestral 
tipo de diagn�stico �D� CPMS 99208.05 � Provisi�n de preservativos masculinos tipo de diagn�stico �D� CPMS 99208.02 
� Provisi�n de preservativos femeninos tipo de diagn�stico �D� CPMS 99208.06.
*/ 
SELECT *
, MAX(TEMP_NUM3) OVER (PARTITION BY DNI) NUM3
INTO #TEMP3
FROM (
  SELECT *
  , IIF(COD_ITEM IN ('11975','58300','99208.05','99208.02','99208.06') 
   AND TIPO='D'
   AND CITA_1=1
   AND FECHA_ATENDIDO IS NOT NULL
   AND FECHA_NAC IS NOT NULL
   AND DATEDIFF(DD,FECHA_NAC,FECHA_ATENDIDO)<=42,1,0) TEMP_NUM3
  FROM (
    SELECT *
    , MAX(IIF(COD_ITEM IN ('59515') AND TIPO='D',1,0)) OVER (PARTITION BY ID_CITA , DNI) CITA_1
    FROM #TEMP2
  ) AS T0
) AS T1

/*
--4.� � Atenci�n de parto vaginal (con o sin episiotom�a), incluyendo atenci�n postparto CPMS 59410 + Inserci�n de Implante CPMS 11975 � Inserci�n de dispositivo intrauterino CPMS (DIU) 58300 
� Administraci�n y uso de m�todo inyectable Trimestral CPMS 99208.05 � Provisi�n de preservativos masculinos CPMS 99208.02 � Provisi�n de preservativos femeninos CPMS 99208.06
*/ 
SELECT *
, MAX(TEMP_NUM4) OVER (PARTITION BY DNI) NUM4
INTO #TEMP4
FROM (
  SELECT *
  , IIF(COD_ITEM IN ('11975','58300','99208.05','99208.02','99208.06') 
   AND CITA_2=1
   ,1,0) TEMP_NUM4
  FROM (
    SELECT *
    , MAX(IIF(COD_ITEM IN ('59410'),1,0)) OVER (PARTITION BY ID_CITA , DNI) CITA_2
    FROM #TEMP3
  ) AS T0
) AS T1

/*
--3.� Atenci�n postparto Control de pu�rpera c�digo CPMS 59430 tipo de diagn�stico �D� Lab �2� + Inserci�n de Implante tipo de diagn�stico �D� CPMS 11975 � Inserci�n de dispositivo intrauterino (DIU) 
tipo de diagn�stico �D� CPMS 58300 � Administraci�n y uso de m�todo inyectable Trimestral tipo de diagn�stico �D� CPMS 99208.05 � Provisi�n de preservativos masculinos tipo de diagn�stico �D�
 CPMS 99208.02 � Provisi�n de preservativos femeninos tipo de diagn�stico �D� CPMS 99208.06.
*/ 
SELECT *
, MAX(TEMP_NUM5) OVER (PARTITION BY DNI) NUM5
INTO #TEMP5
FROM (
  SELECT *
  , IIF(COD_ITEM IN ('11975','58300','99208.05','99208.02','99208.06') 
   AND TIPO='D'
   AND CITA_3=1
   ,1,0) TEMP_NUM5
  FROM (
    SELECT *
    , MAX(IIF(COD_ITEM IN ('59430') AND TIPO='D' AND TRY_CONVERT(INT,VALOR_LAB)=2,1,0)) OVER (PARTITION BY ID_CITA , DNI) CITA_3
    FROM #TEMP4
  ) AS T0
) AS T1

--===================
-- BASE FINAL 
--===================
SELECT 
DNI
,AÑO
,MES
,UBIGEO
,DESC_DPTO DEPARTAMENTO
,desc_prov PROVINCIA
,desc_dist DISTRITO
,DIRIS
,RED 
,MAX(DEN) DENOMINADOR
,MAX(NUM1) NUM1
,MAX(NUM2) NUM2
,MAX(NUM3) NUM3
,MAX(NUM4) NUM4
,MAX(NUM5) NUM5
INTO #PRE_COLLAPSE 
FROM #TEMP5
GROUP BY 
DNI
,AÑO
,MES
,UBIGEO
,DESC_DPTO 
,desc_prov
,desc_dist 
,DIRIS
,RED 

SELECT 
DNI
,AÑO
,MES= case
when mes=1 then 'ENERO'
when mes=2 then 'FEBRERO'
when mes=3 then 'MARZO'
when mes=4 then 'ABRIL'
when mes=5 then 'MAYO'
when mes=6 then 'JUNIO'
when mes=7 then 'JULIO' 
when mes=8 then 'AGOSTO'
when mes=9 then 'SETIEMBRE'
when mes=10 then 'OCTUBRE'
when mes=11 then 'NOVIEMBRE'
when mes=12 then 'DICIEMBRE' end
,UBIGEO
,DEPARTAMENTO
,PROVINCIA
,DISTRITO
,DIRIS
,RED 
,DENOMINADOR
,IIF((NUM1+NUM2+NUM3+NUM4+NUM5)>=1,1,0) NUMERADOR
, NUM1 NUMERADOR_1
, NUM2 NUMERADOR_2
, NUM3 NUMERADOR_3
, NUM4 NUMERADOR_4
, NUM5 NUMERADOR_5
INTO #DL1153_2021_11_NOMINAL
FROM #PRE_COLLAPSE 



SELECT 
AÑO
,MES
,UBIGEO
,DEPARTAMENTO
,PROVINCIA
,DISTRITO
,DIRIS
,RED 
,SUM(DENOMINADOR) DENOMINADOR
,SUM(NUMERADOR) NUMERADOR
,SUM(NUMERADOR_1) NUMERADOR_1
,SUM(NUMERADOR_2) NUMERADOR_2
,SUM(NUMERADOR_3) NUMERADOR_3
,SUM(NUMERADOR_4) NUMERADOR_4
,SUM(NUMERADOR_5) NUMERADOR_5
INTO #DL1153_2021_11_CONSOLIDADO
FROM #DL1153_2021_11_NOMINAL
GROUP BY
AÑO
,MES
,UBIGEO
,DEPARTAMENTO
,PROVINCIA
,DISTRITO
,DIRIS
,RED  

SELECT * FROM #DL1153_2021_11_CONSOLIDADO