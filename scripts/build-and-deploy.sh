#!/bin/bash

echo "Construyendo artefactos con Maven..."

cd gateway-service
mvn clean package -DskipTests
echo "Construyendo imagen Docker para gateway-service..."
docker build -t gateway-service:latest .
cd ..

cd eureka-service
mvn clean package -DskipTests
echo "Construyendo imagen Docker para eureka-service..."
docker build -t eureka-service:latest .
cd ..

echo "Construyendo artefactos con Gradle..."

cd user-ms
./gradlew build -x test
echo "Construyendo imagen Docker para user-ms..."
docker build -t user-ms:latest .
cd ..

cd product-ms
./gradlew build -x test
echo "Construyendo imagen Docker para product-ms..."
docker build -t product-ms:latest .
cd ..

cd review-ms
./gradlew build -x test
echo "Construyendo imagen Docker para review-ms..."
docker build -t review-ms:latest .
cd ..

cd notification-ms
./gradlew build -x test
echo "Construyendo imagen Docker para notification-ms..."
docker build -t notification-ms:latest .
cd ..

echo "Proceso completado."
