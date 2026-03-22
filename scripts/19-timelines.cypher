/*
TIMELINES - Casos que trabalham com uma SÉRIE TEMPORAL na linha do tempo, o correto é utilizar 
            NÓS INTERMEDIÁRIOS. 

            - Garantinho performance no banco
            - Desmembrar um nó em possíveis NÓS TEMPORAIS que podem ser INTERMEDIÁRIOS.

*/

// Criação do NÓ ano 2024
CREATE (y2024:Year {value: 2024});

// Criação dos NÓS referentes aos MESES do ano
CREATE (m01:Month {value: 1, name: 'Janeiro'})
CREATE (m02:Month {value: 2, name: 'Fevereiro'})
CREATE (m03:Month {value: 3, name: 'Março'})
CREATE (m04:Month {value: 4, name: 'Abril'})
CREATE (m05:Month {value: 5, name: 'Maio'})
CREATE (m06:Month {value: 6, name: 'Junho'})
CREATE (m07:Month {value: 7, name: 'Julho'})
CREATE (m08:Month {value: 8, name: 'Agosto'})
CREATE (m09:Month {value: 9, name: 'Setembro'})
CREATE (m10:Month {value: 10, name: 'Outubro'})
CREATE (m11:Month {value: 11, name: 'Novembro'})
CREATE (m12:Month {value: 12, name: 'Dezembro'})

// Criação de alguns DIAS do Mês como exemplo
CREATE (d15:Day {value: 15, date: '2024-01-15'})
CREATE (d16:Day {value: 16, date: '2024-01-16'})
CREATE (d01:Day {value: 1, date: '2024-02-01'})

// Criação de alguns RELACIONAMENTOS referentes ao MÊS e ANO
CREATE (y2024)-[:HAS_MONTH]->(m01)
CREATE (y2024)-[:HAS_MONTH]->(m02)

// Criação de RELACIONAMENTOS de alguns MESES para alguns DIAS
CREATE (m01)-[:HAS_DAY]->(d15)
CREATE (m01)-[:HAS_DAY]->(d16)
CREATE (m02)-[:HAS_DAY]->(d01)

// Criação de alguns NÓS de usuários
CREATE (joao:User {id: 'joao', name:'Joao Silva', email:'joao@email.com'})
CREATE (maria:User {id: 'maria', name: 'Maria Santos', email: 'maria@email.com'})
CREATE (carlos:User {id: 'carlos', name: 'Carlos Lima', email: 'carlos@email.com'})
CREATE (ana:User {id: 'ana', name: 'Ana Costa', email: 'ana@email.com'})

// Criação de NÓS de EVENT (Login e Lougout)
CREATE (login1:Event {type: 'login', timestamp: '2024-01-15T09:30:00'})
CREATE (login2:Event {type: 'login', timestamp: '2024-01-15T14:20:00'})
CREATE (login3:Event {type: 'login', timestamp: '2024-01-15T16:10:00'})
CREATE (logout1:Event {type: 'logout', timestamp: '2024-01-16T18:45:00'})
CREATE (logout2:Event {type: 'logout', timestamp: '2021-01-16T20:30:00'})
CREATE (purchase1:Event {type: 'purchase', amount: 150.00, timestamp: '2024-02-01T11:15:00'})
CREATE (purchase2:Event {type: 'purchase', amount: 89.90, timestamp: '2024-02-01T15:45:00'})

// Criação dos RELACINAMENTOS de EVENTOS nos DIAS
CREATE (d15)-[:HAS_EVENT]->(login1)
CREATE (d15)-[:HAS_EVENT]->(login2)
CREATE (d15)-[:HAS_EVENT]->(login3)
CREATE (d16)-[:HAS_EVENT]->(logout1)
CREATE (d16)-[:HAS_EVENT]->(logout2)
CREATE (d01)-[:HAS_EVENT]->(purchase1)
CREATE (d01)-[:HAS_EVENT]->(purchase2)

// Criação dos RELACIONAMENTOS de REALIZOU
CREATE (joao)-[:REALIZOU]->(login1)
CREATE (maria)-[:REALIZOU]->(login2)
CREATE (ana)-[:REALIZOU]->(login3)
CREATE (joao)-[:REALIZOU]->(logout1)
CREATE (maria)-[:REALIZOU]->(logout2)
CREATE (carlos)-[:REALIZOU]->(purchase1)
CREATE (ana)-[:REALIZOU]->(purchase2)


// Query de consulta de quantos eventos aconteceram por dia
MATCH (m:Month)-[:HAS_DAY]->(d:Day)-[:HAS_EVENT]->(e:Event)<-[:REALIZOU]-(u:User)
RETURN m.name as mes,
    count(DISTINCT u) as usuarios_unicos,
    count(e) as eventos_ocorridos
