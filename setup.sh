#!/bin/bash

echo "[+] - Make sure you have Minikube & Docker installed, That's not my job :)"
echo "[+] - Restarting the cluster"
minikube delete
minikube start
eval $(minikube docker-env)
echo "[+] - Setup LoadBalancer:"
sh setup-metallb.sh
echo "[+] - Building Docker images:"
docker build -t wordpress wordpress/
docker build -t mysql --build-arg EXTERNALIP=192.168.99.242 mysql/
docker build -t ftps --build-arg EXTERNALIP=192.168.99.242 ftps/
docker build -t phpmyadmin phpmyadmin/
docker build -t nginx --build-arg EXTERNALIP=192.168.99.242 nginx/
docker build -t influxDB influxdb/
docker build -t grafana grafana/
echo "[+] - Creating Persistent Volumes for mysql and influxdb:"
kubectl create -f pv-pvc/
kubectl create -f .
echo "[+] - Starting Dashboard:"
minikube dashboard
echo "[+] - Done:"

