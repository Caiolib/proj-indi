## Objetivo

Fazer um microserviço de product para nossa api, que interaja com nosso banco de dados e tenha uma dependencia com os objetos utilizados.

## Montagem do Exercicio

Para a realizaçao deste exercicio, precisamos primeiro criar nossa aplicação e testa-la, uma vez funcionando adicionamos ao compose da API

### Criação Exercicio

Clone o repositório com o exercicio pronto para ver a estrutura de arquivos escolhida, mas ela segue uma estrutura springboot padrão, diferindo que são dois repositórios. Para testar localmente, use mvn clean install em `product` para rodar o `product-service`.


### Criação dockerfile

Este dockerfile basicamente faz o compilamento e executa o mesmo. É necessario ter o product installado (mvn clean install)

=== "product pom.xml"

    ``` { .xml .copy .select linenums='1' title="product pom.xml" }
    --8<-- "https://raw.githubusercontent.com/joaopgs4/product/refs/heads/main/pom.xml"
    ```

=== "product-service pom.xml"

    ``` { .xml .copy .select linenums='1' title="product pom.xml" }
    --8<-- "https://raw.githubusercontent.com/joaopgs4/product-service/refs/heads/main/pom.xml"
    ```

=== "product-service dockerfile"

    ``` { .copy .select linenums='1' title="dockerfile" }
    --8<-- "https://raw.githubusercontent.com/joaopgs4/product-service/refs/heads/main/Dockerfile"
    ```

### Rotas
!!! info "POST /product"

    Create a new product.

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

!!! info "GET /product"

    Get all products.

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

!!! info "GET /product/{id}"

    Get a product by its ID.

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
        Response code: 200 (ok)
        ```

!!! info "DELETE /product/{id}"

    Delete a product by its ID.

    ```bash
    Response code: 204 (no content)
    ```
