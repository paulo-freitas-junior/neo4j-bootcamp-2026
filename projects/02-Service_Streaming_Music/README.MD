# Projeto 02 - Criando um Algoritmo de Recomandações de Músicas com Base em Grafos

## Etapa 1 - Criando um Algoritmo de Recomendação de Músicas

Você foi contratado para desenvolver um sistema de recomendação de Músicas que utiliza grafos para identificar padrões de escuta e seguir novas faixas aos usuários. O sistema deve ser capaz de:

- Representar usuários, músicas, artistas e gêneros como NÓS em um grafo.
- Representar interações (escutar, curtir, seguir) como ARESTAS com propriedades.
- Utilizar consultas Cypher para gerar recomendações personalizadas com base em conexões no grafo.


## Etapa 2 - Esboçando a modelagem do Desafio

A modelagem foi desenvolvida aplicando 4 *Nós* específicos: Usuário, Música, Gêneros, Artista e seus *Relacionamentos* específicos de forma generalizada.

<div align="center">
  <img src="/images/project02/visualisation.png" width="100%" alt="Macro Visão - Modelagem do Projeto">
</div>


## Etapa 3 - Conhecendo bases para conexões no grafo

Solicitei para uma IA Generativa criar um arquivo contendo exemplos de músicas, artistas e gêneros baseando-se na plataforma do Spotfy. Dentro desse contexto solicitei que tivesse informações extras para cada NÓ:

- **Artista**: Nome, Origem, Qtd. seguidores em milhões, data formação da banda.
- **Gêneros**: Nome do tipo de gênero, estilo da música, popularidade na plataforma (porcentagem).
- **Música**: Título da música, duração em segundos, ano de criação, batidas por minuto (BPM).


## Etapa 4 - Populando o o banco de dados com as informações

Neste projeto irei demonstrar **duas maneiras** de popular o banco de dados. 
- Usando o **UNWIND** através da lista de elementos criadas. Como a base de dados para popular é pequena pode-se usar de forma acadêmica.

