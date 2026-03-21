/*
LOAD CSV - Cláusula usada para importar dados de um arquivo .csv para um banco de dados

== ESTRUTURA ==

LOAD CSV FROM <path> AS ROW
WITH ROW
    MERGE ()                // Nós e Atributos
    MERGE ()-[]-()          // Criação de Relacionamentos
    ON CREATE SET           // Para criação do NÓ e/ou Relacionamentos

 - Neo4JAura: Importação do arquivo é feita de um drive ou bucket
 - Neo4JDesktop: Importação é feita da pasta 'import'. Arquivo deve ser colocado na pasta.

 CALL - Cláusula tem duas funções principais:
        - Executar procedimentos
        - Avaliar subconsultas

 - Subqueries: Consultas complexas, agrupar dados, construir lógica condicional

 INTRANSACTIONS OF - Permite a definição de valor de controle de carregamento em lotes evitando
                     possíveis sobrecarga de dados. (batches)
*/


// Visualizando o Schema do banco de dados
CALL db.schema.visualization();


// Exemplo 01 
// Exemplo de uso do CALL
MATCH (t:Team)
CALL (t) {
       MATCH (p:Player)-[r:PLAYS_ON]->(t)  // Subquerie
       RETURN COLLECT(p) as Players, r
}
RETURN (t) as Teams, Players, r;


// Exemplo 02
// Lendo um arquivo .CSV de filmes existente na pasta 'data' (Este exemplo visa uso do VS Code)
/* 
Uso do CALL como subquerie para popular o banco de dados usando MERGE
*/
LOAD CSV WITH HEADERS FROM 'https://github.com/paulo-freitas-junior/neo4j-bootcamp-2026/blob/main/data/film.csv' AS row
CALL (row) 
       {MERGE (m:Movie {movieId: toInteger(row.movieId)})  // cria um nó Movie e para cada linha do arquivo .csv cria id (numérico inteiro) do filme
       SET m.title = row.title,
           m.genres = split(row.genres, '|')     // No arquivo .csv existe mais de um gênero para cada filme, ele é dividido por '|'
       } IN TRANSACTIONS OF 20 ROWS              // batch de 20 em 20 