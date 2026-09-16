-- ============================================================
-- CHALLENGE NIGHT - TECHVENDAS S/A
-- Dashboard Executivo - 18 KPIs
-- Dialeto sugerido: MySQL 8+
--
-- MODELO DE TABELAS ADOTADO
-- Clientes(id_cliente, nome, cidade, estado, data_cadastro)
-- Vendedores(id_vendedor, nome)
-- Vendas(id_venda, id_cliente, id_vendedor, data_venda)
-- Itens_Venda(id_venda, id_produto, quantidade, preco_unitario)
-- Produtos(id_produto, nome, categoria, preco)
--
-- Caso o seu banco use nomes diferentes, ajuste apenas os
-- nomes das colunas/tabelas equivalentes.
-- ============================================================

-- KPI 01 - Faturamento por categoria
-- Objetivo: identificar quais categorias geram mais receita.
SELECT
    p.categoria,
    SUM(iv.quantidade * iv.preco_unitario) AS faturamento
FROM Produtos p
INNER JOIN Itens_Venda iv ON iv.id_produto = p.id_produto
INNER JOIN Vendas v ON v.id_venda = iv.id_venda
GROUP BY p.categoria
ORDER BY faturamento DESC;

-- KPI 02 - Participacao de cada categoria no faturamento
-- Objetivo: medir a representatividade de cada categoria nas vendas.
WITH faturamento_categorias AS (
    SELECT
        p.categoria,
        SUM(iv.quantidade * iv.preco_unitario) AS faturamento
    FROM Produtos p
    INNER JOIN Itens_Venda iv ON iv.id_produto = p.id_produto
    INNER JOIN Vendas v ON v.id_venda = iv.id_venda
    GROUP BY p.categoria
), total AS (
    SELECT SUM(faturamento) AS faturamento_total
    FROM faturamento_categorias
)
SELECT
    fc.categoria,
    fc.faturamento,
    ROUND(100 * fc.faturamento / NULLIF(t.faturamento_total, 0), 2) AS participacao_percentual
FROM faturamento_categorias fc
CROSS JOIN total t
ORDER BY participacao_percentual DESC;

-- KPI 03 - Faturamento por vendedor
-- Objetivo: comparar a contribuicao financeira de cada vendedor.
SELECT
    vd.id_vendedor,
    vd.nome,
    SUM(iv.quantidade * iv.preco_unitario) AS faturamento
FROM Vendedores vd
INNER JOIN Vendas v ON v.id_vendedor = vd.id_vendedor
INNER JOIN Itens_Venda iv ON iv.id_venda = v.id_venda
GROUP BY vd.id_vendedor, vd.nome
ORDER BY faturamento DESC;

-- KPI 04 - Quantidade de vendas por vendedor
-- Objetivo: avaliar o volume de negocios gerado por cada vendedor.
SELECT
    vd.id_vendedor,
    vd.nome,
    COUNT(DISTINCT v.id_venda) AS quantidade_vendas
FROM Vendedores vd
INNER JOIN Vendas v ON v.id_vendedor = vd.id_vendedor
GROUP BY vd.id_vendedor, vd.nome
ORDER BY quantidade_vendas DESC;

-- KPI 05 - Faturamento medio por vendedor
-- Objetivo: medir o valor medio vendido por vendedor, considerando todas as suas vendas.
WITH valor_vendas AS (
    SELECT
        v.id_venda,
        v.id_vendedor,
        SUM(iv.quantidade * iv.preco_unitario) AS valor_venda
    FROM Vendas v
    INNER JOIN Itens_Venda iv ON iv.id_venda = v.id_venda
    GROUP BY v.id_venda, v.id_vendedor
)
SELECT
    vd.id_vendedor,
    vd.nome,
    AVG(vv.valor_venda) AS faturamento_medio_por_venda
FROM Vendedores vd
INNER JOIN valor_vendas vv ON vv.id_vendedor = vd.id_vendedor
GROUP BY vd.id_vendedor, vd.nome
ORDER BY faturamento_medio_por_venda DESC;

-- KPI 06 - Menor e maior venda por vendedor
-- Objetivo: identificar a amplitude dos negocios fechados por cada vendedor.
WITH valor_vendas AS (
    SELECT
        v.id_venda,
        v.id_vendedor,
        SUM(iv.quantidade * iv.preco_unitario) AS valor_venda
    FROM Vendas v
    INNER JOIN Itens_Venda iv ON iv.id_venda = v.id_venda
    GROUP BY v.id_venda, v.id_vendedor
)
SELECT
    vd.id_vendedor,
    vd.nome,
    MIN(vv.valor_venda) AS menor_venda,
    MAX(vv.valor_venda) AS maior_venda
