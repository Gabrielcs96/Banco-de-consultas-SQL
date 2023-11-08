-- Inserir, deletar e e atualizar dados numa tablea 
select * from temp_tables.profissoes


-- inserindo... 

insert into temp_tables.profissoes
(professional_status, status_profissional)

values
('intern', 'estagiário(a)'),
('unemployed','desempregado(a)')

-- exemplo 2 - atualização 
update temp_tables.profissoes
set professional_status = 'intern'
where status_profissional ='estagiario(a)'

-- exemplo 3 - deleção 

-- delete a linha de "estagiário" na tabela

delete from temp_tables.profissoes
where status_profissional ='estagiário(a)'