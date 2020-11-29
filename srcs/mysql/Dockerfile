FROM alpine:latest
RUN apk update
RUN apk add openrc
RUN apk add mysql mysql-client
RUN apk add busybox-extras
RUN openrc
RUN touch /run/openrc/softlevel
COPY wordpress.sql /tmp/wordpress.sql
COPY s.sh /tmp/s.sh
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
