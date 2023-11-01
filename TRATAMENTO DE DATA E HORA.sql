-- TRATAMENTO DE DATA E HORA 

-- TIPOS ###########################################################################
-- INTERVAL
-- DATE_TRUNC
-- EXTRACT
-- DATEDIFF
-- current_date - data de hoje 


select current_date

select current_date +10 -- Vai trazer por padrão a data em dias 

select current_date + interval '10 weeks' -- somando em semanas

select (current_date + interval '10 weeks')::date -- trazendo a data sem a hora 

select (current_date + interval '10 months')::date -- adicionando em meses e trazendo apenas a data 

select current_date + interval '54 hours' -- Somando em horas ! 


--date_trunc para truncar as datas ! 

select 
date_trunc('month',visit_page_date)::date as mes,
count(*)

from sales.funnel as fun

group by mes
order by mes desc



-- Usando o extract para a gente remover uma parte da data 

-- calcular o dia da semana que mais recebe visitas no site 

select 
	
	case 
	when extract('dow' from visit_page_date ) = 0 then 'domingo'
	when extract('dow' from visit_page_date ) = 1 then 'segunda'
	when extract('dow' from visit_page_date ) = 2 then 'Terça'
	when extract('dow' from visit_page_date ) = 3 then 'quarta'
	when extract('dow' from visit_page_date ) = 4 then 'quinta'
	when extract('dow' from visit_page_date ) = 5 then 'sexta'
	when extract('dow' from visit_page_date ) = 6 then 'sábado'
	end as dia_semana_corrigido,
	count(*)
	
	from sales.funnel 
	
	group by dia_semana_corrigido
	order by dia_semana_corrigido desc

    -- Diferenç entre datas com o operador de subtração (-)


select (current_date - '2018-06-01')/7 as diferenca_em_semanas


-- Diferenç entre datas com o operador de subtração (-)

select 
	(current_date - '2018-06-01')/7 as diferenca_em_semanas,
 	(current_date - '2018-06-01')/30 as diferenca_em_meses,
 	(current_date - '2018-06-01')/365 as diferenca_em_anos
	

