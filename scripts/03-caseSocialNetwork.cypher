// Estudo de Caso - Modelando uma rede social simples

// Nós: Pessoa, Grupo, Post
// Pessoa: Atributos (nome, idade, cidade)
// Grupo: Atributos (nome, descrição)
// Post: Atributos (id, titulo, data)

// Nó intermediário: Comentario
// Comentario: Atributos (id, texto, data)

// Nó intermediário era um Relacionamento entre Pessoa e Post que passou ser um Nó para melhores análises


//---------------------------------------------
// CRIANDO OS NÓS E SEUS ATRIBUTOS
//---------------------------------------------

// Criando o Nó Pessoa com seus atributos e dados
CREATE (:Pessoa {nome: 'Ana', idade: 28, cidade: 'São Paulo'});
CREATE (:Pessoa {nome: 'Bruno', idade: 30, cidade: 'Rio de Janeiro'});
CREATE (:Pessoa {nome: 'Clara', idade: 25, cidade: 'Belo Horizonte'});

// Criando o Nó Grupo com seus atributos e dados
CREATE (:Grupo {nome: 'Neo4j Lovers', descricao: 'Grupo para fãs de Grafos'});
CREATE (:Grupo {nome: 'Dev Brasil', descricao: 'Comunidade de desenvolvedores'});

// Criando o Nó Post com seus atributos e dados
CREATE (:Post {id: 1, titulo: 'Como moldar grafos', data: '2026-01-07'});
CREATE (:Post {id: 2, titulo: 'Dicas de Cypher', data: '2026-01-08'});

// Criando o Nó intermediário Comentario com seus atributos e dados
CREATE (:Comentario {id: 101, texto: 'Muito bom!', data: '2026-01-09'});
CREATE (:Comentario {id: 102, texto: 'Gostei das dicas', data: '2026-01-09'});


//---------------------------------------------
// CRIANDO OS RELACIONAMENTOS
//---------------------------------------------

// Amizades
MATCH (ana:Pessoa {nome: "Ana"}), (bruno:Pessoa {nome: "Bruno"})
CREATE (ana)-[:AMIGO_DE {desde: date('2020-05-10')}]->(bruno),
       (bruno)-[:AMIGO_DE {desde: date('2020-05-10')}]->(ana);

MATCH (ana:Pessoa {nome: "Ana"}), (clara:Pessoa {nome: "Clara"})
CREATE (ana)-[:AMIGO_DE {desde: date('2022-01-15')}]->(clara),
       (clara)-[:AMIGO_DE {desde: date('2022-01-15')}]->(ana);

// Postagens por Pessoa
MATCH (ana:Pessoa {nome: "Ana"})
MATCH (post1:Post {id: 1})
CREATE (ana)-[:POSTOU]->(post1);

MATCH (bruno:Pessoa {nome: "Bruno"})
MATCH (post2:Post {id: 2})
CREATE (bruno)-[:POSTOU]->(post2);

// Postagens em Grupos
MATCH (post1:Post {id: 1})
MATCH (grupo1:Grupo {nome: "Neo4j Lovers"})
CREATE (post1)-[:PUBLICADO_EM]->(grupo1);

MATCH (post2:Post {id: 2})
MATCH (grupo2:Grupo {nome: "Dev Brasil"})
CREATE (post2)-[:PUBLICADO_EM]->(grupo2);

// Comentários em Posts

    // Clara
MATCH (clara:Pessoa {nome: "Clara"}),(comentario1:Comentario {id: 101})
CREATE (clara)-[:COMENTOU {data: date("2006-01-10")}]->(comentario1);

MATCH (comentario1:Comentario {id:101}),(post1:Post {id: 1})
CREATE (comentario1)-[:COMENTA]->(post1);

    // Bruno
MATCH (bruno:Pessoa {nome: "Bruno"}),(comentario2:Comentario {id: 102})
CREATE (bruno)-[:COMENTOU {data: date("2026-01-10")}]->(comentario2);

MATCH (comentario2:Comentario {id:102}),(post1:Post {id:1})
CREATE (comentario2)-[:COMENTA]->(post1);

// Pessoas que fazem parte de Grupos

    // Ana
MATCH (ana:Pessoa {nome: "Ana"}),(grupo1:Grupo{nome: "Neo4j Lovers"})
CREATE (ana)-[:MEMBRO_DE {desde: date("2021-03-01")}]->(grupo1);

    // Bruno
MATCH (bruno:Pessoa {nome:"Bruno"}),(grupo2:Grupo{nome:"Dev Brasil"})
CREATE (bruno)-[:MEMBRO_DE {desde: date("2020-10-20")}]->(grupo2);

    // Clara
MATCH (clara:Pessoa {nome:"Clara"}),(grupo1:Grupo{nome:"Neo4j Lovers"})
CREATE (clara)-[:MEMBRO_DE {desde: date("2022-06-15")}]->(grupo1);

