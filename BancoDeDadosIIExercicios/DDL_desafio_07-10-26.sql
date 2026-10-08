CREATE DATABASE sql_quest;

USE sql_quest;

CREATE TABLE jogadores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    classe VARCHAR(50) NOT NULL,
    nivel INT NOT NULL,
    moedas INT NOT NULL DEFAULT 0,
    pontos INT NOT NULL,
    guilda VARCHAR(50),
    bonus INT,
    status_jogador VARCHAR(30) NOT NULL,
    classificacao VARCHAR(30)
);

INSERT INTO jogadores
(nome, classe, nivel, moedas, pontos, guilda, bonus, status_jogador)
VALUES
('Arthas', 'Guerreiro', 18, 950, 7200, 'Dragões', 500, 'ATIVO'),

('Luna', 'Maga', 22, 1500, 9800, 'Fênix', NULL, 'ATIVO'),

('Thorim', 'Guerreiro', 15, 450, 5100, 'Dragões', 300, 'ATIVO'),

('Nyx', 'Assassina', 26, 2100, 12500, 'Sombras', NULL, 'ATIVO'),

('Eldrin', 'Mago', 12, 300, 3900, 'Fênix', 200, 'ATIVO'),

('Kael', 'Arqueiro', 20, 1100, 8300, 'Dragões', NULL, 'ATIVO'),

('Morgana', 'Maga', 30, 3200, 16000, 'Sombras', 1000, 'ATIVO'),

('Ragnar', 'Guerreiro', 8, 150, 1800, 'Dragões', NULL, 'INATIVO'),

('Lyra', 'Arqueira', 17, 700, 6500, 'Fênix', 400, 'ATIVO'),

('Draven', 'Assassino', 25, 1800, 11200, 'Sombras', 700, 'ATIVO'),

('Orion', 'Mago', 6, 80, 900, NULL, NULL, 'INATIVO'),

('Freya', 'Guerreira', 21, 1300, 8900, 'Dragões', 600, 'ATIVO');


SELECT * FROM jogadores;

-- 1. REAJUSTAR CLASSIFICAÇÃO DE ACORDO COM A PONTUAÇÃO
UPDATE jogadores
SET classificacao = CASE 
    WHEN pontos >= 12000 THEN 'LENDÁRIO'
    WHEN pontos >= 8000  THEN 'ELITE'
    WHEN pontos >= 5000  THEN 'VETERANO'
    ELSE 'APRENDIZ'
END;

-- 2. REMOVER O NULL DA COLUNA BONUS

UPDATE jogadores
SET bonus = COALESCE(bonus, 0)
WHERE bonus IS NULL;

-- 3. RECOMPENSA DOS JOGADORES ACIMA DA MÉDIA (+250 MOEDAS)

-- Conferência: quem está acima da média atual
SELECT id, nome, pontos, moedas
FROM jogadores
WHERE pontos > (SELECT AVG(pontos) FROM jogadores);

-- O MySQL não permite subconsulta direta na mesma tabela do UPDATE (erro 1093),
-- por isso a média fica dentro de uma tabela derivada
UPDATE jogadores
SET moedas = moedas + 250
WHERE pontos > (
    SELECT media
    FROM (SELECT AVG(pontos) AS media FROM jogadores) AS t
);

-- 4. GUERRA DAS GUILDAS (+300 MOEDAS PARA GUILDAS COM MÉDIA > 7000)

-- Conferência: média por guilda (ignorando quem não tem guilda)
SELECT guilda, AVG(pontos) AS media_pontos
FROM jogadores
WHERE guilda IS NOT NULL
GROUP BY guilda
HAVING AVG(pontos) > 7000;

UPDATE jogadores
SET moedas = moedas + 300
WHERE guilda IN (
    SELECT guilda
    FROM (
        SELECT guilda
        FROM jogadores
        WHERE guilda IS NOT NULL
        GROUP BY guilda
        HAVING AVG(pontos) > 7000
    ) AS guildas_vencedoras
);

-- 5. CONSELHO DOS CAMPEÕES (+1 NÍVEL PARA O TOP 3 EM PONTOS)

-- Conferência: os três maiores pontuadores
SELECT id, nome, nivel, pontos
FROM jogadores
ORDER BY pontos DESC
LIMIT 3;

UPDATE jogadores
SET nivel = nivel + 1
ORDER BY pontos DESC
LIMIT 3;

-- 6. TREINAMENTO EMERGENCIAL (+2 NÍVEIS PARA ATIVOS COM NÍVEL < 18)

-- Conferência: quem será afetado (usando o estado atual do banco)
SELECT id, nome, nivel, status_jogador
FROM jogadores
WHERE status_jogador = 'ATIVO'
  AND nivel < 18;

UPDATE jogadores
SET nivel = nivel + 2
WHERE status_jogador = 'ATIVO'
  AND nivel < 18;

-- 7. ESPIÕES DE NULLMASTER (REMOVER INATIVOS COM MENOS DE 2000 PONTOS)

-- Conferência: quem será excluído (mesmos critérios do DELETE)
SELECT id, nome, pontos, status_jogador
FROM jogadores
WHERE status_jogador = 'INATIVO'
  AND pontos < 2000;

DELETE FROM jogadores
WHERE status_jogador = 'INATIVO'
  AND pontos < 2000;

-- 8. AUDITORIA FINAL DO REINO
SELECT id, nome, nivel, moedas, pontos, guilda, bonus, status_jogador, classificacao
FROM jogadores
ORDER BY pontos DESC;

-- 9. VALIDAÇÃO FINAL

-- Deve retornar 10
SELECT COUNT(*) AS total_jogadores FROM jogadores;

-- Deve retornar 0
SELECT COUNT(*) AS bonus_nulos FROM jogadores WHERE bonus IS NULL;

-- Deve retornar apenas Morgana e Nyx
SELECT nome FROM jogadores WHERE classificacao = 'LENDÁRIO';

-- Deve retornar 0 (Ragnar e Orion removidos)
SELECT COUNT(*) AS espioes_restantes FROM jogadores WHERE nome IN ('Ragnar', 'Orion');

