/* 
CONSTRAINTS - Restrições ou Limitações que podem ser aplicadas aos NÓS e aos RELACIONAMENTOS
São regras que limitam os valores ou comportamentos de dados de um sistema, garantindo integridade e
precisão das informações.

> Compostos por:
- Uniqueness - (UNIQUE ) - Define a UNICIDADE ou seja, único no banco
- Existence - (IS NOT NULL ) - Define a necessidade de EXISTÊNCIA de uma propriedade específica
- Type - Define o TIPO específico de propriedades
- KEY - Define uma CHAVE identificadora única

> Estrutura de Criação de uma Constraint

CREATE CONSTRAINT <nome da constraint> IF NOT EXISTS
FOR <informaçao>
REQUIRE <informação>
IS <compostos>
 */

// SHOW CONSTRAINTS;  // Exibe todas as constraints no banco
// DROP CONSTRAINT <nome_constraint>;

// 1. UNIQUE CONSTRAINT
// Garante que um atributo seja único para todos os nós de um determinado LABEL

CREATE CONSTRAINT cpf_unico
IF NOT EXISTS
FOR (p:Pessoa)
REQUIRE p.cpf
IS UNIQUE;

CREATE CONSTRAINT unique_person_email 
IF NOT EXISTS
FOR (p:Person) 
REQUIRE p.email 
IS UNIQUE;


// 2. EXISTENCE CONSTRAINT
// Garante que uma propriedade sempre exista em um NÓ ou RELACIONAMENTO
CREATE CONSTRAINT person_name_exists
IF NOT EXISTS
FOR (p:Person) // Nó
REQUIRE p.nome 
IS NOT NULL;

CREATE CONSTRAINT works_since_exists
IF NOT EXISTS
FOR ()-[r:WORKS_AT]-() // Relacionamento
REQUIRE r.since 
IS NOT NULL;


// 3. NODE KEY CONSTRAINT
// Combina múltiplas propriedades para formar uma chave composta única
CREATE CONSTRAINT person_identity
IF NOT EXISTS
FOR (p:Person) // Nó
REQUIRE (p.firstName, p.lastName) 
IS NODE KEY;