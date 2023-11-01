-- Funçoes de tratamento de texto 

/*lower - Para passar tudo para minúsculo 
- UPPER() - para passar tudo para uppercase
TRIM() é utilizado para tirar os espaços "desnecessários"
REPLACE() é utilizado para trocar partes do texto
*/



select 'São Paulo' = 'SÃO PAULO'
select upper('São Paulo') = 'SÃO PAULO'


select 'São Paulo' = 'são paulo'
select lower('São Paulo') = 'são paulo'


select 'SÃO PAULO     ' = 'SÃO PAULO'
select trim('SÃO PAULO     ') = 'SÃO PAULO'


select 'SAO PAULO' = 'SÃO PAULO'
select replace('SAO PAULO', 'SAO', 'SÃO') = 'SÃO PAULO'