/*O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa
análise considerando a tabela FactSales.
*/

-- Resposta

SELECT 

Sum(SalesQuantity) as QuantidadeTotal,
sum(ReturnQuantity) as QuantidadeDevoluções
from 
FactSales

-- Easy



/*   Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes
da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse
resultado.
   */

Select 
	AVG(YearlyIncome) as 'MÉDIA DE PAGAMENTO ANUAL',
	AVG(YearlyIncome)/12 as 'MÉDIA DE PAGAMENTO MENSAL'
from
DimCustomer

where Occupation = 'Professional'

-- Easy 

/*   Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na
empresa. O seu gerente te pediu os seguintes números e informações:
a) Quantos funcionários tem a loja com mais funcionários?
b) Qual é o nome dessa loja?
c) Quantos funcionários tem a loja com menos funcionários?
d) Qual é o nome dessa loja?
  */

  -- Descobrindo a Loja que tem menos funcionários
Select 
StoreName,
EmployeeCount
from 
DimStore

Order By EmployeeCount

-- Descobrindo a Loja que tem menos funcionários
Select 
StoreName,
EmployeeCount
from 
DimStore

Order By EmployeeCount DESC

 -- Minha resposta tá diferente, mas o resultado está igual. Logo, eu estou certo ! 

    /*   A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade
total de funcionários do sexo Masculino e do sexo Feminino.
a) Descubra essas duas informações utilizando o SQL.
b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as
seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.
  */

  SELECT 
Count(1) as 'Funcionários do gênero Masculino '

From 
	DimEmployee

	where Gender='M'

    SELECT 
Count(1) as 'Funcionários do gênero Feminino '

From 
	DimEmployee

	where Gender='F'


    SELECT TOP(1)
	Concat(FirstName,' ',LastName) as "Nome Completo" ,
	EmailAddress as "Endereço de E-mail",
	HireDate as " Data de Contratação"
From 
	DimEmployee

	where Gender='M'

    Order By HireDate

SELECT TOP(1)
	Concat(FirstName,' ',LastName) as "Nome Completo" ,
	EmailAddress as "Endereço de E-mail",
	HireDate as " Data de Contratação"
From 
	DimEmployee

	where Gender='F'

    Order By HireDate

    -- Razoavelmente easy! kkk


/*   Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes
informações:
a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto
Para simplificar, você pode fazer isso em uma mesma consulta. */

select 
count(Distinct ColorName) as 'Qtd Cores',
count(Distinct BrandName) as 'Qtd Marcas',
Count(Distinct ClassName) as 'Qtd Classes'
from 
	DimProduct

    -- Easy


    	/*A Diferença entre o Where e o Having é que o where é utilizado para fazer filtros na tabela geral e o having 
	É usado para fazer filtros após os dados já agrupados */

    