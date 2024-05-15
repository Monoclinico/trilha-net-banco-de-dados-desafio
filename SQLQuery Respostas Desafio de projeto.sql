-- 1. Buscar o nome e ano dos filmes
SELECT Nome,Ano FROM Filmes;

-- 2. Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano, Duracao  FROM Filmes ORDER BY Ano ASC;

-- 3. Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao FROM Filmes WHERE Nome = 'De Volta para o futuro';

-- 4. Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao FROM Filmes WHERE Ano = 1997;

-- 5. Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, Ano, Duracao FROM Filmes WHERE Ano > 2000;

-- 6. Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome, Ano, Duracao FROM Filmes WHERE Duracao > 100 AND Duracao < 150 ORDER BY Duracao ASC;	

-- 7. Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, Quantidade FROM (SELECT Ano, COUNT(Nome) AS Quantidade, SUM(Duracao) AS Duracao2 FROM Filmes GROUP BY Ano) AS TABELA2 ORDER BY Duracao2 DESC

-- 8. Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT Id, PrimeiroNome, UltimoNome, Genero FROM Atores WHERE Genero = 'M'

-- 9. Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT Id, PrimeiroNome, UltimoNome, Genero FROM Atores WHERE Genero = 'F' ORDER BY PrimeiroNome ASC

-- 10. Buscar o nome do filme e o gênero
SELECT Nome, Genero FROM Filmes INNER JOIN (SELECT IdFilme, Genero FROM FilmesGenero INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id) AS QSUB ON Filmes.Id = QSUB.IdFilme

-- 11. Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT Nome, Genero FROM (SELECT Nome, Genero FROM Filmes INNER JOIN (SELECT IdFilme, Genero FROM FilmesGenero INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id) AS QSUB ON Filmes.Id = QSUB.IdFilme) AS QSUB2 WHERE QSUB2.Genero = 'Mistério'

-- 12. Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT Nome, PrimeiroNome, UltimoNome, Papel FROM (SELECT IdFilme,Papel,PrimeiroNome,UltimoNome FROM ElencoFilme INNER JOIN Atores ON ElencoFilme.IdAtor = Atores.Id) AS SUBQ INNER JOIN Filmes ON SUBQ.IdFilme = Filmes.Id




