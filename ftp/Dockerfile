FROM alpine:latest
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel
RUN apk add vsftpd
RUN apk add busybox-extras
RUN rc-update add vsftpd default
RUN echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf
RUN echo "isolate_network=NO" >> /etc/vsftpd/vsftpd.conf
RUN echo "rc-service vsftpd start" > /tmp/s.sh
RUN echo "while true; do echo hello; sleep 10;done" >> /tmp/s.sh
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
RUN telegraf config > /etc/telegraf/telegraf.conf
RUN awk 'NR==112 {$0="urls = [\"http://influxdb-service:8086\"]"} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
RUN awk 'NR==116 {$0="database = \"ftp\""} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf 
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
RUN echo "telegraf && sh" >> /tmp/s.sh
ENTRYPOINT sh /tmp/s.sh

