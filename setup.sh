#!/bin/bash

echo "[+] - Make sure you have Minikube & Docker installed, That's not my job :)"
echo "[+] - Restarting the cluster"
minikube delete
minikube start
eval $(minikube docker-env)
echo "[+] - Setup LoadBalancer:"
sh srcs/setup-metallb.sh
echo "[+] - Building Docker images:"
docker build -t wordpress srcs/wordpress/
docker build -t mysql --build-arg EXTERNALIP=192.168.99.242 srcs/mysql/
docker build -t ftps --build-arg EXTERNALIP=192.168.99.242 srcs/ftps/
docker build -t phpmyadmin srcs/phpmyadmin/
docker build -t nginx --build-arg EXTERNALIP=192.168.99.242 srcs/nginx/
docker build -t influxdb srcs/influxdb/
docker build -t grafana srcs/grafana/
echo "[+] - Creating Persistent Volumes for mysql and influxdb:"
kubectl create -f srcs/pv-pvc/
kubectl create -f srcs/
echo "[+] - Starting Dashboard:"
minikube dashboard
echo "[+] - Done:"

