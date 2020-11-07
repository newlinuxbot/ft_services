FROM alpine:latest
RUN apk update
RUN apk add openrc
RUN apk add mysql mysql-client
RUN apk add busybox-extras
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
RUN echo "mysql -e \"use wordpress;UPDATE wp_options SET option_value = 'http://$MINIKUBEIP:5050' WHERE wp_options.option_id = 1;\"" >> /tmp/s.sh
RUN echo "mysql -e \"use wordpress;UPDATE wp_options SET option_value = 'http://$MINIKUBEIP:5050' WHERE wp_options.option_id = 2;\"" >> /tmp/s.sh
RUN echo "mysql -e \"use wordpress;UPDATE wp_users SET user_pass = '\$P\$B/jLcVjwoM1mPL/h47LQPcoIhaLtFp/' WHERE wp_users.ID = 1; " >> /tmp/s.sh
RUN echo "tele*/usr/bin/telegraf&" >> /tmp/s.sh
RUN echo "/etc/init.d/mariadb restart" >> /tmp/s.sh
RUN echo "while true; do echo hello; sleep 10;done" >> /tmp/s.sh
RUN mkdir -p /etc/telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_linux_i386.tar.gz
RUN tar -xvf teleg*
RUN tele*/usr/bin/telegraf config > /etc/telegraf/telegraf.conf
RUN awk 'NR==112 {$0="urls = [\"http://influxdb-service:8086\"]"} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
RUN awk 'NR==116 {$0="database = \"mysql\""} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf 
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
COPY my.cnf /etc/mysql/my.cnf
EXPOSE 3306
ENTRYPOINT sh /tmp/s.sh
