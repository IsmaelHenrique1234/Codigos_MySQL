# 1. Painel anual de unidade de federação

# 1.1

WITH maior_que_2020 AS (
	SELECT * FROM tb_garantia_safra
    WHERE ano_referencia >= 2020
) SELECT * FROM maior_que_2020;

# 1.2
WITH dinheiro_movimentado AS (
	SELECT sigla_uf, ano_referencia, SUM(valor_parcela) as valor_total, COUNT(*) as qtd_parcelas FROM tb_garantia_safra
    GROUP BY sigla_uf, ano_referencia
)
select * from dinheiro_movimentado;

# 1.3
WITH contarBeneficiarios AS (
	SELECT DISTINCT id_municipio,  COUNT(*) AS beneficiarios_unicos, COUNT(DISTINCT id_municipio) as municipios_atendidos FROM tb_garantia_safra
	GROUP BY id_municipio,sigla_uf, ano_referencia
)
select * from contarBeneficiarios;

# 1.4


#1.6 ATUALIZADO (Com Faixas de Parcelas e Classificação de Ticket)
WITH maior_que_2020 AS (
	SELECT * FROM tb_garantia_safra
    WHERE ano_referencia >= 2020
), 
dinheiro_movimentado AS (
	SELECT sigla_uf, ano_referencia, SUM(valor_parcela) as valor_total, COUNT(*) as qtd_parcelas FROM tb_garantia_safra
    GROUP BY sigla_uf, ano_referencia
),
contarBeneficiarios AS (
	SELECT 
        sigla_uf, 
        ano_referencia, 
        COUNT(*) AS beneficiarios_unicos,
        COUNT(DISTINCT id_municipio) AS municipios_atendidos 
    FROM tb_garantia_safra
	GROUP BY sigla_uf, ano_referencia
),
metricas_valores AS (
    SELECT 
        sigla_uf,
        ano_referencia,
        ROUND(AVG(valor_parcela), 2) AS ticket_medio, -- Adicionado ROUND para limpar a visualização
        MAX(valor_parcela) AS maior_valor_registrado
    FROM tb_garantia_safra
    GROUP BY sigla_uf, ano_referencia
),
-- NOVA CTE: Conta a quantidade de parcelas em cada faixa de valor
faixas_parcelas AS (
    SELECT 
        sigla_uf,
        ano_referencia,
        SUM(CASE WHEN valor_parcela <= 200 THEN 1 ELSE 0 END) AS qtd_baixa,
        SUM(CASE WHEN valor_parcela > 200 AND valor_parcela <= 500 THEN 1 ELSE 0 END) AS qtd_media,
        SUM(CASE WHEN valor_parcela > 500 THEN 1 ELSE 0 END) AS qtd_alta
    FROM tb_garantia_safra
    GROUP BY sigla_uf, ano_referencia
)
SELECT 
    d.ano_referencia,
    d.sigla_uf,
    d.valor_total,
    d.qtd_parcelas,
    c.beneficiarios_unicos,
    c.municipios_atendidos,
    v.ticket_medio,             
    v.maior_valor_registrado,
    f.qtd_baixa,               -- Nova coluna da CTE faixas_parcelas
    f.qtd_media,               -- Nova coluna da CTE faixas_parcelas
    f.qtd_alta,                -- Nova coluna da CTE faixas_parcelas
    -- NOVA COLUNA: Classificação dinâmica baseada no ticket_medio
    CASE 
        WHEN v.ticket_medio <= 200 THEN 'TICKET_BAIXO'
        WHEN v.ticket_medio > 200 AND v.ticket_medio <= 500 THEN 'TICKET_MEDIO'
        ELSE 'TICKET_ALTO'
    END AS classificacao_ticket
FROM maior_que_2020 m 
INNER JOIN dinheiro_movimentado d 
    ON m.sigla_uf = d.sigla_uf 
    AND m.ano_referencia = d.ano_referencia
INNER JOIN contarBeneficiarios c 
    ON d.sigla_uf = c.sigla_uf 
    AND d.ano_referencia = c.ano_referencia
