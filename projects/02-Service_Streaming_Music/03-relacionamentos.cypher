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

MATCH (a:Artista {name: 'Gojira'})
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
        "Damn Right, I´ve Got the Blues",
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