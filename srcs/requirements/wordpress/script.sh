#!/bin/bash

echo "im sleeping"
sleep 30
echo " sleeping done "



wp core download --allow-root

wp config create --dbname=$CONFIGURATION_DB_NAME \
                 --dbuser=$CONFIGURATION_DB_USER \
                 --dbpass=$CONFIGURATION_DB_PASSWORD \
                 --dbhost=$CONFIGURATION_DB_HOST --allow-root 

wp core install --url=localhost \
                --title=inception42 \
                --admin_user=$WP_ADMIN_USER \
                --admin_password=$WP_ADMIN_PASS \
                --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $author_name $author_email --role=contributer --user_pass=$author_pass --allow-root

/usr/sbin/php-fpm7.4 -F
