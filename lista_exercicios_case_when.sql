CREATE DATABASE db_biblioteca;

USE db_biblioteca;


CREATE TABLE tb_livros(
    id INT PRIMARY KEY,              -- Identificador único do livro
    titulo VARCHAR(100) NOT NULL,    -- Título do livro
    autor VARCHAR(100) NOT NULL,     -- Autor do livro
	ano_publicacao INT,              -- Ano de publicação do livro
    disponivel BOOLEAN DEFAULT TRUE  -- Indica se o livro está disponível para empréstimo
    );


-- Insert dos dados da tb_livros
INSERT INTO tb_livros (id, titulo, autor, ano_publicacao, disponivel) 
VALUES
    (1, 'Dom Casmurro', 'Machado de Assis', 1899, TRUE),
    (2, 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881, TRUE),
    (3, 'O Cortiço', 'Aluísio Azevedo', 1890, FALSE),
    (4, 'Iracema', 'José de Alencar', 1865, TRUE),
    (5, 'Grande Sertão: Veredas', 'João Guimarães Rosa', 1956, TRUE),
    (6, 'Vidas Secas', 'Graciliano Ramos', 1938, FALSE),
    (7, 'Capitães da Areia', 'Jorge Amado', 1937, TRUE),
    (8, 'O Guarani', 'José de Alencar', 1857, FALSE),
    (9, 'A Hora da Estrela', 'Clarice Lispector', 1977, TRUE),
    (10, 'O Primo Basílio', 'Eça de Queirós', 1878, TRUE),
    (11, 'Os Maias', 'Eça de Queirós', 1888, FALSE),
    (12, 'Cem Anos de Solidão', 'Gabriel García Márquez', 1967, TRUE),
    (13, 'O Amor nos Tempos do Cólera', 'Gabriel García Márquez', 1985, FALSE),
    (14, '1984', 'George Orwell', 1949, TRUE),
    (15, 'A Revolução dos Bichos', 'George Orwell', 1945, TRUE),
    (16, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, FALSE),
    (17, 'O Hobbit', 'J.R.R. Tolkien', 1937, TRUE),
    (18, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, FALSE),
    (19, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, TRUE),
    (20, 'Harry Potter e o Prisioneiro de Azkaban', 'J.K. Rowling', 1999, FALSE),
    (21, 'Dom Quixote', 'Miguel de Cervantes', 1605, TRUE),
    (22, 'A Divina Comédia', 'Dante Alighieri', 1320, FALSE),
    (23, 'Ilíada', 'Homero', -750, TRUE),
    (24, 'Odisséia', 'Homero', -725, TRUE),
    (25, 'Orgulho e Preconceito', 'Jane Austen', 1813, FALSE),
    (26, 'Frankenstein', 'Mary Shelley', 1818, TRUE),
    (27, 'Drácula', 'Bram Stoker', 1897, FALSE),
    (28, 'O Nome da Rosa', 'Umberto Eco', 1980, TRUE),
    (29, 'As Crônicas de Nárnia', 'C.S. Lewis', 1950, FALSE),
    (30, 'O Código Da Vinci', 'Dan Brown', 2003, TRUE),
    (31, 'A Menina que Roubava Livros', 'Markus Zusak', 2005, FALSE),
    (32, 'A Sombra do Vento', 'Carlos Ruiz Zafón', 2001, TRUE),
    (33, 'O Caçador de Pipas', 'Khaled Hosseini', 2003, TRUE),
    (34, 'A Cidade e as Serras', 'Eça de Queirós', 1901, FALSE),
    (35, 'Ensaio sobre a Cegueira', 'José Saramago', 1995, TRUE),
    (36, 'O Processo', 'Franz Kafka', 1925, FALSE),
    (37, 'A Metamorfose', 'Franz Kafka', 1915, TRUE),
    (38, 'Os Miseráveis', 'Victor Hugo', 1862, FALSE),
    (39, 'O Corcunda de Notre-Dame', 'Victor Hugo', 1831, TRUE),
    (40, 'A Arte da Guerra', 'Sun Tzu', -500, FALSE),
    (41, 'O Príncipe', 'Maquiavel', 1532, TRUE),
    (42, 'Os Três Mosqueteiros', 'Alexandre Dumas', 1844, TRUE),
    (43, 'Vinte Mil Léguas Submarinas', 'Júlio Verne', 1870, FALSE),
    (44, 'A Volta ao Mundo em 80 Dias', 'Júlio Verne', 1873, TRUE),
    (45, 'Admirável Mundo Novo', 'Aldous Huxley', 1932, FALSE),
    (46, 'Os Irmãos Karamázov', 'Fiódor Dostoiévski', 1880, TRUE),
    (47, 'Crime e Castigo', 'Fiódor Dostoiévski', 1866, FALSE),
    (48, 'Guerra e Paz', 'Liev Tolstói', 1869, TRUE),
    (49, 'Anna Kariênina', 'Liev Tolstói', 1877, FALSE),
    (50, 'O Estrangeiro', 'Albert Camus', 1942, TRUE),
    (51, 'O Velho e o Mar', 'Ernest Hemingway', 1952, FALSE),
    (52, 'O Sol é para Todos', 'Harper Lee', 1960, TRUE),
    (53, 'O Apanhador no Campo de Centeio', 'J.D. Salinger', 1951, FALSE),
    (54, 'Neuromancer', 'William Gibson', 1984, TRUE),
    (55, 'Duna', 'Frank Herbert', 1965, FALSE),
    (56, 'Fahrenheit 451', 'Ray Bradbury', 1953, TRUE),
    (57, 'O Silmarillion', 'J.R.R. Tolkien', 1977, FALSE),
    (58, 'O Homem Invisível', 'H.G. Wells', 1897, TRUE),
    (59, 'O Médico e o Monstro', 'Robert Louis Stevenson', 1886, FALSE),
    (60, 'Moby Dick', 'Herman Melville', 1851, TRUE),
    (61, 'Inferno', 'Dan Brown', 2013, FALSE),
    (62, 'O Chamado de Cthulhu', 'H.P. Lovecraft', 1928, TRUE),
    (63, 'O Poderoso Chefão', 'Mario Puzo', 1969, FALSE),
    (64, 'A Ilha do Tesouro', 'Robert Louis Stevenson', 1883, TRUE),
    (65, 'Os Contos de Canterbury', 'Geoffrey Chaucer', 1400, FALSE),
    (66, 'A Máquina do Tempo', 'H.G. Wells', 1895, TRUE),
    (67, 'As Vinhas da Ira', 'John Steinbeck', 1939, FALSE),
    (68, 'O Peregrino', 'John Bunyan', 1678, TRUE),
    (69, 'A Insustentável Leveza do Ser', 'Milan Kundera', 1980, TRUE),
    (70, 'O Livro do Desassossego', 'Fernando Pessoa', 1980, FALSE),
    (71, 'O Cortiço', 'Aluísio Azevedo', 1890, FALSE),
    (72, 'O Nome da Rosa', 'Umberto Eco', 1978, TRUE),
    (73, 'Eu, Robô', 'Isaac Asimov', 1978, TRUE);

 
