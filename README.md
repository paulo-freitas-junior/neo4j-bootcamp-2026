<div align="center">
  <img src="/images/logo_bootcamp.jpg" width="100%" alt="Neo4J - Análise de Dados">
</div>

---

[![Status](https://img.shields.io/badge/status-em_desenvolvimento-yellow)](https://github.com/paulo-freitas-junior/neo4j-bootcamp-2026/blob/main/README.md)
[![Licença](https://img.shields.io/badge/licença-MIT-blue)](https://github.com/paulo-freitas-junior/neo4j-bootcamp-2026/blob/main/LICENSE)

# 📊 Análise de Dados com Neo4j

Repositório do bootcamp **análise de dados utilizando o Neo4j**, banco de dados orientado a grafos que permite explorar relacionamentos complexos de forma eficiente e intuitiva.

---

## 🚀 O que é o Neo4j?
O **Neo4j** é o banco de dados de grafos mais popular do mercado. Ele armazena informações como **nós** (entidades) e **arestas** (relacionamentos), possibilitando consultas rápidas e poderosas sobre conexões.  
Sua linguagem de consulta, **Cypher**, é declarativa e otimizada para explorar padrões em grafos, tornando a análise de dados conectados muito mais simples.

---

## 🎯 Objetivo do Bootcamp
Este repositório tem como objetivo:
- Demonstrar como o Neo4j pode ser aplicado em **análise de dados conectados**.
- Explorar **consultas em grafos** para identificar padrões, comunidades e insights ocultos.
- Integrar algoritmos de **Graph Data Science** (como PageRank, detecção de comunidades e caminhos mais curtos).
- Mostrar casos práticos de uso em áreas como:
  - Redes sociais
  - Sistemas de recomendação
  - Detecção de fraudes
  - Logística e cadeias de suprimentos

---

## ⚙️ Tecnologias Utilizadas
- **Neo4j AuraDB** (versão em nuvem) ou instalação local
- **Cypher Query Language**
- **Python** (para integração e análise de dados)
- **Biblioteca Neo4j Python Driver**
- **Graph Data Science Library (GDS)**
- **Visual Studio Code** elaboração dos scripts em Cypher

---

## 📂 Estrutura do Repositório
- `data/` → Conjunto de dados utilizados para análise
- `projects/` → Projetos criados no bootcamp conforme cada módulo de estudo
- `scripts/` → Scripts e Cypher e Python para integração com Neo4j
- `docs/` → Documentação complementar
- `images/` → Pasta contendo imagens utilizadas nos projetos
- `notebooks/` → Pasta contendo arquivos de Jupyter Notebooks para querys híbridas (Cypher e Python)

---

## 🔎 Exemplos de Consultas em Cypher
```cypher
// Encontrar todas as conexões de um usuário
MATCH (u:Usuario {nome: "Alice"})-[:AMIGO]->(amigos)
RETURN u, amigos;

// Calcular o caminho mais curto entre dois usuários
MATCH p = shortestPath((a:Usuario {nome:"Alice"})-[:AMIGO*]-(b:Usuario {nome:"Bob"}))
RETURN p;
