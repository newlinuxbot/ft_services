#!/bin/bash

echo "\033[101m[+] - Make sure you have Minikube & Docker installed, That's not my job :)"
echo "\033[101m[+] - Restarting The Cluster:"
minikube delete
minikube start
eval $(minikube docker-env)
echo "\033[101m[+] - Setup LoadBalancer:"
sh setup-metallb.sh
echo "\033[101m[+] - Building Docker images:"
docker build -t wp-image wordpress/
docker build -t mysql-image --build-arg EXTERNALIP=192.168.99.242 mysql/
docker build -t ftp-image --build-arg EXTERNALIP=192.168.99.242 ftp/
docker build -t pma-image phpmyadmin/
docker build -t nginx-image --build-arg EXTERNALIP=192.168.99.242 nginx/
docker build -t influxdb-image influxdb/
docker build -t grafana-image grafana/
echo "\033[101m[+] - Creating Persistent Volumes for mysql and influxdb:"
kubectl create -f pv-pvc/
kubectl create -f .
echo "\033[101m[+] - Done:"

#docker run -p 8086:8086 -d -it --net mine --name influxdb myinfluxdb
#docker run -p 80:5050 -it -d --net mine --name wordpress mywordpress
#docker run -p 3306:3306 -it -d --net mine --name mysql mymysql
#docker run -p 5000:5000 -it -d --net mine --name phpmyadmin myphpmyadmin
#docker run -p 8080:80 -p 443:443 -p 22:22 -it -d --net mine --name nginx mynginx
#docker run -p 21:21 -d -it --net mine --name ftp myftp
#docker run -p 3000:3000 -d -it --net mine --name grafana mygrafana

