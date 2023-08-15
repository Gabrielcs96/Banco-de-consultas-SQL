FORMAT -- Para formatar

Cast('05/03/2022' as DATETIME) 
FORMAT


ROUND arrendodar 
Round(3.241231 , 4)  =  3.2410
--Round (truncar)


Floor -- Arredondar para baixo


Ceiling -- Arredondamento paraCima !


Declare @Var tipo 

Declare @VAR TIPO

Exemplo:

Declare @Var INT
SET @Var = 10 
Select @Var

DECLARE @IDADE INT
SET @IDADE = 30
SELECT @IDADE


DECLARE @VAR1 INT
DECLARE @VAR2 VARCHAR
DECLARE @VAR3 DATETIME

SET @VAR1 = 10
SET @VAR2 = 'CAPEPUXIS'
SET @VAR3 = '15/04/2022'

SELECT @VAR1,@VAR2,@VAR3




Declare @Var INT
SET @Var = 10 
Select @Var

DECLARE @VAR1 INT
DECLARE @VAR2 VARCHAR(50)
DECLARE @VAR3 DATETIME

SET @VAR1 = 10
SET @VAR2 = 'CAPEPUXIS'
SET @VAR3 = '15/04/2022'

SELECT @VAR1,@VAR2,@VAR3

DECLARE @VAR4 INT = 10,
		@VAR5 VARCHAR(50) = 'Alameda dos Nhambiquaras',
		@VAR6 DATETIME = '31/03/2022' 

SELECT @VAR4,@VAR5,@VAR6



/*EXERCÍCIO DE TESTE */

	DECLARE @Desconto float 
	

	SET @Desconto = 0.10
	
Select 
ProductKey as 'Chave do Produto',
ProductName as 'Nome do Produto',
UnitPrice as 'Preço Unitário',
UnitPrice * ( 1 - @Desconto) as 'Preço Final'

FROM 
	DimProduct


/*EXERCÍCIO DOIS DE TESTE */


DECLARE @VARDATA DATETIME
SET @VARDATA = '01/01/1980'

SELECT	 

	A.FirstName as 'Nome',
	A.LastName as 'Sobrenome',
	A.BirthDate as 'Nascimento',
	'Cliente' as 'tipo'

FROM 
	DimCustomer as A

WHERE BirthDate >= @VARDATA

UNION 

SELECT	 

	B.FirstName as 'Nome',
	B.LastName as 'Sobrenome',
	B.BirthDate as 'Nascimento',
	'Funcionário' as 'tipo'

FROM 
	DimEmployee as B

WHERE 
B.BirthDate >= @VARDATA
Order By Nascimento 






DECLARE @varTotalFuncionarios int 
SET @varTotalFuncionarios = (SELECT COUNT(*) From DimEmployee)
	 
	 Select @varTotalFuncionarios




PRINT -- [É  USADO PARA PRINTAR NAS MENSAGENS]



DECLARE @lojason int
DECLARE @LOJASoff int

SET @lojason = ( select count(*) from DimStore where Status = 'on') 
SET @LOJASoff = ( select count(*) from DimStore where Status = 'off') 

PRINT 'O total de lojas fechadas é de: ' + cast(@LOJASoff as varchar)

PRINT 'O total de lojas Abertas é de: ' + cast(@LOJASon as varchar)

-- tEM O SET NOCOUNT ON QUE TIRA O CONTADOR QUE APARECE LÁ NA TELA DE MENSAGENS 



Declare @varListaNomes varchar(100)
Set @varListaNomes = ''

Select 
@varListaNomes = @varListaNomes + FirstName + ', ' + CHAR(10)


FROM 
	DimEmployee	
WHERE DepartmentName = 'Marketing' 
and	Gender = 'F'


PRINT LEFT(@varListaNomes, DATALENGTH(@varListaNomes)-3)



