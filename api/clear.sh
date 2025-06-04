#!/bin/bash
# Clear
kubectl delete svc --all -n store
kubectl delete deploy --all -n store
kubectl delete pods --all -n store
kubectl delete all --all -n store