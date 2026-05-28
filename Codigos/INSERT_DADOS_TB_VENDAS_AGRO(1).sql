CREATE DATABASE agropecuaria_db;
USE agropecuaria_db;

-- Crie a tabela chamada tb_vendas_agro com os seguintes campos 
-- id INT PRIMARY KEY,
-- produto VARCHAR(100),
-- categoria VARCHAR(50),
-- fornecedor VARCHAR(100),
-- estado VARCHAR(50),
-- quantidade INT,
-- valor_unitario DECIMAL(10,2), o 10 significa o NUMERO MAXIMO DE DIGITOS,                                          1
-- o 2 significa O NUMERO DE CASAS DECIMAIS DE DEPOIS DA VIRGULA/PONTO, Essa a funcionalidade dos dois parametros    2
-- data_venda DATE,
-- estoque BOOLEAN

CREATE TABLE tb_vendas_agro(
	id INT PRIMARY KEY,
    produto VARCHAR(100),
    categoria VARCHAR(50),
    fornecedor VARCHAR(100),
    estado VARCHAR(50),
    quantidade INT,
    valor_unitario DECIMAL(10, 2),
    data_venda DATE,
    estoque BOOLEAN
);

INSERT INTO tb_vendas_agro
(id, produto, categoria, fornecedor, estado, quantidade, valor_unitario, data_venda, estoque)
VALUES
(1, 'Milho Safrinha', 'Grãos', 'AgroSul', 'PR', 120, 89.90, '2025-01-10', TRUE),
(2, 'Soja Premium', 'Grãos', 'Campo Verde', 'MT', 200, 145.50, '2025-01-15', TRUE),
(3, 'Ração Bovina 25kg', 'Rações', 'NutriCampo', 'SC', 80, 110.00, '2025-01-18', TRUE),
(4, 'Fertilizante NPK', 'Fertilizantes', 'AgroMax', 'GO', 50, 320.75, '2025-01-22', FALSE),
(5, 'Herbicida ForteMax', 'Defensivos', 'BioPlant', 'MS', 30, 450.00, '2025-01-25', TRUE),
(6, 'Calcário Agrícola', 'Minerais', 'Solo Forte', 'PR', 300, 45.90, '2025-01-27', TRUE),
(7, 'Semente de Trigo', 'Sementes', 'AgroSul', 'RS', 90, 99.99, '2025-02-01', FALSE),
(8, 'Inseticida Power', 'Defensivos', 'Campo Verde', 'MT', 25, 599.00, '2025-02-03', TRUE),
(9, 'Farelo de Soja', 'Rações', 'NutriCampo', 'SC', 110, 76.50, '2025-02-05', TRUE),
(10, 'Adubo Orgânico', 'Fertilizantes', 'BioPlant', 'SP', 60, 180.00, '2025-02-08', TRUE),
(11, 'Milheto', 'Sementes', 'AgroSul', 'GO', 70, 88.80, '2025-02-10', FALSE),
(12, 'Sal Mineral Bovino', 'Minerais', 'NutriCampo', 'MG', 95, 67.40, '2025-02-12', TRUE),
(13, 'Soja Convencional', 'Grãos', 'Campo Verde', 'MT', 180, 139.00, '2025-02-15', TRUE),
(14, 'Ração Suína 20kg', 'Rações', 'NutriCampo', 'SC', 55, 98.00, '2025-02-17', FALSE),
(15, 'Fungicida Max', 'Defensivos', 'AgroMax', 'PR', 22, 799.90, '2025-02-20', TRUE),
(16, 'Semente de Aveia', 'Sementes', 'AgroSul', 'RS', 65, 72.30, '2025-02-22', TRUE),
(17, 'Ureia Agrícola', 'Fertilizantes', 'Solo Forte', 'GO', 140, 210.00, '2025-02-25', TRUE),
(18, 'Milho Híbrido', 'Grãos', 'Campo Verde', 'MS', 210, 155.90, '2025-03-01', FALSE),
(19, 'Ração Equina', 'Rações', 'NutriCampo', 'SP', 40, 132.75, '2025-03-04', TRUE),
(20, 'Herbicida Select', 'Defensivos', 'BioPlant', 'MT', 28, 499.90, '2025-03-06', TRUE),
(21, 'Calcário Premium', 'Minerais', 'Solo Forte', 'PR', 310, 55.50, '2025-03-08', TRUE),
(22, 'Semente de Pastagem', 'Sementes', 'AgroSul', 'GO', 85, 120.00, '2025-03-10', FALSE),
(23, 'Soja Exportação', 'Grãos', 'Campo Verde', 'MT', 260, 160.00, '2025-03-12', TRUE),
(24, 'Fertilizante Potássico', 'Fertilizantes', 'AgroMax', 'MS', 48, 420.00, '2025-03-14', TRUE),
(25, 'Inseticida Ultra', 'Defensivos', 'BioPlant', 'SP', 18, 890.00, '2025-03-16', FALSE),
(26, 'Ração Avícola', 'Rações', 'NutriCampo', 'SC', 130, 89.50, '2025-03-18', TRUE),
(27, 'Milho Orgânico', 'Grãos', 'AgroSul', 'PR', 95, 110.00, '2025-03-20', TRUE),
(28, 'Adubo Nitrogenado', 'Fertilizantes', 'Solo Forte', 'GO', 75, 275.00, '2025-03-22', TRUE),
(29, 'Semente de Arroz', 'Sementes', 'Campo Verde', 'RS', 60, 140.00, '2025-03-24', FALSE),
(30, 'Fungicida Premium', 'Defensivos', 'AgroMax', 'MT', 15, 950.00, '2025-03-26', TRUE),
(31, 'Farelo Bovino', 'Rações', 'NutriCampo', 'MG', 120, 82.30, '2025-03-28', TRUE),
(32, 'Soja Safra 2025', 'Grãos', 'Campo Verde', 'MS', 230, 150.00, '2025-03-30', FALSE),
(33, 'Calcário Fino', 'Minerais', 'Solo Forte', 'PR', 340, 42.00, '2025-04-01', TRUE),
(34, 'Herbicida AgroPlus', 'Defensivos', 'BioPlant', 'GO', 26, 620.00, '2025-04-03', TRUE),
(35, 'Ração Premium Bovina', 'Rações', 'NutriCampo', 'SC', 88, 145.00, '2025-04-05', FALSE),
(36, 'Semente de Feijão', 'Sementes', 'AgroSul', 'PR', 77, 115.90, '2025-04-07', TRUE),
(37, 'Milho Tradicional', 'Grãos', 'Campo Verde', 'MT', 170, 100.00, '2025-04-10', TRUE),
(38, 'Fertilizante Especial', 'Fertilizantes', 'AgroMax', 'SP', 54, 380.00, '2025-04-12', TRUE),
(39, 'Inseticida Verde', 'Defensivos', 'BioPlant', 'MS', 19, 720.00, '2025-04-15', FALSE),
(40, 'Sal Mineral Premium', 'Minerais', 'Solo Forte', 'MG', 105, 92.00, '2025-04-18', TRUE),
(41, 'Ração Ovina', 'Rações', 'NutriCampo', 'RS', 66, 118.00, '2025-04-20', TRUE),
(42, 'Soja Natural', 'Grãos', 'Campo Verde', 'GO', 190, 148.00, '2025-04-22', FALSE),
(43, 'Semente Especial', 'Sementes', 'AgroSul', 'PR', 59, 132.50, '2025-04-24', TRUE),
(44, 'Fungicida Rural', 'Defensivos', 'AgroMax', 'MT', 24, 845.00, '2025-04-26', TRUE),
(45, 'Adubo Premium', 'Fertilizantes', 'Solo Forte', 'SC', 81, 299.90, '2025-04-28', FALSE),
(46, 'Milho Exportação', 'Grãos', 'Campo Verde', 'MS', 250, 170.00, '2025-05-01', TRUE),
(47, 'Ração Campo Forte', 'Rações', 'NutriCampo', 'GO', 74, 136.40, '2025-05-03', TRUE),
(48, 'Calcário Rural', 'Minerais', 'Solo Forte', 'PR', 330, 48.90, '2025-05-05', FALSE),
(49, 'Herbicida Platinum', 'Defensivos', 'BioPlant', 'SP', 17, 980.00, '2025-05-07', TRUE),
(50, 'Semente Premium', 'Sementes', 'AgroSul', 'RS', 68, 155.00, '2025-05-10', TRUE),

