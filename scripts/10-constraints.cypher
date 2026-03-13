/*

CONSTRAINTS - (Restrições ou Limitações) regras que limitam os valores ou comportamento dos dados de um sistema garantinho
a integridade e precisão das informações.

São 4 tipos de constraints:
===========================

- UNIQUENESS (UNICIDADE) - Unicidade deve ser única no banco
- EXISTENCE (EXISTÊNCIA) - Precisa existir uma propriedade específica
- TYPE (TIPO) - Propriedades de tipos específicos - Ex: string, number
- KEY (CHAVE) - Identificador único

ESTRUTURA DE CRIAÇÃO DE CONSTRAINT
==================================

CREATE CONSTRAINT <nome constraint> IF NOT EXISTS
FOR ( <l.label> )
REQUIRE <l.propriedade> 
IS <UNIQUE> <NOT NULL>


EXIBINDO AS CONSTRAINTS
=======================

SHOW CONSTRAINTS
*/

// Exemplo 01
CREATE CONSTRAINT cpf_unico IF NOT EXISTS
FOR (p:Pessoa)
REQUIRE p.cpf
IS UNIQUE NOT NULL;
