create database biblioteca_horizonte;

use biblioteca_horizonte;

create table emprestimos(
id_emprestimo INT,
livro VARCHAR(50),
categoria VARCHAR(50),
quantidade INT,
dias_emprestado INT
);

INSERT INTO emprestimos VALUES (1,'Banco de Dados','Tecnologia',1,7);
INSERT INTO emprestimos VALUES (2,'Algoritmos','Tecnologia',2,10);
INSERT INTO emprestimos VALUES (3,'Estrutura de Dados','Tecnologia',1,12);
INSERT INTO emprestimos VALUES (4,'Engenharia de Software','Tecnologia',3,15);
INSERT INTO emprestimos VALUES (5,'Inteligência Artificial','Tecnologia',2,20);

INSERT INTO emprestimos VALUES (6,'História do Brasil','Historia',1,8);
INSERT INTO emprestimos VALUES (7,'Segunda Guerra Mundial','Historia',2,14);
INSERT INTO emprestimos VALUES (8,'Brasil Colônia','Historia',1,9);
INSERT INTO emprestimos VALUES (9,'História Antiga','Historia',3,18);
INSERT INTO emprestimos VALUES (10,'Idade Média','Historia',2,16);

INSERT INTO emprestimos VALUES (11,'Matemática Básica','Exatas',2,7);
INSERT INTO emprestimos VALUES (12,'Cálculo I','Exatas',1,12);
INSERT INTO emprestimos VALUES (13,'Cálculo II','Exatas',2,15);
INSERT INTO emprestimos VALUES (14,'Álgebra Linear','Exatas',1,11);
INSERT INTO emprestimos VALUES (15,'Estatística','Exatas',3,13);

INSERT INTO emprestimos VALUES (16,'Física I','Exatas',1,10);
INSERT INTO emprestimos VALUES (17,'Física II','Exatas',2,14);
INSERT INTO emprestimos VALUES (18,'Química Geral','Exatas',1,9);
INSERT INTO emprestimos VALUES (19,'Química Orgânica','Exatas',2,16);
INSERT INTO emprestimos VALUES (20,'Probabilidade','Exatas',1,12);

INSERT INTO emprestimos VALUES (21,'Direito Civil','Humanas',1,10);
INSERT INTO emprestimos VALUES (22,'Direito Penal','Humanas',2,14);
INSERT INTO emprestimos VALUES (23,'Filosofia','Humanas',1,18);
INSERT INTO emprestimos VALUES (24,'Sociologia','Humanas',3,20);
INSERT INTO emprestimos VALUES (25,'Psicologia','Humanas',2,15);

INSERT INTO emprestimos VALUES (26,'Administração','Negocios',1,9);
INSERT INTO emprestimos VALUES (27,'Marketing','Negocios',2,11);
INSERT INTO emprestimos VALUES (28,'Gestão de Projetos','Negocios',1,13);
INSERT INTO emprestimos VALUES (29,'Empreendedorismo','Negocios',3,17);
INSERT INTO emprestimos VALUES (30,'Finanças','Negocios',2,12);

INSERT INTO emprestimos VALUES (31,'Machine Learning','Tecnologia',1,18);
INSERT INTO emprestimos VALUES (32,'Cloud Computing','Tecnologia',2,14);
INSERT INTO emprestimos VALUES (33,'Big Data','Tecnologia',3,16);
INSERT INTO emprestimos VALUES (34,'Python','Tecnologia',1,10);
INSERT INTO emprestimos VALUES (35,'SQL Avançado','Tecnologia',2,12);

INSERT INTO emprestimos VALUES (36,'Literatura Brasileira','Literatura',1,8);
INSERT INTO emprestimos VALUES (37,'Literatura Mundial','Literatura',2,12);
INSERT INTO emprestimos VALUES (38,'Poesia','Literatura',1,9);
INSERT INTO emprestimos VALUES (39,'Romance','Literatura',3,14);
INSERT INTO emprestimos VALUES (40,'Contos','Literatura',2,11);

INSERT INTO emprestimos VALUES (41,'Biologia','Saude',1,10);
INSERT INTO emprestimos VALUES (42,'Anatomia','Saude',2,13);
INSERT INTO emprestimos VALUES (43,'Fisiologia','Saude',1,12);
INSERT INTO emprestimos VALUES (44,'Enfermagem','Saude',3,16);
INSERT INTO emprestimos VALUES (45,'Nutrição','Saude',2,14);

INSERT INTO emprestimos VALUES (46,'Educação Física','Saude',1,9);
INSERT INTO emprestimos VALUES (47,'Treinamento Esportivo','Saude',2,11);
INSERT INTO emprestimos VALUES (48,'Reabilitação','Saude',1,13);
INSERT INTO emprestimos VALUES (49,'Saúde Pública','Saude',3,18);
INSERT INTO emprestimos VALUES (50,'Farmacologia','Saude',2,17);

INSERT INTO emprestimos VALUES (51,'Geografia','Humanas',1,10);
INSERT INTO emprestimos VALUES (52,'Geopolítica','Humanas',2,14);
INSERT INTO emprestimos VALUES (53,'Antropologia','Humanas',1,12);
INSERT INTO emprestimos VALUES (54,'Teoria Social','Humanas',3,16);
INSERT INTO emprestimos VALUES (55,'Cultura Brasileira','Humanas',2,15);

INSERT INTO emprestimos VALUES (56,'Economia','Negocios',1,11);
INSERT INTO emprestimos VALUES (57,'Contabilidade','Negocios',2,13);
INSERT INTO emprestimos VALUES (58,'Logística','Negocios',1,12);
INSERT INTO emprestimos VALUES (59,'Gestão Financeira','Negocios',3,18);
INSERT INTO emprestimos VALUES (60,'Planejamento','Negocios',2,14);

	#Missão 1
SELECT COUNT(*) AS total_emprestimos
FROM emprestimos;

	#Missão 2
SELECT SUM(quantidade) AS total_livros_emprestimos
FROM emprestimos;

	#Missão 3
SELECT SUM(dias_emprestado) AS total_dias_emprestado
FROM emprestimos;

	#Missão 4
SELECT  CEIL(AVG(dias_emprestado)) AS Media_dias_emprestado
FROM emprestimos;

	#Missão 5
SELECT DISTINCT categoria
FROM emprestimos;

	#Missão 6
SELECT DISTINCT categoria, COUNT(categoria) AS Total_Emprestimos
FROM emprestimos
GROUP BY categoria;

	#Missão 7
SELECT DISTINCT categoria, COUNT(categoria) AS Mais_Utilizado
FROM emprestimos
GROUP BY categoria
ORDER BY Mais_Utilizado DESC;

	#Missão 8
SELECT DISTINCT livro, dias_emprestado
FROM emprestimos
WHERE dias_emprestado > (SELECT AVG(dias_emprestado) FROM emprestimos)
GROUP BY livro, dias_emprestado;

	#Missão 9
SELECT livro, quantidade
FROM emprestimos
WHERE quantidade > (SELECT AVG(quantidade) FROM emprestimos);

	#Missão 10
SELECT livro, dias_emprestado
FROM emprestimos
WHERE dias_emprestado BETWEEN 
(SELECT AVG(dias_emprestado) FROM emprestimos)
 AND 
(SELECT MAX(dias_emprestado) FROM emprestimos);


