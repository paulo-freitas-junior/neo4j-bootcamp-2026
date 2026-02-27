// Ver todos os nós criados
MATCH (n) 
RETURN n 
LIMIT 50;


// Verificar relacionamentos

// Quais os filmes que os usuários assistiram?
MATCH (u:User)-[r:WATCHED]->(m:Movie)
RETURN u.name, r.rating, m.title;

// Qual o gênero de cada filme?
MATCH (m:Movie)-[r:IN_GENRE]->(g:Genre)
RETURN m.title, g.name;

// Em que filme cada ator atuou?
MATCH (a:Actor)-[r:ACTED_IN]->(m:Movie)
RETURN a.name, m.title;

// Em que filme cada diretor digiriu?
MATCH (d:Director)-[r:DIRECTED]->(m:Movie)
RETURN d.name, m.title;

