FROM alpine:latest
ARG EXTERNALIP
RUN apk update
RUN apk add openssl nginx openrc --no-cache
RUN mkdir -p /etc/nginx/ssl /run/nginx
RUN adduser -D "admin"
RUN echo "admin:admin" | chpasswd
RUN openrc
RUN touch /run/openrc/softlevel
RUN mkdir -p /usr/share/nginx/html
RUN openssl req -newkey rsa:2048 -x509 -days 365 -sha256 -nodes -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt -subj "/C=MA/ST=BG/L=BG/O=1337/OU=oimejad/CN=localhost"
COPY d.conf /etc/nginx/conf.d/default.conf
RUN sed -i "s/EXTERNALIP/$EXTERNALIP/g" /etc/nginx/conf.d/default.conf
RUN apk add openssh
RUN apk add vim
RUN rc-update add sshd
COPY s.sh /tmp/s.sh
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
RUN telegraf config > /etc/telegraf/telegraf.conf
RUN awk 'NR==112 {$0="urls = [\"http://influxdb-service:8086\"]"} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
RUN awk 'NR==116 {$0="database = \"nginx\""} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf 
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
EXPOSE 80 443 2
ENTRYPOINT sh /tmp/s.sh

