/* 
SET e REMOVE: Modificam os NÓS e RELACIONAMENTOS nos quesitos de LABEL E PROPRIEDADES
Eles NÃO adicionam ou removem os NÓS.
*/

// SET

// Exemplo 1
// Localiza pessoa de nome JOAO e adiciona propriedade nacionalidade ao nó
MATCH (p:Pessoa{nome:"Joao"})
SET p.nacionalidade = "Brasileiro"
RETURN p;

// Exemplo 2
// Adicionando outro LABEL para o nó João (PESSOA & BRASILEIRO)
MATCH (p:Pessoa{nome:"João"})
SET p:Brasileiro
RETURN p;

// Exemplo 3
// Todos os nós com o label Pessoa, recebem outro label Brasileiro
MATCH (p:Pessoa)
SET p:Brasileiro
RETURN p;

// REMOVE

// Exemplo 4
// Remove o label Brasileiro de todos os nós que possuem ambos os labels Pessoa e Brasileiro
MATCH (p:Pessoa)
REMOVE p:Brasileiro
RETURN p;
