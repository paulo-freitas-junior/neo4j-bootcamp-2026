/*
ORDENAÇÃO , PAGINAÇÃO E NAVEGAÇÃO
- Order By: Permite ordenar ASC (Ascendente), DESC (Decrecente)
- Limit: Define um número limite de resultados visíveis
- Skip: Pula resultados da conulta (paginação)
*/

// Exemplo 1
// Retornar os títulos dos filmes em ordem crescente
MATCH (m:Movie)
RETURN m.title
ORDER BY m.title ASC;

// Exemplo 2
// Retornar os filmes e as avaliações feitas por quem assistiu em ordem do melhor para pior filme
MATCH (u:User)-[r:WATCHED]->(m:Movie)
RETURN  u.name AS Nome_Usuario,
        m.title AS Filme, 
        r.rating as Nota_Filme
ORDER BY r.rating DESC
LIMIT 30;