### Opção 1 - Usando UNWIND
```
/*
Projeto - Service Streaming Music
=================================

Utilizando como opção o UNWIND à partir de uma lista de dados.

Baseando-se que NÃO EXISTA informações no banco de dados, optei por usar o CREATE nesse caso.
*/


// CRIAÇÃO DOS NÓS
// ===============

// 1. Criar nós de Usuários
CREATE CONSTRAINT IF NOT EXISTS FOR (u:Usuario) REQUIRE u.name IS UNIQUE;
CREATE (u1:Usuario {name:"Paulo"}),
       (u2:Usuario {name:"Elaine"}), 
(u1)-[:CONHECE]->(u2),
(u2)-[:CONHECE]->(u1);

// 2. Criar nós de Gênero
WITH [
    {name: "Rock", vibes: "Energetic", popularity_index: 85 },
    {name: "Blues", vibes: "Soulful", popularity_index: 70 },
    {name: "Pop", vibes: "Catchy", popularity_index: 95 },
    {name: "Heavy Metal", vibes: "Powerful", popularity_index: 75 }
] AS generos
UNWIND generos AS generos_musicais
CREATE (g:Generos)
SET g = generos_musicais;

// 3. Criar nós de Artista

CREATE CONSTRAINT IF NOT EXISTS FOR (a:Artista) REQUIRE a.name IS UNIQUE;
WITH [
    {name: "Arctic Monkeys", origin: "UK", followers_mln: 50.2, formed_year: 2002 },
    {name: "Foo Fighters", origin: "USA", followers_mln: 30.5, formed_year: 1994 },
    {name: "Måneskin", origin: "Italy", followers_mln: 25.1, formed_year: 2016 },
    {name: "Radiohead", origin: "UK", followers_mln: 20.8, formed_year: 1985 },
    {name: "Gary Clark Jr.", origin: "USA", followers_mln: 5.2, formed_year: 2001 },
    {name: "Joe Bonamassa", origin: "USA", followers_mln: 3.1, formed_year: 1989 },
    {name: "Kingfish", origin: "USA", followers_mln: 1.5, formed_year: 2015 },
    {name: "Buddy Guy", origin: "USA", followers_mln: 2.8, formed_year: 1953 },
    {name: "Dua Lipa", origin: "UK", followers_mln: 80.4, formed_year: 2014 },
    {name: "Harry Styles", origin: "UK", followers_mln: 75.2, formed_year: 2010 },
    {name: "Olivia Rodrigo", origin: "USA", followers_mln: 40.9, formed_year: 2015 },
    {name: "Taylor Swift", origin: "USA", followers_mln: 110.5, formed_year: 2004 },
    {name: "The Weeknd", origin: "Canada", followers_mln: 105.3, formed_year: 2009 },
    {name: "Metallica", origin: "USA", followers_mln: 45.7, formed_year: 1981 },
    {name: "Iron Maiden", origin: "UK", followers_mln: 15.2, formed_year: 1975 },
    {name: "Gojira", origin: "France", followers_mln: 4.1, formed_year: 1996 },
    {name: "Slipknot", origin: "USA", followers_mln: 18.9, formed_year: 1995 }
] AS artistas
UNWIND artistas AS artista
CREATE (a:Artista)
SET a = artista;

// 4. Criar nós de Música (Track)
WITH [
    {title: "Do I Wanna Know?", duration_sec: 272, release_year: 2013, bpm: 85 },
    {title: "505", duration_sec: 253, release_year: 2007, bpm: 140 },
    {title: "R U Mine?", duration_sec: 200, release_year: 2013, bpm: 97 },
    {title: "Everlong", duration_sec: 250, release_year: 1997, bpm: 158 },
    {title: "The Pretender", duration_sec: 269, release_year: 2007, bpm: 173 },
    {title: "Best of You", duration_sec: 256, release_year: 2005, bpm: 130 },
    {title: "Beggin'", duration_sec: 211, release_year: 2017, bpm: 129 },
    {title: "I WANNA BE YOUR SLAVE", duration_sec: 173, release_year: 2021, bpm: 132 },
    {title: "ZITTI E BUONI", duration_sec: 194, release_year: 2021, bpm: 103 },
    {title: "Creep", duration_sec: 238, release_year: 1992, bpm: 92 },
    {title: "Karma Police", duration_sec: 261, release_year: 1997, bpm: 75 },
    {title: "No Surprises", duration_sec: 228, release_year: 1997, bpm: 76 },
    {title: "Bright Lights", duration_sec: 324, release_year: 2011, bpm: 115 },
    {title: "When My Train Pulls In", duration_sec: 461, release_year: 2012, bpm: 78 },
    {title: "Pearl Cadillac", duration_sec: 305, release_year: 2019, bpm: 65 },
    {title: "Blues Deluxe", duration_sec: 440, release_year: 2003, bpm: 68 },
    {title: "Sloe Gin", duration_sec: 493, release_year: 2007, bpm: 72 },
    {title: "Dust Bowl", duration_sec: 273, release_year: 2011, bpm: 80 },
    {title: "Outside of This Town", duration_sec: 248, release_year: 2019, bpm: 112 },
    {title: "662", duration_sec: 201, release_year: 2021, bpm: 135 },
    {title: "Fresh Out", duration_sec: 228, release_year: 2019, bpm: 95 },
    {title: "Damn Right, I've Got the Blues", duration_sec: 269, release_year: 1991, bpm: 105 },
    {title: "Mustang Sally", duration_sec: 284, release_year: 1991, bpm: 110 },
    {title: "Houdini", duration_sec: 185, release_year: 2023, bpm: 117 },
    {title: "Levitating", duration_sec: 203, release_year: 2020, bpm: 103 },
    {title: "Don't Start Now", duration_sec: 183, release_year: 2019, bpm: 124 },
    {title: "As It Was", duration_sec: 167, release_year: 2022, bpm: 174 },
    {title: "Watermelon Sugar", duration_sec: 174, release_year: 2019, bpm: 95 },
    {title: "Adore You", duration_sec: 207, release_year: 2019, bpm: 99 },
    {title: "Vampire", duration_sec: 219, release_year: 2023, bpm: 138 },
    {title: "Drivers License", duration_sec: 242, release_year: 2021, bpm: 144 },
    {title: "Good 4 U", duration_sec: 178, release_year: 2021, bpm: 167 },
    {title: "Anti-Hero", duration_sec: 200, release_year: 2022, bpm: 97 },
    {title: "Blank Space", duration_sec: 231, release_year: 2014, bpm: 96 },
    {title: "Shake It Off", duration_sec: 219, release_year: 2014, bpm: 160 },
    {title: "Blinding Lights", duration_sec: 200, release_year: 2019, bpm: 171 },
    {title: "Starboy", duration_sec: 230, release_year: 2016, bpm: 186 },
    {title: "Save Your Tears", duration_sec: 215, release_year: 2020, bpm: 118 },
    {title: "72 Seasons", duration_sec: 459, release_year: 2023, bpm: 160 },
    {title: "Enter Sandman", duration_sec: 331, release_year: 1991, bpm: 123 },
    {title: "Master of Puppets", duration_sec: 515, release_year: 1986, bpm: 212 },
    {title: "The Writing on the Wall", duration_sec: 374, release_year: 2021, bpm: 110 },
    {title: "The Trooper", duration_sec: 252, release_year: 1983, bpm: 160 },
    {title: "Aces High", duration_sec: 271, release_year: 1984, bpm: 133 },
    {title: "Amazonia", duration_sec: 300, release_year: 2021, bpm: 120 },
    {title: "Stranded", duration_sec: 269, release_year: 2016, bpm: 110 },
    {title: "Silvera", duration_sec: 213, release_year: 2016, bpm: 135 },
    {title: "Duality", duration_sec: 252, release_year: 2004, bpm: 145 },
    {title: "Psychosocial", duration_sec: 284, release_year: 2008, bpm: 135 },
    {title: "Before I Forget", duration_sec: 278, release_year: 2004, bpm: 127 }
] AS musicas
UNWIND musicas AS musica
CREATE (m:Musica)
SET m = musica;
```
### - Opção 2 - Usando APOC
- Usando p **APOC** para carregar os dados via API de um local na web já dispoível. No caso na pasta `/data/Projeto02`.