FROM Vendedores vd
INNER JOIN valor_vendas vv ON vv.id_vendedor = vd.id_vendedor
GROUP BY vd.id_vendedor, vd.nome
ORDER BY maior_venda DESC;

-- KPI 07 - Clientes ativos por vendedor
-- Objetivo: saber quantos clientes distintos cada vendedor atende de fato.
SELECT
    vd.id_vendedor,
    vd.nome,
    COUNT(DISTINCT v.id_cliente) AS clientes_ativos
FROM Vendedores vd
INNER JOIN Vendas v ON v.id_vendedor = vd.id_vendedor
GROUP BY vd.id_vendedor, vd.nome
ORDER BY clientes_ativos DESC;

-- KPI 08 - Clientes sem nenhuma compra
-- Objetivo: localizar clientes cadastrados que nunca realizaram uma compra.
SELECT
    c.id_cliente,
    c.nome,
    c.cidade,
    c.estado
FROM Clientes c
LEFT JOIN Vendas v ON v.id_cliente = c.id_cliente
WHERE v.id_venda IS NULL
ORDER BY c.nome;

-- KPI 09 - Quantidade de clientes que compraram mais de uma vez
-- Objetivo: identificar clientes recorrentes e apoiar estrategias de fidelizacao.
WITH compras_cliente AS (
    SELECT
        c.id_cliente,
        c.nome,
        COUNT(DISTINCT v.id_venda) AS compras
    FROM Clientes c
    INNER JOIN Vendas v ON v.id_cliente = c.id_cliente
    GROUP BY c.id_cliente, c.nome
)
SELECT
    COUNT(*) AS clientes_recorrentes
FROM compras_cliente
WHERE compras > 1;

-- KPI 10 - Taxa de recorrencia dos clientes
-- Objetivo: medir a proporcao de clientes que voltam a comprar.
WITH compras_cliente AS (
    SELECT
        c.id_cliente,
        COUNT(DISTINCT v.id_venda) AS compras
    FROM Clientes c
    LEFT JOIN Vendas v ON v.id_cliente = c.id_cliente
    GROUP BY c.id_cliente
)
SELECT
    ROUND(
        100 * SUM(CASE WHEN compras > 1 THEN 1 ELSE 0 END) /
        NULLIF(COUNT(*), 0),
        2
    ) AS taxa_recorrencia_percentual
FROM compras_cliente;

-- KPI 11 - Produtos nunca vendidos
-- Objetivo: descobrir produtos cadastrados sem movimentacao comercial.
SELECT
    p.id_produto,
    p.nome,
    p.categoria,
    COALESCE(SUM(iv.quantidade), 0) AS unidades_vendidas
FROM Produtos p
LEFT JOIN Itens_Venda iv ON iv.id_produto = p.id_produto
GROUP BY p.id_produto, p.nome, p.categoria
HAVING COALESCE(SUM(iv.quantidade), 0) = 0
ORDER BY p.nome;

-- KPI 12 - Cobertura comercial do catalogo
-- Objetivo: calcular o percentual de produtos cadastrados que ja foram vendidos.
WITH produtos_movimentados AS (
    SELECT DISTINCT p.id_produto
    FROM Produtos p
    INNER JOIN Itens_Venda iv ON iv.id_produto = p.id_produto
)
SELECT
    ROUND(
        100 * (SELECT COUNT(*) FROM produtos_movimentados) /
        NULLIF((SELECT COUNT(*) FROM Produtos), 0),
        2
    ) AS cobertura_catalogo_percentual;

-- KPI 13 - Quantidade vendida por categoria
-- Objetivo: comparar categorias pelo volume fisico comercializado.
SELECT
    p.categoria,
    SUM(iv.quantidade) AS unidades_vendidas
FROM Produtos p
INNER JOIN Itens_Venda iv ON iv.id_produto = p.id_produto
GROUP BY p.categoria
ORDER BY unidades_vendidas DESC;

-- KPI 14 - Media de itens por venda
-- Objetivo: medir o tamanho medio do carrinho/pedido em quantidade de unidades.
WITH quantidade_por_venda AS (
    SELECT
        v.id_venda,
        SUM(iv.quantidade) AS unidades_na_venda
    FROM Vendas v
    INNER JOIN Itens_Venda iv ON iv.id_venda = v.id_venda
    GROUP BY v.id_venda
)
SELECT
    AVG(unidades_na_venda) AS media_unidades_por_venda,
    MIN(unidades_na_venda) AS menor_quantidade_em_uma_venda,
    MAX(unidades_na_venda) AS maior_quantidade_em_uma_venda
