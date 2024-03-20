# FIAP 2023 - Pós Tech - Tech Callenge - Entrega Final -  Anotações para execução da POC

## Portas

As portas são referentes aos containers configurados e disponibilizados na pasta [infra](./infra), que são as aplicações de suporte. Para os microserviços da aplicação da lanchonete a definição das portas está no arquivo de [configuração dos containers](./docker-compose.yaml)

| Aplicação | Porta |
| :--- | :---: |
| Keycloak | 8091 |
| MariaDB | 3306 |
| phpMyAdmin (MariaDB) | 8092 |
| Redis | 6379 |
| Kafka UI | 8090 |
| Kafka Bootstrap Server | 29092 |
| Microserviço de produtos | 9081 |
| Microserviço de pedidos | 9082 |
| Microserviço de status | 9083 |
| Microserviço de pagamento | 9084 |
| Microserviço de produção | 9085 |

## Keycloak 
- Administração
    - http://<\<HOST\>>:8091/
    - login: admin
    - senha: admin

- Usuários:
    - Acesso para recuperação do Código de acesso
        - http://<\<HOST\>>:8091/realms/tech_challenge/protocol/openid-connect/auth?client_id=tc-admin-web&response_type=code

    - Usuário Administrador do cadastro de Produtos
        - login: grupo36-admin
        - senha: SPIudeFIntxAoX9t
        - roles:
            - tc_products_create
            - tc_products_delete
            - tc_products_edit
            - tc_products_read
            - tc_products_readall

    - Clientes:
        -  Yago
            - login: 26762876803
            - senha: WcABhF5Jb8
        - Osvaldo
            - login: 51475142870
            - senha: uJbbus7tNW

Para obter mais clientes para testes, utilizar o arquivo [clientesMoc.json](./clientesMoc.json)

Para obter mais Pedidos para testes, utilizar o arquivo [pedidosMoc.json](./pedidosMoc.json)

## Kafka UI
- http://<\<HOST\>>:8093/ui/clusters/local/all-topics

## phpMyAdmin UI
- http://<\<HOST\>>:8092
- Admin
    - login: root
    - senha: senha123
- User
    - login: application_user
    - senha: senha123

Arquivo com alguns SQL útils: [Querys Auxiliares](./querys_auxiliares.sql)

## Diversos
- Sequência de status possíveis para um pedido
    - new
    - payment_requested
    - payment_pending
    - payment_accepted
    - payment_refused
    - order_received
    - order_in_production
    - order_completed
    - order_delivered