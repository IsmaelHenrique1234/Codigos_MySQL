-- ============================================================
-- BANCO DE DADOS II - EXERCÍCIOS RESOLVIDOS: INNER JOIN
-- Cenário: TechVendas S/A
-- ============================================================
-- Regras aplicadas:
-- 1. INNER JOIN explicitamente nas questões.
-- 2. Aliases para as tabelas.
-- 3. Sem SELECT *.
-- 4. Código organizado e indentado.
-- ============================================================


-- ------------------------------------------------------------
-- EXERCÍCIO 01 - Clientes que compraram
-- ------------------------------------------------------------
-- Descrição:
-- Liste todas as vendas com:
-- id_venda, data_venda, nome_cliente e valor_total.
-- Relacione as tabelas clientes e vendas.
-- ------------------------------------------------------------

SELECT
    v.id_venda,
    v.data_venda,
    c.nome_cliente,
    v.valor_total
FROM vendas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
ORDER BY v.id_venda;


-- ------------------------------------------------------------
-- EXERCÍCIO 02 - Vendedor responsável
-- ------------------------------------------------------------
-- Descrição:
-- Liste:
-- id_venda, data_venda, nome_vendedor, setor e valor_total.
-- Ordene da venda mais recente para a mais antiga.
-- ------------------------------------------------------------

SELECT
    v.id_venda,
    v.data_venda,
    ve.nome_vendedor,
    ve.setor,
    v.valor_total
FROM vendas AS v
INNER JOIN vendedores AS ve
    ON v.id_vendedor = ve.id_vendedor
ORDER BY
    v.data_venda DESC,
    v.id_venda DESC;


-- ------------------------------------------------------------
-- EXERCÍCIO 03 - Produtos presentes nas vendas
-- ------------------------------------------------------------
-- Descrição:
-- Liste:
-- id_item, nome_produto, categoria, quantidade e valor_unitario.
-- Relacione itens_venda e produtos.
-- ------------------------------------------------------------

SELECT
    iv.id_item,
    p.nome_produto,
    p.categoria,
    iv.quantidade,
    iv.valor_unitario
FROM itens_venda AS iv
INNER JOIN produtos AS p
    ON iv.id_produto = p.id_produto
ORDER BY iv.id_item;


-- ------------------------------------------------------------
-- EXERCÍCIO 04 - Detalhamento da venda
-- ------------------------------------------------------------
-- Descrição:
-- Liste:
-- id_venda, data_venda, nome_produto, quantidade e valor_unitario.
-- Utilize vendas, itens_venda e produtos.
-- ------------------------------------------------------------

SELECT
    v.id_venda,
    v.data_venda,
    p.nome_produto,
    iv.quantidade,
    iv.valor_unitario
FROM vendas AS v
INNER JOIN itens_venda AS iv
    ON v.id_venda = iv.id_venda
INNER JOIN produtos AS p
    ON iv.id_produto = p.id_produto
ORDER BY v.id_venda;


-- ------------------------------------------------------------
-- EXERCÍCIO 05 - Relatório completo
-- ------------------------------------------------------------
-- Descrição:
-- Liste:
-- id_venda, data_venda, nome_cliente, nome_vendedor,
-- nome_produto, quantidade e valor_unitario.
-- Utilize as cinco tabelas.
-- ------------------------------------------------------------

SELECT
    v.id_venda,
    v.data_venda,
    c.nome_cliente,
    ve.nome_vendedor,
    p.nome_produto,
    iv.quantidade,
    iv.valor_unitario
FROM vendas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN vendedores AS ve
    ON v.id_vendedor = ve.id_vendedor
INNER JOIN itens_venda AS iv
    ON v.id_venda = iv.id_venda
INNER JOIN produtos AS p
    ON iv.id_produto = p.id_produto
ORDER BY v.id_venda;


-- ------------------------------------------------------------
-- EXERCÍCIO 06 - Clientes de Curitiba
-- ------------------------------------------------------------
-- Descrição:
-- Liste somente vendas de clientes da cidade de Curitiba.
--
-- Exiba:
-- nome_cliente, cidade, id_venda, data_venda, status,
-- valor_total.
-- ------------------------------------------------------------

