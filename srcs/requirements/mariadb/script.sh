#!/bin/bash

rm -rf /var/lib/mysql/*

mysql_install_db

service mariadb start

sleep 10

mariadb -e "CREATE DATABASE ${CONFIGURATION_DB_NAME};"
mariadb -e "CREATE USER '${CONFIGURATION_DB_USER}'@'%' IDENTIFIED BY '${CONFIGURATION_DB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${CONFIGURATION_DB_NAME}.* TO '${CONFIGURATION_DB_USER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld_safe --user=mysql

