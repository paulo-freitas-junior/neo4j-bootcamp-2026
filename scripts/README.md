# Acessando Neo4J SaaS (Aura DB Free) via VSCode

---

## 🔧 Passo a Passo para Instalar e Conectar

### 1. Instalar a extensão

- No VS Code vá em **Extensões** e procure por **Neo4J for VS Code** a extensão oficial publicada pela Neo4J.
![Extensão Oficial Neo4j](/images/neo4jextension.jpg)

### 2. Criar/usar sua instância SaaS (AuraDB Free)
- Acesse [Neo4j AuraDB](https://neo4j.com/cloud/aura/) e faça login com sua conta free.
- Crie uma instância gratuita (AuraDB Free).
- Certifique-se de ter em mãos o **usuário** (geralmente neo4j) e a **senha** que foi gerada automaticamente quando foi criado o banco (**aquele arquivo .txt**)
![Instâncias](/images/instancias.jpg)

- Clique na opção **Query** para poder ter acesso às informações da Instância que deseja conectar
- Copie o **HOST**, **usuário** e **senha** gerados.
![Instâncias](/images/query.jpg)

### 3. Configurar a conexão no VS Code
- No VS Code, abra a aba lateral da extensão Neo4j.
- Clique em **“Add Connection”**.
- Preencha:
  - **CONECTION NAME**: Inserir um nome para a Conexão
  - **SCHEMA**: `neo4j+s` obrigatório devido criptografia do AuraDB
  - **HOST**: Cole o endereço do console (removendo o `neo4j+s://` do início, se necessário)
  - **Usuário**: normalmente `neo4j`
  - **Senha**: fornecida pelo AuraDB durante a criação da Instância
- Salve a conexão.
![VS Code Conexão Aura DB Free (SaaS)](/images/VsCodeConnection.jpg)


### 4. Usar Cypher diretamente no editor
- Crie um arquivo com extensão **`.cypher`**.
- Escreva as queries.
- Execute-as pelo menu da extensão ou clicando em **Run Query**.
- Recursos como:
  - **Autocompletar** para labels, funções e propriedades.
  - **Linting** (validação de erros).
  - **Formatação automática** segundo o estilo Cypher.

---

## 📌 Observações Importantes
- **AuraDB Free** tem limite de recursos (200k nós e 400k relacionamentos), mas é suficiente para desenvolvimento e aprendizado.
- A conexão é feita via **Bolt+TLS** (segura), então não há necessidade de instalar Neo4j localmente.
- É possível alternar entre instâncias locais e SaaS, basta criar múltiplas conexões na extensão.
- Caso queira, insira dentro do arquivo `.gitignore` o arquivo .txt contendo a senha fornecida pelo AuraDB
---
