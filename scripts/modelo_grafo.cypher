// Primeiro modelo de Grafo
// Pergunta: Quais usuários assistem quais filmes e quais os gêneros desses filmes?
// Pergunta: Quais usuários são avaliadores de filmes?

// MATCH - Localizar
// MERGE - Gerar o Relacionamento

// Inserindo dados de USUÁRIO e AVALIADOR (Nós)
MERGE (:Usuario&Avaliador {nome: 'Alice'});
MERGE (:Usuario {nome: 'Bob'})

// Inserindo dados de FILME (Nó)
MERGE (:Filme {titulo: 'Inception'});
MERGE (:Filme {titulo: 'Titanic'});

// Inserindo dados de GÊNERO (Nó)
MERGE (:Genero {tipo: 'Ficção Científica'});

// Criando RELACIONAMENTO [ASSISTIU] entre USUÁRIO e FILME
MATCH (u:Usuario {nome: 'Alice'})
MATCH (f:Filme {titulo: 'Inception'})
MERGE (u)-[:ASSISTIU {data: '2025'}]->(f);  // Relacionamento com atributo de Date

MATCH (u:Usuario {nome: 'Bob'}) 
MATCH (f:Filme {titulo: 'Titanic'})
MERGE (u)-[:ASSISTIU]->(f)

// Criando um RELACIONAMENTO [PERTENCE] entre FILME E GÊNERO
MATCH (f:Filme {nome: 'Inception'})
MATCH (g:Genero {tipo: 'Ficção Científica'})
MERGE (f)-[:PERTENCE_A]->(g)
