--Operadores Lógicos 

select *
from sales.products
where price >= 100000 and price <= 200000

select *
from sales.products
where price < 100000 or price > 200000

select *
from sales.products
where brand = 'HONDA' or brand = 'TOYOTA' or brand = 'RENAULT'

select distinct first_name
from sales.customers
where first_name = 'ANA'

select distinct first_name
from sales.customers
where first_name like 'ana%'


select *
from temp_tables.regions
where population = null
