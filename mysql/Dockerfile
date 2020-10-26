FROM alpine:latest
RUN apk update
RUN apk add openrc
RUN apk add mysql mysql-client
RUN openrc
RUN touch /run/openrc/softlevel
RUN echo "/etc/init.d/mariadb setup && /etc/init.d/mariadb start" > /tmp/s.sh
COPY wordpress.sql /tmp/wordpress.sql
RUN echo "mysql -e \"CREATE USER 'dev'@'localhost' IDENTIFIED BY 'pass';\"" >> /tmp/s.sh
RUN echo "mysql -e \"CREATE USER 'dev'@'%' IDENTIFIED BY 'pass';\"" >> /tmp/s.sh
RUN echo "mysql -e \"GRANT ALL ON *.* TO 'dev'@'localhost';\"" >> /tmp/s.sh
RUN echo "mysql -e \"GRANT ALL ON *.* TO 'dev'@'%';\"" >> /tmp/s.sh
RUN echo "mysql -e \"CREATE DATABASE wordpress\"" >> /tmp/s.sh
RUN echo "mysql wordpress < /tmp/wordpress.sql" >> /tmp/s.sh
RUN echo "telegraf&" >> /tmp/s.sh
RUN echo "/etc/init.d/mariadb restart && /bin/sh" >> /tmp/s.sh
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
RUN telegraf config > /etc/telegraf/telegraf.conf
RUN awk 'NR==112 {$0="urls = [\"http://influxdb.mine:8086\"]"} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
RUN awk 'NR==116 {$0="database = \"mysql\""} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf 
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
COPY my.cnf /etc/mysql/my.cnf
EXPOSE 3306
CMD ["sh", "/tmp/s.sh"]
