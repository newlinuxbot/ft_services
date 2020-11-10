FROM alpine
RUN apk update
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN wget https://dl.grafana.com/oss/release/grafana-6.7.2.linux-amd64.tar.gz
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN tar -xzf grafana*.tar.gz
COPY grafana.db /grafana-6.7.2/data/grafana.db
RUN mkdir -p /etc/telegraf
RUN telegraf config > /etc/telegraf/telegraf.conf
RUN awk 'NR==112 {$0="urls = [\"http://influxdb-service:8086\"]"} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf 
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
RUN awk 'NR==116 {$0="database = \"grafana\""} { print }' /etc/telegraf/telegraf.conf > /etc/telegraf/telegraf1.conf
RUN mv /etc/telegraf/telegraf1.conf /etc/telegraf/telegraf.conf
RUN echo "telegraf&" > /tmp/s.sh
RUN echo "cd /grafana-6.7.2/bin && ./grafana-server" >> /tmp/s.sh
RUN echo "while true; do echo hello; sleep 10;done" >> /tmp/s.sh
ENTRYPOINT sh /tmp/s.sh
