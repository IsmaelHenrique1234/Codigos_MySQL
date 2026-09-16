-- ============================================================
-- BANCO DE DADOS II - DESAFIO FINAL DO SEMESTRE
-- SPORTZONE - RELATÓRIO GERENCIAL EXECUTIVO
-- ============================================================

USE sportzone;

-- ============================================================
-- PARTE 1 - ANÁLISE DE CLIENTES
-- Objetivo: apresentar todos os clientes, inclusive os que
-- nunca compraram.
-- ============================================================

WITH resumo_clientes AS (
    SELECT
        v.id_cliente,
        COUNT(DISTINCT v.id_venda) AS quantidade_compras,
        SUM(iv.quantidade) AS quantidade_produtos,
        SUM(iv.quantidade * iv.preco_unitario) AS valor_total_gasto,
        MAX(v.data_venda) AS data_ultima_compra
    FROM vendas v
    INNER JOIN itens_venda iv
        ON iv.id_venda = v.id_venda
    GROUP BY v.id_cliente
)
SELECT
    c.nome,
    c.cidade,
    c.renda,
    COALESCE(rc.quantidade_compras, 0) AS quantidade_compras,
    COALESCE(rc.quantidade_produtos, 0) AS quantidade_total_produtos,
    COALESCE(rc.valor_total_gasto, 0) AS valor_total_gasto,
    COALESCE(
        rc.valor_total_gasto / NULLIF(rc.quantidade_compras, 0),
        0
    ) AS ticket_medio,
    rc.data_ultima_compra
FROM clientes c
LEFT JOIN resumo_clientes rc
    ON rc.id_cliente = c.id_cliente
ORDER BY c.nome;


-- ============================================================
-- PARTE 2 - ANÁLISE DE PRODUTOS
-- Objetivo: apresentar todos os produtos, inclusive os que
-- nunca foram vendidos.
-- ============================================================

WITH resumo_produtos AS (
    SELECT
        iv.id_produto,
        SUM(iv.quantidade) AS quantidade_total_vendida,
        SUM(iv.quantidade * iv.preco_unitario) AS faturamento_gerado,
        COUNT(DISTINCT v.id_cliente) AS clientes_diferentes
    FROM itens_venda iv
    INNER JOIN vendas v
        ON v.id_venda = iv.id_venda
    GROUP BY iv.id_produto
)
SELECT
    p.nome,
    p.preco AS preco_atual,
    p.estoque,
    COALESCE(rp.quantidade_total_vendida, 0) AS quantidade_total_vendida,
    COALESCE(rp.faturamento_gerado, 0) AS faturamento_gerado,
    COALESCE(rp.clientes_diferentes, 0) AS clientes_diferentes
FROM produtos p
LEFT JOIN resumo_produtos rp
    ON rp.id_produto = p.id_produto
ORDER BY p.nome;


-- ============================================================
-- PARTE 3 - ANÁLISE DE VENDEDORES
-- Objetivo: apresentar todos os vendedores, inclusive os que
-- ainda não realizaram vendas.
-- ============================================================

WITH resumo_vendedores AS (
    SELECT
        v.id_vendedor,
        COUNT(DISTINCT v.id_venda) AS quantidade_vendas,
        COUNT(DISTINCT v.id_cliente) AS clientes_diferentes,
        SUM(iv.quantidade) AS quantidade_produtos_vendidos,
        SUM(iv.quantidade * iv.preco_unitario) AS faturamento_total
    FROM vendas v
    INNER JOIN itens_venda iv
        ON iv.id_venda = v.id_venda
    GROUP BY v.id_vendedor
)
SELECT
    ven.nome,
    COALESCE(rv.quantidade_vendas, 0) AS quantidade_vendas,
    COALESCE(rv.clientes_diferentes, 0) AS clientes_diferentes,
    COALESCE(rv.quantidade_produtos_vendidos, 0) AS quantidade_produtos_vendidos,
    COALESCE(rv.faturamento_total, 0) AS faturamento_total,
    COALESCE(
        rv.faturamento_total / NULLIF(rv.quantidade_vendas, 0),
        0
    ) AS ticket_medio
