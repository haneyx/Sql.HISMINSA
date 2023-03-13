/*
----------------------------------------------------------
ELABORACION: OGTI/ OGEI - MINSA 
INDICADORES: DL1153 - 2021
-----------------------------------------------------------------------

Indicadores DL1153

Nombre: Referencias y Contrarreferencias realizadas en el aplicativo REFCON en el marco de la continuidad del cuidado integral de la salud de las personas usuarias de los servicios de salud.
Sintaxis:

Numerador. - Es el n�mero de contrarreferencias recibidas en un per�odo de tiempo. La contrarreferencia es el proceso asistencial mediante el cual un establecimiento de salud
			 de destino de la referencia devuelve o env�a la responsabilidad del cuidado integral de la salud de un usuario por consulta externa, emergencia atendida 
			 o el resultado de la prueba diagn�stica requerida, a la IPRESS de origen de la referencia o a la IPRESS donde procede el usuario de salud;
			 la Contrarreferencia Recibida es aquella contrarreferencia aceptada que llega a la IPRESS de origen de la referencia 
			 o IPRESS donde procede el usuario de salud. 

Denominador. � Es el n�mero de referencias efectuadas en el mismo periodo. La referencia es el proceso asistencial mediante el cual una IPRESS traslada la responsabilidad del cuidado integral 
				de la salud de un usuario a la IPRESS que cuenta con la prestaci�n requerida en su cartera de servicios de salud, seg�n las necesidades de salud del usuario de salud; 
				la Referencia efectuada es aquella referencia solicitada por la IPRESS de origen a la IPRESS de destino.
*/
use BD_HISINDICADORES
go

---- TABLAS INTERMEDIAS.
Select *
into #tramarefcon 
from TramaEqhali_Refcon_202106_20210720

select *
into #renaes
from Renaes_20210419
---========================================

