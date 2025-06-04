# proj-indi


Este é o rep principal. Utilize o clone.sh para clonar os outros reps dentro da pasta /api

chmod +x clone.sh
./clone.sh

O arquivo jankins.yaml contem uma pré configuração do jankens, pode ser usado com:
docker compose -f jankins.yaml up --build
E assim você tera um docker do jankins pronto, faltando apenas configurar as variaveis do jankins

* clone.sh: Clona todos os reps
* compile.sh: Compila todos os serviços e baixa os pacotes java para testes locais (com compose)
* clear.sh: limpa o minikube, para fazer um clean-build novamente do projeto
* deploy.sh: faz um rebuild de todos os dockers no cluster do kubernets

links de todos os repositórios:
https://github.com/joaopgs4/api-principal  
https://github.com/joaopgs4/product-service
https://github.com/joaopgs4/product
https://github.com/joaopgs4/order-service
https://github.com/joaopgs4/order
https://github.com/joaopgs4/gateway-service
https://github.com/joaopgs4/exchange-service
https://github.com/joaopgs4/auth-service
https://github.com/joaopgs4/auth
https://github.com/joaopgs4/account-service
https://github.com/joaopgs4/account