INNER JOIN metricas_valores v
    ON d.sigla_uf = v.sigla_uf 
    AND d.ano_referencia = v.ano_referencia
-- NOVO JOIN: Ligando a CTE de faixas de valores
INNER JOIN faixas_parcelas f
    ON d.sigla_uf = f.sigla_uf 
    AND d.ano_referencia = f.ano_referencia
GROUP BY 
    d.ano_referencia,
    d.sigla_uf,
    d.valor_total,
    d.qtd_parcelas,
    c.beneficiarios_unicos,
    c.municipios_atendidos,
    v.ticket_medio,
    v.maior_valor_registrado,
    f.qtd_baixa,
    f.qtd_media,
    f.qtd_alta
ORDER BY d.ano_referencia, c.municipios_atendidos DESC, v.maior_valor_registrado DESC;

# 2.0 Ranking nacional por UF

WITH cte1_apenas_2020 AS (
    SELECT * FROM tb_garantia_safra
    WHERE ano_referencia = 2020
), 

cte2_total_recebido AS (
    SELECT 
        sigla_uf, 
        SUM(valor_parcela) AS valor_total, 
        COUNT(*) AS qtd_parcelas 
    FROM cte1_apenas_2020
    GROUP BY sigla_uf
),

cte3_beneficiarios AS (
    SELECT 
        sigla_uf, 
        COUNT(*) AS beneficiarios_unicos -- Como removemos o id_beneficiario, conta-se o total de registos da UF
    FROM cte1_apenas_2020
    GROUP BY sigla_uf
),

cte4_municipios AS (
    SELECT 
        sigla_uf, 
        COUNT(DISTINCT id_municipio) AS municipios_atendidos 
    FROM cte1_apenas_2020
    GROUP BY sigla_uf
),

cte5_participacao_brasil AS (
    SELECT 
        t.sigla_uf,
        t.valor_total,
        (SELECT SUM(valor_total) FROM cte2_total_recebido) AS total_brasil,
        ROUND((t.valor_total / (SELECT SUM(valor_total) FROM cte2_total_recebido)) * 100, 2) AS percentual_no_brasil
    FROM cte2_total_recebido t
),

cte6_classificar_faixas AS (
    SELECT 
        sigla_uf,
        CASE 
            WHEN valor_total >= 20000 THEN 'ALTO'
            WHEN valor_total >= 10000 AND valor_total < 20000 THEN 'MEDIO'
            ELSE 'BAIXO'
        END AS faixa_valor
    FROM cte2_total_recebido
),

cte7_top5_ufs AS (
    SELECT sigla_uf, valor_total
    FROM cte2_total_recebido
    ORDER BY valor_total DESC
    LIMIT 5
)

-- SELECT FINAL: Une todas as 7 CTEs com JOINs e faz a classificação de destaque
SELECT 
    t.sigla_uf AS UF,
    t.valor_total,
    t.qtd_parcelas AS parcelas,
    b.beneficiarios_unicos AS beneficiarios,
    m.municipios_atendidos AS municipios,
    p.percentual_no_brasil,
    f.faixa_valor,
    -- Grupo de Destaque: Se for o maior do Brasil é LIDER_BR, se estiver na CTE7 é TOP_5
    CASE 
        WHEN t.valor_total = (SELECT MAX(valor_total) FROM cte2_total_recebido) THEN 'LIDER_BR'
        WHEN t.sigla_uf IN (SELECT sigla_uf FROM cte7_top5_ufs) THEN 'TOP_5'
        ELSE 'GERAL'
    END AS grupo_destaque
FROM cte2_total_recebido t
INNER JOIN cte3_beneficiarios b ON t.sigla_uf = b.sigla_uf
INNER JOIN cte4_municipios m   ON t.sigla_uf = m.sigla_uf
INNER JOIN cte5_participacao_brasil p ON t.sigla_uf = p.sigla_uf
INNER JOIN cte6_classificar_faixas f  ON t.sigla_uf = f.sigla_uf
ORDER BY t.valor_total DESC
LIMIT 5;






