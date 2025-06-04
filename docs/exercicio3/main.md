## Objetivo

Fazer um microserviço de order para nossa api, que interaja com nosso banco de dados e tenha uma dependencia com os objetos utilizados.

## Montagem do Exercicio

Para a realizaçao deste exercicio, precisamos primeiro criar nossa aplicação e testa-la, uma vez funcionando adicionamos ao compose da API

### Criação Exercicio

Clone o repositório com o exercicio pronto para ver a estrutura de arquivos escolhida, mas ela segue uma estrutura springboot padrão, diferindo que são dois repositórios. Para testar localmente, use mvn clean install em `order` para rodar o `order-service`.


### Criação dockerfile

Este dockerfile basicamente faz o compilamento e executa o mesmo. É necessario ter o order installado (mvn clean install)

=== "order pom.xml"

    ``` { .xml .copy .select linenums='1' title="order pom.xml" }
    --8<-- "https://raw.githubusercontent.com/joaopgs4/order/refs/heads/main/pom.xml"
    ```

=== "order-service pom.xml"

    ``` { .xml .copy .select linenums='1' title="order pom.xml" }
    --8<-- "https://raw.githubusercontent.com/joaopgs4/order-service/refs/heads/main/pom.xml"
    ```

=== "order-service dockerfile"

    ``` { .copy .select linenums='1' title="dockerfile" }
    --8<-- "https://raw.githubusercontent.com/joaopgs4/order-service/refs/heads/main/Dockerfile"
    ```

### Rotas
!!! info "POST /order"

    Create a new order.

    === "Request"

        ``` { .json .copy .select linenums='1' }
        {
            "name": "Tomato",
            "price": 10.12,
            "unit": "kg"
        }
        ```

    === "Response"

        ``` { .json .copy .select linenums='1' }
        {
            "id": "0195abfb-7074-73a9-9d26-b4b9fbaab0a8",
            "name": "Tomato",
            "price": 10.12,
            "unit": "kg"
        }
        ```
        ```bash
        Response code: 201 (created)
        ```

!!! info "GET /order"

    Get all orders.

    === "Response"

        ``` { .json .copy .select linenums='1' }
        [
            {
                "id": "0195abfb-7074-73a9-9d26-b4b9fbaab0a8",
                "name": "Tomato",
                "price": 10.12,
                "unit": "kg"
            },
            {
                "id": "0195abfe-e416-7052-be3b-27cdaf12a984",
                "name": "Cheese",
                "price": 0.62,
                "unit": "slice"
            }
        ]
        ```
        ```bash
        Response code: 200 (ok)
        ```

!!! info "POST /order"

    Create a new order **for the current user**.

    === "Request"

        ``` { .json .copy .select linenums='1' }
        {
            "items": [
                {
                    "idorder": "0195abfb-7074-73a9-9d26-b4b9fbaab0a8",
                    "quantity": 2
                },
                {
                    "idorder": "0195abfe-e416-7052-be3b-27cdaf12a984",
                    "quantity": 10
                }
            ]
        }
        ```

    === "Response"

        ``` { .json .copy .select linenums='1' }
        {
            "id": "0195ac33-73e5-7cb3-90ca-7b5e7e549569",
            "date": "2025-09-01T12:30:00",
            "items": [
                {
                    "id": "01961b9a-bca2-78c4-9be1-7092b261f217",
                    "order": {
                        "id": "0195abfb-7074-73a9-9d26-b4b9fbaab0a8"
                    },
                    "quantity": 2,
                    "total": 20.24
                },
                {
                    "id": "01961b9b-08fd-76a5-8508-cdb6cd5c27ab",
                    "order": {
                        "id": "0195abfe-e416-7052-be3b-27cdaf12a984"
                    },
                    "quantity": 10,
                    "total": 6.2
                }
            ],
            "total": 26.44
        }
        ```
        ```bash
        Response code: 201 (created)
        Response code: 400 (bad request), if the order does not exist.
        ```

!!! info "GET /order"

    Get all orders **for the current user**.

    === "Response"

        ``` { .json .copy .select linenums='1' }
        [
            {
                "id": "0195ac33-73e5-7cb3-90ca-7b5e7e549569",
                "date": "2025-09-01T12:30:00",
                "total": 26.44
            },
            {
                "id": "0195ac33-cbbd-7a6e-a15b-b85402cf143f",
                "date": "2025-10-09T03:21:57",
                "total": 18.6
            }
            
        ]
        ```
        ```bash
        Response code: 200 (ok)
        ```

!!! info "GET /order/{id}"

    Get the order details by its ID. **The order must belong to the current user.**, otherwise, return a `404`.

    === "Response"

        ``` { .json .copy .select linenums='1' }
        {
            "id": "0195ac33-73e5-7cb3-90ca-7b5e7e549569",
            "date": "2025-09-01T12:30:00",
            "items": [
                {
                    "id": "01961b9a-bca2-78c4-9be1-7092b261f217",
                    "order": {
                        "id": "0195abfb-7074-73a9-9d26-b4b9fbaab0a8",
                    },
                    "quantity": 2,
                    "total": 20.24
                },
                {
                    "id": "01961b9b-08fd-76a5-8508-cdb6cd5c27ab",
                    "order": {
                        "id": "0195abfe-e416-7052-be3b-27cdaf12a984",
                    },
                    "quantity": 10,
                    "total": 6.2
                }
            ],
            "total": 26.44
        }
        ```
        ```bash
        Response code: 200 (ok)
        Response code: 404 (not found), if the order does not belong to the current user.
        ```