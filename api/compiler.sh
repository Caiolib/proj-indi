#!/bin/bash
# Dependencies
cd account
mvn clean install -DskipTests 
cd ..
cd auth
mvn clean install -DskipTests 
cd ..
cd product
mvn clean install -DskipTests 
cd ..
cd order
mvn clean install -DskipTests 
cd ..

# Services
cd account-service
mvn -B -DskipTests clean package
cd ..
cd auth-service
mvn -B -DskipTests clean package
cd ..
cd product-service
mvn -B -DskipTests clean package
cd ..
cd order-service
mvn -B -DskipTests clean package
cd ..
cd gateway-service
mvn -B -DskipTests clean package
cd ..