/*=-=-=-=-=-=-=-=-=-=-=-=-==-=-==-=-=-=-=-=-LISTA DE EXERCICIOS -==-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-=-=-=
01. A equipe de curadoria quer organizar melhor o catálogo por períodos históricos.
Crie uma consulta que classifique os livros como "Clássico" (publicados antes de 1980), "Moderno" (entre 1980 e 2000) ou "Contemporâneo" (após 2000), mostrando título, autor e classificação.

02. O time operacional precisa de uma visão clara da disponibilidade dos livros para exibição no sistema.
Mostre todos os livros com uma coluna adicional chamada "Status" que exibe "Disponível" quando disponivel = TRUE e "Indisponível" quando FALSE.

03. A área financeira deseja simular estratégias de precificação baseadas na “percepção de valor” dos livros.
Crie uma consulta que atribua uma categoria de preço fictícia baseada no ano: "Premium" para livros antes de 1950, "Standard" para 1950-2000 e "Econômico" para após 2000.

04. A equipe editorial quer identificar autores mais relevantes no catálogo.
Liste os autores que têm mais de 2 livros cadastrados no sistema.

05. Pensando em campanhas de marketing, a empresa quer focar nos principais nomes.
Liste os TOP 3 autores que têm mais livros cadastrados no sistema.

06. O time de planejamento quer entender concentração de publicações por ano.
Mostre os anos de publicação que têm mais de 2 livros disponíveis.

07. A diretoria quer identificar autores com forte histórico de produção clássica.
Encontre autores cuja soma total de livros publicados antes de 2000 seja maior que 2.

08. A equipe de análise de dados está investigando anos com baixa produção editorial.
Liste os anos que têm exatamente 1 livro cadastrado no sistema.

09. Para relatórios executivos, é necessário visualizar a evolução temporal do catálogo.
Liste todos os livros ordenados por ano de publicação de forma decrescente.

10. Para melhorar a navegação do usuário, o sistema precisa exibir livros disponíveis de forma organizada.
Mostre os livros disponíveis ordenados pelo título em ordem alfabética.

11. A área estratégica deseja um ranking completo de autores.
Ordene os autores pelo número de livros que escreveram (do que tem mais para o que tem menos).

12. A equipe de produto quer priorizar livros disponíveis e mais recentes no sistema.
Liste os livros combinando ordenação: primeiro por disponibilidade (disponíveis primeiro) e depois por ano (mais recentes primeiro).

13. O time de inteligência quer identificar livros acima do padrão geral da base.
Encontre os livros cujo ano de publicação é maior que a média de todos os livros.

14. A biblioteca quer entender gargalos de disponibilidade.
Liste os autores que não têm nenhum livro disponível no momento.

15. A equipe de curadoria deseja destacar obras mais antigas de cada autor.
Mostre o livro mais antigo de cada autor (usando subquery).

16. A área de governança de dados identificou possíveis inconsistências no cadastro.
Encontre os livros que têm o mesmo título que outros livros no sistema (possíveis duplicatas).

17. O time de marketing quer classificar autores para campanhas.
Use CASE WHEN com subquery para marcar os livros como "Popular" se o autor tem mais de 2 livros no sistema ou "Raro" caso contrário.

18. A diretoria quer visualizar concentração de produção por ano.
Combine HAVING e ORDER BY para listar os anos com mais de 1 livro, ordenados pela quantidade de livros em ordem decrescente.

19. A equipe de análise avançada quer comparar desempenho de autores com a média global.
Crie uma consulta que use subquery no HAVING para encontrar autores cuja média de ano de publicação seja maior que a média geral de todos os livros.

20. O time de UX quer definir uma ordenação estratégica para exibição dos livros no sistema.
Utilize CASE WHEN com ORDER BY para listar primeiro os clássicos (antes de 1980), depois modernos (1980-2000) e por fim contemporâneos (após 2000), mantendo a ordenação alfabética por título dentro de cada grupo.                                    
-==-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-=-=--=-=-=-=-==-=-==-=-=-==-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-==-=-=-*/



