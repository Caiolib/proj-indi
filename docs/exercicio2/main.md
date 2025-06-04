# Guia Rápido: API de Produtos

## Sumário

Este guia apresenta uma nova abordagem para configurar, construir e operar o serviço de produtos. A seguir, você encontrará instruções para o ambiente, configurações Docker e utilização dos endpoints disponíveis.

## Configuração Inicial

### Preparação da Aplicação

Comece clonando o repositório que contém a estrutura base. O projeto possui uma arquitetura em Spring Boot dividida em dois módulos. Para testes locais, navegue até o diretório "product" e execute:

    mvn clean install

### Configuração com Docker

Após a instalação local, configure o ambiente Docker. Um arquivo Docker é utilizado para compilar e executar o serviço, garantindo que o módulo "product" já esteja instalado.

=== "Arquivo Docker do product-service"

     ``` { .copy .select linenums='1' title="dockerfile" }
     --8<-- "https://raw.githubusercontent.com/joaopgs4/product-service/refs/heads/main/Dockerfile"
     ```

### Arquivos de Configuração Maven

Verifique os arquivos de configuração Maven presentes nos dois módulos do projeto:

=== "Arquivo pom.xml do product"

     ``` { .xml .copy .select linenums='1' title="product pom.xml" }
     --8<-- "https://raw.githubusercontent.com/joaopgs4/product/refs/heads/main/pom.xml"
     ```

=== "Arquivo pom.xml do product-service"

     ``` { .xml .copy .select linenums='1' title="product pom.xml" }
     --8<-- "https://raw.githubusercontent.com/joaopgs4/product-service/refs/heads/main/pom.xml"
     ```

## Documentação dos Endpoints

A seguir, detalhamos os endpoints disponíveis para interação com o serviço de produtos.

!!! info "Cadastrar Produto (POST /product)"

     Utilize este endpoint para inserir um novo produto no sistema.

     === "Exemplo de Requisição"

          ``` { .json .copy .select linenums='1' }
          {
                "name": "Tomate",
                "price": 10.12,
                "unit": "kg"
          }
          ```

     === "Exemplo de Resposta"

          ``` { .json .copy .select linenums='1' }
          {
                "id": "0195abfb-7074-73a9-9d26-b4b9fbaab0a8",
                "name": "Tomate",
                "price": 10.12,
                "unit": "kg"
          }
          ```
          ```bash
          Código: 201 (Created)
          ```

!!! info "Listar Produtos (GET /product)"

     Recupere a lista completa de produtos cadastrados.

     === "Exemplo de Resposta"

          ``` { .json .copy .select linenums='1' }
          [
                {
                     "id": "0195abfb-7074-73a9-9d26-b4b9fbaab0a8",
                     "name": "Tomate",
                     "price": 10.12,
                     "unit": "kg"
                },
                {
                     "id": "0195abfe-e416-7052-be3b-27cdaf12a984",
                     "name": "Queijo",
                     "price": 0.62,
                     "unit": "fatia"
                }
          ]
          ```
          ```bash
          Código: 200 (OK)
          ```

!!! info "Detalhar Produto (GET /product/{id})"

     Consulte informações específicas de um produto usando seu identificador único.

     === "Exemplo de Resposta"

          ``` { .json .copy .select linenums='1' }
          {
                "id": "0195abfb-7074-73a9-9d26-b4b9fbaab0a8",
                "name": "Tomate",
                "price": 10.12,
                "unit": "kg"
          }
          ```
          ```bash
          Código: 200 (OK)
          ```

!!! info "Remoção de Produto (DELETE /product/{id})"

     Exclua um produto conforme seu identificador. Este endpoint não retorna conteúdo.

     ```bash
     Código: 204 (No Content)
     ```

## Conclusão

Esta documentação apresenta uma abordagem alternativa para a configuração e uso da API de produtos. Siga os passos indicados para obter um ambiente adequado para desenvolvimento e testes.

