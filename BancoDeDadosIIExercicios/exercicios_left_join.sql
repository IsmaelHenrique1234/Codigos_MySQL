-- ============================================================
-- BANCO DE DADOS II - EXERCÍCIOS RESOLVIDOS: LEFT JOIN
-- Cenário: TechVendas S/A
-- ============================================================
-- Regras aplicadas:
-- 1. LEFT JOIN explicitamente nas questões.
-- 2. Aliases para as tabelas.
-- 3. Sem SELECT *.
-- 4. Código organizado e indentado.
-- ============================================================


-- ------------------------------------------------------------
-- EXERCÍCIO 01 - Todos os clientes
-- ------------------------------------------------------------
-- Descrição:
-- Liste TODOS os clientes, mesmo aqueles que nunca realizaram
-- uma venda.
--
-- Exiba:
-- id_cliente, nome_cliente, cidade, id_venda, data_venda.
-- ------------------------------------------------------------

SELECT
    c.id_cliente,
    c.nome_cliente,
    c.cidade,
    v.id_venda,
    v.data_venda
FROM clientes AS c
LEFT JOIN vendas AS v
    ON c.id_cliente = v.id_cliente
ORDER BY c.id_cliente, v.data_venda;


-- ------------------------------------------------------------
-- EXERCÍCIO 02 - Clientes sem compras
-- ------------------------------------------------------------
-- Descrição:
-- Liste apenas os clientes que nunca realizaram uma venda.
-- ------------------------------------------------------------

SELECT
    c.id_cliente,
    c.nome_cliente,
    c.cidade
FROM clientes AS c
LEFT JOIN vendas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venda IS NULL
ORDER BY c.id_cliente;


-- ------------------------------------------------------------
-- EXERCÍCIO 03 - Todos os vendedores
-- ------------------------------------------------------------
-- Descrição:
-- Liste TODOS os vendedores, inclusive aqueles que ainda não
-- realizaram vendas.
--
-- Exiba:
-- id_vendedor, nome_vendedor, setor, id_venda.
-- ------------------------------------------------------------

SELECT
    ve.id_vendedor,
    ve.nome_vendedor,
    ve.setor,
    v.id_venda
FROM vendedores AS ve
LEFT JOIN vendas AS v
    ON ve.id_vendedor = v.id_vendedor
ORDER BY ve.id_vendedor, v.id_venda;


-- ------------------------------------------------------------
-- EXERCÍCIO 04 - Vendedores sem vendas
-- ------------------------------------------------------------
-- Descrição:
-- Liste somente os vendedores que ainda não venderam nenhum
-- produto.
-- ------------------------------------------------------------

SELECT
    ve.id_vendedor,
    ve.nome_vendedor,
    ve.setor
FROM vendedores AS ve
LEFT JOIN vendas AS v
    ON ve.id_vendedor = v.id_vendedor
WHERE v.id_venda IS NULL
ORDER BY ve.id_vendedor;


-- ------------------------------------------------------------
-- EXERCÍCIO 05 - Todos os produtos
-- ------------------------------------------------------------
-- Descrição:
-- Liste TODOS os produtos cadastrados, inclusive aqueles que
-- nunca foram vendidos.
--
-- Exiba:
-- id_produto, nome_produto, categoria, quantidade.
-- ------------------------------------------------------------

SELECT
    p.id_produto,
    p.nome_produto,
    p.categoria,
    COALESCE(SUM(iv.quantidade), 0) AS quantidade
FROM produtos AS p
LEFT JOIN itens_venda AS iv
    ON p.id_produto = iv.id_produto
GROUP BY
    p.id_produto,
    p.nome_produto,
    p.categoria
ORDER BY p.id_produto;


-- ------------------------------------------------------------
-- EXERCÍCIO 06 - Produtos nunca vendidos
-- ------------------------------------------------------------
-- Descrição:
-- Liste apenas os produtos que nunca apareceram em uma venda.
-- ------------------------------------------------------------

SELECT
    p.id_produto,
    p.nome_produto,
    p.categoria
FROM produtos AS p
LEFT JOIN itens_venda AS iv
    ON p.id_produto = iv.id_produto
WHERE iv.id_item IS NULL
ORDER BY p.id_produto;


-- ------------------------------------------------------------
-- EXERCÍCIO 07 - Quantidade de vendas por cliente
-- ------------------------------------------------------------
-- Descrição:
-- Exiba TODOS os clientes, informando a quantidade de vendas
-- realizada por cada um.
--
-- Clientes sem compras devem aparecer com quantidade zero.
--
-- Requisitos:
-- COUNT, GROUP BY e LEFT JOIN.
-- ------------------------------------------------------------

SELECT
    c.id_cliente,
    c.nome_cliente,
    COUNT(v.id_venda) AS quantidade_vendas
FROM clientes AS c
LEFT JOIN vendas AS v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nome_cliente
ORDER BY c.id_cliente;


-- ------------------------------------------------------------
-- EXERCÍCIO 08 - Valor total comprado por cliente
-- ------------------------------------------------------------
-- Descrição:
-- Liste TODOS os clientes.
--
-- Clientes sem compras devem aparecer com total igual a zero.
--
-- Requisitos:
-- SUM e COALESCE.
-- ------------------------------------------------------------

SELECT
    c.id_cliente,
    c.nome_cliente,
    COALESCE(SUM(v.valor_total), 0) AS total_comprado
FROM clientes AS c
LEFT JOIN vendas AS v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nome_cliente
ORDER BY c.id_cliente;