SELECT
    c.nome_cliente,
    c.cidade,
    v.id_venda,
    v.data_venda,
    v.status,
    v.valor_total
FROM clientes AS c
INNER JOIN vendas AS v
    ON c.id_cliente = v.id_cliente
WHERE c.cidade = 'Curitiba'
ORDER BY v.id_venda;


-- ------------------------------------------------------------
-- EXERCÍCIO 07 - Produtos de Informática vendidos
-- ------------------------------------------------------------
-- Descrição:
-- Liste apenas produtos da categoria 'Informática' que foram
-- vendidos.
--
-- Exiba:
-- nome_produto, categoria, id_venda, data_venda e quantidade.
-- ------------------------------------------------------------

SELECT
    p.nome_produto,
    p.categoria,
    v.id_venda,
    v.data_venda,
    iv.quantidade
FROM produtos AS p
INNER JOIN itens_venda AS iv
    ON p.id_produto = iv.id_produto
INNER JOIN vendas AS v
    ON iv.id_venda = v.id_venda
WHERE p.categoria = 'Informática'
ORDER BY v.id_venda;


-- ------------------------------------------------------------
-- EXERCÍCIO 08 - Vendas pagas via Pix
-- ------------------------------------------------------------
-- Descrição:
-- Liste somente vendas cuja forma de pagamento seja 'Pix'.
--
-- Exiba:
-- id_venda, data_venda, nome_cliente, nome_vendedor,
-- valor_total.
-- ------------------------------------------------------------

SELECT
    v.id_venda,
    v.data_venda,
    c.nome_cliente,
    ve.nome_vendedor,
    v.valor_total
FROM vendas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN vendedores AS ve
    ON v.id_vendedor = ve.id_vendedor
WHERE v.forma_pagamento = 'Pix'
ORDER BY v.id_venda;


-- ------------------------------------------------------------
-- EXERCÍCIO 09 - Subtotal dos itens
-- ------------------------------------------------------------
-- Descrição:
-- Liste itens cuja quantidade seja maior que 2.
--
-- Exiba:
-- id_venda, nome_produto, quantidade, valor_unitario,
-- desconto e subtotal_bruto.
--
-- subtotal_bruto = quantidade * valor_unitario.
-- ------------------------------------------------------------

SELECT
    iv.id_venda,
    p.nome_produto,
    iv.quantidade,
    iv.valor_unitario,
    iv.desconto,
    iv.quantidade * iv.valor_unitario AS subtotal_bruto
FROM itens_venda AS iv
INNER JOIN produtos AS p
    ON iv.id_produto = p.id_produto
WHERE iv.quantidade > 2
ORDER BY iv.id_venda;


-- ------------------------------------------------------------
-- EXERCÍCIO 10 - Total comprado por cliente
-- ------------------------------------------------------------
-- Descrição:
-- Calcule o total comprado por cada cliente que possui vendas.
--
-- Exiba:
-- id_cliente, nome_cliente, quantidade_vendas,
-- total_comprado.
--
-- Requisitos:
-- COUNT, SUM, GROUP BY e ordenação do maior para o menor total.
-- ------------------------------------------------------------

SELECT
    c.id_cliente,
    c.nome_cliente,
    COUNT(v.id_venda) AS quantidade_vendas,
    SUM(v.valor_total) AS total_comprado
FROM clientes AS c
INNER JOIN vendas AS v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nome_cliente
ORDER BY total_comprado DESC;


-- ------------------------------------------------------------
-- EXERCÍCIO 11 - Desempenho dos vendedores
-- ------------------------------------------------------------
-- Descrição:
-- Para cada vendedor que realizou vendas, exiba:
-- id_vendedor, nome_vendedor, quantidade_vendas,
-- total_vendido e ticket_medio.
--
-- Requisitos:
-- COUNT, SUM, AVG e GROUP BY.
-- ------------------------------------------------------------

SELECT
    ve.id_vendedor,
    ve.nome_vendedor,
    COUNT(v.id_venda) AS quantidade_vendas,
    SUM(v.valor_total) AS total_vendido,
    AVG(v.valor_total) AS ticket_medio
FROM vendedores AS ve
INNER JOIN vendas AS v
    ON ve.id_vendedor = v.id_vendedor
GROUP BY
    ve.id_vendedor,
    ve.nome_vendedor
