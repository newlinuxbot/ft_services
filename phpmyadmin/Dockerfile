FROM alpine:latest
RUN apk update
RUN apk add nginx openrc --no-cache
RUN mkdir -p /etc/nginx/ssl /run/nginx
RUN adduser -D "admin"
RUN echo "admin:admin" | chpasswd
RUN openrc
RUN touch /run/openrc/softlevel
RUN mkdir -p /usr/share/nginx/html
RUN cd /usr/share/nginx/html
RUN chmod -R 777 /usr/share/nginx/html/
COPY d.conf /etc/nginx/conf.d/default.conf
RUN apk add phpmyadmin
RUN apk add php-fpm
RUN mv /usr/share/webapps/phpmyadmin /usr/share/nginx/html/
RUN echo "/usr/sbin/php-fpm7" > /tmp/s.sh
RUN echo "telegraf&" >> /tmp/s.sh
RUN echo 'nginx -g "daemon off;"' >> /tmp/s.sh
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
RUN telegraf config > /etc/telegraf/telegraf.conf
RUN awk 'NR==112 {$0="urls = [\"http://influxdb.mine:8086\"]"} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
RUN awk 'NR==116 {$0="database = \"phpmyadmin\""} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf 
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
COPY config.inc.php /usr/share/nginx/html/phpmyadmin/config.inc.php
CMD ["/bin/sh","/tmp/s.sh"]
