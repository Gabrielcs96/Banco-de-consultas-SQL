-- (Exemplo 1) Identifique qual é o status profissional mais frequente nos clientes 
-- que compraram automóveis no site


select 
	clientes.professional_status,
	count(fun.paid_date) as pagamentos

from sales.funnel as fun
left join sales.customers as clientes
	on fun.customer_id = cus.customer_id
group by cus.professional_status
order by pagamentos desc


-- (Exemplo 2) Identifique qual é o gênero mais frequente nos clientes que compraram
-- automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders

-- Essa é mais complexa, porque eu tenho que criar uma join entre a funnel e a customers, para pegar o ID do cliente  que pagaram, porque se ele está na customers é sinal de que ele comprou
-- E depois para saber o gênero do cliente, eu uso a primeira tabela ( que sofreu o join) e faço um join com a ibge, para saber se o primeiro nome é "referente" a um homem ou mulher

select 
	ibge.gender as genero,
	count(fun.paid_date) 
from sales.funnel as fun
left join sales.customers as clientes
	on fun.customer_id = clientes.customer_id
left join temp_tables.ibge_genders as ibge
	on lower(cus.first_name) = ibge.first_name -- lower para passar tudo para minúsculo
group by ibge.gender


-- (Exemplo 3) Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions

select
	reg.region,
	count(fun.visit_page_date) as visitas
from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id = cus.customer_id
left join temp_tables.regions as reg
	on lower(cus.city) = lower(reg.city)
	and lower(cus.state) = lower(reg.state)
group by reg.region
order by visitas desc

