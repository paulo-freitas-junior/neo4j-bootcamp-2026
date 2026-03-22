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