#!/bin/sh

/etc/init.d/sshd start
telegraf&
nginx -g "daemon off;"&
while sleep 10; do
  ps aux |grep sshd |grep -q -v grep
  PROCESS_1_STATUS=$?
  ps aux |grep nginx |grep -q -v grep
  PROCESS_2_STATUS=$?
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    exit 1
  fi
done