-- ------------------------------------------------------------
-- EXERCÍCIO 09 - Quantidade vendida por produto
-- ------------------------------------------------------------
-- Descrição:
-- Liste TODOS os produtos cadastrados.
--
-- Produtos nunca vendidos devem aparecer com quantidade igual
-- a zero.
--
-- Requisitos:
-- SUM e COALESCE.
-- ------------------------------------------------------------

SELECT
    p.id_produto,
    p.nome_produto,
    COALESCE(SUM(iv.quantidade), 0) AS quantidade_total_vendida
FROM produtos AS p
LEFT JOIN itens_venda AS iv
    ON p.id_produto = iv.id_produto
GROUP BY
    p.id_produto,
    p.nome_produto
ORDER BY p.id_produto;


-- ------------------------------------------------------------
-- EXERCÍCIO 10 - Produtos sem movimentação
-- ------------------------------------------------------------
-- Descrição:
-- Liste apenas os produtos que nunca foram vendidos.
--
-- Exiba:
-- id_produto, nome_produto, categoria, preco.
-- ------------------------------------------------------------

SELECT
    p.id_produto,
    p.nome_produto,
    p.categoria,
    p.preco
FROM produtos AS p
LEFT JOIN itens_venda AS iv
    ON p.id_produto = iv.id_produto
WHERE iv.id_item IS NULL
ORDER BY p.id_produto;


-- ------------------------------------------------------------
-- EXERCÍCIO 11 - Relatório completo de clientes
-- ------------------------------------------------------------
-- Descrição:
-- Liste TODOS os clientes, exibindo quantidade de vendas e
-- total comprado.
--
-- Clientes sem compras devem aparecer normalmente.
-- Ordene pelo maior total comprado.
-- ------------------------------------------------------------

SELECT
    c.nome_cliente,
    c.cidade,
    COUNT(v.id_venda) AS quantidade_vendas,
    COALESCE(SUM(v.valor_total), 0) AS total_comprado
FROM clientes AS c
LEFT JOIN vendas AS v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nome_cliente,
    c.cidade
ORDER BY total_comprado DESC;


-- ------------------------------------------------------------
-- EXERCÍCIO 12 - Relatório de vendedores
-- ------------------------------------------------------------
-- Descrição:
-- Para TODOS os vendedores, exiba:
-- nome_vendedor, quantidade_vendas, faturamento_total.
--
-- Vendedores sem vendas devem aparecer com valores iguais a zero.
--
-- Requisitos:
-- COUNT, SUM e COALESCE.
-- ------------------------------------------------------------

SELECT
    ve.nome_vendedor,
    COUNT(v.id_venda) AS quantidade_vendas,
    COALESCE(SUM(v.valor_total), 0) AS faturamento_total
FROM vendedores AS ve
LEFT JOIN vendas AS v
    ON ve.id_vendedor = v.id_vendedor
GROUP BY
    ve.id_vendedor,
    ve.nome_vendedor
ORDER BY ve.id_vendedor;


-- ------------------------------------------------------------
-- EXERCÍCIO 13 - Produtos e categorias
-- ------------------------------------------------------------
-- Descrição:
-- Liste TODOS os produtos, exibindo:
-- categoria, nome_produto, quantidade_vendida.
--
-- Mesmo que nunca tenham sido vendidos.
-- Ordene por categoria e nome.
-- ------------------------------------------------------------

SELECT
    p.categoria,
    p.nome_produto,
    COALESCE(SUM(iv.quantidade), 0) AS quantidade_vendida
FROM produtos AS p
LEFT JOIN itens_venda AS iv
    ON p.id_produto = iv.id_produto
GROUP BY
    p.id_produto,
    p.categoria,
    p.nome_produto
ORDER BY
    p.categoria,
    p.nome_produto;


-- ------------------------------------------------------------
-- EXERCÍCIO 14 - Clientes e última venda
-- ------------------------------------------------------------
-- Descrição:
-- Liste TODOS os clientes.
--
-- Exiba:
-- nome_cliente, data_da_ultima_venda.
--
-- Clientes sem compras também devem aparecer.
-- Requisito: MAX(data_venda).
-- ------------------------------------------------------------

SELECT
    c.nome_cliente,
    MAX(v.data_venda) AS data_da_ultima_venda
FROM clientes AS c
LEFT JOIN vendas AS v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nome_cliente
ORDER BY c.id_cliente;


-- ------------------------------------------------------------
-- EXERCÍCIO 15 - Dashboard Gerencial
-- ------------------------------------------------------------
-- Descrição:
-- Monte um relatório contendo TODOS os clientes.
--
-- Exiba:
-- id_cliente, nome_cliente, cidade, quantidade_vendas,
-- valor_total_comprado, data_primeira_compra,
-- data_ultima_compra.
--
-- Clientes que nunca compraram devem aparecer normalmente.
--
-- Requisitos obrigatórios:
-- LEFT JOIN, COUNT, SUM, MIN, MAX, COALESCE,
-- GROUP BY e ORDER BY.
-- ------------------------------------------------------------

SELECT
    c.id_cliente,
    c.nome_cliente,
    c.cidade,
    COUNT(v.id_venda) AS quantidade_vendas,
    COALESCE(SUM(v.valor_total), 0) AS valor_total_comprado,
    MIN(v.data_venda) AS data_primeira_compra,
    MAX(v.data_venda) AS data_ultima_compra
FROM clientes AS c
LEFT JOIN vendas AS v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nome_cliente,
    c.cidade
ORDER BY valor_total_comprado DESC, c.id_cliente;