FROM vendedores ven
LEFT JOIN resumo_vendedores rv
    ON rv.id_vendedor = ven.id_vendedor
ORDER BY ven.nome;


-- ============================================================
-- PARTE 4 - KPI 01
-- Pergunta: Qual cliente mais gastou na SportZone?
-- ============================================================

WITH gastos_clientes AS (
    SELECT
        c.id_cliente,
        c.nome,
        SUM(iv.quantidade * iv.preco_unitario) AS total_gasto
    FROM clientes c
    INNER JOIN vendas v
        ON v.id_cliente = c.id_cliente
    INNER JOIN itens_venda iv
        ON iv.id_venda = v.id_venda
    GROUP BY c.id_cliente, c.nome
)
SELECT
    nome,
    total_gasto
FROM gastos_clientes
ORDER BY total_gasto DESC
LIMIT 1;


-- ============================================================
-- KPI 02
-- Pergunta: Qual cliente realizou a maior quantidade de compras?
-- ============================================================

SELECT
    c.nome,
    COUNT(v.id_venda) AS quantidade_compras
FROM clientes c
INNER JOIN vendas v
    ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY quantidade_compras DESC
LIMIT 1;


-- ============================================================
-- KPI 03
-- Pergunta: Qual produto teve a maior quantidade de unidades vendidas?
-- ============================================================

SELECT
    p.nome,
    SUM(iv.quantidade) AS unidades_vendidas
FROM produtos p
INNER JOIN itens_venda iv
    ON iv.id_produto = p.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY unidades_vendidas DESC
LIMIT 1;


-- ============================================================
-- KPI 04
-- Pergunta: Qual produto gerou o maior faturamento?
-- ============================================================

SELECT
    p.nome,
    SUM(iv.quantidade * iv.preco_unitario) AS faturamento
FROM produtos p
INNER JOIN itens_venda iv
    ON iv.id_produto = p.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY faturamento DESC
LIMIT 1;


-- ============================================================
-- KPI 05
-- Pergunta: Quais produtos nunca foram vendidos?
-- ============================================================

SELECT
    p.id_produto,
    p.nome
FROM produtos p
WHERE NOT EXISTS (
    SELECT 1
    FROM itens_venda iv
    WHERE iv.id_produto = p.id_produto
)
ORDER BY p.nome;


-- ============================================================
-- KPI 06
-- Pergunta: Qual vendedor realizou a maior quantidade de vendas?
-- ============================================================

SELECT
    ven.nome,
    COUNT(v.id_venda) AS quantidade_vendas
FROM vendedores ven
INNER JOIN vendas v
    ON v.id_vendedor = ven.id_vendedor
GROUP BY ven.id_vendedor, ven.nome
ORDER BY quantidade_vendas DESC
LIMIT 1;


-- ============================================================
-- KPI 07
-- Pergunta: Qual vendedor gerou o maior faturamento?
-- ============================================================

SELECT
    ven.nome,
    SUM(iv.quantidade * iv.preco_unitario) AS faturamento
FROM vendedores ven
INNER JOIN vendas v
    ON v.id_vendedor = ven.id_vendedor
INNER JOIN itens_venda iv
    ON iv.id_venda = v.id_venda
GROUP BY ven.id_vendedor, ven.nome
ORDER BY faturamento DESC
LIMIT 1;


-- ============================================================
-- KPI 08
-- Pergunta: Quantos clientes nunca realizaram uma compra?
-- ============================================================

SELECT
    COUNT(*) AS clientes_sem_compras
FROM clientes c
WHERE NOT EXISTS (
    SELECT 1
    FROM vendas v
    WHERE v.id_cliente = c.id_cliente
);


-- ============================================================
-- KPI 09
-- Pergunta: Qual foi o faturamento total da empresa?
-- ============================================================

SELECT
    COALESCE(SUM(iv.quantidade * iv.preco_unitario), 0) AS faturamento_total
