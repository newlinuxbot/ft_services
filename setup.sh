docker build --tag mywordpress wordpress/
docker build --tag mymysql mysql/
docker build --tag myphpmyadmin phpmyadmin/
docker build --tag mynginx nginx/
docker build --tag myftp ftp/
docker build --tag myinfluxdb influxdb/
docker build --tag mygrafana grafana/
docker run -p 8086:8086 -d -it --net mine --name influxdb myinfluxdb
docker run -p 80:5050 -it -d --net mine --name wordpress mywordpress
docker run -p 3306:3306 -it -d --net mine --name mysql mymysql
docker run -p 5000:5000 -it -d --net mine --name phpmyadmin myphpmyadmin
docker run -p 8080:80 -p 443:443 -p 22:22 -it -d --net mine --name nginx mynginx
docker run -p 21:21 -d -it --net mine --name ftp myftp
docker run -p 3000:3000 -d -it --net mine --name grafana mygrafana

