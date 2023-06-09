USE [BDHIS_MINSA]
GO

 DROP TABLE #TRAMA_IND_TELEMEDICINA_15_2021_CONSOLIDADO
 DROP TABLE #TRAMA_IND_TELEMEDICINA_15_2021_202011_20201221
 DROP TABLE #TRAMA_IND_TELEMEDICINA_15_2021_CONSOLIDADO_202011_20201221
 DROP TABLE #TRAMA_IND_TELEMEDICINA_15
 DROP TABLE #TEMFFF
 DROP TABLE #RENAES
 DROP TABLE #TEMP
 DROP TABLE #HIS_MINSA


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
	CAST(YEAR(N.FECHA_ATENCION) AS NVARCHAR) + RIGHT('00' + CAST(MONTH(N.FECHA_ATENCION) AS NVARCHAR), 2)	AS PERIODO,
	(MP.APELLIDO_PATERNO_PACIENTE + ' ' + MP.APELLIDO_MATERNO_PACIENTE + ' ' + MP.NOMBRES_PACIENTE) AS PACIENTE
INTO
	#TRAMAHISMINSA_202106_20210720
FROM
	NOMINAL_TRAMA_NUEVO AS N
		INNER JOIN MAESTRO_PACIENTE AS MP
			ON N.ID_PACIENTE = MP.ID_PACIENTE
		INNER JOIN MAESTRO_HIS_ESTABLECIMIENTO AS ME
			ON N.ID_ESTABLECIMIENTO = ME.ID_ESTABLECIMIENTO
