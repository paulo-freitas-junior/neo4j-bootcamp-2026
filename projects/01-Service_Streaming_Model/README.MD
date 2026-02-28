# Projeto01 - Modelagem de Dados em Grafos de um Serviço de Streaming
---

## 1 - Situação Problema
Você foi contratado para um novo serviço de streaming de filmes e séries e sua primeira tarefa é projetar o banco de dados.

Diferente dos sistemas tradicionais, a empresa quer focar nos **relacionamentos** para cirar um sistema de recomendação poderoso.

O objetivo será criar uma visão inicial da modelagem de dados em grafos.

---

## 2 - Desafio
Modelar e criar um pequeno grafo de conhecimento para este serviço.

### O modelo deve incluir:

-   **Entidades(Nós):**
    - User
    - Movie
    - Serie
    - Genre
    - Actor
    - Director

-   **Conexões(Relacionamentos):**
    - WATCHED (com propriedade rating)
    - ACTED_IN
    - DIRECTED
    - IN_GENRE

### Tabela com os dados

| User   | Obra (Movie/Serie)   | Tipo   | Genre             | Actor(s)                               | Director(s)             | WATCHED (rating) |
|--------|-----------------------|--------|-------------------|----------------------------------------|-------------------------|------------------|
| Paulo  | Inception             | Movie  | Sci-Fi/Thriller   | Leonardo DiCaprio, Joseph Gordon-Levitt | Christopher Nolan       | 4.5/5            |
| Elaine | The Revenant          | Movie  | Adventure/Drama   | Leonardo DiCaprio, Tom Hardy            | Alejandro G. Iñárritu   | 5/5              |
| Daniel | Interstellar          | Movie  | Sci-Fi/Drama      | Matthew McConaughey, Anne Hathaway      | Christopher Nolan       | 5/5              |
| Paulo  | The Dark Knight       | Movie  | Action/Crime      | Christian Bale, Heath Ledger            | Christopher Nolan       | 5/5              |
| Elaine | The Matrix            | Movie  | Sci-Fi            | Keanu Reeves, Carrie-Anne Moss          | Lana Wachowski, Lilly Wachowski | 5/5      |
| Daniel | Pulp Fiction          | Movie  | Crime/Drama       | John Travolta, Uma Thurman              | Quentin Tarantino       | 5/5              |
| Paulo  | Gladiator             | Movie  | Historical/Action | Russell Crowe, Joaquin Phoenix          | Ridley Scott            | 4.5/5            |
| Elaine | Titanic               | Movie  | Romance/Drama     | Leonardo DiCaprio, Kate Winslet         | James Cameron           | 5/5              |
| Daniel | Avatar                | Movie  | Sci-Fi/Fantasy    | Sam Worthington, Zoe Saldana            | James Cameron           | 4.5/5            |
| Paulo  | Fight Club            | Movie  | Drama/Thriller    | Brad Pitt, Edward Norton                | David Fincher           | 5/5              |
| Elaine | Breaking Bad          | Serie  | Drama/Crime       | Bryan Cranston, Aaron Paul              | Vince Gilligan          | 5/5              |
| Daniel | Stranger Things       | Serie  | Sci-Fi/Horror     | Millie Bobby Brown, Finn Wolfhard       | The Duffer Brothers     | 4/5              |
| Paulo  | Game of Thrones       | Serie  | Fantasy/Drama     | Emilia Clarke, Kit Harington            | David Benioff, D.B. Weiss | 4/5            |
| Elaine | Friends               | Serie  | Comedy            | Jennifer Aniston, Matthew Perry         | David Crane, Marta Kauffman | 4.5/5         |
| Daniel | The Crown             | Serie  | Historical/Drama  | Claire Foy, Olivia Colman               | Peter Morgan            | 4/5              |
| Paulo  | The Office (US)       | Serie  | Comedy            | Steve Carell, Rainn Wilson              | Greg Daniels            | 4.5/5            |
| Elaine | Peaky Blinders        | Serie  | Crime/Drama       | Cillian Murphy, Helen McCrory           | Steven Knight           | 4.5/5            |
| Daniel | The Sopranos          | Serie  | Crime/Drama       | James Gandolfini, Lorraine Bracco       | David Chase             | 5/5              |
| Paulo  | House of Cards        | Serie  | Political/Drama   | Kevin Spacey, Robin Wright              | Beau Willimon           | 4/5              |
| Elaine | Narcos                | Serie  | Crime/Drama       | Wagner Moura, Pedro Pascal              | Chris Brancato          | 4.5/5            |

**Observações importantes:** 
 - Existem Obras que possuem mais de um Diretor.
 - Existem mais de uma definição de Gênero para cada Filme
 - Existe mais de um Ator para cada Filme.
 - Criar primeiro os Nós e depois os Relacionamentos

---

## 3 - Entrega

### Diagrama da modelagem