-- REGISTROS COM PROBLEMAS PARA LIMPEZA E TRATAMENTO DE DADOS

-- PRODUTOS DUPLICADOS
(51, 'Milho Safrinha', 'Grãos', 'AgroSul', 'PR', 120, 89.90, '2025-05-12', TRUE),
(52, 'Soja Premium', 'Grãos', 'Campo Verde', 'MT', 200, 145.50, '2025-05-12', TRUE),
(53, 'Ração Bovina 25kg', 'Rações', 'NutriCampo', 'SC', 80, 110.00, '2025-05-12', TRUE),

-- NOMES INCORRETOS DE PRODUTOS
(54, 'Milhho Safrinha', 'Grãos', 'AgroSul', 'PR', 95, 88.00, '2025-05-13', TRUE),
(55, 'Sojjja Premium', 'Grãos', 'Campo Verde', 'MT', 180, 140.00, '2025-05-13', TRUE),
(56, 'Racão Bovina 25kg', 'Rações', 'NutriCampo', 'SC', 70, 105.00, '2025-05-13', TRUE),
(57, 'Fertilizanti NPK', 'Fertilizantes', 'AgroMax', 'GO', 45, 310.00, '2025-05-13', FALSE),
(58, 'Insetcida Power', 'Defensivos', 'Campo Verde', 'MT', 20, 580.00, '2025-05-13', TRUE),

