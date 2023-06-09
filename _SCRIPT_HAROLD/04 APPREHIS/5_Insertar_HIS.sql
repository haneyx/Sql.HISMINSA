USE DataHIS
GO
IF OBJECT_ID('dbo.HIS', 'U') IS NOT NULL
BEGIN
	DROP TABLE HIS
	--TRUNCATE TABLE HIS
END    
GO


CREATE TABLE HIS(
	ID_CITA varchar(20),
	ANIO int,
	MES int,
	DIA int,
	FECHA date,
	LOTE varchar(5),
	NUM_PAG int,
	NUM_REG int,
	UPS varchar(6),
	COD_RED int,
	COD_DISA int,
	COD_MIC int,
	RENAES varchar(9),
	NOM_ESTABLEC varchar(100),
	ID_PACIENTE varchar(15),
	TIP_DOC int,
	NRO_DOC varchar(15),
	NOMBRE_PACIENTE varchar(100),
	FECHA_NAC date,
	SEXO char(1),
	HCL varchar(15),
	FI int,
	COND_EESS char(1),
	COND_SERV char(1),
	TIP_EDAD char(1),
	EDAD int,
	EDAD_A int,
	EDAD_M int,
	EDAD_D int,
	TIP_DIAG char(1),
	LAB varchar(3),
	COD_ITEM varchar(8),
	ID_C int,
	ID_L int,
	PESO real,
	TALLA real,
	HB real,
	ETNIA varchar(2),
	PAC varchar(6),
	PC real,
	COND varchar(2),
	FECHA_REG date,
	PAIS varchar(3),
	TURNO char(1),
	DOC_ATIENDE varchar(15),
	COLEGIO varchar(2),
	PROF varchar(2),
	DOC_REGISTRA varchar(15) 
) 
PRINT 'SE CREO LA TABLA HIS'
GO

INSERT INTO HIS SELECT *FROM VIEWHIS
GO
DBCC SHRINKDATABASE(N'DataHIS' )
GO

/*

SELECT *INTO HIS FROM VIEWHIS
SELECT *INTO HISMINSA FROM V_HISMINSA
*/