# DESAFIO 1
SELECT titulo,
	CASE
		WHEN ano_publicacao < 1980 THEN "Clássico"
        WHEN ano_publicacao >= 1980 AND ano_publicacao <= 2000 THEN "Moderno"
        ELSE "Comtemporâneo"
    END AS "Classificação"
FROM tb_livros;

# DESAFIO 2
SELECT titulo,
	CASE disponivel
		WHEN TRUE THEN "disponível"
        ELSE "indisponível"
    END AS "Status"
FROM tb_livros;

# DESAFIO 3
SELECT titulo, ano_publicacao,
	CASE
		WHEN ano_publicacao < 1950 THEN "Premium"
        WHEN ano_publicacao >= 1950 AND ano_publicacao <= 2000 THEN "Standard"
        ELSE "Econômico"
    END AS "Categoria"
FROM tb_livros;

# DESAFIO 4
SELECT autor, COUNT(*) AS Totais_Livros
FROM tb_livros
GROUP BY autor
HAVING Totais_Livros > 2;

# DESAFIO 5
SELECT autor, COUNT(*) AS TOP_3
FROM tb_livros
GROUP BY autor
ORDER BY TOP_3 DESC
LIMIT 3;


# DESAFIO 6
SELECT ano_publicacao, COUNT(*) AS Maior_Publicacao
FROM tb_livros
GROUP BY ano_publicacao
ORDER BY Maior_Publicacao DESC;

# DESAFIO 7
SELECT autor, COUNT(titulo) AS SOMA_TOTAL
FROM tb_livros
WHERE ano_publicacao < 2000
GROUP BY autor
HAVING SOMA_TOTAL > 2; 

# DESAFIO 8
SELECT ano_publicacao, COUNT(titulo) AS Unica_Publicacao
FROM tb_livros
GROUP BY ano_publicacao
HAVING Unica_Publicacao = 1
ORDER BY ano_publicacao DESC;

# DESAFIO 9
SELECT titulo, ano_publicacao
FROM tb_livros
GROUP BY titulo, ano_publicacao
ORDER BY ano_publicacao DESC;

# DESAFIO 10
SELECT titulo, disponivel
FROM tb_livros
WHERE disponivel = TRUE
ORDER BY titulo;

# DESAFIO 11
SELECT autor, count(*) AS TOTAL_LIVROS
FROM tb_livros
GROUP BY autor
ORDER BY TOTAL_LIVROS DESC;

# DESAFIO 12
SELECT titulo, ano_publicacao,
	CASE
		WHEN disponivel = 1 THEN "Sim"
	END AS Disponivel
FROM tb_livros
WHERE disponivel = TRUE
ORDER BY ano_publicacao DESC;


# DESAFIO 13
SELECT titulo, ano_publicacao AS Acima_Media
FROM tb_livros
WHERE ano_publicacao > (
	SELECT AVG(ano_publicacao)
    FROM tb_livros
)
ORDER BY Acima_Media DESC;

# DESAFIO 14
SELECT autor,
CASE disponivel
	WHEN FALSE THEN "Não"
END AS "Livro Disponivel?"
FROM tb_livros
WHERE disponivel = FALSE;

# DESAFIO 15
SELECT autor, titulo AS "Livro Mais Antigo", ano_publicacao
FROM tb_livros t1 -- primeiro apelido dessa query
WHERE ano_publicacao = (
	SELECT MIN(ano_publicacao)
	FROM tb_livros t2 -- segundo apelido dessa subquery
	WHERE t2.autor = t1.autor);

# DESAFIO 16
SELECT id, autor, titulo
FROM tb_livros t1 -- apelido 1 
WHERE titulo = (
	SELECT titulo 
	FROM tb_livros t2 -- apelido 2
	WHERE t2.titulo = t1.titulo
	AND t2.id != t1.id
);

# DESAFIO 17
SELECT DISTINCT l.autor,
CASE 
	WHEN (
		SELECT COUNT(*) AS total
		FROM tb_livros l2
		WHERE l2.autor = l.autor
        ) > 2 THEN "Popular"
    ELSE "Raro"
END AS "Classificação"
FROM tb_livros l
ORDER BY Classificação ASC;

# DESAFIO 18