-- FORNECEDORES ESCRITOS ERRADOS
(59, 'Milho Híbrido', 'Grãos', 'Campo Vrede', 'MS', 190, 150.00, '2025-05-14', TRUE),
(60, 'Ração Equina', 'Rações', 'NutriCamp', 'SP', 38, 130.00, '2025-05-14', TRUE),
(61, 'Herbicida Select', 'Defensivos', 'Bio Planti', 'MT', 27, 495.00, '2025-05-14', TRUE),

-- PREÇOS INCORRETOS / SUSPEITOS
(62, 'Soja Exportação', 'Grãos', 'Campo Verde', 'MT', 250, 1.99, '2025-05-15', TRUE),
(63, 'Fungicida Premium', 'Defensivos', 'AgroMax', 'MT', 12, 99999.99, '2025-05-15', TRUE),
(64, 'Calcário Premium', 'Minerais', 'Solo Forte', 'PR', 300, -45.00, '2025-05-15', TRUE),
(65, 'Adubo Nitrogenado', 'Fertilizantes', 'Solo Forte', 'GO', 70, 0.00, '2025-05-15', TRUE),

-- QUANTIDADES INCORRETAS
(66, 'Milho Tradicional', 'Grãos', 'Campo Verde', 'MT', -10, 100.00, '2025-05-16', TRUE),
(67, 'Ração Ovina', 'Rações', 'NutriCampo', 'RS', 0, 118.00, '2025-05-16', TRUE),

-- ESTADOS INCORRETOS
(68, 'Semente Especial', 'Sementes', 'AgroSul', 'PARANA', 59, 132.50, '2025-05-16', TRUE),
(69, 'Herbicida Platinum', 'Defensivos', 'BioPlant', 'SÃO PAULO', 17, 980.00, '2025-05-16', TRUE),

-- CATEGORIAS INCORRETAS
(70, 'Milho Exportação', 'Graos', 'Campo Verde', 'MS', 250, 170.00, '2025-05-17', TRUE),
(71, 'Ração Campo Forte', 'Racao', 'NutriCampo', 'GO', 74, 136.40, '2025-05-17', TRUE),

-- DATAS INCONSISTENTES
(72, 'Calcário Rural', 'Minerais', 'Solo Forte', 'PR', 330, 48.90, '2035-01-01', FALSE),
(73, 'Semente Premium', 'Sementes', 'AgroSul', 'RS', 68, 155.00, '2028-12-30', TRUE),

-- REGISTROS COMPLETAMENTE INCONSISTENTES
(74, 'XXXXX', 'ERRO', 'DESCONHECIDO', 'XX', -999, -500.00, '2040-01-01', FALSE),
(75, 'TESTE PRODUTO', 'TESTE', 'TESTE', 'TT', 99999, 999999.99, '2099-01-01', TRUE);

SELECT * FROM tb_vendas_agro;


/*
# DESAFIO 1 - REMOVER DUPLICADOS ABAIXO:

Milho Safrinha
Soja Premium
Ração Bovina 25kg

*/

