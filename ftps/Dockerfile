FROM alpine:latest
ARG EXTERNALIP
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel
RUN apk add vsftpd openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/privat
e/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=MA/ST=BG/L=BG/O=1337/OU=o
imejad/CN=localhost"
RUN apk add busybox-extras
RUN rc-update add vsftpd default
RUN adduser -D admin
RUN echo "admin:admin" | chpasswd
RUN echo "admin" > /etc/vsftpd.chroot_list
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN sed -i "s/EXTERNALIP/$EXTERNALIP/g" /etc/vsftpd/vsftpd.conf
RUN echo "rc-service vsftpd start" > /tmp/s.sh
RUN echo "telegraf && sh" >> /tmp/s.sh
RUN echo "while true; do echo hello; sleep 10;done" >> /tmp/s.sh
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
RUN telegraf config > /etc/telegraf/telegraf.conf
RUN awk 'NR==112 {$0="urls = [\"http://influxdb-service:8086\"]"} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
RUN awk 'NR==116 {$0="database = \"ftp\""} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf 
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
ENTRYPOINT sh /tmp/s.sh

