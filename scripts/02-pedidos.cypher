// Exemplo de criação de Nós, Relacionamentos dentro de modelagem

// Nós: Pessoa, Produto, Pedido
// Relacionamentos: REALIZOU, CONTÉM

// CREATE: Comando que repete as informações

// Nós
CREATE (p:Pessoa {nome: 'Ana'})
CREATE (prod:Produto {nome: 'Notebook', preco: 3500}) 
CREATE (pedido:Pedido {id: 1,
        data: '2026-01-09',
        valorTotal: 3200,
        loja: 'eletrônicos ltda',
        formaPagamento: 'cartao'}
        )

// Relacionamentos
CREATE (p)-[:REALIZOU]->(pedido)    // Pessoa realizou Pedido
CREATE (pedido)-[:CONTÉM]->(prod)   // Pedido contém Produto