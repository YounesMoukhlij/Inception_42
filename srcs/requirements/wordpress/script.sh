#!/bin/bash

echo "im sleping"
sleep 40
echo " sleping done "

wp core download --allow-root

wp config create --dbname=$DATA_BASE_NAME --dbuser=$DATA_BASE_USER --dbpass=$DATA_BASE_PASS --dbhost=$db_host --allow-root

wp core install --url=localhost --title=youmoukh --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

/usr/sbin/php-fpm7.4 -F
