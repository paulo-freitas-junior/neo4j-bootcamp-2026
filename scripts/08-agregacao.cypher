/*
AGREGAÇÃO - Funções que processam conjunto de VALORES e retornam um único resultado resumido.
- COUNT() - Conta o número de valores ou linhas (ex. count(n) ou count(*))
- SUM() - Soma de valores numéricos
- AVG() - Média aritmética 
- MIN()/ MAX() - Encontra o menor ou o maior valor dentro de um conjunto
*/

// Exemplo 1
// Verifique a quantidade total de filmes no banco
MATCH (m:Movie)
RETURN COUNT(m) as Total_Filmes;

// Exemplo 2
// Verifique média de idade, idade mínima e máxima dos atores de um filme específico
MATCH (a:Actor)-[:ACTED_IN]-(m:Movie{title:'Gladiator'})
RETURN m.title, avg(a.idade), min(a.idade), max(a.idade);
