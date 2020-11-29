#!/bin/sh

rc-service vsftpd start
telegraf&
while sleep 10; do
  ps aux |grep vsftpd |grep -q -v grep
  PROCESS_1_STATUS=$?
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    exit 1
  fi
done
