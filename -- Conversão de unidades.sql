-- Conversão de unidades
/* Dá pra converter data em texto e texto em data */
-- Primeiro operador - usando o " ::" e explicitando qual que é o formato 
-- aLÉM DISSO, PODEMOS USAR O CAST para fazer as conversões ! 

select '2021-10-01'::date - '2021-02-01'::date

select '100'::numeric - '10'::numeric


select replace(112122::text,'1','A') 


select CAST('2021-10-01' as date) - CAST('2021-02-01'  as date)