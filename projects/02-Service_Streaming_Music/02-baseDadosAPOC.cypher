/*
Projeto - Service Streaming Music
=================================

Utilizando como opção o APOC à partir de um arquivo .json (API).

Baseando-se que EXISTA informações no banco de dados, optei por usar o MERGE afim de manter
integridade dos dados na base de dados.
*/


// CRIAÇÃO DOS NÓS
// ===============

// Carrega o JSON de uma URL ou caminho local
CALL apoc.load.json("https://github.com/paulo-freitas-junior/neo4j-bootcamp-2026/blob/main/data/Projeto02/data.json") YIELD value
UNWIND value.nodes AS nodeGroup

// Processamento dos Usuários
WITH nodeGroup WHERE nodeGroup.type = "User"
UNWIND nodeGroup.items AS item
MERGE (u:Usuario {name: item.name})
SET u += item

// Processamento de Gêneros
WITH nodeGroup WHERE nodeGroup.type = "Genre"
UNWIND nodeGroup.items AS item
MERGE (g:Genero {name: item.name})
SET g += item

// Processamento de Artistas
WITH nodeGroup WHERE nodeGroup.type = "Artist"
UNWIND nodeGroup.items AS item
MERGE (a:Artista {name: item.name})
SET a += item

// Processamento de Músicas (Tracks)
WITH nodeGroup WHERE nodeGroup.type = "Track"
UNWIND nodeGroup.items AS item
MERGE (t:Musica {title: item.title})
SET t += item


/*
O MERGE funciona como um "upsert". 
Ele verifica se o nó já existe (baseado no nome/título) antes de criar, evitando duplicatas caso rode o script mais vezes.

Operador +=: Este operador do Cypher é muito útil com APOC. 
Ele pega todas as chaves do objeto JSON (como vibes, origin, bpm) e as transforma automaticamente em propriedades do nó no Neo4j.

Filtragem por type: O uso do WITH nodeGroup WHERE... permite que um único script trate diferentes categorias de dados presentes no mesmo arquivo .json.
*/

