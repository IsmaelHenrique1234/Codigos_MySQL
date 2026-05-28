create database gametech_store;
 
use gametech_store;
 
create table vendas (
id_venda int not null,
produto varchar(100),
categoria varchar(100),
quantidade int,
valor_unitario float
);

INSERT INTO vendas VALUES (1,'Mouse Gamer','Periferico',3,120);
INSERT INTO vendas VALUES (2,'Teclado Mecânico','Periferico',2,350);
INSERT INTO vendas VALUES (3,'Headset Gamer','Periferico',4,250);
INSERT INTO vendas VALUES (4,'Monitor 24','Monitor',1,900);
INSERT INTO vendas VALUES (5,'Mousepad','Acessorio',5,80);
INSERT INTO vendas VALUES (6,'Notebook Gamer','Computador',1,5500);
INSERT INTO vendas VALUES (7,'Webcam','Periferico',2,200);
INSERT INTO vendas VALUES (8,'HD Externo','Armazenamento',3,400);
INSERT INTO vendas VALUES (9,'Pendrive','Armazenamento',6,60);
INSERT INTO vendas VALUES (10,'Caixa de Som','Audio',2,300);
INSERT INTO vendas VALUES (11,'Mouse Gamer','Periferico',2,120);
INSERT INTO vendas VALUES (12,'Teclado Mecânico','Periferico',1,350);
INSERT INTO vendas VALUES (13,'Headset Gamer','Periferico',2,250);
INSERT INTO vendas VALUES (14,'Monitor 24','Monitor',1,900);
INSERT INTO vendas VALUES (15,'Mousepad','Acessorio',3,80);
INSERT INTO vendas VALUES (16,'Notebook Gamer','Computador',1,5500);
INSERT INTO vendas VALUES (17,'Webcam','Periferico',1,200);
INSERT INTO vendas VALUES (18,'HD Externo','Armazenamento',2,400);
INSERT INTO vendas VALUES (19,'Pendrive','Armazenamento',4,60);
INSERT INTO vendas VALUES (20,'Caixa de Som','Audio',1,300);
INSERT INTO vendas VALUES (21,'Mouse Gamer','Periferico',3,120);
INSERT INTO vendas VALUES (22,'Teclado Mecânico','Periferico',2,350);
INSERT INTO vendas VALUES (23,'Headset Gamer','Periferico',1,250);
INSERT INTO vendas VALUES (24,'Monitor 24','Monitor',2,900);
INSERT INTO vendas VALUES (25,'Mousepad','Acessorio',4,80);
INSERT INTO vendas VALUES (26,'Notebook Gamer','Computador',1,5500);
INSERT INTO vendas VALUES (27,'Webcam','Periferico',3,200);
INSERT INTO vendas VALUES (28,'HD Externo','Armazenamento',1,400);
INSERT INTO vendas VALUES (29,'Pendrive','Armazenamento',5,60);
INSERT INTO vendas VALUES (30,'Caixa de Som','Audio',2,300);
INSERT INTO vendas VALUES (31,'Mouse Gamer','Periferico',4,120);
INSERT INTO vendas VALUES (32,'Teclado Mecânico','Periferico',1,350);
INSERT INTO vendas VALUES (33,'Headset Gamer','Periferico',3,250);
INSERT INTO vendas VALUES (34,'Monitor 24','Monitor',1,900);
INSERT INTO vendas VALUES (35,'Mousepad','Acessorio',2,80);
INSERT INTO vendas VALUES (36,'Notebook Gamer','Computador',1,5500);
INSERT INTO vendas VALUES (37,'Webcam','Periferico',2,200);
INSERT INTO vendas VALUES (38,'HD Externo','Armazenamento',2,400);
INSERT INTO vendas VALUES (39,'Pendrive','Armazenamento',3,60);
INSERT INTO vendas VALUES (40,'Caixa de Som','Audio',1,300);
INSERT INTO vendas VALUES (41,'Mouse Gamer','Periferico',2,120);
INSERT INTO vendas VALUES (42,'Teclado Mecânico','Periferico',2,350);
INSERT INTO vendas VALUES (43,'Headset Gamer','Periferico',2,250);
INSERT INTO vendas VALUES (44,'Monitor 24','Monitor',1,900);
INSERT INTO vendas VALUES (45,'Mousepad','Acessorio',3,80);
INSERT INTO vendas VALUES (46,'Notebook Gamer','Computador',1,5500);
INSERT INTO vendas VALUES (47,'Webcam','Periferico',1,200);
INSERT INTO vendas VALUES (48,'HD Externo','Armazenamento',2,400);
INSERT INTO vendas VALUES (49,'Pendrive','Armazenamento',4,60);
INSERT INTO vendas VALUES (50,'Caixa de Som','Audio',2,300);
 
 #missao 1
