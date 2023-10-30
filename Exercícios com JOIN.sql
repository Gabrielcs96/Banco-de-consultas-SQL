-- Exercícios JOIN 
-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel

select 
produtos.brand as marca,
count(*) as visitas
from sales.funnel as funel
left join sales.products as produtos
on funel.product_id = produtos.product_id
group by marca
order by visitas desc


-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
select 
lojas.store_name,
count(*)
from sales.funnel as funnel
left join sales.stores as lojas
on funnel.store_id = lojas.store_id
group by lojas.store_name
order by count(*) desc

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)

select 
regiao.size,
count(*)
from sales.customers as clientes
left join temp_tables.regions as regiao
on lower(clientes.city) = lower (regiao.city)
and lower (clientes.state) = lower(regiao.state)
group by regiao.size
order by count(*)