ORDER BY total_vendido DESC;


-- ------------------------------------------------------------
-- EXERCÍCIO 12 - Quantidade vendida por produto
-- ------------------------------------------------------------
-- Descrição:
-- Para cada produto vendido, exiba:
-- id_produto, nome_produto, categoria e
-- quantidade_total_vendida.
--
-- Requisito:
-- SUM e ordenação do produto mais vendido para o menos vendido.
-- ------------------------------------------------------------

SELECT
    p.id_produto,
    p.nome_produto,
    p.categoria,
    SUM(iv.quantidade) AS quantidade_total_vendida
FROM produtos AS p
INNER JOIN itens_venda AS iv
    ON p.id_produto = iv.id_produto
GROUP BY
    p.id_produto,
    p.nome_produto,
    p.categoria
ORDER BY quantidade_total_vendida DESC;


-- ------------------------------------------------------------
-- EXERCÍCIO 13 - Faturamento por categoria
-- ------------------------------------------------------------
-- Descrição:
-- Calcule o faturamento líquido por categoria, considerando:
--
-- quantidade * valor_unitario * (1 - desconto / 100).
--
-- Exiba:
-- categoria, quantidade_total_itens e faturamento_liquido.
--
-- Ordene do maior para o menor faturamento.
-- ------------------------------------------------------------

SELECT
    p.categoria,
    SUM(iv.quantidade) AS quantidade_total_itens,
    SUM(
        iv.quantidade
        * iv.valor_unitario
        * (1 - iv.desconto / 100)
    ) AS faturamento_liquido
FROM produtos AS p
INNER JOIN itens_venda AS iv
    ON p.id_produto = iv.id_produto
GROUP BY p.categoria
ORDER BY faturamento_liquido DESC;


-- ------------------------------------------------------------
-- EXERCÍCIO 14 - Vendas concluídas em um período
-- ------------------------------------------------------------
-- Descrição:
-- Liste as vendas concluídas entre '2026-03-01' e '2026-06-30'.
--
-- Exiba:
-- id_venda, data_venda, nome_cliente, nome_vendedor,
-- forma_pagamento e valor_total.
--
-- Ordene por data_venda e id_venda.
-- ------------------------------------------------------------

SELECT
    v.id_venda,
    v.data_venda,
    c.nome_cliente,
    ve.nome_vendedor,
    v.forma_pagamento,
    v.valor_total
FROM vendas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN vendedores AS ve
    ON v.id_vendedor = ve.id_vendedor
WHERE v.status = 'Concluída'
  AND v.data_venda BETWEEN '2026-03-01' AND '2026-06-30'
ORDER BY
    v.data_venda,
    v.id_venda;


-- ------------------------------------------------------------
-- EXERCÍCIO 15 - Relatório gerencial
-- ------------------------------------------------------------
-- Descrição:
-- Considere somente vendas com status 'Concluída'.
--
-- Para cada vendedor, exiba:
-- nome_vendedor,
-- quantidade_vendas,
-- quantidade_clientes_atendidos,
-- quantidade_produtos_vendidos,
-- faturamento_dos_itens,
-- ticket_medio_das_vendas.
--
-- Requisitos obrigatórios:
-- INNER JOIN, COUNT, COUNT(DISTINCT ...), SUM, AVG,
-- GROUP BY e ORDER BY.
-- ------------------------------------------------------------

SELECT
    ve.nome_vendedor,
    COUNT(DISTINCT v.id_venda) AS quantidade_vendas,
    COUNT(DISTINCT v.id_cliente) AS quantidade_clientes_atendidos,
    SUM(iv.quantidade) AS quantidade_produtos_vendidos,
    SUM(
        iv.quantidade
        * iv.valor_unitario
        * (1 - iv.desconto / 100)
    ) AS faturamento_dos_itens,
    AVG(v.valor_total) AS ticket_medio_das_vendas
FROM vendedores AS ve
INNER JOIN vendas AS v
    ON ve.id_vendedor = v.id_vendedor
INNER JOIN itens_venda AS iv
    ON v.id_venda = iv.id_venda
WHERE v.status = 'Concluída'
GROUP BY
    ve.id_vendedor,
    ve.nome_vendedor
ORDER BY faturamento_dos_itens DESC;
