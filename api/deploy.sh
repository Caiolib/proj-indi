#!/bin/bash
# Infra
kubectl apply -f k8s/db.yaml -n store
kubectl apply -f k8s/redis.yaml -n store
kubectl apply -f k8s/prometheus-config.yaml -n store
kubectl apply -f k8s/prometheus.yaml -n store
kubectl apply -f k8s/grafana.yaml -n store

# Services
kubectl apply -f account-service/k8s/k8s.yaml -n store
kubectl apply -f auth-service/k8s/k8s.yaml -n store
kubectl apply -f gateway-service/k8s/k8s.yaml -n store
kubectl apply -f product-service/k8s/k8s.yaml -n store
kubectl apply -f order-service/k8s/k8s.yaml -n store
kubectl apply -f exchange-service/k8s/k8s.yaml -n store
