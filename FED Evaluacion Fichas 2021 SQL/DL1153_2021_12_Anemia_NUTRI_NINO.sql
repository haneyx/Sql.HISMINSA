USE BDHIS_MINSA
GO

 DROP TABLE #TRAMAHIS_CG_12_NOMINAL
 DROP TABLE #TRAMAHIS_CG_12_CONSOLIDADO
 DROP TABLE #HIS
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
--drop table #TRAMAHIS_CG_12_NOMINAL
--drop table #TRAMAHIS_CG_12_CONSOLIDADO

---------------------------------------
-- Reduccion de Tramas. 
-- select *
-- into #padronnominal
-- from #PADRON_NOMINAL_30062021

select *
into #his 
from #TRAMAHISMINSA_202106_20210720
where ltrim(rtrim(cod_item)) in ('D500','D508','D509','D649','C0011','99499.08')
----------------------------------------------------------------------------

create table #TRAMAHIS_CG_12_NOMINAL
(
mes int,
departam varchar(50),
provincia varchar(50),
distrito varchar(50),
diris varchar(50),
dni varchar(32),
fecha_nac date,
seguro int, 
ubi_res varchar(6), 
fecha_anemia date, 
anemia int, 
fecha_visita date, 
num int, 
den int
)

declare @anio_eval int, @mes_eval int, @mes_final int
declare @fec_eval date, @fec_final date
declare @periodoeval varchar(6), @periodofin varchar(6)
set @anio_eval=2021
set @mes_final=6
set @mes_eval=1

set @fec_final=try_convert(date,try_convert(varchar(4),@anio_eval)+'-'+right('00'+try_convert(varchar(2),@mes_final+1),2)+'-'+right('00'+try_convert(varchar(2),1),2))
set @periodofin=substring(convert(varchar,@fec_final,112),1,6)

