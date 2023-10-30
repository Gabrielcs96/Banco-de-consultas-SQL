--Exemplo - Seleção de todas as colunas da tabela 
select *
from sales.customers


--select distinct 
select distinct brand
from sales.products


--distinct
select distinct brand, model_year
from sales.products

--where 
select email, state
from sales.customers 
where (state = 'SC' or state = 'MS')
and birth_date <'1991-12-28' 




--order by
select * from sales.products
order by price desc

--limit 
select *
from sales.customers
limit 5

--Operadores numéricos e função de data
select 
email,
birth_date,
(current_date - birth_date)/365 as idade_cliente -- Para pegar a idade do cliente 
from sales.customers

limit 10


select 
email,
birth_date,
(current_date - birth_date)/365 as idade_cliente -- Para pegar a idade do cliente 
from sales.customers

order by idade_cliente asc -- trazendo os clientes mais novos 
limit 10

-- Soma de strings 
select 
first_name || ' ' || last_name as "Nome completo"
from sales.customers

limit 50