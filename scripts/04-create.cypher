/*
CREATE: Não verifica se o nó ou relacionamento existe no banco de dados podendo ocasionar duplicidade.
*/

// Criação de um Nó com apenas um Label
CREATE (:Bootcamp {descricao:"Primeiro nó com 1 label"});

// Criação de um Nó com 2 Labels
CREATE (:Teste&Dio {descricao:"Primeiro nó com 2 labels"});

// Criação Nó com duplo label e seu relacionamento com nó Tester
CREATE (:Teste&Dio {descricao:"Nó"})-[r:FOI_TESTADO]->(:Tester);

// Exemplo criação de nós e relacionamentos
CREATE
(a:Pessoa{nome:"Joao",idade:36}),
(t:Pessoa{nome:"Maria",idade:25}),
(p:Pessoa{nome:"Pedro",idade:34}),
(a)-[:CONHECE]->(t),
(a)-[:CONHECE]->(p);