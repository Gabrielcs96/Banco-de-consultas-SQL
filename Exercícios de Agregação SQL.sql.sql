/* a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
(channelkey).
b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).
c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
para o ano de 2007.*/

-- a 

	SELECT 
	SUM(SalesQuantity) as 'Soma de vendas' ,-- Somando a quantidade de vendas para que consigamos manter o agrupamento	
	channelKey

	FROM 
	FactSales

	GROUP BY channelKey

    -- b

	SELECT 
	SUM(SalesQuantity) as 'Soma de vendas' ,-- Somando a quantidade de vendas para que consigamos manter o agrupamento	
	SUM(ReturnQuantity) as 'Devoluções',
	StoreKey

	FROM 
	FactSales

	GROUP BY StoreKey

    -- c 

    Select 
	SUM(SalesAmount),
	StoreKey

	from
	FactSales

	where DateKey BETWEEN '01/01/2007' and '31/12/2007'

	Group By StoreKey

    -- Esse deu um pouco de trabalho para sair por conta do between,
    -- geralmente eu uso o Unix time stamp 
    


    /*
    2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).
a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.
b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado
*/


-- a 

	SELECT 
	ProductKey,
	Sum(SalesAmount) as 'Total Vendido'

	From 
	FactSales

	GROUP BY ProductKey
	HAVING Sum(SalesAmount)>5000000

	ORDER BY [Total Vendido] DESC


    -- b 

    	SELECT TOP(10)
	ProductKey,
	Sum(SalesAmount) as 'Total Vendido'

	From 
	FactSales

	GROUP BY ProductKey
	--HAVING Sum(SalesAmount)>5000000

	ORDER BY [Total Vendido] DESC

    -- Easy ! 


    /*FACTONLINESALES
3. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna
SalesQuantity).
b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto
e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
*/

--a

Select TOP(5)
	CustomerKey,
	Sum(SalesQuantity) as 'qtd. Compras'
from 
FactOnlineSales

Group By CustomerKey

order By [qtd. Compras] DESC


--b
Select TOP(3)
	ProductKey,
	Sum(SalesQuantity) as 'qtd. Compras'
from 
FactOnlineSales

Where CustomerKey = 19037

Group By ProductKey

order By [qtd. Compras] DESC



-- Eu deveria por um where com a identificação do cliente 

-- Não tão easy, hein... Mas, foi tranquilo. 

/*DIMPRODUCT
4. a) Faça um agrupamento e descubra a quantidade total de produtos por marca.
b) Determine a média do preço unitário (UnitPrice) para cada ClassName.
c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possu*/


--a 


	SELECT 
		BrandName,
		count(*)

	From	
		DimProduct

	GROUP BY BrandName


    --b

    	
	SELECT 
	ClassName,
	AVG(UnitPrice)

	From
	DimProduct

	Group By ClassName


    --c

    
	SELECT 
	colorName,
	SUM(Weight)

	From
	DimProduct

	Group By ColorName




/*Você deverá descobrir o peso total para cada tipo de produto (StockTypeName).
A tabela final deve considerar apenas a marca ‘Contoso’ e ter os seus valores classificados em
ordem decrescente.   */

Select 
StockTypeName,
Sum(weight) as 'Soma de pesos',
BrandName

From DimProduct 

group by StockTypeName, BrandName
HAVING BrandName = 'Contoso'

ORDER BY [Soma de pesos] ASC

-- Easy


/*   Você seria capaz de confirmar se todas as marcas dos produtos possuem à disposição todas as
16 opções de cores?
   */

   --Resposta 

   Select 
	Count(DISTINCT ColorName) as 'Contador de cores',
	BrandName
	 
From 
DimProduct

	GROUP BY BrandName


    -- Easy 


    /*   Faça um agrupamento para saber o total de clientes de acordo com o Sexo e também a média
salarial de acordo com o Sexo. Corrija qualquer resultado “inesperado” com os seus
conhecimentos em SQL   */

--- Resposta 




SELECT 

	Gender,
	SUM(YEarlyIncome) as'Soma  Salarial',
	Count(*) as 'Qtd. Pessoas',
	(SUM(YEarlyIncome)/Count(*)) as  'MédiaSalarial anual',
	concat('U$',' ',(SUM(YEarlyIncome)/Count(*))/12) as 'Média Salarial Mensal'
FROM 
	DimCustomer

GROUP BY GENDER
HAVING Gender is not null


-- Olha... Não foi tão easy. Mas, ainda assim foi easy!  


/*     Faça um agrupamento para descobrir a quantidade total de clientes e a média salarial de
acordo com o seu nível escolar. Utilize a coluna Education da tabela DimCustomer para fazer
esse agrupamento.     */

-- RESPOSTA

SELECT * 
FROM DimCustomer

	SELECT 
	count(1) as 'Contador de Clientes',
	SUM(YearlyIncome)/count(1) as 'Média Salarial',
	Education

	FROM
		DimCustomer

	GROUP BY 
		Education


/*9. Faça uma tabela resumo mostrando a quantidade total de funcionários de acordo com o
Departamento (DepartmentName). Importante: Você deverá considerar apenas os
funcionários ativos.
*/

SELECT	
	DepartmentName,
	count(1) as 'Contagem de Funcionários'


	FROM 
	DimEmployee
	where Status = 'Current'
	Group By DepartmentName

    -- A piece of cake 

    /* Faça uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Você
deve considerar apenas as mulheres, dos departamentos de Production, Marketing,
Engineering e Finance, para os funcionários contratados entre os anos de 1999 e 2000*/

SELECT 
Title,

SUM(VacationHours) as TotalHoras

	FROM DImEmployee

	where Gender = 'F'
	and DepartmentName in ('Production', 'Marketing', 'Engineering', 'Finance')
	and HireDate BETWEEN '01/01/1999' and '31/12/2000'

	Group By Title

    -- Not so easy 

    