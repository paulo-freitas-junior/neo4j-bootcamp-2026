/*
WHERE - Permite filtrar os dados e resumir informações mais complexas

- Operadores de comparação: '=','<>','<','>','<=','>='
- Operadores lógicos: AND, OR, XOR, NOT
- Filtros de String: 'STARTS WITH', 'ENDS WITH', 'CONTAINS'
- Listas: IN
- Existência de propriedades: 'IS NULL', 'IS NOT NULL'
- Criando uma Lista de dados: COLLECT ()
*/

// Exemplo 1
// Localizar uma pessoa que tenha idade acima dos 18 anos e nome começa com letra 'P'
MATCH (p:Pessoa) 
    WHERE p.idade >=18 
    AND p.nome STARTS WITH "A"
RETURN p;

// Exemplo 2
// Localize os filmes que foram dirigidos pelo diretor 'James Cameron'
MATCH (m:Movie)-[:DIRECTED]-(d:Director)
    WHERE d.name = "James Cameron"
RETURN m;

// Exemplo 3
// Localize o nome dos atores e diretor que atuaram no filme 'The Matrix'
MATCH (a:Actor)-[:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(d:Director)
    WHERE m.title = "The Matrix"
RETURN a,d;

// Exemplo 4
// Localizar atores que atuaram em filmes que possuem o gênero 'Sci-fi' e 'Fantasia'
MATCH (a:Actor)-[:ACTED_IN]->(m:Movie)-[:IN_GENRE]->(g:Genre)
    WHERE g.name IN ['Sci-Fi','Fantasy']
RETURN a,m; // Pode-se usar ALIAS (AS) para dar nome colunas de resultados

// Exemplo 5
// Encontrar diretores que não atuaram em seus filmes (se houver)
MATCH (d:Director)-[:DIRECTED]->(m:Movie)
    WHERE NOT (d)-[:ACTED_IN]-(m:Movie)
RETURN d.name, m.title;

// Exemplo 6
// Criando uma lista de filmes conforme baseando se nos diretores
MATCH (d:Director)-[:DIRECTED]->(m:Movie)
RETURN d.name, COLLECT(m.title) AS Filmes_Dirigidos;