FROM quantidade_por_venda;

-- KPI 15 - Participacao dos 10 maiores clientes no faturamento
-- Objetivo: avaliar o nivel de concentracao da receita em poucos clientes.
WITH faturamento_cliente AS (
    SELECT
        c.id_cliente,
        c.nome,
        SUM(iv.quantidade * iv.preco_unitario) AS faturamento
    FROM Clientes c
    INNER JOIN Vendas v ON v.id_cliente = c.id_cliente
    INNER JOIN Itens_Venda iv ON iv.id_venda = v.id_venda
    GROUP BY c.id_cliente, c.nome
), ranking_clientes AS (
    SELECT
        id_cliente,
        nome,
        faturamento,
        ROW_NUMBER() OVER (ORDER BY faturamento DESC) AS posicao
    FROM faturamento_cliente
), total AS (
    SELECT SUM(faturamento) AS faturamento_total
    FROM faturamento_cliente
)
SELECT
    ROUND(
        100 * SUM(rc.faturamento) / NULLIF(t.faturamento_total, 0),
        2
    ) AS participacao_top_10_percentual
FROM ranking_clientes rc
CROSS JOIN total t
WHERE rc.posicao <= 10;

-- KPI 16 - Valor medio gasto por cliente ativo
-- Objetivo: estimar o potencial financeiro medio da base que efetivamente compra.
WITH faturamento_cliente AS (
    SELECT
        v.id_cliente,
        SUM(iv.quantidade * iv.preco_unitario) AS faturamento_cliente
    FROM Vendas v
    INNER JOIN Itens_Venda iv ON iv.id_venda = v.id_venda
    GROUP BY v.id_cliente
)
SELECT
    AVG(faturamento_cliente) AS gasto_medio_por_cliente_ativo,
    MIN(faturamento_cliente) AS menor_gasto_cliente_ativo,
    MAX(faturamento_cliente) AS maior_gasto_cliente_ativo
FROM faturamento_cliente;

-- KPI 17 - Produtos com baixo giro
-- Objetivo: apontar produtos vendidos em pouca quantidade para apoiar decisoes de estoque e mix.
WITH vendas_produto AS (
    SELECT
        p.id_produto,
        p.nome,
        p.categoria,
        COALESCE(SUM(iv.quantidade), 0) AS unidades_vendidas
    FROM Produtos p
    LEFT JOIN Itens_Venda iv ON iv.id_produto = p.id_produto
    GROUP BY p.id_produto, p.nome, p.categoria
)
SELECT
    id_produto,
    nome,
    categoria,
    unidades_vendidas
FROM vendas_produto
WHERE unidades_vendidas BETWEEN 1 AND 5
ORDER BY unidades_vendidas ASC, nome;

-- KPI 18 - Desempenho mensal de vendas
-- Objetivo: acompanhar a evolucao do volume financeiro e da quantidade de vendas por mes.
WITH vendas_mes AS (
    SELECT
        DATE_FORMAT(v.data_venda, '%Y-%m') AS mes,
        COUNT(DISTINCT v.id_venda) AS quantidade_vendas,
        SUM(iv.quantidade * iv.preco_unitario) AS faturamento
    FROM Vendas v
    INNER JOIN Itens_Venda iv ON iv.id_venda = v.id_venda
    GROUP BY DATE_FORMAT(v.data_venda, '%Y-%m')
)
SELECT
    mes,
    quantidade_vendas,
    faturamento
FROM vendas_mes
ORDER BY mes;

-- ============================================================
-- CONTROLE DOS REQUISITOS DO DESAFIO
-- CTE: KPIs 02, 05, 06, 09, 10, 12, 14, 15, 16, 17, 18
-- INNER JOIN: usado em diversos KPIs de vendas/produtos/vendedores
-- LEFT JOIN: KPIs 08, 10, 11, 17
-- COUNT(): KPIs 04, 09, 10, 12, 18
-- SUM(): KPIs 01, 02, 03, 13, 15, 16, 18
-- AVG(): KPIs 05, 14, 16
-- MIN(): KPIs 06, 14, 16
-- MAX(): KPIs 06, 14, 16
-- COUNT(DISTINCT): KPIs 04, 07, 09, 18
-- GROUP BY: utilizado em varios KPIs agregados
-- ORDER BY: presente em todos os KPIs que retornam rankings/listagens
-- ============================================================
