// Neste caso usando o CREATE uma vez que o banco de dados está totalmente vazio e não serão geradas duplicatas de dados.
// Para evitar possíveis duplicidades caso no banco houvesse dados, ao invés do CREATE usar o MERGE.

// 1º Script para criação completa de nós, relacionamentos e atributos (no caso o rating)

// Usuários
CREATE (u1:User {name:"Paulo"});
CREATE (u2:User {name:"Elaine"});
CREATE (u3:User {name:"Daniel"});

// Filmes   
CREATE (m1:Movie {title:"Inception"});
CREATE (m2:Movie {title:"The Revenant"});
CREATE (m3:Movie {title:"Interstellar"});
CREATE (m4:Movie {title:"The Dark Knight"});
CREATE (m5:Movie {title:"The Matrix"});
CREATE (m6:Movie {title:"Pulp Fiction"});
CREATE (m7:Movie {title:"Gladiator"});
CREATE (m8:Movie {title:"Titanic"});
CREATE (m9:Movie {title:"Avatar"});
CREATE (m10:Movie {title:"Fight Club"});

// Séries
CREATE (s1:Serie {title:"Breaking Bad"});
CREATE (s2:Serie {title:"Stranger Things"});
CREATE (s3:Serie {title:"Game of Thrones"});
CREATE (s4:Serie {title:"Friends"});
CREATE (s5:Serie {title:"The Crown"});
CREATE (s6:Serie {title:"The Office (US)"});
CREATE (s7:Serie {title:"Peaky Blinders"});
CREATE (s8:Serie {title:"The Sopranos"});
CREATE (s9:Serie {title:"House of Cards"});
CREATE (s10:Serie {title:"Narcos"});

// Gêneros
CREATE (g1:Genre {name:"Sci-Fi/Thriller"});
CREATE (g2:Genre {name:"Adventure/Drama"});
CREATE (g3:Genre {name:"Sci-Fi/Drama"});
CREATE (g4:Genre {name:"Action/Crime"});
CREATE (g5:Genre {name:"Sci-Fi"});
CREATE (g6:Genre {name:"Crime/Drama"});
CREATE (g7:Genre {name:"Historical/Action"});
CREATE (g8:Genre {name:"Romance/Drama"});
CREATE (g9:Genre {name:"Sci-Fi/Fantasy"});
CREATE (g10:Genre {name:"Drama/Thriller"});
CREATE (g11:Genre {name:"Drama/Crime"});
CREATE (g12:Genre {name:"Sci-Fi/Horror"});
CREATE (g13:Genre {name:"Fantasy/Drama"});
CREATE (g14:Genre {name:"Comedy"});
CREATE (g15:Genre {name:"Historical/Drama"});
CREATE (g16:Genre {name:"Political/Drama"});

// Pessoas
CREATE (a1:Actor {name:"Leonardo DiCaprio"});
CREATE (d1:Director {name:"Christopher Nolan"});
CREATE (d2:Director {name:"James Cameron"});

// Relacionamentos IN_GENRE para Filmes
MATCH (m:Movie {title:"Inception"}), (g:Genre {name:"Sci-Fi/Thriller"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:"The Revenant"}), (g:Genre {name:"Adventure/Drama"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:"Interstellar"}), (g:Genre {name:"Sci-Fi/Drama"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:"The Dark Knight"}), (g:Genre {name:"Action/Crime"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:"The Matrix"}), (g:Genre {name:"Sci-Fi"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:"Pulp Fiction"}), (g:Genre {name:"Crime/Drama"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:"Gladiator"}), (g:Genre {name:"Historical/Action"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:"Titanic"}), (g:Genre {name:"Romance/Drama"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:"Avatar"}), (g:Genre {name:"Sci-Fi/Fantasy"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:"Fight Club"}), (g:Genre {name:"Drama/Thriller"})
CREATE (m)-[:IN_GENRE]->(g);

