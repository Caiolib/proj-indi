# Como executar

## Para executar 

### localmente (compose):

chmod +x compiler.sh
./compiler.sh
docker-compose up --build


### kubernets(minikube):
chmod +x deploy.sh
./deploy.sh



´´

### Comando Para criar os repositorios

gh repo create product-service --public 
git remote add origin-aws https://github.com/Caiolib/product-service.git
git init
git add .
git commit -m "Initial commit"
git push origin-aws

´´