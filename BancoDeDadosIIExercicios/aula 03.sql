-- ============================================================
-- EXERCÍCIOS DE FIXAÇÃO - LEFT JOIN
-- ============================================================
--
-- Regras:
-- 1. Utilize explicitamente LEFT JOIN em todas as questões.
-- 2. Utilize aliases para as tabelas.
-- 3. Não utilize SELECT *.
-- 4. Organize e indente seu código.
-- 5. Escreva sua solução abaixo de cada exercício.
--
-- Objetivo:
-- Compreender a diferença entre INNER JOIN e LEFT JOIN,
-- identificando registros que possuem ou não relacionamento.
-- ============================================================


-- ------------------------------------------------------------
-- EXERCÍCIO 01 - Todos os clientes
-- ------------------------------------------------------------
-- Liste TODOS os clientes, mesmo aqueles que nunca realizaram
-- uma venda.
--
-- Exiba:
-- id_cliente
-- nome_cliente
-- cidade
-- id_venda
-- data_venda
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 02 - Clientes sem compras
-- ------------------------------------------------------------
-- Liste apenas os clientes que nunca realizaram uma venda.
--
-- Exiba:
-- id_cliente
-- nome_cliente
-- cidade
--
-- Dica:
-- Utilize LEFT JOIN e verifique os registros nulos.
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 03 - Todos os vendedores
-- ------------------------------------------------------------
-- Liste TODOS os vendedores,
-- inclusive aqueles que ainda não realizaram vendas.
--
-- Exiba:
-- id_vendedor
-- nome_vendedor
-- setor
-- id_venda
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 04 - Vendedores sem vendas
-- ------------------------------------------------------------
-- Liste somente os vendedores
-- que ainda não venderam nenhum produto.
--
-- Exiba:
-- id_vendedor
-- nome_vendedor
-- setor
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 05 - Todos os produtos
-- ------------------------------------------------------------
-- Liste TODOS os produtos cadastrados,
-- inclusive aqueles que nunca foram vendidos.
--
-- Exiba:
-- id_produto
-- nome_produto
-- categoria
-- quantidade
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 06 - Produtos nunca vendidos
-- ------------------------------------------------------------
-- Liste apenas os produtos
-- que nunca apareceram em uma venda.
--
-- Exiba:
-- id_produto
-- nome_produto
-- categoria
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 07 - Quantidade de vendas por cliente
-- ------------------------------------------------------------
-- Exiba TODOS os clientes,
-- informando a quantidade de vendas realizada por cada um.
--
-- Clientes sem compras devem aparecer com quantidade zero.
--
-- Exiba:
-- id_cliente
-- nome_cliente
-- quantidade_vendas
--
-- Utilize COUNT, GROUP BY e LEFT JOIN.
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 08 - Valor total comprado por cliente
-- ------------------------------------------------------------
-- Liste TODOS os clientes.
--
-- Exiba:
-- id_cliente
-- nome_cliente
-- total_comprado
--
-- Clientes sem compras devem aparecer
-- com total igual a zero.
--
-- Utilize SUM e COALESCE.
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 09 - Quantidade vendida por produto
-- ------------------------------------------------------------
-- Liste TODOS os produtos cadastrados.
--
-- Exiba:
-- id_produto
-- nome_produto
-- quantidade_total_vendida
--
-- Produtos nunca vendidos devem aparecer
-- com quantidade igual a zero.
--
-- Utilize SUM e COALESCE.
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 10 - Produtos sem movimentação
-- ------------------------------------------------------------
-- Liste apenas os produtos
-- que nunca foram vendidos.
--
-- Exiba:
-- id_produto
-- nome_produto
-- categoria
-- preco
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 11 - Relatório completo de clientes
-- ------------------------------------------------------------
-- Liste TODOS os clientes.
--
-- Exiba:
-- nome_cliente
-- cidade
-- quantidade_vendas
-- total_comprado
--
-- Clientes sem compras devem aparecer normalmente.
--
-- Ordene pelo maior total comprado.
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 12 - Relatório de vendedores
-- ------------------------------------------------------------
-- Para TODOS os vendedores,
-- exiba:
--
-- nome_vendedor
-- quantidade_vendas
-- faturamento_total
--
-- Vendedores sem vendas devem aparecer
-- com valores iguais a zero.
--
-- Utilize COUNT, SUM e COALESCE.
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 13 - Produtos e categorias
-- ------------------------------------------------------------
-- Liste TODOS os produtos,
-- exibindo:
--
-- categoria
-- nome_produto
-- quantidade_vendida
--
-- Mesmo que nunca tenham sido vendidos.
--
-- Ordene por categoria e nome.
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 14 - Clientes e última venda
-- ------------------------------------------------------------
-- Liste TODOS os clientes.
--
-- Exiba:
--
-- nome_cliente
-- data_da_ultima_venda
--
-- Clientes sem compras também devem aparecer.
--
-- Utilize MAX(data_venda).
--
-- ESCREVA SUA CONSULTA ABAIXO:



-- ------------------------------------------------------------
-- EXERCÍCIO 15 - Dashboard Gerencial
-- ------------------------------------------------------------
-- Monte um relatório contendo TODOS os clientes.
--
-- Exiba:
--
-- id_cliente
-- nome_cliente
-- cidade
-- quantidade_vendas
-- valor_total_comprado
-- data_primeira_compra
-- data_ultima_compra
--
-- Clientes que nunca compraram devem aparecer
-- normalmente no relatório.
--
-- Requisitos obrigatórios:
--
-- LEFT JOIN
-- COUNT
-- SUM
-- MIN
-- MAX
-- COALESCE
-- GROUP BY
-- ORDER BY