/*1. Declare 4 variáveis inteiras. Atribua os seguintes valores a elas:
valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7
a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame
essa variável de soma.
b) Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4.
Chame essa variável de subtracao.
c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o
valor4. Chame essa variável de multiplicacao.
d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame
essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.
e) Arredonde o resultado da letra d) para 2 casas decimais.
*/


DECLARE @Var1 FLOAT
DECLARE @Var2 FLOAT
DECLARE @Var3 FLOAT 
DECLARE @Var4 FLOAT 

SET @Var1 = 10
SET @Var2 = 5  
SET @Var3 = 34
SET @Var4 = 7 

DECLARE @NewVar1 FLOAT 
DECLARE @NewVar2 FLOAT 
DECLARE @NewVar3 FLOAT 
DECLARE @NewVar4 float  

Set @NewVar1 = @Var1 + @Var2
Set @NewVar2 = @Var3 - @Var4
Set @NewVar3 = @Var1 * @Var4
Set @NewVar4 = @Var3 / @Var4

PRINT 'O resultado da soma de Var1 + Var2  é: ' + cast(@NewVar1 as Varchar)
PRINT 'O resultado da subtração de Var3 - Var4  é: ' + cast(@NewVar2 as Varchar)
PRINT 'O resultado da multiplicação de Var1 e Var4  é: ' + cast(@NewVar3 as Varchar)
PRINT 'O resultado da divisão de  Var3/ Var4  é: ' + cast(ROUND (@NewVar4 ,3) as Varchar)

-- A piece of cake

/*. Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser
especificado.
a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’.
b) Declare uma variável chamada ‘quantidade’ e atribua o valor de 12.
c) Declare uma variável chamada ‘preco’ e atribua o valor 9.99.
d) Declare uma variável chamada ‘faturamento’ e atribua o resultado da multiplicação entre
‘quantidade’ e ‘preco’.
e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT*/


DECLARE @Produto Varchar(100)
DECLARE @Quantidade int
DECLARE @Preco float 
DECLARE @Faturamento float

SET @Produto = 'Celular'
SET @Quantidade = 12
SET @Preco = 9.99
SET @Faturamento = @Quantidade * @Preco

Select 
@Produto, 
@Quantidade,
@Preco,
@Faturamento



/*  3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de
usuários. Em resumo, esses dados são:
- Nome do usuário
- Data de nascimento
- Quantidade de pets que aquele usuário possui
Você precisará criar um código em SQL capaz de juntar as informações fornecidas por este
usuário. Para simular estes dados, crie 3 variáveis, chamadas: nome, data_nascimento e
num_pets. Você deverá armazenar os valores ‘André’, ‘10/02/1998’ e 2, respectivamente.
O resultado final a ser alcançado é mostrado no print abaixo:   */


DECLARE @nome varchar(30) = 'André'
DECLARE @data_nascimento DATETIME = '10/02/1998'
DECLARE @num_pets int = 2

SELECT 
'Meu nome é ' + @nome + 'Nasci em: ' + FORMAT(@data_nascimento, 'MMM/ yyyy') + 'e tenho ' + CAST(@num_pets as Varchar) + ' pets' 

-- Absolutely easy 

/*   4. Você acabou de ser promovido e o seu papel será realizar um controle de qualidade sobre as
lojas da empresa.
A primeira informação que é passada a você é que o ano de 2008 foi bem complicado para a
empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio é descobrir
o nome dessas lojas que fecharam no ano de 2008, para que você possa entender o motivo e
mapear planos de ação para evitar que outras lojas importantes tomem o mesmo caminho.
O seu resultado deverá estar estruturado em uma frase, com a seguinte estrutura:
‘As lojas fechadas no ano de 2008 foram: ’ + nome_das_lojas
  */

   
 DECLARE @Nome_Loja Varchar(300) = ''

SELECT 

	@Nome_Loja = @Nome_Loja + StoreName + ', ' 

From 
	DimStore

	where 
	FORMAT(CloseDate, 'yyyy') = 2008

	PRINT ' As lojas Fechadas em 2008 foram: ' + @Nome_Loja


    