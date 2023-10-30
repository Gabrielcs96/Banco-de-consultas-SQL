-- Trazer um agrupamento por estados
select state, count(*) as contagem
from sales.customers group by state
order by contagem desc


--agrupamento d emúlstiplas colunas
select state, professional_status, count(*) as contagem
from sales.customers group by state, professional_status
order by state,contagem desc


select state
from sales.customers
group by state
