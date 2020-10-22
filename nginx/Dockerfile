FROM alpine:latest
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
RUN apk add openssh
RUN rc-update add sshd
RUN echo "HTTPS is working !!, or is it ?!" > /usr/share/nginx/html/index.html 
RUN echo "/etc/init.d/sshd start" >> /tmp/s.sh
RUN echo 'nginx -g "daemon off;"' >> /tmp/s.sh
EXPOSE 80
CMD ["sh","/tmp/s.sh"]

