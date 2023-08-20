USE CADASTRO
GO

CREATE TABLE  Lojas (
UF VARCHAR(2),
p1 VARCHAR (10), -- as 40%
p2 VARCHAR (10), -- as 30%
p3 VARCHAR (10), -- as 15%
p4 VARCHAR (10), -- as 10%
p5 VARCHAR (10), -- as 5%

)
GO

INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('PR','Loja 01', 'Loja 06', 'Loja 07', 'Loja 04', 'Loja 08')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('RS','Loja 01', 'Loja 06', 'Loja 07', 'Loja 04', 'Loja 08')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('SC','Loja 01', 'Loja 06', 'Loja 07', 'Loja 04', 'Loja 08')

INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('ES','Loja 02', 'Loja 09', 'Loja 10', 'Loja 05', 'Loja 04')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('MG','Loja 02', 'Loja 09', 'Loja 10', 'Loja 05', 'Loja 04')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('RJ','Loja 02', 'Loja 09', 'Loja 10', 'Loja 05', 'Loja 04')

INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('SP','Loja 03', 'Loja 09', 'Loja 14', 'Loja 08', 'Loja 10')

INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('AC','Loja 04', 'Loja 02', 'Loja 11', 'Loja 10', 'Loja 12')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('AM','Loja 04', 'Loja 02', 'Loja 11', 'Loja 10', 'Loja 12')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('AP','Loja 04', 'Loja 02', 'Loja 11', 'Loja 10', 'Loja 12')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('PA','Loja 04', 'Loja 02', 'Loja 11', 'Loja 10', 'Loja 12')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('RO','Loja 04', 'Loja 02', 'Loja 11', 'Loja 10', 'Loja 12')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('RR','Loja 04', 'Loja 02', 'Loja 11', 'Loja 10', 'Loja 12')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('TO','Loja 04', 'Loja 02', 'Loja 11', 'Loja 10', 'Loja 12')

INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('AL','Loja 02', 'Loja 09', 'Loja 10', 'Loja 13', 'Loja 11')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('BA','Loja 02', 'Loja 09', 'Loja 10', 'Loja 13', 'Loja 11')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('CE','Loja 02', 'Loja 09', 'Loja 10', 'Loja 13', 'Loja 11')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('MA','Loja 02', 'Loja 09', 'Loja 10', 'Loja 13', 'Loja 11')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('PB','Loja 02', 'Loja 09', 'Loja 10', 'Loja 13', 'Loja 11')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('PE','Loja 02', 'Loja 09', 'Loja 10', 'Loja 13', 'Loja 11')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('PI','Loja 02', 'Loja 09', 'Loja 10', 'Loja 13', 'Loja 11')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('SE','Loja 02', 'Loja 09', 'Loja 10', 'Loja 13', 'Loja 11')

INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('DF','Loja 05', 'Loja 10', 'Loja 14', 'Loja 01', 'Loja 15')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('GO','Loja 05', 'Loja 10', 'Loja 14', 'Loja 01', 'Loja 15')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('MS','Loja 05', 'Loja 10', 'Loja 14', 'Loja 01', 'Loja 15')
INSERT INTO Lojas (UF, p1, p2, p3, p4, p5) VALUES('MT','Loja 05', 'Loja 10', 'Loja 14', 'Loja 01', 'Loja 15')

SELECT 
UF,
p1 as '40%',
p2 as '30%',
p3 as '15%',
p4 as '10%',
p5 as '5%'
from Lojas
