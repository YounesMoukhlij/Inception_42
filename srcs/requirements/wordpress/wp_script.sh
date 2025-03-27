#!/bin/bash

sleep 30



USER_PASSWORD=$(cat /run/secrets/user_pass)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_pass)
DB_PASSWORD=$(cat /run/secrets/db_pass)



wp core download --allow-root

wp config create --dbname=$CONFIGURATION_DB_NAME \
                 --dbuser=$CONFIGURATION_DB_USER \
                 --dbpass=$DB_PASSWORD \
                 --dbhost=$CONFIGURATION_DB_HOST --allow-root

wp core install --url=$WP_SITE_URL \
                --title=$WP_SITE_TITLE \
                --admin_user=$WP_ADMIN_USER \
                --admin_password=$WP_ADMIN_PASSWORD \
                --admin_email=$WP_ADMIN_EMAIL --allow-root
            

wp user create $USER_NAME $USER_MAIL --role=$ROLE --user_pass=$USER_PASSWORD --allow-root


chown -R www-data:www-data /var/www/html
chmod -R 777 /var/www/html

sleep 5

# Install and activate the Redis Object Cache plugin BONUS
wp config set WP_REDIS_HOST $REDIS_HOST --allow-root
wp config set WP_REDIS_PORT $REDIS_PORT --raw --allow-root

cd /var/www/html && sudo -u www-data wp plugin install redis-cache --activate
cd /var/www/html && sudo -u www-data wp redis enable


/usr/sbin/php-fpm7.4 -F