// Relacionamentos IN_GENRE para Séries
MATCH (s:Serie {title:"Breaking Bad"}), (g:Genre {name:"Drama/Crime"})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Serie {title:"Stranger Things"}), (g:Genre {name:"Sci-Fi/Horror"})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Serie {title:"Game of Thrones"}), (g:Genre {name:"Fantasy/Drama"})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Serie {title:"Friends"}), (g:Genre {name:"Comedy"})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Serie {title:"The Crown"}), (g:Genre {name:"Historical/Drama"})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Serie {title:"The Office (US)"}), (g:Genre {name:"Comedy"})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Serie {title:"Peaky Blinders"}), (g:Genre {name:"Crime/Drama"})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Serie {title:"The Sopranos"}), (g:Genre {name:"Crime/Drama"})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Serie {title:"House of Cards"}), (g:Genre {name:"Political/Drama"})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Serie {title:"Narcos"}), (g:Genre {name:"Crime/Drama"})
CREATE (s)-[:IN_GENRE]->(g);

// Relacionamentos WATCHED (com ratings)
MATCH (u:User {name:"Paulo"}), (m:Movie {title:"Inception"})
CREATE (u)-[:WATCHED {rating:4.5}]->(m);

MATCH (u:User {name:"Elaine"}), (m:Movie {title:"The Revenant"})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {name:"Daniel"}), (m:Movie {title:"Interstellar"})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {name:"Paulo"}), (m:Movie {title:"The Dark Knight"})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {name:"Elaine"}), (m:Movie {title:"The Matrix"})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {name:"Daniel"}), (m:Movie {title:"Pulp Fiction"})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {name:"Paulo"}), (m:Movie {title:"Gladiator"})
CREATE (u)-[:WATCHED {rating:4.5}]->(m);

MATCH (u:User {name:"Elaine"}), (m:Movie {title:"Titanic"})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {name:"Daniel"}), (m:Movie {title:"Avatar"})
CREATE (u)-[:WATCHED {rating:4.5}]->(m);

MATCH (u:User {name:"Paulo"}), (m:Movie {title:"Fight Club"})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {name:"Elaine"}), (s:Serie {title:"Breaking Bad"})
CREATE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {name:"Daniel"}), (s:Serie {title:"Stranger Things"})
CREATE (u)-[:WATCHED {rating:4}]->(s);

MATCH (u:User {name:"Paulo"}), (s:Serie {title:"Game of Thrones"})
CREATE (u)-[:WATCHED {rating:4}]->(s);

MATCH (u:User {name:"Elaine"}), (s:Serie {title:"Friends"})
CREATE (u)-[:WATCHED {rating:4.5}]->(s);

MATCH (u:User {name:"Daniel"}), (s:Serie {title:"The Crown"})
CREATE (u)-[:WATCHED {rating:4}]->(s);

MATCH (u:User {name:"Paulo"}), (s:Serie {title:"The Office (US)"})
CREATE (u)-[:WATCHED {rating:4.5}]->(s);

MATCH (u:User {name:"Elaine"}), (s:Serie {title:"Peaky Blinders"})
CREATE (u)-[:WATCHED {rating:4.5}]->(s);

MATCH (u:User {name:"Daniel"}), (s:Serie {title:"The Sopranos"})
CREATE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {name:"Paulo"}), (s:Serie {title:"House of Cards"})
CREATE (u)-[:WATCHED {rating:4}]->(s);

MATCH (u:User {name:"Elaine"}), (s:Serie {title:"Narcos"})
CREATE (u)-[:WATCHED {rating:4.5}]->(s);

// Exemplos de ACTED_IN (Leonardo DiCaprio em 3 filmes)
MATCH (a:Actor {name:"Leonardo DiCaprio"}), (m:Movie {title:"Inception"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Leonardo DiCaprio"}), (m:Movie {title:"The Revenant"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Leonardo DiCaprio"}), (m:Movie {title:"Titanic"})
CREATE (a)-[:ACTED_IN]->(m);

// Exemplos de DIRECTED (Christopher Nolan em 3 filmes)
MATCH (d:Director {name:"Christopher Nolan"}), (m:Movie {title:"Inception"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"Christopher Nolan"}), (m:Movie {title:"Interstellar"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"Christopher Nolan"}), (m:Movie {title:"The Dark Knight"})
CREATE (d)-[:DIRECTED]->(m);

// Exemplos de DIRECTED (James Cameron em 2 filmes)
MATCH (d:Director {name:"James Cameron"}), (m:Movie {title:"Titanic"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"James Cameron"}), (m:Movie {title:"Avatar"})
CREATE (d)-[:DIRECTED]->(m);
