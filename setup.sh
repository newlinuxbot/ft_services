docker build -t wp-image wordpress/
docker build -t mysql-image mysql/
docker build -t pma-image phpmyadmin/
docker build -t nginx-image nginx/
docker build -t ftp-image ftp/
docker build -t influxdb-image influxdb/
docker build -t grafana-image grafana/
kubectl create -f .
#docker run -p 8086:8086 -d -it --net mine --name influxdb myinfluxdb
#docker run -p 80:5050 -it -d --net mine --name wordpress mywordpress
#docker run -p 3306:3306 -it -d --net mine --name mysql mymysql
#docker run -p 5000:5000 -it -d --net mine --name phpmyadmin myphpmyadmin
#docker run -p 8080:80 -p 443:443 -p 22:22 -it -d --net mine --name nginx mynginx
#docker run -p 21:21 -d -it --net mine --name ftp myftp
#docker run -p 3000:3000 -d -it --net mine --name grafana mygrafana