FROM itens_venda iv;


-- ============================================================
-- KPI 10
-- Pergunta: Qual é o ticket médio geral das vendas?
-- ============================================================

WITH total_por_venda AS (
    SELECT
        id_venda,
        SUM(quantidade * preco_unitario) AS valor_venda
    FROM itens_venda
    GROUP BY id_venda
)
SELECT
    COALESCE(AVG(valor_venda), 0) AS ticket_medio_geral
FROM total_por_venda;


-- ============================================================
-- PARTE 5 - KPI CRIADO 01
-- Nome: Faturamento por Cidade
-- Pergunta: Quais cidades concentram o maior faturamento?
-- Área: Marketing / Diretoria
-- ============================================================

WITH faturamento_cidade AS (
    SELECT
        c.cidade,
        SUM(iv.quantidade * iv.preco_unitario) AS faturamento
    FROM clientes c
    INNER JOIN vendas v
        ON v.id_cliente = c.id_cliente
    INNER JOIN itens_venda iv
        ON iv.id_venda = v.id_venda
    GROUP BY c.cidade
)
SELECT
    cidade,
    faturamento
FROM faturamento_cidade
ORDER BY faturamento DESC;


-- ============================================================
-- KPI CRIADO 02
-- Nome: Taxa de Clientes Recorrentes
-- Pergunta: Qual percentual dos clientes realizou pelo menos
-- duas compras?
-- Área: Marketing
-- ============================================================

WITH compras_cliente AS (
    SELECT
        c.id_cliente,
        COUNT(v.id_venda) AS quantidade_compras
    FROM clientes c
    LEFT JOIN vendas v
        ON v.id_cliente = c.id_cliente
    GROUP BY c.id_cliente
)
SELECT
    COUNT(
        CASE
            WHEN quantidade_compras >= 2 THEN 1
        END
    ) AS clientes_recorrentes,
    COUNT(*) AS total_clientes,
    ROUND(
        100.0 * COUNT(
            CASE
                WHEN quantidade_compras >= 2 THEN 1
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS percentual_recorrentes
FROM compras_cliente;


-- ============================================================
-- KPI CRIADO 03
-- Nome: Valor Financeiro do Estoque
-- Pergunta: Quanto dinheiro está atualmente imobilizado no estoque,
-- considerando o preço atual dos produtos?
-- Área: Estoque / Financeiro
-- ============================================================

SELECT
    ROUND(SUM(preco * estoque), 2) AS valor_financeiro_estoque
FROM produtos;


-- ============================================================
-- KPI CRIADO 04
-- Nome: Mês de Maior Faturamento
-- Pergunta: Em qual mês a SportZone apresentou o maior faturamento?
-- Área: Comercial / Diretoria
-- ============================================================

WITH faturamento_mensal AS (
    SELECT
        YEAR(v.data_venda) AS ano,
        MONTH(v.data_venda) AS mes,
        SUM(iv.quantidade * iv.preco_unitario) AS faturamento
    FROM vendas v
    INNER JOIN itens_venda iv
        ON iv.id_venda = v.id_venda
    GROUP BY YEAR(v.data_venda), MONTH(v.data_venda)
)
SELECT
    ano,
    mes,
    faturamento
FROM faturamento_mensal
ORDER BY faturamento DESC
LIMIT 1;


-- ============================================================
-- KPI CRIADO 05
-- Nome: Categoria com Maior Faturamento
-- Pergunta: Qual categoria de produtos é responsável pelo maior
-- faturamento da empresa?
-- Área: Produtos / Comercial
-- ============================================================

SELECT
    p.categoria,
    SUM(iv.quantidade * iv.preco_unitario) AS faturamento
FROM produtos p
INNER JOIN itens_venda iv
    ON iv.id_produto = p.id_produto
GROUP BY p.categoria
ORDER BY faturamento DESC
LIMIT 1;


-- ============================================================
-- FIM DO RELATÓRIO SQL
-- ============================================================
