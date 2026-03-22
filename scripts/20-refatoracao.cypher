/*
REFATORAÇÃO - Prática de melhorar uma estrutura JÁ EXISTENTE interna sem alterar o comportamento externo

- Enriquecer os dados do banco
- Add Labels
- Enriquecer NÓS e RELACIONAMENTOS
- Alterar informações
- etc..
*/

// Criação dos NÓS de Usuários
CREATE (ana:Usuario {nome:'Ana', idade:25, email:'ana@email.com', status:'ativo'})
CREATE (bruno:Usuario {nome:'Bruno', idade:30, email:'bruno@email.com', status:'inativo'})
CREATE (carla:Usuario {nome:'Carla', idade:28, email:'carla@email.com', status:'ativo'})
CREATE (diego:Usuario {nome:'Diego', idade:35, email:'diego@gmail.com', status:'ativo'})

// Criação dos Relacionamentos
CREATE (ana)-[:AMIGO_DE {desde: '2020-01-05'}]->(bruno)
CREATE (ana)-[:AMIGO_DE {desde: '2021-03-10'}]->(carla)
CREATE (bruno)-[:AMIGO_DE {desde: '2019-08-20'}]->(diego)
CREATE (carla)-[:AMIGO_DE {desde: '2022-01-05'}]->(diego)

// Aplicando a REFATORAÇÃO
// =======================



