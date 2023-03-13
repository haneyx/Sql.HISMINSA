--==========================================
-- PROMEDIO DE PERMANENCIA CAMA
-- AREA: OGTI/OGEI - MINSA 
--==========================================
USE BD_HISINDICADORES

--=============================================================
SELECT *
INTO #EGRESOS
FROM BD_HISINDICADORES.DBO.TramaEgresos_202106_20210720

SELECT *
INTO #RENAES 
FROM Renaes_20210720
--===========================================================

DECLARE @MES_INICIO INT ,
		@MES_FINAL INT , 
		@YEAR INT

SET @MES_INICIO=1 -- <========= CAMBIAR MES INICIO
SET @MES_FINAL=6 -- <========= CAMBIAR MES FINAL
SET @YEAR=2021 -- <========= CAMBIAR AÑO.

SELECT A.RENIPRESS 
, B.desc_Estab EESS_NOMBRE
, B.CAT_ESTAB EESS_CAT
, ISNULL(CONVERT(INT,B.CAMAS),0) CAMAS
, A.UPS 
, IIF(D.DESCRIP_UPS02 IS NULL,'SIN REGISTRO',D.DESCRIP_UPS02) DESC_UPS
, B.DESC_DISA DIRESA
, B.DESC_DPTO DEPARTAMENTO
, B.DESC_PROV PROVINCIA
, B.DESC_DIST DISTRITO
, AÑO=@YEAR
, MONTH(TRY_CONVERT(DATE,A.FECEGR)) MES
, TRY_CONVERT(DATE,A.FECEGR) FECHA_EGRESO
, TRY_CONVERT(DATE,A.FECING) FECHA_INGRESO
, A.CONDICION 
, CODDIAG1 DX -- DIAGNOSTICO. 
INTO #DATA_EGRESO
FROM #EGRESOS A 
INNER JOIN #RENAES  B ON CONVERT(INT,A.RENIPRESS)=CONVERT(INT,B.COD_ESTAB)
LEFT JOIN EGRESOS_RES_UPS D ON CONVERT(INT,A.UPS)=CONVERT(INT,D.COD_UPS)
WHERE YEAR(TRY_CONVERT(DATE,A.FECEGR))=@YEAR AND MONTH(TRY_CONVERT(DATE,A.FECEGR))>=@MES_INICIO AND MONTH(TRY_CONVERT(DATE,A.FECEGR))<=@MES_FINAL
AND B.AMBITO='1' --> ESTABLECIMIENTOS DE SALUD DEL MINSA. 
AND A.CONDICION IN ('1' --> EGRESO: ALTA MEDICA
					,'2' --> EGRESO: ALTA VOLUNTARIA
					,'3' --> EGRESO: TRANSFERIDO
					,'4' --> EGRESO: FUGADO
					,'5' --> EGRESO: FALLECIDO. 
					)
AND ( 
	 (LTRIM(RTRIM(B.CAT_ESTAB)) IN ('II-1','II-2','II-E') AND ISNULL(CONVERT(INT,B.CAMAS),0)>50) -- HOSPITAL DE II NIVEL CON MAS DE 50 CAMAS.
	 OR  
	 LTRIM(RTRIM(B.CAT_ESTAB)) IN ('III-1','III-2','III-E') -- HOSPITAL DE III NIVEL E INSTITUOS ESPECIALIZADOS.
)


/* --================================
-- DENOMINADOR

El n�mero de egresos es la sumatoria diaria de todos los pacientes que salen de la UPSS Hospitalizaci�n luego de haber ocupado una cama de hospitalizaci�n.
El egreso puede ser por alta (alta m�dica, alta voluntaria, fuga, referencia a otro establecimiento de salud), transferencia a otra UPSS (UCI, Emergencia)
o por defunci�n.
Se excluir� del c�lculo las camas ocupadas por pacientes abandonados por problemas judiciales o sociales. Para tal efecto, la DIRESA/GERESA y DIRIS e INEN,
remitir�n a la OGTI, el listado de pacientes, con los n�meros de historia cl�nica y las causas de la estancia prolongada con el visto bueno  
del servicio de asistencia social y/o del �rea de asuntos legales del establecimiento de salud, seg�n corresponda.
--=============================== */
SELECT RENIPRESS, EESS_NOMBRE, EESS_CAT, CAMAS, UPS, DESC_UPS, DIRESA, DEPARTAMENTO, PROVINCIA, DISTRITO, AÑO, MES
, COUNT(*) DENOMINADOR
INTO #DENOMINADOR
FROM #DATA_EGRESO
GROUP BY RENIPRESS, EESS_NOMBRE, EESS_CAT, CAMAS, UPS, DESC_UPS, DIRESA, DEPARTAMENTO, PROVINCIA, DISTRITO, AÑO, MES
--- 

/* --================================
-- NUMERADOR
El n�mero total de d�as-estancia de los egresos (o d�as de permanencia) se obtiene de la sumatoria de los d�as de hospitalizaci�n de cada paciente egresado
de la UPSS Hospitalizaci�n. Los d�as de hospitalizaci�n se contabilizan desde el momento del ingreso del paciente a una cama de la UPSS Hospitalizaci�n
hasta su egreso de esta UPSS; independientemente de su estad�a en diferentes �reas o especialidades de la UPSS Hospitalizaci�n.

1. Las camas de hospitalizaci�n no incluyen las cunas para reci�n nacidos sanos, las incubadoras y camas de la UPSS Cuidados Intensivos 
(incluyendo la unidad de intermedios), las camas de observaci�n de la UPSS Emergencia y las camillas de recuperaci�n de la UPSS Centro Quir�rgico
, las camas de dilataci�n y las camillas de expulsivo de la UPSS Centro Obst�trico. 

2. Las camas de hospitalizaci�n no incluyen las camas ocupadas por pacientes con diagnostico de COVID-19.

--=============================== */
SELECT RENIPRESS, UPS, AÑO, MES
, SUM(NUM) NUMERADOR
INTO #NUMERADOR
FROM(	
		SELECT * 
		, DATEDIFF(DD, FECHA_INGRESO, FECHA_EGRESO) NUM 
		FROM #DATA_EGRESO
		WHERE DX NOT IN ('U071') -- <= DIAGNOSTICO COVID. 
		AND LTRIM(RTRIM(SUBSTRING(UPS,1,4))) NOT IN ('2501', '2502', '2503', '2504')  -- <= UNIDAD DE CUIDADOS INTENSIVOS (INCLUYE CUIDADOS INTERMEDIOS)
						AND LTRIM(RTRIM(UPS)) NOT IN ('250500')  -- <= UNIDAD DE CUIDADOS INTENSIVOS (INCLUYE CUIDADOS INTERMEDIOS)
						AND LTRIM(RTRIM(UPS)) NOT IN ('250501') -- <= UNIDAD DE TRAUMA SHOCk. (HOSPITALIZACI�N-REUMATOLOG�A PEDI�TRICA-)
						AND LTRIM(RTRIM(SUBSTRING(UPS,1,2))) NOT IN ('23')   -- <= CAMAS DE EMERGENCIA. 
) AS T0
GROUP BY RENIPRESS, UPS, AÑO, MES

--================================
-- INDICADOR.
SELECT A.* 
, IIF(B.NUMERADOR IS NULL,0,B.NUMERADOR) NUMERADOR
FROM #DENOMINADOR A
LEFT JOIN #NUMERADOR B ON A.RENIPRESS=B.RENIPRESS AND A.UPS=B.UPS AND A.MES=B.MES



