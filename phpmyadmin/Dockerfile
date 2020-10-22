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
RUN echo 'nginx -g "daemon off;"' >> /tmp/s.sh
COPY config.inc.php /usr/share/nginx/html/phpmyadmin/config.inc.php
CMD ["/bin/sh","/tmp/s.sh"]
