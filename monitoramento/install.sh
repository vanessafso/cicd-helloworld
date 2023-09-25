#!/bin/bash

# Script to install Monitoring Stack

echo "Prometheus install"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/prometheus -n monitoramento


sleep 2

echo "Grafana install"
helm repo add grafana https://grafana.github.io/helm-charts
helm install grafana bitnami/grafana -n monitoramento

# kubectl port-forward svc/grafana 8080:3000 -n monitoramento &

# Grafana password show
echo "Password: $(kubectl get secret grafana-admin --namespace monitoramento -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 --decode)"

sleep 10

echo "Get Pods"
kubectl get pods -n monitoramento

echo "Get Services"
kubectl get svc -n monitoramento

# Setting up services
kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prom-server -n monitoramento
minikube service prom-server -n monitoramento

sleep 3

kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-server -n monitoramento
minikube service grafana-server -n monitoramento

echo " "