#### Arrows.app
<div align="center">
  <img src="/images/project01/project01_model.png" width="100%" alt="Neo4J - Modelagem Arrows App">
</div>

#### Neo4J Bloom
<div align="center">
  <img src="/images/project01/bloom-visualisation.png" width="100%" alt="Neo4J - Neo4J Bloom">
</div>

**Legenda:**
- **Azul Claro:** Users
- **Verde:** Atores/Atrizes
- **Rosa:** Diretores/Diretoras
- **Roxo:** Gênero dos Filmes e Séries
- **Laranja:** Filmes
- **Amarelo:** Séries

### Script em Cypher

```cypher
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

// Atores
CREATE (a1:Actor {name:"Leonardo DiCaprio"});
CREATE (a2:Actor {name:"Joseph Gordon-Levitt"});
CREATE (a3:Actor {name:"Tom Hardy"});
CREATE (a4:Actor {name:"Matthew McConaughey"});
CREATE (a5:Actor {name:"Anne Hathaway"});
CREATE (a6:Actor {name:"Christian Bale"});
CREATE (a7:Actor {name:"Heath Ledger"});
CREATE (a8:Actor {name:"Keanu Reeves"});
CREATE (a9:Actor {name:"Carrie-Anne Moss"});
CREATE (a10:Actor {name:"John Travolta"});
CREATE (a11:Actor {name:"Uma Thurman"});
CREATE (a12:Actor {name:"Russell Crowe"});
CREATE (a13:Actor {name:"Joaquin Phoenix"});
CREATE (a14:Actor {name:"Kate Winslet"});
CREATE (a15:Actor {name:"Sam Worthington"});
CREATE (a16:Actor {name:"Zoe Saldana"});
CREATE (a17:Actor {name:"Brad Pitt"});
CREATE (a18:Actor {name:"Edward Norton"});
CREATE (a19:Actor {name:"Bryan Cranston"});
CREATE (a20:Actor {name:"Aaron Paul"});
CREATE (a21:Actor {name:"Millie Bobby Brown"});
CREATE (a21:Actor {name:"Finn Wolfhard"});
CREATE (a22:Actor {name:"Emilia Clarke"});
CREATE (a23:Actor {name:"Kit Harington"});
CREATE (a24:Actor {name:"Jennifer Aniston"});
CREATE (a25:Actor {name:" Matthew Perry"});
CREATE (a26:Actor {name:"Claire Foy"});
CREATE (a27:Actor {name:"Olivia Colman"});
CREATE (a28:Actor {name:"Steve Carell"});
CREATE (a29:Actor {name:"Rainn Wilson"});
CREATE (a30:Actor {name:"Cillian Murphy"});
CREATE (a31:Actor {name:"Helen McCrory"});
CREATE (a31:Actor {name:"James Gandolfin"});
CREATE (a32:Actor {name:"Lorraine Bracco"});
CREATE (a33:Actor {name:"Kevin Spacey"});
CREATE (a34:Actor {name:"Robin Wright"});
CREATE (a35:Actor {name:"Wagner Moura"});
CREATE (A36:Actor {name:"Pedro Pascal"});

// Diretores
CREATE (d1:Director {name:"Christopher Nolan"});
CREATE (d2:Director {name:"James Cameron"});
CREATE (d3:Director {name:"Alejandro G. Iñárritu"});
CREATE (d4:Director {name:"Lana Wachowsk"});
CREATE (d4:Director {name:"Lilly Wachowski"});
CREATE (d5:Director {name:"Quentin Tarantino"});
CREATE (d6:Director {name:"Ridley Scott"});
CREATE (d7:Director {name:"David Fincher"});
CREATE (d8:Director {name:"Vince Gilligan"});
CREATE (d9:Director {name:"The Duffer Brothers"});
CREATE (d10:Director {name:"David Benioff"});
CREATE (d11:Director {name:"D.B. Weiss"});
CREATE (d12:Director {name:"David Crane"});
CREATE (d13:Director {name:"Marta Kauffman"});
CREATE (d14:Director {name:"Peter Morgan"});
CREATE (d15:Director {name:"Greg Daniels"});
CREATE (d16:Director {name:"Steven Knight"});
CREATE (d17:Director {name:"David Chase"});
CREATE (d18:Director {name:"Beau Willimon"});
CREATE (d19:Director {name:"Chris Brancato"});

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


// Exemplos de ACTED_IN (Atores que atuaram em Filmes)
MATCH (a:Actor {name:"Leonardo DiCaprio"}), (m:Movie {title:"Inception"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Joseph Gordon-Levitt"}), (m:Movie {title:"Inception"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Leonardo DiCaprio"}), (m:Movie {title:"The Revenant"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Tom Hardy"}), (m:Movie {title:"The Revenant"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Matthew McConaughey"}), (m:Movie {title:"Interstellar"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Anne Hathaway"}), (m:Movie {title:"Interstellar"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Christian Bale"}), (m:Movie {title:"The Dark Knight"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Heath Ledger"}), (m:Movie {title:"The Dark Knight"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Keanu Reeves"}), (m:Movie {title:"The Matrix"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Carrie-Anne Moss"}), (m:Movie {title:"The Matrix"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"John Travolta"}), (m:Movie {title:"Pulp Fiction"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Uma Thurman"}), (m:Movie {title:"Pulp Fiction"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Russell Crowe"}), (m:Movie {title:"Gladiator"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Joaquin Phoenix"}), (m:Movie {title:"Gladiator"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Leonardo DiCaprio"}), (m:Movie {title:"Titanic"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Kate Winslet"}), (m:Movie {title:"Titanic"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Sam Worthington"}), (m:Movie {title:"Avatar"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Zoe Saldana"}), (m:Movie {title:"Avatar"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Brad Pitt"}), (m:Movie {title:"Fight Club"})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:"Edward Norton"}), (m:Movie {title:"Fight Club"})
CREATE (a)-[:ACTED_IN]->(m);


// Exemplos de ACTED_IN (Atores que atuaram em Series)
MATCH (a:Actor {name:"Bryan Cranston"}), (s:Serie {title:"Breaking Bad"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Aaron Paul"}), (s:Serie {title:"Breaking Bad"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Millie Bobby Brown"}), (s:Serie {title:"Stranger Things"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Finn Wolfhard"}), (s:Serie {title:"Stranger Things"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Emilia Clarke"}), (s:Serie {title:"Game of Thrones"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Kit Harington"}), (s:Serie {title:"Game of Thrones"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Jennifer Aniston"}), (s:Serie {title:"Friends"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Matthew Perry"}), (s:Serie {title:"Friends"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Claire Foy"}), (s:Serie {title:"The Crown"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Olivia Colman"}), (s:Serie {title:"The Crown"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Steve Carell"}), (s:Serie {title:"The Office (US)"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Rainn Wilson"}), (s:Serie {title:"The Office (US)"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Cillian Murphy"}), (s:Serie {title:"Peaky Blinders"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Helen McCrory"}), (s:Serie {title:"Peaky Blinders"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"James Gandolfini"}), (s:Serie {title:"The Sopranos"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Lorraine Bracco"}), (s:Serie {title:"The Sopranos"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Kevin Spacey"}), (s:Serie {title:"House of Cards"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Robin Wright"}), (s:Serie {title:"House of Cards"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Wagner Moura"}), (s:Serie {title:"Narcos"})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:"Pedro Pascal"}), (s:Serie {title:"Pedro Pascal"})
CREATE (a)-[:ACTED_IN]->(s);


// Exemplos de DIRECTED (Diretos que dirigiram Filmes)
MATCH (d:Director {name:"Christopher Nolan"}), (m:Movie {title:"Inception"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"Alejandro G. Iñárritu"}), (m:Movie {title:"The Revenant"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"Christopher Nolan"}), (m:Movie {title:"Interstellar"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"Christopher Nolan"}), (m:Movie {title:"The Dark Knight"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"Lana Wachowski"}), (m:Movie {title:"The Matrix"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"Lilly Wachowski"}), (m:Movie {title:"The Matrix"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"Quentin Tarantino"}), (m:Movie {title:"Pulp Fiction"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"Ridley Scott"}), (m:Movie {title:"Gladiator"})
CREATE (d)-[:ACTED_IN]->(m);

MATCH (d:Director {name:"James Cameron"}), (m:Movie {title:"Titanic"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"James Cameron"}), (m:Movie {title:"Avatar"})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:"David Fincher"}), (m:Movie {title:"Fight Club"})
CREATE (d)-[:DIRECTED]->(m);


// Exemplos de DIRECTED (Diretos que dirigiram Series)
MATCH (d:Director {name:"Vince Gilligan"}), (s:Serie {title:"Breaking Bad"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"The Duffer Brothers"}), (s:Serie {title:"Stranger Things"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"David Benioff"}), (s:Serie {title:"Game of Thrones"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"D.B. Weiss"}), (s:Serie {title:"Game of Thrones"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"David Crane"}), (s:Serie {title:"Friends"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"Marta Kauffman"}), (s:Serie {title:"Friends"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"Peter Morgan"}), (s:Serie {title:"The Crown"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"Greg Daniels"}), (s:Serie {title:"The Office (US)"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"Steven Knight"}), (s:Serie {title:"Peaky Blinders"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"David Chase"}), (s:Serie {title:"The Sopranos"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"Beau Willimon"}), (s:Serie {title:"House of Cards"})
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:"Chris Brancato"}), (s:Serie {title:"Narcos"})
CREATE (d)-[:DIRECTED]->(s);

```
O arquivo deste script encontra-se na pasta do Projeto

---

## 4 - Arrows.App

Ferramenta da Neo4J para modelagem de dados
https://arrows.app/

---
