/* 
DELETE - Deletar todos os atributos de um NÓ ou de um RELACIONAMENTO
Remove a ESTRUTURA DO GRAFO.
Removendo o NÓ, são removidas as PROPRIEDADES.
*/

// Exemplo 1
// Deleta o João e os Relacionamentos referentes à 'CONHECE'
MATCH (p:Pessoa{name:"Joao"})-[r:CONHECE]-()
DELETE p,r;

// Exemplo 2
// Deleta apenas os Relacionamentos referentes à 'CONHECE' ao Nó João
MATCH (p:Pessoa{name:"João"})-[r:CONHECE]-()
DELETE r;


// DETACH DELETE - Deleta todos os Nós e Relacionamentos do banco

// Exemplo 3
// Apagar o Nó João e todos so Relacionamentos referentes ao Nó
MATCH (p:Pessoa{name:"João"})
DETACH DELETE p;

// Exemplo 4
// Apaga todos os Nós e Relacionamentos do banco (Zera o banco completo)
MATCH (p)
DETACH DELETE p;