select
	count(*) as total_registros
from vendas;

  #missao 2
select
    sum(quantidade) as total_vendidos
from vendas;

  #missao 3
SELECT COUNT(*) AS total_vendas_perifericos
	FROM vendas
WHERE categoria = 'Periferico';

  #missao 4
SELECT SUM(quantidade) AS total_pendrives
	FROM vendas
WHERE produto = 'Pendrive';

  #missao 5
SELECT SUM(quantidade) AS total_computadores
	FROM vendas
WHERE categoria = 'Computador';

  #missao 6
SELECT SUM(valor_unitario * quantidade) AS total_valor
	FROM vendas;
    
  #missao 7
SELECT SUM(valor_unitario * quantidade) AS total_valor_mouses
	FROM vendas
WHERE produto = 'Mouse Gamer';

  #missao 8
SELECT SUM(valor_unitario * quantidade) AS total_valor_Audio
	FROM vendas
WHERE categoria = 'Audio';

  #missão 9
SELECT SUM(valor_unitario * quantidade) AS total_valor_Pendrives
	FROM vendas
WHERE produto = 'Pendrive';

  #missão 10
SELECT SUM(quantidade) / COUNT(*) AS total_valor
	FROM vendas;
    
  #missão 11
SELECT SUM(valor_unitario * quantidade) / COUNT(*) AS total_Media_Mousepads
	FROM vendas
WHERE produto = 'Mousepad';

  #missão 12
SELECT SUM(valor_unitario * quantidade) / COUNT(*) AS total_Media_Webcams
	FROM vendas
WHERE produto = 'Webcam';

  #missão 13
SELECT SUM(valor_unitario * quantidade) AS ValorTotal_Perifericos
	FROM vendas
WHERE categoria = 'Periferico';

  #missão 14
SELECT	SUM(valor_unitario * quantidade) / COUNT(*) AS mediaValor_vendas
	FROM vendas;
    
  #missão 15
SELECT produto,
SUM(valor_unitario * quantidade) AS mediaValor_vendas
FROM vendas
WHERE produto = 'Mouse Gamer' OR produto = 'Teclado Mecânico'
GROUP BY produto;

  #missão 16
SELECT AVG(valor_unitario * quantidade) AS ticket_medio
FROM vendas;

  #missão 17
SELECT 
    produto,
    AVG(valor_unitario * quantidade)  AS Media_ProdutoVendido
FROM vendas
GROUP BY produto;

  #missão 18
SELECT 
    categoria,
    AVG(valor_unitario * quantidade)  AS Media_CategoriaVendida
FROM vendas
GROUP BY categoria;

  #missão 19
SELECT 
    produto,
    AVG(quantidade)  AS Media_QuantidadesVendidas
FROM vendas
GROUP BY produto;

  #missão 20
SELECT 
    produto,
    AVG(valor_unitario * quantidade)  AS Media_MaiorVendido
FROM vendas
GROUP BY produto 
ORDER BY Media_MaiorVendido DESC;

  #missão 21
SELECT 
    produto,
    quantidade,
    SUM(valor_unitario * quantidade)  AS Eficiencia_Faturamento
FROM vendas
GROUP BY produto, quantidade;

  #missão 22
SELECT produto,
    categoria,
    AVG(valor_unitario * quantidade)  AS Media_FaturamentoPerifericos
FROM vendas
WHERE categoria = 'Periferico'
GROUP BY produto,categoria;

  #missão 23
