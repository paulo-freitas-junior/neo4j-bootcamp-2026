/*
Projeto // Service Streaming Music
=================================

Queries de consultas ao banco de dados
*/

// Quais artistas você recomendaria com base nos artistas de rock mais ouvidos?
MATCH (u:Usuario)-[lt:LISTENED_TO]->(m:Musica)-[:IN_GENERO]->(g:Generos {name: 'Rock'})
WITH m, count(lt) AS lista_contagem
ORDER BY lista_contagem DESC
LIMIT 10
MATCH (a:Artista)-[:PERFORMED]->(m)
RETURN DISTINCT a.name AS artista_recomendado;

// Quais são as bandas de Heavy Metal existentes?
MATCH (g:Generos {name: 'Heavy Metal'})<-[:IN_GENERO]-(m:Musica)<-[:PERFORMED]-(a:Artista)
RETURN DISTINCT a.name AS Bandas_Heavy_Metal;

// Quais são as bandas com maior número de seguidores?
MATCH (a:Artista)
RETURN a.name, a.followers_mln
ORDER BY a.followers_mln DESC;

// Quais músicas possuem maior média de BPM?
MATCH (m:Musica)
RETURN m.title, m.bpm
ORDER BY m.bpm DESC;

// Quais nacionalidades possuem mais bandas nessa base de dados?
MATCH (a:Artista)
RETURN a.origin AS Nacionalidade, count(a) AS Numero_de_Bandas
ORDER BY Numero_de_Bandas DESC
LIMIT 5;