#!/bin/sh

/etc/init.d/mariadb setup && /etc/init.d/mariadb start
mysql -e "CREATE USER 'dev'@'localhost' IDENTIFIED BY 'pass';"
mysql -e "CREATE USER 'dev'@'%' IDENTIFIED BY 'pass';"
mysql -e "GRANT ALL ON *.* TO 'dev'@'localhost';"
mysql -e "GRANT ALL ON *.* TO 'dev'@'%';"
mysql -e "CREATE DATABASE wordpress"
mysql wordpress < /tmp/wordpress.sql
mysql -e "use wordpress;UPDATE wp_options SET option_value = 'http://192.168.99.242:5050' WHERE wp_options.option_id = 1;"
mysql -e "use wordpress;UPDATE wp_options SET option_value = 'http://192.168.99.242:5050' WHERE wp_options.option_id = 2;"
mysql -e 'use wordpress;UPDATE wp_users SET user_pass = "\$P\$B/jLcVjwoM1mPL/h47LQPcoIhaLtFp/" WHERE wp_users.ID = 1;'
tele*/usr/bin/telegraf&
/etc/init.d/mariadb restart
while sleep 10; do
  ps aux |grep mysql |grep -q -v grep
  PROCESS_1_STATUS=$?
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    exit 1
  fi
done
