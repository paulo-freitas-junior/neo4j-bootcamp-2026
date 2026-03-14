/*
MERGE - Carga de dados e criação de NÓS e RELACIONAMENTOS
Combinação dos comandos MATCH e CREATE, usando para encontrar um padrão de NÓS e RELACIONAMENTOS
no gráfico e cria esses dados caso não exista, OU retorna os elementos se já existirem.

MERGE
ON MATCH SET - Se existe o nó ou relacionamento, cria APENAS a propriedade
ON CREATE SET - Se não existe o nó ou relacionamento, é criado e juntamente a propriedade

*/

// Exemplo 1
// ===========
// 1- Criando o Nó
CREATE (:Pessoa{nome:"Paulo", cpf: 12345678});

// 2- Tentando criar o mesmo Nó com propriedade já existente no banco 
MERGE (:Pessoa{cpf:12345678}); // Não será criado

// Exemplo 2
// ===========

// Tenta criar um Nó com propriedade CPF. Se não existir nó com o atributo CPF, cria o mesmo e mais 2
// atributos 'criadoEm' e logins contendo dados
MERGE (p:Pessoa{cpf:123456789})
ON CREATE SET
    p.criadoEm = date(),
    p.logins = 1
ON MATCH SET    // Caso já exista o CPF no banco, ele adiciona a propriedade logins e faz um somatório
    p.logins = coalesce(p.logins,0)+1
RETURN p;
