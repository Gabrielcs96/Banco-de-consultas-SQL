-- colunas - inserindo, atualizando e deletando 

-- exemplo 1 - inserção de colunas 
--insira a coluna idade do cliente na tabela sales.customers

alter table sales.customers
add customer_age int

select * 
from sales.customers
limit 10

update sales.customers
set customer_age = datediff('years', birth_date, current_date)
where true


-- exemplo 02 
-- altere o tipo de uma coluna... aqui vamos alterar de customer_age de int para varchar

alter table sales.customers
alter column customer_age type varchar

select * from sales.customers 
limit 50


-- Exemplo 3 - alterar o nome de uma coluna

alter table sales.customers
rename column customer_age to age




--exemplo 04 
-- Deletar - Deletar a age

alter table sales.customers 
drop column age

select * from sales.customers
limit 50