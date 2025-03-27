#!/bin/bash

service mariadb start

sleep 5

DB_PASS=$(cat /run/secrets/db_pass)


mariadb -e "CREATE DATABASE ${CONFIGURATION_DB_NAME};"
mariadb -e "CREATE USER '${CONFIGURATION_DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${CONFIGURATION_DB_NAME}.* TO '${CONFIGURATION_DB_USER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop


mysqld_safe --user=mysql

