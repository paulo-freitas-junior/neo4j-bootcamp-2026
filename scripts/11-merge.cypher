/*
MERGE - CARGA DE DADOS E CRIAÇÃO DE NÓS/RELACIONAMENTOS
Combinação dos comandos MATCH e CREATE.
Usando para encontrar um padrão de NÓS e RELACIONAMENTOS no gráfico e retornar os elementos se já existentes.

TIPOS DE MERGE
==============

ON MATCH SET - Se existe o nó, cria apenas a propriedade
ON CREATE SET - Se não existe o nó, cria o nó e a propriedade também

MERGE (p.Pessoa {nome:"Paulo"});
*/

// Exemplo 01
CREATE (:Pessoa {nome:"Paulo", cpf: 12345678});     // Cria sem verificar duplicidade no banco
MERGE (:Pessoa {cpf: 12345678});                   //  NÃO VAI CRIAR porque já existe o cpf no banco


// Exemplo 02
MERGE (p.Pessoa {cpf: 12345678})
ON CREATE SET
    p.criadoEm = date(),
    p.logins = 1
ON MATCH SET
    p.logins = coalesce(u.logins,0) + 1
RETURN p;
