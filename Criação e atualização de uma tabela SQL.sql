CREATE DATABASE CADASTRO
GO

USE CADASTRO
GO

CREATE TABLE Clientes (
ID int,
NOME VARCHAR (20),
Pontos bigint
)
GO

USE CADASTRO
INSERT INTO Clientes (ID, Nome, Pontos) VALUES(0, 'TESTE', 01)

INSERT INTO Clientes(ID, Nome, Pontos) VALUES(1,'Marcela',1051)

INSERT INTO Clientes(ID, Nome, Pontos) VALUES(2,'Renata',2309)

INSERT INTO Clientes(ID, Nome, Pontos) VALUES(3,'Tatiany',4233)

INSERT INTO Clientes(ID, Nome, Pontos) VALUES(4,'Sabrina',3225)

INSERT INTO Clientes(ID, Nome, Pontos) VALUES(6,'Roberta',1598)

INSERT INTO Clientes(ID, Nome, Pontos) VALUES(8,'Amanda',1971)

INSERT INTO Clientes(ID, Nome, Pontos) VALUES(9,'Gisele',1236)

INSERT INTO Clientes(ID, Nome, Pontos) VALUES(10,'Juliana',5601)

INSERT INTO Clientes(ID, Nome, Pontos) VALUES(11,'Julia',3300)

INSERT INTO Clientes(ID, Nome, Pontos) VALUES(12,'Priscila',2437)


Select * from CADASTRO.dbo.Clientes 

USE CADASTRO
delete TOP(1) Clientes 

USE CADASTRO
UPDATE TOP(5) Clientes set Pontos = Pontos + 1000 


DECLARE @media int 

Select 
@media=AVG(Pontos) 
from Clientes 

Select @media as Média 

select * from Clientes 
Order By Pontos

USE CADASTRO

update Clientes 
SET Pontos = Pontos+500 
where Pontos>@media 

update Clientes 
SET Pontos = Pontos+250 
where Pontos<@media 


select * from Clientes 
Order By Pontos

