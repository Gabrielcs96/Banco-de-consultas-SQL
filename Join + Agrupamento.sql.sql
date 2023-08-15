Select 
CalendarYear, 
Sum(SalesQuantity)
from FactSales

inner join DimDate

On FactSales.DateKey = DimDate.Datekey
where CalendarMonthLabel = 'January'
group by CalendarYear
having (Sum(SalesQuantity) > 1200000)


-- JOIN + AGREGAÇÃO

/* a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal
de vendas (ChannelName). Você deve ordenar a tabela final de acordo com SalesQuantity,
em ordem decrescente.
b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e
quantidade total devolvida (Return Quantity) de acordo com o nome das lojas
(StoreName).
c) Faça um resumo do valor total vendido (Sales Amount) para cada mês
(CalendarMonthLabel) e ano (CalendarYear).*/

Select TOP ( 100) 
SUM(SalesQuantity) as 'Soma de vendas',
ChannelName
from FactSales

Inner Join DimChannel
ON FactSales.channelKey = DimChannel.ChannelKey
Group By ChannelName
Order By [Soma de vendas] DESC

-- B 
Select 

    StoreName as 'Loja',
    Sum(SalesQuantity) as 'Total_vendas',
    sum(ReturnQuantity) as 'Tota_devolucoes'

    From FactSales as A
	Inner JOIN DimStore as B
	ON A.StoreKey = B.StoreKey

	Group by StoreName
	Order BY StoreName

-- C 

SELECT 

	CalendarYear as 'Ano'	,
	CalendarMonthLabel as 'Mês',
	Sum(SalesAmount) as 'Faturamento Total'


From FactSales
	
	Inner JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey

	GROUP BY CalendarYear, CalendarYearLabel, CalendarMonthLabel

	Order BY CalendarMonthLabel ASC



/*Questão 2
Você precisa fazer uma análise de vendas por produtos. O objetivo final é
descobrir o valor total vendido (SalesAmount) por produto.
a. Descubra qual é a cor de produto que mais é vendida (de acordo com
SalesQuantity) 
b. Quantas cores tiveram uma quantidade vendida acima de 3.000.000.
*/


-- a 
Select 

ColorName as 'COR',
SUM(SalesQuantity) as 'Qtd Vendida' 

From FactSales as A
 INNER JOIN DimProduct  as B
 ON A.ProductKey = B.ProductKey	

 Group By  ColorName
 ORDER BY Sum(salesQuantity) DESC



-- B

Select 

ColorName as 'COR',
SUM(SalesQuantity) as 'Qtd Vendida' 

From FactSales as A
 INNER JOIN DimProduct  as B
 ON A.ProductKey = B.ProductKey	

 Group By  ColorName
 HAVING (Sum(SalesQuantity) > 3000000)
 ORDER BY Sum(salesQuantity) DESC


 /* Crie um agrupamento de quantidade vendida (SalesQuantity) por
categoria do produto (ProductCategoryName).
Obs: Você precisará fazer mais de 1 INNER JOIN, dado que a relação
entre FactSales e DimProductCategory não é dire*/

Select 

ProductCategoryName as 'Categoria',
SUM(SalesQuantity) as 'Qtd Vendas'

From FactSales as A	
	Inner Join DimProduct as B
	ON A.ProductKey = B.ProductKey	
			Inner Join DimProductSubcategory as C
			ON B.ProductSubcategoryKey = C.ProductSubcategoryKey
				INNER JOIN DimProductCategory as D
				ON C.ProductCategoryKey = D.ProductCategoryKey

GROUP BY D.ProductCategoryName


/* Questão 4
a. Você deve fazer uma consulta à tabela FactOnlineSales e descobrir
qual é o nome completo do cliente que mais realizou compras online
(de acordo com a coluna SalesQuantity).
b. Feito isso, faça um agrupamento de produtos e descubra quais foram
os top 10 produtos mais comprados pelo cliente da letra a,
considerando o nome do produto*/

-- a



	SELECT 
	a.CustomerKey,
	FirstName as 'Nome',
	LastName as 'Sobrenome',
	Sum(SalesQuantity) as 'Qtd Vendas'

	from FactOnlineSales as A
	INNER JOIN DimCustomer as B
	ON A.CustomerKey = B.CustomerKey
	
	Where CustomerType = 'Person'
	Group By FirstName, LastName, A.CustomerKey	

	ORDER BY SUM(SalesQuantity) DESC


    --b 
    	Select TOP(10)
	ProductName as 'Nome Produto' ,
	SUM(SalesQuantity) as 'Qtd Comprada'

	From FactOnlineSales as A
	INNER JOIN DimProduct as B
	ON 	A.ProductKey = B.ProductKey
	
	where  A.CustomerKey = 7665
	Group By ProductName

	
	Order BY SuM(SalesQuantity) DESC






    /*Questão 5
Faça um resumo mostrando o total de produtos comprados (Sales
Quantity) de acordo com o sexo dos clientes.
*/

Select 
Gender as 'Genero',
Sum(SalesQuantity) as 'Qtd_Vendas'

From FactOnlineSales as A
 INNER JOIN DimCustomer as B
 ON A.CustomerKey = B.CustomerKey

Group By Gender 
having Gender is not null
Order By Sum(SalesQuantity) DESC



/*Questão 6
Faça uma tabela resumo mostrando a taxa de câmbio média de acordo
com cada CurrencyDescription. A tabela final deve conter apenas taxas
entre 10 e 100.
*/

Select 
CurrencyDescription,
AVG(AverageRate) as 'média'

FROM 
FactExchangeRate as A
INNER JOIN DimCurrency as B
ON A.CurrencyKey = B.CurrencyKey

Group By CurrencyDescription
HAVING AVG(AverageRate) between 10 and 100


/*Descubra o valor total na tabela FactStrategyPlan destinado aos
cenários: Actual e Budget. */


SELECT 
ScenarioName as 'Cenário',
SUM(Amount) as 'Total'

FROM
	FactStrategyPlan as A
INNER JOIN DimScenario as B

ON A.ScenarioKey= B.ScenarioKey
GROUP BY ScenarioName
Having ScenarioName in ('Actual','Budget')

