# Guia Rápido do Microserviço de Câmbio

## Rotas da API
!!! note "Endpoint: GET /exchange/from/to"
    Utilize este endpoint para consultar a taxa de câmbio entre duas moedas. Por exemplo: `GET /exchange/BRL/USD`.

    === "Exemplo de Resposta"

        ```json
        {
            "venda": 0.85,
            "compra": 0.83,
            "horario": "2022-05-21 10:12:00",
            "conta": "b3c2d1e5-9f8a-7c6b-d4e2-1a3b5c7d8f9g"
        }
        ```
        ```bash
        Código: 200 (sucesso)
        ```

## Configuração com Docker e Dependências
Para garantir o ambiente ideal do microserviço, empregamos contêineres Docker. O setup inclui um script para iniciar o uvicorn e um arquivo de dependências.

=== "Script uvicorn.sh"

    ```sh
    --8<-- "https://raw.githubusercontent.com/joaopgs4/exchange-service/refs/heads/main/uvicorn.sh"
    ```

=== "Arquivo de Requisitos"

    ```txt
    --8<-- "https://raw.githubusercontent.com/joaopgs4/exchange-service/refs/heads/main/requirements.txt"
    ```

=== "Dockerfile"
    
    ```dockerfile
    --8<-- "https://raw.githubusercontent.com/joaopgs4/exchange-service/refs/heads/main/dockerfile"
    ```

## Descrição do Projeto
Este projeto foi desenvolvido com FastAPI e Python para criar um microserviço de câmbio que integra fontes externas de dados para fornecer conversões de moedas em tempo real. A arquitetura foi pensada para ser leve e escalável, facilitando a manutenção e expansão.