```
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
```

### Criando os Relacionamentos

```
/*
Projeto - Service Streaming Music
=================================

Baseando-se que EXISTA informações no banco de dados, optei por usar o MERGE afim de manter
integridade dos dados na base de dados.
*/


// CRIAÇÃO DOS RELACIONAMENTOS
// ===========================

// 1. Relacionar Artistaas às suas Músicas (:PERFORMED)
// ===================================================

// Rock
MATCH (a:Artista {name: 'Arctic Monkeys'})
UNWIND ['Do I Wanna Know?', '505', 'R U Mine?'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'Foo Fighters'})
UNWIND ['Everlong', 'The Pretender', 'Best of You'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'Måneskin'})
UNWIND ["Beggin'",'I WANNA BE YOUR SLAVE', 'ZITTI E BUONI'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'Radiohead'})
UNWIND ['Creep', 'Karma Police', 'No Surprises'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

// Blues
MATCH (a:Artista {name: 'Gary Clark Jr.'})
UNWIND ['Bright Lights', 'When My Train Pulls In', 'Pearl Cadillac'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'Joe Bonamassa'})
UNWIND ['Blues Deluxe', 'Sloe Gin', 'Dust Bowl'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'Kingfish'})
UNWIND ['Outside of This Town', '662','Fresh Out'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'Buddy Guy'})
UNWIND ["Damn Right, I've Got the Blues",'Mustang Sally'] as titulo
MATCH (t:Musica {title:titulo})
MERGE (a)-[:PERFORMED]->(t);

// Pop
MATCH (a:Artista {name: 'Dua Lipa'})
UNWIND ['Houdini', 'Levitating', 'Don\'t Start Now'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'Harry Styles'})
UNWIND ['As It Was', 'Watermelon Sugar', 'Adore You'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'Olivia Rodrigo'})
UNWIND ['Vanpire', 'Drivers License', 'Good 4 U'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'Taylor Swift'})
UNWIND ['Anti-Hero', 'Blank Space', 'Shake It Off'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'The Weeknd'})
UNWIND ['Blinding Lights', 'Starboy', 'Save Your Tears'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

// Heavy Metal
MATCH (a:Artista {name: 'Metallica'})
UNWIND ['72 Seasons', 'Enter Sandman', 'Master of Puppets'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]->(t);

MATCH (a:Artista {name: 'Iron Maiden'})
UNWIND ['The Writing on the Wall', 'The Trooper', 'Aces High'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]-(t);

MATCH (a:Artista {name: 'Gorija'})
UNWIND ['Amazonia', 'Stranded','Silvera'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]-(t);

MATCH (a:Artista {name: 'Slipknot'})
UNWIND ['Duality', 'Psychosocial', 'Before i Forget'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (a)-[:PERFORMED]-(t);


// 2. Relacionar Músicas aos seus Gêneros (:IN_GENERO)
// ==================================================

// Rock
MATCH (g:Generos {name: 'Rock'})
UNWIND ['Do I Wanna Know?', '505',
        'Everlong',
        'The Pretender',
        'Best of You',
        'Beggin\'',
        'I WANNA BE YOUR SLAVE',
        'ZITTI E BUONI',
        'Creep',
        'Karma Police',
        'No Surprises'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (t)-[:IN_GENERO]->(g);

// Blues
MATCH (g:Generos {name: 'Blues'})
UNWIND ['Bright Lights',
        'When My Train Pulls In',
        'Pearl Cadillac',
        'Blues Deluxe',
        'Sloe Gin',
        'Dust Bowl',
        'Ouside of This Town',
        '662',
        'Fresh Out',
        'Damn Right',
        "I´ve Got the Blues",
        'Mustang Sally'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (t)-[:IN_GENERO]->(g);

// Pop
MATCH (g:Generos {name: 'Pop'})
UNWIND ['Houdini',
        'Leviating',
        "Don´t Start Now",
        'As It Was',
        'Watermelon Sugar',
        'Adore You',
        'Vampire',
        'Drivers License',
        'Good 4 U',
        'Anti-Hero',
        'Blank Space',
        'Shake It Off',
        'Blinding Lights',
        'Starboy',
        'Save your Tears'] AS titulo
MATCH (t:Musica {title: titulo})
MERGE (t)-[:IN_GENERO]->(g);

// Heavy Metal
MATCH (g:Generos {name: 'Heavy Metal'})
UNWIND ['72 Seasons',
        'Enter Sandman',
        'Master of Puppets',
        'The Writing on the Wall',
        'The Trooper',
        'Aces High',
        'Amazonia',
        'Stranded',
        'Silvera',
        'Duality',
        'Psychosocial',
        'Before I Forget'] as titulo
MATCH (t:Musica {title: titulo})
MERGE (t)-[:IN_GENERO]->(g);

/*
INTEGRIDADE: O uso do MERGE garante que, se você rodar o script novamente após uma nova importação via APOC, o Neo4j não criará setas duplicadas entre os mesmos nós.
PERFORMANCE: Ao agrupar os títulos em listas (IN [...]), o banco processa a criação de múltiplos relacionamentos em uma única transação, o que é ideal para o ambiente de nuvem do AuraDB.
VISUALIZAÇÃO: Após rodar esses comandos, é possível visualizar a estrutura de grafo completa, onde as músicas servem como pontes entre Artistaas e gêneros.
*/

// Relacionando Usuários que escutaram as Músicas (:LISTENED_TO)
// =============================================================
WITH [
  {user: "Elaine", musica: "Do I Wanna Know?", count: 42},
  {user: "Elaine", musica: "505", count: 23},
  {user: "Elaine", musica: "R U Mine?", count: 12},
  {user: "Paulo", musica: "Everlong", count: 58},
  {user: "Elaine", musica: "The Pretender", count: 24},
  {user: "Paulo", musica: "Best of You", count: 75},
  {user: "Elaine", musica: "Beggin'", count: 42},
  {user: "Elaine", musica: "I WANNA BE YOUR SLAVE", count: 31},
  {user: "Elaine", musica: "ZITTI E BUONI", count: 19},
  {user: "Paulo", musica: "Creep", count: 63},
  {user: "Elaine", musica: "Karma Police", count: 37},
  {user: "Paulo", musica: "No Surprises", count: 48},
  {user: "Elaine", musica: "Bright Lights", count: 15},
  {user: "Paulo", musica: "When My Train Pulls In", count: 82},
  {user: "Elaine", musica: "Pearl Cadillac", count: 27},
  {user: "Paulo", musica: "Blues Deluxe", count: 91},
  {user: "Paulo", musica: "Sloe Gin", count: 54},
  {user: "Paulo", musica: "Dust Bowl", count: 33},
  {user: "Paulo", musica: "Outside of This Town", count: 46},
  {user: "Paulo", musica: "662", count: 67},
  {user: "Elaine", musica: "Fresh Out", count: 28},
  {user: "Elaine", musica: "Damn Right", count: 35},
  {user: "Paulo", musica: "I've Got the Blues", count: 71},
  {user: "Paulo", musica: "Mustang Sally", count: 88},
  {user: "Elaine", musica: "Houdini", count: 53},
  {user: "Elaine", musica: "Levitating", count: 96},
  {user: "Elaine", musica: "Don't Start Now", count: 84},
  {user: "Paulo", musica: "As It Was", count: 61},
  {user: "Paulo", musica: "Watermelon Sugar", count: 45},
  {user: "Elaine", musica: "Adore You", count: 39},
  {user: "Elaine", musica: "Vampire", count: 77},
  {user: "Elaine", musica: "Drivers License", count: 66},
  {user: "Paulo", musica: "Good 4 U", count: 52},
  {user: "Elaine", musica: "Anti-Hero", count: 81},
  {user: "Elaine", musica: "Blank Space", count: 73},
  {user: "Elaine", musica: "Shake It Off", count: 59},
  {user: "Elaine", musica: "Blinding Lights", count: 94},
  {user: "Elaine", musica: "Starboy", count: 68},
  {user: "Elaine", musica: "Save Your Tears", count: 44},
  {user: "Paulo", musica: "72 Seasons", count: 38},
  {user: "Paulo", musica: "Enter Sandman", count: 85},
  {user: "Paulo", musica: "Master of Puppets", count: 97},
  {user: "Elaine", musica: "The Writing on the Wall", count: 21},
  {user: "Elaine", musica: "The Trooper", count: 56},
  {user: "Paulo", musica: "Aces High", count: 74},
  {user: "Paulo", musica: "Amazonia", count: 43},
  {user: "Elaine", musica: "Stranded", count: 29},
  {user: "Elaine", musica: "Silvera", count: 62},
  {user: "Paulo", musica: "Duality", count: 79},
  {user: "Elaine", musica: "Psychosocial", count: 47},
  {user: "Paulo", musica: "Before I Forget", count: 83}
] AS ouvintes
UNWIND ouvintes AS ouvinte
MATCH (u:Usuario {name: ouvinte.user})
MATCH (m:Musica {title: ouvinte.musica})
MERGE (u)-[r:LISTENED_TO]->(m)
SET r.count = ouvinte.count;
```

