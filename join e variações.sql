

-- EXEMPLOS ########################################################################

--Leftjoin gold ! 
select * from temp_tables.tabela_1
select * from temp_tables.tabela_2

select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
left join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf


--Inner join pra trazer apenas os matchs entre ambas as tabelas 
select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
inner join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf

-- Right join só para trazer os resultados primeiro, da tabela direita 
select t2.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
right join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf


-- Full join para trazer a soma das duas tabelas 
select t2.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
full join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf
