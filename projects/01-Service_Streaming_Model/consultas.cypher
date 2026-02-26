// Ver todos os nós criados
MATCH (n) RETURN n LIMIT 50;

// Verificar relacionamentos
MATCH (u:User)-[r:WATCHED]->(m) RETURN u.name, r.rating, m.title;
MATCH (m:Movie)-[r:IN_GENRE]->(g:Genre) RETURN m.title, g.name;
MATCH (a:Actor)-[r:ACTED_IN]->(m) RETURN a.name, m.title;
MATCH (d:Director)-[r:DIRECTED]->(m) RETURN d.name, m.title;