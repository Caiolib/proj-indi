# proj-indi

## Repositorio Principal que controla os microServi


#### clone.sh para clonar os outros reps dentro da pasta /api

chmod +x clone.sh
./clone.sh

O arquivo jankins.yaml contem uma pré configuração do jankens, pode ser usado com:
docker compose -f jankins.yaml up --build
E assim você tera um docker do jankins pronto, faltando apenas configurar as variaveis do jankins

* clone.sh: Clona todos os reps
* compile.sh: Compila todos os serviços e baixa os pacotes java para testes locais (com compose)
* clear.sh: limpa o minikube, para fazer um clean-build novamente do projeto
* deploy.sh: faz um rebuild de todos os dockers no cluster do kubernets



Repositorios

git clone https://github.com/Caiolib/account.git
git clone https://github.com/Caiolib/account-service.git
git clone https://github.com/Caiolib/auth.git
git clone https://github.com/Caiolib/auth-service.git
git clone https://github.com/Caiolib/exchange-service.git
git clone https://github.com/Caiolib/gateway-service.git
git clone https://github.com/Caiolib/order.git
git clone https://github.com/Caiolib/order-service.git
git clone https://github.com/Caiolib/product.git
git clone https://github.com/Caiolib/product-service.git