SELECT
    AVG(valor_unitario * quantidade)  AS Media_MaiorVolume
FROM vendas
WHERE quantidade > 3;

  #missão 24
SELECT produto,
	   quantidade,
    AVG(valor_unitario * quantidade)  AS Media_Quantidades
FROM vendas
GROUP BY produto, quantidade;

  #missão 25
SELECT categoria,
    AVG(valor_unitario * quantidade)  AS MaiorValorMedio
FROM vendas
GROUP BY categoria
ORDER BY MaiorValorMedio DESC;

  #missão 26
SELECT produto,
    AVG(valor_unitario * quantidade)  AS MediaFaturamento
FROM vendas
GROUP BY produto
ORDER BY MediaFaturamento DESC;

  #missão 27
SELECT categoria,
    AVG(valor_unitario)  AS Media_ValorUnitario
FROM vendas
GROUP BY categoria
ORDER BY Media_ValorUnitario DESC;

  #missão 28
SELECT categoria,
    AVG(valor_unitario * quantidade)  AS Media_ValorUnitario
FROM vendas
GROUP BY categoria
ORDER BY Media_ValorUnitario DESC;

  #missão 29
SELECT produto,
    AVG(valor_unitario * quantidade) AS Media_AltoValor
FROM vendas
GROUP BY produto
HAVING Media_AltoValor > 500
ORDER BY Media_AltoValor DESC;

  #missão 30
SELECT produto,
    AVG(valor_unitario * quantidade) AS Media_BaixoValor
FROM vendas
GROUP BY produto
HAVING SUM(quantidade) / COUNT(*) <= 2
ORDER BY Media_BaixoValor DESC;

	#DISTINCT
select distinct 
categoria
from vendas;

	#BETWEEN
select produto, quantidade
from vendas
where quantidade between 1 and 5;

	#TRADICIONAL
select produto, quantidade
from vendas
where quantidade >= 1 and quantidade <= 5;

	#SUBQUERY/SUBCONSULTA
select produto, quantidade
from vendas
where quantidade < (
	select avg(quantidade) as media_quantidade
    from vendas
);

create table produtos(
	ID_produtos INT,
    nome_produtos VARCHAR(100),
    categoria_produtos VARCHAR(100),
    preco_produtos FLOAT,
    estoque_produtos INT,
    ativo_produtos TINYINT(1)
);

INSERT INTO produtos VALUES
(1,'Notebook Gamer','Eletronicos',5500,10,1),
(2,'Mouse Gamer','Eletronicos',150,50,1),
(3,'Teclado Mecanico','Eletronicos',350,30,1),
(4,'Monitor 24','Eletronicos',900,20,1),
(5,'Headset','Eletronicos',250,40,1),
(6,'Cadeira Gamer','Moveis',1200,15,1),
(7,'Mesa Escritório','Moveis',800,12,1),
(8,'Luminária','Moveis',120,25,1),
(9,'Sofá','Moveis',2000,5,1),
(10,'Armario','Moveis',1500,8,0),

(11,'Camiseta','Roupas',80,100,1),
(12,'Calça Jeans','Roupas',150,60,1),
(13,'Jaqueta','Roupas',300,40,1),
(14,'Tênis','Roupas',400,30,1),
(15,'Boné','Roupas',60,70,1),

(16,'Geladeira','Eletrodomesticos',3000,10,1),
(17,'Fogão','Eletrodomesticos',2000,8,1),
(18,'Microondas','Eletrodomesticos',600,20,1),
(19,'Air Fryer','Eletrodomesticos',500,25,1),
(20,'Liquidificador','Eletrodomesticos',200,30,1),

(21,'Livro SQL','Livros',120,50,1),
(22,'Livro Python','Livros',150,40,1),
(23,'Livro Data Science','Livros',200,35,1),
(24,'Livro IA','Livros',250,20,1),
(25,'Livro Cloud','Livros',180,25,1),

(26,'Tablet','Eletronicos',1500,15,1),
(27,'Smartphone','Eletronicos',2500,20,1),
(28,'Smartwatch','Eletronicos',1200,10,1),
(29,'Camera','Eletronicos',3500,8,1),
(30,'Drone','Eletronicos',4500,5,0),

