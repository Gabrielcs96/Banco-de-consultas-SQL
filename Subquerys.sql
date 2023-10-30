-- Subquerys

-- Subquery no where

select * from sales.products
where price = (select min(price) from sales.products)

--Subquery com with !

with alguma_tabela as (select 
professional_status,
(current_date - birth_date)/365 as idade
from sales.customers
)

select professional_status,
avg(idade) as idade_media
from alguma_tabela
group by professional_status


-- Subquery no FROM - Toda subquery no from pode ser substituída por uma subquery no with 


select professional_status,
avg(idade) as idade_media
from (select 
professional_status,
(current_date - birth_date)/365 as idade
from sales.customers
)
group by professional_status

--Subquery no SELECT 
/*Essa query é super complexa e super pesada, mas, em alguns casos, só ela pode resolver a nossa pergunta de negócio */
select 
fun.visit_id,
fun.visit_page_date,
sto.store_name,
(select count(*) 
from sales.funnel as fun2
where fun2.visit_page_date <= fun.visit_page_date 
and fun2.store_id = fun.store_id) as "visitas acumuladas"

from sales.funnel as fun
left join sales.stores as sto
on fun.store_id = sto.store_id
order by sto.store_name, fun.visit_page_date





-- EXEMPLOS ########################################################################

-- (Exemplo 1) Análise de recorrência dos leads
-- Calcule o volume de visitas por dia ao site separado por 1ª visita e demais visitas
-- Criar uma subquery que me informe qual foi a primeira data de visita ao site por customer id 
-- Depois eu puxo todas as visitas que ocorreram ao site e cruzo a info com a primeira data de visita de cada cliente, assim dá para 
-- identificar qual que é a primeira visita e qual que não é 

-- Criar uma subquery que me informe qual foi a primeira data de visita ao site por customer id 
-- Depois eu puxo todas as visitas que ocorreram ao site e cruzo a info com a primeira data de visita de cada cliente, assim dá para 
-- identificar qual que é a primeira visita e qual que não é 

with primeira_visita as (

	select customer_id, min(visit_page_date) as visita_1
	from sales.funnel 
	group by customer_id)
	
	select 
	fun.visit_page_date,
	(fun.visit_page_date <> primeira_visita.visita_1) as lead_recorrente,
	count(*)
	
	from sales.funnel as fun 
	left join primeira_visita
	on fun.customer_id = primeira_visita.customer_id
	
	group by fun.visit_page_date, lead_recorrente




-- (Exemplo 2) Análise do preço versus o preço médio
-- Calcule, para cada visita ao site, quanto o preço do um veículo visitado pelo cliente
-- estava acima ou abaixo do preço médio dos veículos daquela marca 
-- (levar em consideração o desconto dado no veículo)

-- calcular para cada veículo do nosso site quanto o preço está diferente do preço médio 

with preco_medio as (
select 
brand, 
avg(price) as preco_medio_da_marca
from sales.products
group by brand
)

select 
fun.visit_id,
fun.visit_page_date,
pro.brand,
(pro.price * (1+fun.discount)) as preco_final,
preco_medio.preco_medio_da_marca,
((pro.price * (1+fun.discount)) - preco_medio.preco_medio_da_marca) as preco_vs_media
from sales.funnel as fun 
left join sales.products as pro
on fun.product_id = pro.product_id
left join preco_medio
on pro.brand = preco_medio.brand 



-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers


with numero_de_visitas as ( 
	select 
	customer_id,count(*) as n_visitas
from sales.funnel
group by 1)

select 
customers.*,
n_visitas

from sales.customers as customers
left join numero_de_visitas as ndv
on customers.customer_id = ndv.customer_id
order by n_visitas desc     