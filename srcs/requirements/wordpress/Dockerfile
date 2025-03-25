FROM debian:11

# Install necessary packages
RUN apt-get update && apt install -y sudo curl php-fpm php-mysql

RUN mkdir  -p /var/www/html
RUN mkdir -p /var/www/.wp-cli
RUN chmod 777  /var/www/.wp-cli/


WORKDIR /var/www/html

RUN  chmod -R 777 /var/www/*

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY wp_script.sh /tmp

RUN mkdir -p /run/php

RUN chmod 777 /tmp/wp_script.sh

RUN chmod 777 /run/php/


CMD ["/tmp/wp_script.sh"]