while @mes_eval <= @mes_final
begin
	set @fec_eval=try_convert(date,try_convert(varchar(4),@anio_eval)+'-'+right('00'+try_convert(varchar(2),@mes_eval),2)+'-'+right('00'+try_convert(varchar(2),1),2))
	set @periodoeval=substring(convert(varchar,@fec_eval,112),1,6)

	-- DENOMINADOR
	select 
		case when isnull(ltrim(rtrim(a.NU_DNI_MENOR)),'')='' then a.nu_cnv 
			else a.NU_DNI_MENOR end dni, 
			a.nu_cnv, a.fe_nac_menor fecha_nac, a.ti_seguro_menor seguro, a.co_ubigeo_inei ubi_res, b.desc_dpto, b.desc_prov, b.desc_dist, b.diris, b.red
	into #padron
	from  #padronnominal a with (nolock) 
	left join Maestro_UBIGEO_20200407 b on a.co_ubigeo_inei=convert(int,b.UBIGEO)
	where (isnull(ltrim(rtrim(NU_DNI_MENOR)),'')<>'' or  isnull(ltrim(rtrim(nu_cnv)),'')<>'')
	and (@mes_eval between month(dateadd(dd,180,fe_nac_menor)) and month(dateadd(dd,364,fe_nac_menor)))
	and (@anio_eval between year(dateadd(dd,180,fe_nac_menor)) and year(dateadd(dd,364,fe_nac_menor)))

	select distinct num_doc, try_convert(date,periodo,111) fecha_anemia 
	into #anemia1
	from #his with (nolock) 
	where (aniomes=substring(try_convert(varchar(8),@fec_eval,112),1,6)) 
	and id_tipitem='D' and cod_item in ('D500','D508','D509','D649')
	
	select dni, fecha_nac, seguro, ubi_res, iif(anemia=1,fecha_anemia,null) fecha_anemia, anemia
	into #tmp_01
	from 
	(
		select *, row_number() over(partition by dni order by anemia desc, fecha_anemia) id
		from (
			select d.*, t.fecha_anemia, iif(datediff(dd,d.fecha_nac,t.fecha_anemia) between 180 and 364 ,1,0) anemia 
			from #padron d left join #anemia1 t on d.dni collate database_default =t.num_doc collate database_default
		) as t where anemia=1
	) as tmp where id=1 and anemia=1


		--NUMERADOR
	select distinct id_cita 
	into #tratam 
	from #his with (nolock) -- entre mes ini y mes fin
	where aniomes between @periodoeval AND @periodofin
	and id_tipitem ='R' and cod_item in ('D500','D508','D509','D649')

	select num_doc, try_convert(date,periodo,111) fecha_visita, id_cita 
	into #visita
	from #his h with (nolock) 
	where aniomes between @periodoeval AND @periodofin
		and cod_item in ('C0011','99499.08') 
		and exists(select c.id_cita from #tratam c where h.id_cita=c.id_cita)

	
--select * from #tmp_02
	select dni, fecha_nac, seguro, ubi_res, fecha_anemia, anemia, 
	iif(visita=1 and anemia=1,fecha_visita,null) fecha_visita, visita
	into #tmp_02
	from 
	(
		select *, row_number() over(partition by dni order by fecha_anemia, fecha_visita) id
		from (
			select d.*, t.fecha_visita, iif(datediff(dd,d.fecha_anemia,t.fecha_visita) between 1 and 30,1,0) visita
			from #tmp_01 d left join #visita t on d.dni collate database_default=t.num_doc collate database_default
		) as t
	) as t0 where id=1

	insert into #TRAMAHIS_CG_12_NOMINAL
	select @mes_eval mes, 
	 u.desc_dpto departam, u.desc_prov provincia, u.desc_dist distrito, u.DIRIS diris,	
	dni, fecha_nac, seguro, ubi_res, fecha_anemia, anemia, fecha_visita, 
	visita num, den=1
	from #tmp_02 t0
	left join Maestro_UBIGEO_20200407 u on t0.ubi_res=try_convert(int,u.ubigeo)
	
	drop table #padron
	drop table #anemia1
	drop table #tratam
	drop table #visita
	drop table #tmp_01
	drop table #tmp_02
	
	set @mes_eval = @mes_eval + 1
end

----Duplicados anuales
--	drop table  #TRAMAHIS_CG_12_CONSOLIDADO

select mes= case
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
when mes=12 then 'DICIEMBRE' end, departam, provincia, distrito, diris, ubi_res, seguro, 
sum(num) num, sum(den) den 
into #TRAMAHIS_CG_12_CONSOLIDADO
from (
	select *
	FROM (
			select *, row_number() over(partition by dni order by fecha_anemia ) id
			from #TRAMAHIS_CG_12_NOMINAL
		) as t0
		 where id=1 
) as consolidado
group by mes, departam, provincia, distrito, diris, ubi_res, seguro


select año=@anio_eval, * from #TRAMAHIS_CG_12_CONSOLIDADO


--/*select * from #TRAMAHIS_CG_12_nominal where num =1
--select * from #TRAMAHIS_CG_12_consolidado*/

--select dni,count(*) from  #TRAMAHIS_CG_12_NOMINAL-- where dni= is not null 
--group by dni having count(*)>1 order by 2  desc

--select *
--	FROM (
--			select *, row_number() over(partition by dni order by fecha_anemia ) id
--			from #TRAMAHIS_CG_12_NOMINAL
--			where  dni='91651913'
--		) as t0
--		 where id=1 

--select sum(num),sum(den) from #TRAMAHIS_CG_12_CONSOLIDADO-- 

---- visitas para diagn�stico R: num:6745	den:35161
---- visitas para diagn�stico D,R: num: 6855	den: 35161

--select * from #TRAMAHIS_CG_12_NOMINAL where dni='81902903' order by mes

--	select * 
--	from TramaHisMinsa_202012_20210120 with (nolock) 
--	where aniomes between '201912' and '202006'-- and   id_cita='391643432'
--	--and id_tipitem='D' 
--	and cod_item in ('D500','D508','D509','D649') and num_doc='81902903' order by periodo


--	--and id_tipitem='D' 
--	and cod_item in ('C0011','99499.08') and num_doc='81902903' order by periodo




--2020-04-14
--2020-01-14
--2020-02-19
--2020-03-15
--2020-05-20
--2020-06-18