(31,'Cama','Moveis',1800,10,1),
(32,'Colchão','Moveis',1300,12,1),
(33,'Guarda Roupa','Moveis',2200,6,1),
(34,'Rack TV','Moveis',700,15,1),
(35,'Poltrona','Moveis',900,10,1),

(36,'Vestido','Roupas',200,50,1),
(37,'Saia','Roupas',120,60,1),
(38,'Blusa','Roupas',90,80,1),
(39,'Casaco','Roupas',350,30,0),
(40,'Chinelo','Roupas',50,100,1),

(41,'TV 50','Eletronicos',3000,10,1),
(42,'Soundbar','Eletronicos',800,15,1),
(43,'Projetor','Eletronicos',2500,7,1),
(44,'Console','Eletronicos',4000,5,1),
(45,'Controle','Eletronicos',300,20,1),

(46,'Panela','Eletrodomesticos',150,40,1),
(47,'Cafeteira','Eletrodomesticos',350,25,1),
(48,'Aspirador','Eletrodomesticos',900,15,1),
(49,'Ventilador','Eletrodomesticos',250,30,1),
(50,'Ar Condicionado','Eletrodomesticos',2500,10,1);

SELECT * FROM produtos;

	#Missão 1 (parte 2)
SELECT *
FROM produtos
WHERE ativo_produtos = 1;

	#Missão 2 (parte 2)
SELECT *
FROM produtos
WHERE ativo_produtos = 0;

	#Missão 3 (parte 2)
SELECT *
FROM produtos
WHERE preco_produtos BETWEEN 100 AND 500;

	#Missão 4 (parte 2)
SELECT *
FROM produtos
WHERE estoque_produtos BETWEEN 10 AND 50;

	#Missão 5 (parte 2)
SELECT ID_produtos AS "codigo do produto",
	   nome_produtos AS "nome do produto",
       categoria_produtos AS "categoria do produto",
       preco_produtos AS "preço do produto",
       estoque_produtos AS "estoque dos produtos",
       ativo_produtos AS "Status"
FROM produtos;

	#Missão 6 (parte 2)
SELECT nome_produtos, preco_produtos
FROM produtos
ORDER BY preco_produtos DESC;

	#Missão 7 (parte 2)
SELECT nome_produtos
FROM produtos
ORDER BY nome_produtos;

	#Missão 8 (parte 2)
SELECT DISTINCT categoria_produtos
FROM produtos;

	#Missão 9 (parte 2)
SELECT categoria_produtos, SUM(estoque_produtos) as Total_Produto
FROM produtos
GROUP BY categoria_produtos;

	#Missão 10 (parte 2)
SELECT categoria_produtos, ROUND(AVG(preco_produtos)) as Preco_Medio
FROM produtos
GROUP BY categoria_produtos;

	#Missão 11 (parte 2)
SELECT categoria_produtos, SUM(estoque_produtos) as Maior_Volume
FROM produtos
GROUP BY categoria_produtos
HAVING Maior_Volume > 5;

	#Missão 12 (parte 2)
SELECT DISTINCT nome_produtos, SUM(preco_produtos * estoque_produtos) as Acima_Media
FROM produtos
GROUP BY nome_produtos
HAVING Acima_Media > (SELECT AVG(preco_produtos * estoque_produtos) from produtos);

	#Missão 13 (parte 2)
SELECT DISTINCT nome_produtos, categoria_produtos, preco_produtos AS Preco_Media
FROM produtos
WHERE preco_produtos > (SELECT AVG(preco_produtos) from produtos) and categoria_produtos = "Eletronicos";

	#Missão 14 (parte 2)
SELECT DISTINCT nome_produtos,  preco_produtos AS Mais_Valioso, ativo_produtos
FROM produtos
WHERE ativo_produtos = 1
ORDER BY preco_produtos DESC;

	#Missão 15 (parte 2)
SELECT DISTINCT categoria_produtos, ROUND(AVG(preco_produtos)) as Preco_Medio
FROM produtos
GROUP BY categoria_produtos
HAVING Preco_Medio > 300;







