/*
OTIMIZANDO CONSULTAS - PERFORMANCE E OTIMIZAÇÃO

- EXPLAIN: comando que fornece o plano de execução de uma consulta cypher SEM EXECUTÁ-LA. Mostra apenas os passos a serem realizados
- PROFILE: comando que fornece um plano de execução DETALHADO de uma consulta, que mostra como o banco de dados à processa, incluindo o uso de índices e travessias de Relacinamentos

    - NodeByLabelScan: Examina todos os nós de um determinado RÓTULO, realizando uma varredura de rótulo quando não há um índice de esquema dispoível ou quando a consulta precisa
                       filtrar NÓS com base em um RÓTULO sem outras propriedades indexadas.

    - NodeIndexSeek: É o processo de usar um ÍNDICE de banco de dados para localizar NÓS e PROPRIEDADES específicas de forma eficiente, acelerando a recuperação de dados em consultas.

    - Database Hits(DBHits):Cada operador enviará uma solicitação ao mecanismo de armazenamento para realizar tarefas como recuperar ou atualizar dados.

    - Expand: Refere-se a ação de explorar a conectividade de um nó, revelando suas relações e nõs vizinhos para uma visualizar o grafo mais a fundo.
*/

// Exemplo 01 - Uso do EXPLAIN
// ===========================
// OBS: Resultado visual não aparece no VS CODE, apenas no AuraDB

EXPLAIN
MATCH (u:Usuario {nome:'Usuário 500'})-[:AMIGO_DE]->(amigo)
RETURN amigo;


// Exemplo 02 - Uso do PROFILE
// ===========================
// OBS: Resultado visual não aparece no VS CODE, apenas no AuraDB

PROFILE
MATCH (u:Usuario {nome:'Usuário 500'})-[:AMIGO_DE]->(amigo)
RETURN amigo;


// Exemplo 03 - Criando um INDEX
// ==============================
/* 

*/

// Primeiro criar um índice
CREATE INDEX usuario_nome_index FOR (u:Usuario) ON (u.nome);

// Executar
PROFILE
    MATCH (u:Usuario {nome:'Usuário 500'})-[:AMIGO_DE]->(amigo)
RETURN (amigo);
