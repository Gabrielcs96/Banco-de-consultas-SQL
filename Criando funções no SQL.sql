-- Criando funções no SQL 

-- Exemplo - Crie uma função chamada datediff para calcular a diferença entre duas datas em dias, semanas, meses e anos

/*#################chassi do que eu preciso fazer###################### 
select 
	(current_date - '2018-06-01')/7 as diferenca_em_semanas,
 	(current_date - '2018-06-01')/30 as diferenca_em_meses,
 	(current_date - '2018-06-01')/365 as diferenca_em_anos
*/

    -- criando a função

create function datediff(unidade varchar, data_inicial date, data_final date)
returns integer
language sql

as

$$

	select
		case
			when unidade in ('d', 'day', 'days') then (data_final - data_inicial)
			when unidade in ('w', 'week', 'weeks') then (data_final - data_inicial)/7
			when unidade in ('m', 'month', 'months') then (data_final - data_inicial)/30
			when unidade in ('y', 'year', 'years') then (data_final - data_inicial)/365
			end as diferenca

$$

select datediff('day', '2021-02-04', current_date)



/*para apagar a função, basta escrever assim: */

drop function datediff