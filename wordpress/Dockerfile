FROM alpine:latest
RUN apk update
RUN apk add nginx openrc --no-cache
RUN mkdir -p /etc/nginx/ssl /run/nginx
RUN adduser -D "admin"
RUN echo "admin:admin" | chpasswd
RUN openrc
RUN touch /run/openrc/softlevel
RUN mkdir -p /usr/share/nginx/html
RUN apk add curl php7 php7-fpm php7-json php7-zlib php7-xml php7-pdo php7-phar php7-openssl \
    php7-pdo_mysql php7-mysqli php7-mysqlnd \
    php7-gd php7-mcrypt \
    php7-curl php7-opcache php7-ctype  \
    php7-intl php7-bcmath php7-dom php7-xmlreader --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/
RUN curl https://wordpress.org/latest.tar.gz -o /usr/share/nginx/html/latest.tar.gz
RUN tar xf /usr/share/nginx/html/latest.tar.gz -C /usr/share/nginx/html/
COPY d.conf /etc/nginx/conf.d/default.conf
RUN echo "/usr/sbin/php-fpm7" > /tmp/s.sh
RUN echo "telegraf&" >> /tmp/s.sh
RUN echo 'nginx -g "daemon off;"' >> /tmp/s.sh
RUN echo "while true; do echo hello; sleep 10;done" >> /tmp/s.sh
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
RUN telegraf config > /etc/telegraf/telegraf.conf
RUN awk 'NR==112 {$0="urls = [\"http://influxdb.mine:8086\"]"} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
RUN awk 'NR==116 {$0="database = \"wordpress\""} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf 
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
COPY wp-config.php /usr/share/nginx/html/wordpress/wp-config.php
CMD ["sh","/tmp/s.sh"]
