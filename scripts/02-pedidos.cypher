// Exemplo de criação de Nós, Relacionamentos dentro de modelagem

// Nós: Pessoa, Produto, Pedido
// Relacionamentos: REALIZOU, CONTÉM

// CREATE: Comando que cria um novo NÓ ou RELACIONAMENTO sempre, resultando em DUPLICATAS se executado
//         mais de uma vez com os mesmos dados.

// AÇÃO: Cria novos nós/relacionamentos sem verificar o que já está no banco de dados.
// RESULTADO: Duplicatas são criadas se o comando for executado múltiplas vezes com os mesmos parâmetros.
// PERFORMANCE: É mais rápido, pois não precisa fazer consultas de verificação (match).
// USO: Ideal para quando você tem certeza absoluta de que os dados não existem ou quando não se importa com a duplicação.

// Nós
CREATE (p:Pessoa {nome: 'Ana'})

CREATE (prod:Produto {nome: 'Notebook', preco: 3500})

CREATE (pedido:Pedido {
        id: 1,
        data: '2026-01-09',
        valorTotal: 3200,
        loja: 'eletrônicos ltda',
        formaPagamento: 'cartao'}
        )

// Relacionamentos
CREATE (p)-[:REALIZOU]->(pedido)    // Pessoa realizou Pedido

CREATE (pedido)-[:CONTÉM]->(prod)   // Pedido contém Produto