SELECT *
FROM tb_vendas_agro
WHERE produto IN ("Milho Safrinha", "Soja Premium", "Ração Bovina 25kg");

DELETE FROM tb_vendas_agro WHERE id > 3 AND produto IN ("Milho Safrinha", "Soja Premium", "Ração Bovina 25kg"); -- dados originais menor que 4

# DESAFIO 1 FINALIZADO

/*
# DESAFIO 2 - CORRIGIR OS NOMES INCORRETOS


Nomes Incorretos:			Nomes Corretos:

	Milhho Safrinha			Milho Safrinha
	Sojjja Premium			Soja Premium
	Racão Bovina 25kg		Ração Bovina 25kg
	Fertilizanti NPK		Fertilizante NPK
	Insetcida Power			Inseticida Power

*/

UPDATE tb_vendas_agro
SET produto = 'Milho Safrinha'
WHERE produto = 'Milhho Safrinha' AND id = 54;

UPDATE tb_vendas_agro
SET produto = 'Soja Premium'
WHERE produto = 'Sojjja Premium' AND id = 55;

UPDATE tb_vendas_agro
SET produto = 'Ração Bovina 25kg'
WHERE produto = 'Racão Bovina 25kg' AND id = 3;

UPDATE tb_vendas_agro
SET produto = 'Fertilizante NPK'
WHERE produto = 'Fertilizanti NPK'  AND id = 57;

UPDATE tb_vendas_agro
SET produto = 'Inseticida Power'
WHERE produto = 'Insetcida Power'  AND id = 58;

SELECT * FROM tb_vendas_agro
WHERE produto = 'Insetcida Power';

# DESAFIO 2 FINALIZADO

/*
# DESAFIO 3 - CORRIGIR OS FORNECEDORES



	Nome Incorreto		Nome Correto
		Campo Vrede			Campo Verde
		NutriCamp			NutriCampo
		Bio Planti			BioPlant

*/

UPDATE tb_vendas_agro
SET fornecedor = 'Campo Verde'
WHERE fornecedor = 'Campo Vrede' AND id = 59;

UPDATE tb_vendas_agro
SET fornecedor = 'NutriCampo'
WHERE fornecedor = 'NutriCamp' AND id = 60;

UPDATE tb_vendas_agro
SET fornecedor = 'BioPlant'
WHERE fornecedor = 'Bio Planti' AND id = 61;

SELECT * FROM tb_vendas_agro WHERE fornecedor IN ('Campo Verde', 'NutriCampo','BioPlant');

# DESAFIO 3 FINALIZADO

/*
# DESAFIO 4 - CORRIGIR OS PREÇOS



Produto	Problema 			Encontrado	Valor 			Correto
	Soja Exportação	         	Valor muito baixo			160.00
	Fungicida Premium			Valor extremamente alto		950.00
	Calcário Premium			Valor negativo				55.50
	Adubo Nitrogenado			Valor zerado				275.00


*/

SELECT produto, valor_unitario FROM tb_vendas_agro WHERE produto IN("Soja Exportação", "Fungicida Premium", "Calcário Premium", "Adubo Nitrogenado") ORDER BY produto;

UPDATE tb_vendas_agro
SET valor_unitario = 160
WHERE produto = 'Soja Exportação';

UPDATE tb_vendas_agro
SET valor_unitario = 950
WHERE produto = 'Fungicida Premium';

UPDATE tb_vendas_agro
SET valor_unitario = 55.50
WHERE produto = 'Calcário Premium';

UPDATE tb_vendas_agro
SET valor_unitario = 275
WHERE produto = 'Adubo Nitrogenado';

/*

Produto				Quantidade Incorreta	Quantidade Correta
Milho Tradicional		-10						170
Ração Ovina				0						66

*/

# DESAFIO 4 FINALIZADO
SELECT produto, quantidade FROM tb_vendas_agro WHERE produto IN("Milho Tradicional", "Ração Ovina");

UPDATE tb_vendas_agro
SET quantidade = 170
WHERE produto = 'Milho Tradicional';

UPDATE tb_vendas_agro
SET quantidade = 66
WHERE produto = 'Ração Ovina';

# DESAFIO 5 FINALIZADO

/*
DESAFIO 6 - PADRONIZAR OS DADOS DE ESTADOS (EX: PARANA PARA "PR")

Estado Incorreto	Estado Correto
	PARANA				PR
	SÃO PAULO			SP

*/
