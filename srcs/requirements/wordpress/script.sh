#!/bin/bash

sleep 30

wp core download --allow-root

wp config create --dbname=$CONFIGURATION_DB_NAME \
                 --dbuser=$CONFIGURATION_DB_USER \
                 --dbpass=$CONFIGURATION_DB_PASSWORD \
                 --dbhost=$CONFIGURATION_DB_HOST --allow-root

wp core install --url=$WP_SITE_URL \
                --title=$WP_SITE_TITLE \
                --admin_user=$WP_ADMIN_USER \
                --admin_password=$WP_ADMIN_PASS \
                --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $author_name $author_email --role=contributor --user_pass=$author_pass --allow-root


chown -R www-data:www-data /var/www/html
chmod -R 777 /var/www/html


# Install and activate the Redis Object Cache plugin BONUS
cd /var/www/html && sudo -u www-data wp plugin install redis-cache --activate
cd /var/www/html && sudo -u www-data wp redis enable




/usr/sbin/php-fpm7.4 -F
