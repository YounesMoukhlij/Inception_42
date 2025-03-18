FROM debian:11

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    sudo \
    curl \
    iputils-ping \
    php7.4 \
    php7.4-fpm \
    php7.4-cli \
    php7.4-mysqli \
    && rm -rf /var/lib/apt/lists/*

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Set up WordPress directory
RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Download WordPress core
WORKDIR /var/www/html
RUN sudo -u www-data wp core download --path=/var/www/html

# Copy configuration files
COPY www.conf /etc/php/7.4/fpm/pool.d/
COPY wp-config.php /tmp/
RUN mv /tmp/wp-config.php /var/www/html/

# Replace placeholders in wp-config.php with build arguments
RUN sed -i 's/CHNAME/'$CONFIGURATION_DB_NAME'/' /var/www/html/wp-config.php && \
    sed -i 's/CHUSER/'$CONFIGURATION_DB_USER'/' /var/www/html/wp-config.php && \
    sed -i 's/CHPASS/'$CONFIGURATION_DB_PASSWORD'/' /var/www/html/wp-config.php && \
    sed -i 's/CHHOST/'$CONFIGURATION_DB_HOST'/' /var/www/html/wp-config.php

# Install WordPress
RUN wp core install --url=localhost --title=$WP_SITE_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

# Create additional WordPress user
RUN wp user create ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PASSWORD} --allow-root


# Create PHP-FPM run directory
RUN mkdir /run/php

# Expose PHP-FPM port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.4", "-F"]
