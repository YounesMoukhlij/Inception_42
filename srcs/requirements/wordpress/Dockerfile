FROM debian:11

# Install necessary packages
RUN apt-get update
RUN apt install -y curl php-fpm php-mysql


RUN mkdir -p /var/www/html
WORKDIR /var/www/html

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp


COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY script.sh /tmp

RUN chmod +x /tmp/script.sh

RUN mkdir -p /run/php



CMD ["/tmp/script.sh"]