/****** Object:  StoredProcedure [dbo].[usp_Indicador_telemedicina_2021_ficha_15]    Script Date: 14/01/2021 15:55:47 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
-- =============================================
-- Author:		<Adhemir Bellido>
-- Create date: <09/01/2020>
-- Description:	<Indicador de Telemedicina 2021 - Ficha 15>
-- =============================================
--ALTER PROCEDURE [dbo].[usp_Indicador_telemedicina_2021_ficha_15]
--AS
--BEGIN
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;

--	-------- Cambiar sufijo (ejem: 202011_20201221  , según el ultimo mes de evaluacion y fecha de corte de la trama base   )


--	IF EXISTS (SELECT * FROM sysobjects WHERE name='TRAMA_IND_TELEMEDICINA_15_2021_202011_20201221') begin
--		drop table TRAMA_IND_TELEMEDICINA_15_2021_202011_20201221
--	END
--	IF EXISTS (SELECT * FROM sysobjects WHERE name='TRAMA_IND_TELEMEDICINA_15_2021_CONSOLIDADO_202011_20201221') begin
--		drop table TRAMA_IND_TELEMEDICINA_15_2021_CONSOLIDADO_202011_20201221
--	END


    -- Insert statements for procedure here
	
	create table #TRAMA_IND_TELEMEDICINA_15
	(
	renaes int,
	EESS varchar(100),
	Cat_estab varchar(6),
	ubigeo varchar(6),
	departamento varchar(100),
	provincia varchar(100),
	distrito varchar(100),
	red varchar(100), 
	microred varchar(100), 
	diris varchar(100),
	anio varchar(4),
	mes varchar(2),
	ambito float,
	CPMS varchar(8),
	Estado varchar(15),
	Casos int
	)

	--- REDUCCION DE BASES DE DATOS. 
	select * 
	into #his_minsa
	from #TRAMAHISMINSA_202106_20210720
	where ltrim(rtrim(cod_item)) in ('99499.10','99499.11','99499.12')

	select *
	into #renaes 
	from Renaes_20210720
	---------------------------


	declare @anio_eval int, @mes_eval int, @mes_final int
--	declare @fec_eval varchar
	set @anio_eval=2021
	set @mes_eval=1
	set @mes_final=8

	while @mes_eval <= @mes_final
	begin 
		
	--	set @fec_eval=try_convert(varchar(4),@anio_eval)+'-'+try_convert(varchar(2),@mes_eval)+'-'+try_convert(varchar(2),1)

		---- Denominador
		--select distinct renaes, id_persona into #DENOM
		--from BD_BACKUP_OGEI.dbo.TramaHisMinsa_201910_20191120 with (nolock)
		--where  id_tipcond_estab in ('N','R') and id_persona is not null and rownum=1
		-- and (edad_reg between 25 and 64) and id_genero='F'  				
		-- and ( try_convert(int, SUBSTRING(periodo,1,4))=@anio_eval and
		--	     try_convert(int, SUBSTRING(periodo,5,2))=@mes_eval )

		----- Numerador
		
		select distinct renaes, id_cita, cod_item, '--------------' Estado
		into #TEMP
		from #his_minsa t with (nolock)    ---------------- Fuente HISMINSA
		where (
		ltrim(rtrim(t.id_tipitem))='D' and ltrim(rtrim(t.cod_item))='99499.10' 	
				 and ( try_convert(int, SUBSTRING(t.periodo,1,4))=@anio_eval and
			     try_convert(int, SUBSTRING(t.periodo,5,2))=@mes_eval )
		)

		------------------------
		--- Teleconsultante(1) y Teleconsultor(2) para teleinterconsulta (99499.11,99499.12)
		select distinct renaes, id_cita, cod_item,
		Estado=
		case 
			when ltrim(rtrim(cod_item)) in ('99499.11','99499.12') and try_convert(int,valor_lab)='1' then 'Consultante'
			when ltrim(rtrim(cod_item)) in ('99499.11','99499.12') and try_convert(int,valor_lab)='2' then 'Consultora'
		end
		into #TEMP1
		from #his_minsa t with (nolock)
		where (
		ltrim(rtrim(t.id_tipitem))='D' and ltrim(rtrim(t.cod_item)) in ('99499.11','99499.12') 
		and ltrim(rtrim(t.valor_lab)) in ('1','2')		
				 and ( try_convert(int, SUBSTRING(t.periodo,1,4))=@anio_eval and
			     try_convert(int, SUBSTRING(t.periodo,5,2))=@mes_eval )
		)
		
		------------------------
		insert into #TEMP
		select * from #TEMP1

		drop table #TEMP1
		------------------------
		
		select  renaes, cod_item CPMS, Estado, anio=@anio_eval, mes=@mes_eval,  count(*) Casos into #NUMER 
		from #TEMP
		group by renaes, cod_item , Estado

		drop table #TEMP

		------ CRUCE DE DATOS

		--select renaes, id_persona, anio, mes, iif(anio is null or mes is null,0,1) N
		--into #Temporal1
		--from 
		--(
		--		select d.* , anio, mes
		--		from #DENOM d left join #NUMER n on d.id_persona =n.id_persona and d.renaes =n.renaes 
		--) as t		
			
		--drop table #DENOM
		--drop table #NUMER

		----- INSERCION
		insert into #TRAMA_IND_TELEMEDICINA_15
		select t.renaes, r.DESC_ESTAB EESS, r.CAT_ESTAB , r.UBIGEO, r.DESC_DPTO departamento,
		r.DESC_PROV provincia, r.DESC_DIST distrito, r.DESC_RED Red, r.DESC_MRED microred,
		r.DIRIS, @anio_eval anio  , @mes_eval mes, r.AMBITO, t.CPMS, t.Estado, t.Casos
		from #NUMER t
		left join #renaes r on t.renaes=r.COD_ESTAB 
		where r.CAT_ESTAB in ('I-1','I-2','I-3','I-4', 'II-1','II-2','II-E','III-1','III-2','III-E') and r.ambito=1

		drop table #NUMER
		
		set @mes_eval = @mes_eval + 1

	end

	select anio, mes, renaes, EESS, Cat_estab, ubigeo, departamento, provincia, distrito, red, microred, diris, ambito
	, iif(ltrim(rtrim(CPMS))='99499.10',casos,0) casos_telemonitoreo ,  iif(ltrim(rtrim(CPMS)) in ('99499.11','99499.12'),casos,0) casos_teleinterconsulta
	, iif(ltrim(rtrim(CPMS)) in ('99499.11','99499.12') and ltrim(rtrim(estado))='Consultora',casos,0) casos_teleinterconsulta_consultora
	, iif(ltrim(rtrim(CPMS)) in ('99499.11','99499.12') and ltrim(rtrim(estado))='Consultante',casos,0) casos_teleinterconsulta_consultante
	into #temFFF
	from #TRAMA_IND_TELEMEDICINA_15

	select anio, mes= case
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
when mes=12 then 'DICIEMBRE' end, renaes, EESS, Cat_estab, ubigeo, departamento, provincia, distrito, red, microred, diris, ambito
	, sum(casos_telemonitoreo) casos_monit, sum(casos_teleinterconsulta) casos_inter
	, sum(casos_teleinterconsulta_consultante) casos_inter1, sum( casos_teleinterconsulta_consultora)  casos_inter2
	into #TRAMA_IND_TELEMEDICINA_15_2021_CONSOLIDADO
	from #temFFF
	group by anio, mes, renaes, EESS, Cat_estab, ubigeo, departamento, provincia, distrito, red, microred, diris, ambito

select * from #TRAMA_IND_TELEMEDICINA_15_2021_CONSOLIDADO
