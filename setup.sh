#!/bin/bash

echo "[+] - Make sure you have Minikube & Docker installed, That's not my job :)"
echo "[+] - Restarting the cluster"
minikube delete
minikube start
eval $(minikube docker-env)
echo "[+] - Setup LoadBalancer:"
sh setup-metallb.sh
echo "[+] - Building Docker images:"
docker build -t wp-image wordpress/
docker build -t mysql-image --build-arg EXTERNALIP=192.168.99.242 mysql/
docker build -t ftp-image --build-arg EXTERNALIP=192.168.99.242 ftp/
docker build -t pma-image phpmyadmin/
docker build -t nginx-image --build-arg EXTERNALIP=192.168.99.242 nginx/
docker build -t influxdb-image influxdb/
docker build -t grafana-image grafana/
echo "[+] - Creating Persistent Volumes for mysql and influxdb:"
kubectl create -f pv-pvc/
kubectl create -f .
echo "[+] - Starting Dashboard:"
minikube dashboard
echo "[+] - Done:"

