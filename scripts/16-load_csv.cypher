/*
LOAD CSV - Cláusula usada para importar dados de um arquivo .csv para um banco de dados

== ESTRUTURA ==

LOAD CSV FROM <path> AS ROW
WITH ROW
    MERGE ()                // Nós e Atributos
    MERGE ()-[]-()          // Criação de Relacionamentos
    ON CREATE SET           // Para criação do NÓ e/ou Relacionamentos

 - Neo4JAura: Importação do arquivo é feita de um drive ou bucket
 - Neo4JDesktop: Importação é feita da pasta 'import'. Arquivo deve ser colocado na pasta.

 CALL - Cláusula tem duas funções principais:
        - Executar procedimentos
        - Avaliar subconsultas

 - Subqueries: Consultas complexas, agrupar dados, construir lógica condicional

 INTRANSACTIONS OF - Permite a definição de valor de controle de carregamento em lotes evitando
                     possíveis sobrecarga de dados. (batches)
*/
