/*
UNWIND - Permite transformar uma lista de elementos em linhas separadas de resultados "desmembrando" a lista para que cada item
da lista seja processado individualmente em uma nova linha de consulta

- Manipular listas
- Manipular itens

UNWIND pode ser usado junto com CREATE, MERGE, QUERY
*/


// Exemplo 01
UNWIND [1,2,3,4,5] AS numero
RETURN numero;


// Exemplo 02
// usar apenas UNWIND + CREATE se houver certeza que não existe cadastro do produto no banco evitando duplicidade
UNWIND [
    {sku:'p001', nome:'Notebook Gamer', preco:5000},
    {sku:'p002', nome:'Mouse sem fio', preco:120},
    {sku:'p003', nome:'Teclado mecânico', preco:350},
] AS prod;

CREATE (p.Produto {
    sku: prod.sku,
    nome: prod.nome,
    preco: prod.preco,
    criadoEm: date()
})
RETURN p;


// Exemplo 03
// Criando CONSTRAINTS de unicidade para evitar criação em duplicidade

// sku
CREATE CONSTRAINT sku_unico IF NOT EXISTS
FOR (p:Produto)
REQUIRE p.sku
IS UNIQUE NOT NULL;

// nome
CREATE CONSTRAINT nome_unico IF NOT EXISTS
FOR (p:Produto)
REQUIRE p.nome
IS UNIQUE NOT NULL;

// preço
CREATE CONSTRAINT preco_unico IF NOT EXISTS
FOR (p:Produto)
REQUIRE p.preco
IS UNIQUE NOT NULL;

UNWIND [
    {sku:'p004', nome:'Monitor Gamer 27', preco:1000},
    {sku:'p005', nome:'Placa de Video 3060', preco:2000},
    {sku:'p006', nome:'Roteador Wifi', preco:150}
] AS prod

CREATE (p:Produto {
    sku: prod.sku,
    nome: prod.nome,
    preco: prod.preco,
    criadoEm: date()
})
RETURN p;

SHOW CONSTRAINTS;
