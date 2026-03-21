/*
APOC - Awesome Procedure on Cypher
Coleção de ferramentas que estende a linguagem de consulta cypher para diversas tarefas como interação e manipulação de dados.

- importação de arquivos .json
- leitura de dados de API ou .json
- estrutura de dados
- exportação de dados
- criação de relacionamentos (tempo de consulta sem armazenamento no banco de dados)
- listas encadeadas
- mesclagem de nós duplicados
- processamento em batch
- time serial
*/

// Exemplo 01 - Carregando dados de uma API
// ===============================
/*
1. Integração e Ingestão de Dados (APIs e JSON)
O primeiro grande uso demonstrado é a capacidade de buscar dados externos sem precisar de ferramentas de ETL (Extração e Transformação) complexas.
A função apoc.load.json: conecta o banco de dados diretamente a uma URL (API) ou arquivo local.

Mapeamento de Estrutura: O código mostra como navegar em objetos JSON aninhados (ex: user.adress.city) para criar propriedades em nós do Neo4j.
Criação de Relacionamentos Dinâmicos: Após carregar usuários e posts, o script usa o MATCH para encontrar o usuário correspondente ao userId do post e cria a conexão [:ESCREVEU] entre eles.
*/

CALL apoc.load.json('https://jsonplaceholder.typicode.com/users')  // arquivo encontra-se também na pasta ./data/users.json
YIELD value as user
CREATE (u:Usuario {
    id: user.id,
    nome: user.nome,
    email: user.email,
    cidade: user.adress.city,
    empresa: user.company.name
})
RETURN count(*) as usuarios_criados;

// Exibindo os usuários criados
MATCH (u)
RETURN (u) LIMIT 25;

// Criando os relacionamentos
CALL apoc.load.json('https://jsonplaceholder.typicode.com/posts')  // arquivo encontra-se também na pasta ./data/posts.json
YIELD value as post
MATCH (u:Usuario {id: post.userId})  // vincula id´s
CREATE (p:Post {
    id: post.id,
    titulo: post.title,
    conteudo: post.body
})
CREATE (u)-[:ESCREVEU]->(p)  // cria os relacionamentos
RETURN count (*) as posts_criados;


// Exemplo 02 - Realizando um "Merge Node" sobre nós que foram criados duplicados (João Silva)
// ===========================================================================================
/*
2. Limpeza de Dados: Mesclagem de Nós Duplicados
Uma das tarefas mais difíceis em bancos de dados é lidar com duplicatas. O código utiliza o APOC para resolver isso de forma inteligente.
A função apoc.refactor.mergeNodes: identifica dois ou mais nós que representam a mesma entidade (baseado em um critério como o e-mail) e os funde em um único nó.
Estratégia combine: Ao realizar o merge, o código utiliza a opção {properties: 'combine'}. Isso garante que nenhuma informação seja perdida; se um nó tinha a "idade" e o outro o "departamento", o nó final terá ambos.
*/

CREATE (u1:Usuario {nome: 'João Silva', email:'joao@email.com', idade: 30});
CREATE (u2:Usuario {nome: 'João Silva', email:'joao@email.com', departamento: 'TI'});
CREATE (u3:Usuario {nome: 'Maria Santos', email:'maria@email.com'});

// Idendificando NÓS DUPLICADOS de Usuários na base usando o e-mail como comparativo de identificação (igualdade)
MATCH (u1:Usuario), (u2:Usuario)
WHERE u1.email = u2.email AND elementId(u1) < elementId (u2)
WITH u1, u2
CALL apoc.refactor.mergeNodes ([u1, u2], {properties: 'combine'})   //  uso do MergeNodes e do Combine para transformar em único Nó
YIELD node      // Seleciona o Nó 
RETURN node;    // Retorna apenas o NÓ feito o mergeNode com todos os dados do Merge


// Exemplo 03 - Processamento em Lote (Batch) de uma consulta
// ==========================================================
/*
3. Performance com Processamento em Lote (Batch)
Quando for necessário alterar milhões de registros, fazer tudo de uma vez pode travar o banco de dados por falta de memória.
A função apoc.periodic.iterate: divide uma tarefa grande em pedaços menores (batches).

Funcionamento:
- A primeira parte seleciona os dados (MATCH (u:Usuario)).
- A segunda parte executa a ação (SET u.processado = true).
- O parâmetro {batchSize: 50} instrui o Neo4j a salvar as alterações a cada 50 registros, otimizando o uso de memória e garantindo que a operação seja concluída com segurança.
*/

CALL apoc.periodic.iterate(
    "MATCH (u:Usuario) RETURN u",
    "SET u.processado = true",      // cria uma nova propriedade 'processado' com valor true para todos os usuários
    {batchSize: 50}                // executa de 50 em 50 
);
