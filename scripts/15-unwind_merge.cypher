/*
UNWIND + MERGE
Prática recomendada para importar dados em lote, garantindo performance e integridade.
*/

// Exemplo

// 1- Criando os produtos na base de dados
WITH [
    {id: 1, nome:'Smartphone Galaxy S23', preco:2599.99, categoria:'Eletrônicos', estoque: 50},
    {id: 2, nome:'Notebook Dell Inspiron', preco:3299.00, categoria:'Eletrônicos', estoque: 25},
    {id: 3, nome:'Tênis Nike Air Max', preco:599.00, categoria:'Calçados', estoque: 100},
    {id: 4, nome:'Camiseta Polo', preco:79.90, categoria:'Roupas', estoque:200},
    {id: 5, nome:'Livro - Clean Code', preco:79.90, categoria:'Livros', estoque: 30},
    {id: 6, nome:'Mouse Gamer RGB', preco:199.90, categoria:'Eletrônicos', estoque: 75}
] AS produtos

UNWIND produtos AS produto
MERGE (p:Produto {id: produto.id})  // verifica se o NÓ PRODUTO já existe na base antes de criar o produto
SET p.nome = produto.nome,
    p.preco = produto.preco,
    p.categoria = produto.categoria,
    p.estoque = produto.estoque,
    p.criadoEm = datetime()
RETURN p;


// 2- Criando os pedidos dos produtos
WITH [
    {id: 101, clienteId: 1001, cliente:'João da Silva', email:'joao@email.com', status:'Processando', total: 0},
    {id: 102, clienteId: 1002, cliente:'Maria Santos', email:'maria@email.com', status:'Enviado', total: 0},
    {id: 103, clienteid: 1003, cliente:'Pedro Costa', email:'pedro@email.com', status:'Entregue', total: 0},
    {id: 104, clienteId: 1001, cliente:'João Silva', email:'joa@email.com', status:'Processando', total: 0}
] AS pedidos

UNWIND pedidos AS pedido
MERGE (ped:Pedido {id: pedido.id})  // Verificar se o NÓ PEDIDO já existe na base antes de criar o mesmo
SET ped.id = pedido.id,
    ped.clienteId = pedido.clienteId,
    ped.cliente = pedido.cliente,
    ped.email = pedido.email,
    ped.status = pedido.status,
    ped.total = pedido.total,
    ped.criadoEM = datetime()
RETURN ped;


// 3- Criando os REALACIONAMENTOS entre PRODUTOS e PEDIDOS
WITH [
    {pedidoId: 101, produtoId: 1, quantidade: 1, precoUnitario: 2599.99},
    {pedidoId: 101, produtoId: 4, quantidade: 2, precoUnitario: 89.90},
    {pedidoId: 102, produtoId: 2, quantidade: 1, precoUnitario: 3299.00},
    {pedidoId: 102, produtoId: 6, quantidade: 1, precoUnitario: 199.99},
    {pedidoId: 103, produtoId: 3, quantidade: 2, precoUnitario: 599.90},
    {pedidoId: 103, produtoId: 5, quantidade: 3, precoUnitario: 79.90},
    {pedidoId: 104, produtoId: 1, quantidade: 1, precoUnitario: 2599.99},
    {pedidoId: 104, produtoId: 3, quantidade: 1, precoUnitario: 599.90}
] AS ItensPedido

UNWIND ItensPedido as item
MATCH (pedido:Pedido {id: item.pedidoId})
MATCH (produto:Produto {id: item.produtoId})
MERGE (pedido)-[contem:CONTEM]->(produto)
SET contem.quantidade = item.quantidade,
    contem.precoUnitario = item.precoUnitario,
    contem.subtotal = (item.quantidade * item.precoUnitario),
    contem.adicionadoEm = datetime()
RETURN pedido.id AS PedidoID,
       produto.nome AS Produto,
       contem.quantidade AS Quantidade,
       contem.precoUnitario AS PrecoUnitario,
       contem.subtotal AS Subtotal;