declare @anio_eval int, @mes_eval int
-- Parametros
set @anio_eval=2021
set @mes_eval=6

	--///////////////////////////////////
	-- REFERENCIAS. 
	--///////////////////////////////////
	select distinct a.id_referencia, a.num_doc, convert(int,a.cod_unico) renaes, year(a.fecha_envio) año, month(a.fecha_envio) mes, a.tipo_traslado, a.desc_estado
	into #tempref 
	from #tramarefcon a
	inner join #renaes b on convert(int,a.cod_unico)=convert(int,b.COD_ESTAB)
	where ltrim(rtrim(b.CAT_ESTAB)) in ('I-3','I-4','II-1','II-2','II-E','III-1','III-2','III-E')
	and ltrim(rtrim(a.tipo_traslado))='REFERENCIA' 
	and ltrim(rtrim(a.desc_estado)) in ('ACEPTADO','PACIENTE CITADO','PACIENTE RECIBIDO') --> No se contabilizan las referencias observadas o rechazadas o pendiente.. 
	and ltrim(rtrim(substring(a.c_id_ups_origen,1,2))) not in ('25','24') --> No se contabilizan las referencias por Hospitalizacion.
	and ltrim(rtrim(a.ups_origen)) not in ('SIN UPS') --> No se contabilizan las referencias sin destino de UPS. 
	and year(a.fecha_envio)=@anio_eval and month(a.fecha_envio)<=@mes_eval

	-- CONTEO
	select renaes, mes, año, count(*) ref 
	into #ref
	from #tempref
	group by renaes, mes, año 

	--///////////////////////////////////
	-- CONTRAREFERENCIAS
	--///////////////////////////////////

	-- Condicion Traslado=Contrareferencia y estado=Contrareferido. 
	select distinct a.id_referencia, a.num_doc, convert(int,a.cod_unico_d) renaes, year(a.fecha_envio) año, month(a.fecha_envio) mes
	into #tempcref1 
	from #tramarefcon a
	inner join #renaes b on convert(int,a.cod_unico_d)=convert(int,b.COD_ESTAB)
	where ltrim(rtrim(b.CAT_ESTAB)) in ('I-3','I-4','II-1','II-2','II-E','III-1','III-2','III-E')
	and ltrim(rtrim(a.tipo_traslado))='REFERENCIA' and ltrim(rtrim(a.desc_estado))='CONTRAREFERIDO' --> Primer grupo de referidos con contrareferidos.
	and ltrim(rtrim(substring(a.R_id_ups_destino,1,2))) not in ('25','24') --> No se contabilizan las Contrareferencias por Hospitalizacion.
	and ltrim(rtrim(a.ups_destino)) not in ('SIN UPS') --> No se contabilizan las Contrareferencias sin destino de UPS. 
	and year(a.fecha_envio)=@anio_eval and month(a.fecha_envio)<=@mes_eval

	-- Condicion de contrareferencia aceptada que no se encuentre en la primera condicion (No contabilizar doble). 
	select distinct a.id_referencia, a.num_doc, convert(int,a.cod_unico) renaes, year(a.fecha_envio) año, month(a.fecha_envio) mes
	into #tempcref2 
	from 
	(
			select a.*, isnull(b.id,0) id  from #tramarefcon a
			left join 
			(select distinct id_referencia , id=1 from #tempcref1) b on convert(int,a.id_refcon)=convert(int,b.id_Referencia)
	) a
	inner join #renaes b on convert(int,a.cod_unico)=convert(int,b.COD_ESTAB)
	where ltrim(rtrim(b.CAT_ESTAB)) in ('I-3','I-4','II-1','II-2','II-E','III-1','III-2','III-E')
	and ltrim(rtrim(a.tipo_traslado))='CONTRAREFERENCIA' and ltrim(rtrim(a.desc_estado)) in ('ACEPTADO','PACIENTE CITADO') --> Primer grupo de referidos con contrareferidos.
	and ltrim(rtrim(substring(a.C_id_ups_origen,1,2))) not in ('25','24') --> No se contabilizan las Contrareferencias por Hospitalizacion.
	and ltrim(rtrim(a.ups_origen)) not in ('SIN UPS') --> No se contabilizan las Contrareferencias sin destino de UPS.
	and year(a.fecha_envio)=@anio_eval and month(a.fecha_envio)<=@mes_eval
	and a.id=0 -- No se contabilizan las contrareferencias aceptadas que ya tienen su contraparte en las referencias-contrareferidas para evitar doble conteo. 

	-- CONTEO
	select renaes, mes, año, count(*) cref 
	into #cref
	from (
			select distinct renaes, mes, año, num_doc, id_referencia 
			from (
					select * from #tempcref1
					union 
					select * from #tempcref2
			) as t0 
	) as t1
	group by renaes, mes, año 
	
	
	--///////////////////////////////////
	-- INDICADOR.
	--///////////////////////////////////

	select distinct renaes, mes, año
	into #temp 
	from (
		select renaes, mes, año from #ref
		union all
		select renaes, mes, año from #cref
	) as t 

	select a.*
	, isnull(b.ref,0) ref_tot 
	, isnull(c.cref,0) cref_tot 	
	into #ind_refcon 
	from #temp a
	left join #ref b on convert(int,a.renaes)=convert(int,b.renaes) and convert(int,a.mes)=converT(int,b.mes) and convert(int,a.año)=convert(int,b.año)
	left join #cref c on convert(int,a.renaes)=convert(int,c.renaes) and convert(int,a.mes)=converT(int,c.mes) and convert(int,a.año)=convert(int,c.año)

	----------------------------
	select 
	case when ltrim(rtrim(b.CAT_ESTAB)) in ('I-3','I-4') then 'PRIMER NIVEL'
			when ltrim(rtrim(b.CAT_ESTAB)) in ('II-1','II-2','II-E','III-1','III-2','III-E') then 'SEGUNDO NIVEL' end tipo 
	, a.renaes
	, b.DESC_ESTAB est_nombre
	, b.CAT_ESTAB
	, b.UBIGEO
	, b.DESC_DPTO departamento
	, b.DESC_PROV provincia
	, b.DESC_DIST distrito
	, b.DESC_RED
	, b.DESC_MRED
	, b.diris
	, a.año ANIO
	, case 
	     when a.mes=1 then 'Enero'
		 when a.mes=2 then 'Febrero'
		 when a.mes=3 then 'Marzo'
		 when a.mes=4 then 'Abril'
		 when a.mes=5 then 'Mayo'
		 when a.mes=6 then 'Junio'
		 when a.mes=7 then 'Julio'
		 when a.mes=8 then 'Agosto'
		 when a.mes=9 then 'Setiembre'
		 when a.mes=10 then 'Octubre'
		 when a.mes=11 then 'Noviembre'
		 when a.mes=12 then 'Diciembre'
	  end mes
	  , ref_tot ref_apy, cref_tot cref_apy
	  , iif(ref_tot=0,0,1) filtro_referencias, iif(cref_tot=0,0,1) filtro_contrareferencias 
	into #consolidado 
	from #ind_refcon a 
	inner join #renaes b on convert(int,a.renaes)=converT(int,b.cod_estab) 

		---- CRITERIOS DE MEDICION. 
	-- I primer nivel . 
	-- 30% -> 30% de cumplimiento.
	-- 31 a 50 50% de cumplimiento.
	-- 51 a 100 100% de cumplimiento. 


	select *,
	case 
	when tipo='PRIMER NIVEL' and ref_apy>0 and ( (convert(float,cref_apy)/convert(float,ref_apy))=0.3 ) then 'PrimerNivel - 30% de cumplimiento'
	when tipo='PRIMER NIVEL' and ref_apy>0 and ( (convert(float,cref_apy)/convert(float,ref_apy)) between 0.31 and 0.50 ) then 'PrimerNivel - 50% de cumplimiento'
	when tipo='PRIMER NIVEL' and ref_apy>0 and ( (convert(float,cref_apy)/convert(float,ref_apy))>0.50 ) then 'PrimerNivel - 100% de cumplimiento'
	when tipo='PRIMER NIVEL' then 'PrimerNivel - Sin cumplimiento' 
	when tipo='SEGUNDO NIVEL' and ref_apy=10 and cref_apy=10 then 'SegundoNivel - 40% de cumplimiento'
	when tipo='SEGUNDO NIVEL' and (ref_apy>=11 and ref_apy<=19) and (cref_apy>=11 and cref_apy<=19) then 'SegundoNivel - 70% de cumplimiento'
	when tipo='SEGUNDO NIVEL' and ref_apy>=20 and cref_apy>=20 then 'SegundoNivel - 100% de cumplimiento'
	when tipo='SEGUNDO NIVEL' then 'SegundoNivel - Sin cumplimiento'  end Filtro_cumplimiento 
	from #consolidado
	

-- SCRIPT ANTIGUO. 

--create table #TRAMA_REFCON_PRIMER_NIVEL
--(anio int, mes int, renaes int, ref_apy int, cref_apy int)

--create table #TRAMA_REFCON_SEGUNDO_NIVEL
--(anio int, mes int, renaes int, ref_tot int, cref_tot int)


--declare @anio_eval int, @mes_eval int, @mes_final int
---- Parametros
--set @anio_eval=2021
--set @mes_final=3
--set @mes_eval=1

--while @mes_eval <= @mes_final
--begin

--	-- TRAMA REFCON PRIMER NIVEL

--	select distinct id_referencia, cod_unico_d into #tmp_refer
--	from #tramarefcon  r with (nolock) 	
--	left join #renaes e with (nolock) on r.cod_unico_d=e.cod_estab
--	where year(fecha_aceptacion)=@anio_eval and month(fecha_aceptacion)=@mes_eval and 
--	tipo_traslado='REFERENCIA' --and substring(r_id_ups_destino,1,2) in ('15','03','08')
--	and e.cat_estab in ('I-3','I-4')

--	select anio, mes, renaes, count(*) ref_apoyo into #tot_apoyo
--	from (	
--		select year(fecha_aceptacion) anio, month(fecha_aceptacion) mes, cod_unico_d renaes, 
--		row_number() over(partition by id_referencia order by id_referencia) id
--		from #tramarefcon  r with (nolock) 	
--		left join #renaes e with (nolock) on r.cod_unico_d=e.cod_estab
--		where year(fecha_aceptacion)=@anio_eval and month(fecha_aceptacion)=@mes_eval and 
--		tipo_traslado='REFERENCIA' --and substring(r_id_ups_destino,1,2) in ('15','03','08') 
--		and e.cat_estab in ('I-3','I-4')
--	) as r where id=1 group by anio, mes, renaes

--	select r.anio, r.mes, r.renaes, sum(r.referencia) ref_tot, 
--	sum(r.cref_apoyo) cref_apy into #trefcon
--	from 
--	(
--		select year(fecha_envio) anio, month(fecha_envio) mes, cod_unico renaes, 
--		referencia=(case when tipo_traslado='REFERENCIA' then 1 else 0 end),
--		cref_apoyo=(case when tipo_traslado='CONTRAREFERENCIA' and 
--		exists(select c.id_referencia from #tmp_refer c where r.id_refcon=c.id_referencia) then 1 else 0 end), 
--		row_number() over(partition by id_referencia order by id_referencia) id 
--		from  #tramarefcon r with (nolock) 			
--		where year(fecha_envio)=@anio_eval and month(fecha_envio)=@mes_eval
--	) as r 
--	left join #renaes e with (nolock) on r.renaes=e.cod_estab 
--	where r.id=1 and e.cat_estab in ('I-3','I-4') and e.ambito=1 group by r.anio, r.mes, r.renaes

--	insert into #TRAMA_REFCON_PRIMER_NIVEL
--	select r.anio, r.mes, r.renaes, iif(t.ref_apoyo is null,0,t.ref_apoyo) ref_apy, r.cref_apy 
--	from #trefcon r left join #tot_apoyo t on r.anio=t.anio and r.mes=t.mes and r.renaes=t.renaes

--	drop table #tmp_refer
--	drop table #tot_apoyo
--	drop table #trefcon

--	-- TRAMA REFCON SEGUNDO NIVEL
--	insert into #TRAMA_REFCON_SEGUNDO_NIVEL
--	select r.anio, r.mes, r.renaes, sum(r.referencia) ref_tot, 
--	sum(r.contrareferencia) cref_tot
--	from 
--	(
--		select year(fecha_envio) anio, month(fecha_envio) mes, cod_unico renaes, 
--		referencia=(case when tipo_traslado='REFERENCIA' then 1 else 0 end),
--		contrareferencia=(case when tipo_traslado='CONTRAREFERENCIA' then 1 else 0 end), 
--		row_number() over(partition by id_referencia order by id_referencia) id 
--		from #tramarefcon  r with (nolock) 			
--		where year(fecha_envio)=@anio_eval and month(fecha_envio)=@mes_eval
--	) as r 
--	left join #renaes e with (nolock) on r.renaes=e.cod_estab 
--	where r.id=1 and e.cat_estab in ('II-1','II-2','II-E','III-1','III-2','III-E') and e.ambito=1 
--	group by r.anio, r.mes, r.renaes
		
--	set @mes_eval = @mes_eval + 1
--end

--select  'PRIMER NIVEL' as tipo,
--       tmp.renaes,
--	    re.DESC_ESTAB est_nombre,
--	    re.CAT_ESTAB,
--		re.UBIGEO,
--		re.DESC_DPTO departamento,
--		re.DESC_PROV provincia,
--		re.DESC_DIST distrito,
--		re.DESC_RED,
--		re.DESC_MRED,
--		re.diris,
--		tmp.ANIO,
--		case tmp.mes
--	     when 1 then 'Enero'
--		 when 2 then 'Febrero'
--		 when 3 then 'Marzo'
--		 when 4 then 'Abril'
--		 when 5 then 'Mayo'
--		 when 6 then 'Junio'
--		 when 7 then 'Julio'
--		 when 8 then 'Agosto'
--		 when 9 then 'Setiembre'
--		 when 10 then 'Octubre'
--		 when 11 then 'Noviembre'
--		 when 12 then 'Diciembre'
--		 end mes,
--		 ref_apy  , cref_apy 
--from  #TRAMA_REFCON_PRIMER_NIVEL tmp left join #renaes re
--ON tmp.renaes = re.COD_ESTAB
----where tmp.mes <=11
--union all
--select 
--	   'SEGUNDO NIVEL' as tipo,
--        stmp.renaes,
--	    re.DESC_ESTAB est_nombre,
--	    re.CAT_ESTAB,
--		re.UBIGEO,
--		re.DESC_DPTO departamento,
--		re.DESC_PROV provincia,
--		re.DESC_DIST distrito,
--		re.DESC_RED,
--		re.DESC_MRED,
--		re.diris,
--		stmp.ANIO,
--		case stmp.mes
--	     when 1 then 'Enero'
--		 when 2 then 'Febrero'
--		 when 3 then 'Marzo'
--		 when 4 then 'Abril'
--		 when 5 then 'Mayo'
--		 when 6 then 'Junio'
--		 when 7 then 'Julio'
--		 when 8 then 'Agosto'
--		 when 9 then 'Setiembre'
--		 when 10 then 'Octubre'
--		 when 11 then 'Noviembre'
--		 when 12 then 'Diciembre'
--		 end mes,
--         ref_tot, cref_tot
--from  #TRAMA_REFCON_SEGUNDO_NIVEL stmp left join #renaes re
--ON stmp.renaes = re.COD_ESTAB
----where stmp.mes <=11