### Exemplos de querys de consultas (Perguntas de Negócio)

1. Usando recursos de Queries:

- Quais artistas você recomendaria com base nos artistas de rock mais ouvidos?
```
MATCH (u:Usuario)-[lt:LISTENED_TO]->(m:Musica)-[:IN_GENERO]->(g:Generos {name: 'Rock'})
WITH m, count(lt) AS lista_contagem
ORDER BY lista_contagem DESC
LIMIT 10
MATCH (a:Artista)-[:PERFORMED]->(m)
RETURN DISTINCT a.name AS artista_recomendado;
```
- Quais são as bandas de rock existentes?
```
MATCH (g:Generos {name: 'Heavy Metal'})<-[:IN_GENERO]-(m:Musica)<-[:PERFORMED]-(a:Artista)
RETURN DISTINCT a.name AS Bandas_Heavy_Metal;
```

- Quais são as bandas com maior número de seguidores?
```
MATCH (a:Artista)
RETURN a.name, a.followers_mln
ORDER BY a.followers_mln DESC
```

- Quais músicas possuem maior média de BPM?
```
MATCH (m:Musica)
RETURN m.title, m.bpm
ORDER BY m.bpm DESC
```

- Quais nacionalidades possuem mais bandas nessa base de dados?
```
MATCH (a:Artista)
RETURN a.origin AS Nacionalidade, count(a) AS Numero_de_Bandas
ORDER BY Numero_de_Bandas DESC
LIMIT 5;
```

2. Algorítmos de GDS

- *PageRank* 
- Ranqueamento de músicas mais ouvidas

3. Similaridade

- *NodeSimilarity*
- Nós de usuários que possuem similaridades (nós com mesmos nós)
- Artistas que possuem algum tipo de similaridade

4. Comunidades

- *ComunityDetection*
- Comunidades de pessoas que possuem mesmo gosto musical

5. Caminhos

- *ShortestPath*
- Caminhos mais curtos entre pessoas e artistas por similaridades

