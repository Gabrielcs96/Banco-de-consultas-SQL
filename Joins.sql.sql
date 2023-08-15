/*Select ProductKey, ProductSubcategoryKey, ProductName from DimProduct;
Select ProductSubcategoryKey, ProductSubcategoryName, ProductCategoryKey from DimProductSubcategory;
Select ProductCategoryKey,ProductCategoryName From DimProductCategory
*/

-- minha missão com múltiplos joins é tentar fazer um join e depois um join desse join! ( kkkk)

Select 
ProductKey,
ProductName,
A.ProductSubcategoryKey,
C.ProductCategoryName
From DimProduct as A
Inner Join DimProductSubcategory as B
ON A.ProductSubcategoryKey = B.ProductSubcategoryKey
Inner Join DimProductCategory as C
ON B.ProductCategoryKey = C.ProductCategoryKey 


-- Ficou legal. 


/*   1. Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela
DimProductSubcategory para a tabela DimProduct.   */



Select
A.ProductKey as 'Chave do produto',
A.ProductName 'Nome Do Produto',
B.ProductSubcategoryName as 'Nome da Subcategoria'

From DimProduct as A

Inner Join DimProductSubcategory as B
ON  A.ProductSubcategoryKey= B.ProductSubcategoryKey

-- Caracolis, essa foi difícil para podar

/*        Identifique uma coluna em comum entre as tabelas DimProductSubcategory e
DimProductCategory. Utilize essa coluna para complementar informações na tabela
DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.]]
      */



SELECT 
*
FROM 
DimProductSubcategory as A
Left JOIN  DimProductcategory as B
ON B.ProductCategoryKey = A.ProductCategoryKey

-- Easy 



/*      Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do País associados
(de acordo com DimGeography). Seu SELECT final deve conter apenas as seguintes colunas:
StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT
JOIN neste exercício.        */


SELECT 
StoreKey, StoreName, EmployeeCount, ContinentName , RegionCountryName

FROM 
	DimStore as A
LEFT JOIN DimGeography as B
ON	A.GeographyKey = B.GeographyKey

-- easy



/*  Complementa a tabela DimProduct com a informação de ProductCategoryDescription. Utilize
o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes.  */


Select 
A.ProductKey,
A.ProductName,
A.Manufacturer,
C.ProductCategoryDescription

From DimProduct as A
Left Join DimProductSubcategory as B
ON A.ProductSubcategoryKey = B.ProductSubcategoryKey
Left Join DimProductCategory as C
ON C.ProductCategoryKey = B.ProductCategoryKey

-- Not so easy, but easy! 


/*   A tabela FactStrategyPlan resume o planejamento estratégico da empresa. Cada linha
representa um montante destinado a uma determinada AccountKey.
a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.
b) Faça um INNER JOIN para criar uma tabela contendo o AccountName para cada
AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• AccountName
• Amount   */

/*A*/ -- 
SELECT TOP(100)
	*
FROM 
	FactStrategyPlan


/*B*/ -- 


Select TOP(100)
StrategyPlanKey,
DateKey,
AccountName,
Amount,
A.AccountKey
FROM FactStrategyPlan A
INNER JOIN DimAccount B
ON A.AccountKey = B.AccountKey

-- Easy

/*   Vamos continuar analisando a tabela FactStrategyPlan. Além da coluna AccountKey que
identifica o tipo de conta, há também uma outra coluna chamada ScenarioKey. Essa coluna
possui a numeração que identifica o tipo de cenário: Real, Orçado e Previsão.
Faça um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey
da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• ScenarioName
• Amount   */


Select 
StrategyPlanKey,
DateKey,
A.ScenarioKey,
B.ScenarioName,
Amount

FROM FactStrategyPlan A
INNER JOIN DimScenario B
ON A.ScenarioKey = B.ScenarioKey

-- EASY

/*     Algumas subcategorias não possuem nenhum exemplar de produto. Identifique que
subcategorias são essas.     */
Select 
ProductSubcategoryName
From 
DimProduct As A

Right Join DimProductSubcategory AS B
ON A.ProductSubcategoryKey = B.ProductSubcategoryKey

Where A.ProductName is Null

-- Essa foi difícil. Sobretudo entender pq usar o Right Join 


/*A tabela abaixo mostra
a combinação entre Marca
e Canal de Venda, para
as marcas Contoso
, Fabrikam
e Litware
. Crie um código SQL para chegar
no mesmo resultado
.
*/
Select 
Distinct BrandName,
		 ChannelName

FROM DimProduct CROSS JOIN DimChannel
where BrandName In('Contoso', 'Fabrikam', 'Litware')

-- easy

