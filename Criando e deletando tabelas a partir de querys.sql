-- Criando tabelas a partir de querys


select 
	customer_id,
	datediff('years',birth_date,current_date) as idade_cliente
	into temp_tables.customers_age -- into para jogar os resultados dentro dessa tabela 
from sales.customers


select *
from temp_tables.customers_age


-- Ex 2 - Criar uma tabela a partir do zero
-- Criar uma tabela com a tradução do status  profissional dos clientes 

select distinct 
professional_status
from sales.customers

create table temp_tables.profissoes (
professional_status varchar,
status_profissional varchar
)


select * from temp_tables.profissoes

insert into temp_tables.profissoes 
(professional_status, status_profissional)

values 
('freelancer','freelancer'),
('retired','aposentado(a0)'),
('clt','clt'),
('self-employed','autônomo(a)'),
('other','outro'),
('busnessman','empresário(a)'),
('civil_servant','funcionário(a) público(a)'),
('student', 'estudante')


select * from temp_tables.profissoes


-- Deletando toda a tabela 

drop table temp_tables.profissoes