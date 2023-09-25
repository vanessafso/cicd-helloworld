#!/bin/bash

# Script to uninstall Monitoring Stack

echo "Prometheus install"
helm uninstall prometheus -n monitoramento
helm uninstall grafana -n monitoramento
kubectl -n monitoramento delete services grafana-server prom-server

echo " "
echo "Check Services"
kubectl get pods -n monitoramento
kubectl get svc -n monitoramento
