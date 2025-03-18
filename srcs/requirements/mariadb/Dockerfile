FROM debian:11

RUN    apt-get update && apt-get install -y sudo mariadb-server


# Initialize the database and configure users
RUN service mariadb start && \
    mariadb -e "CREATE DATABASE ${DATA_BASE_NAME};" && \
    mariadb -e "CREATE USER '${DATA_BASE_USER}'@'%' IDENTIFIED BY '${DATA_BASE_PASS}';" && \
    mariadb -e "GRANT ALL PRIVILEGES ON ${DATA_BASE_NAME}.* TO '${DATA_BASE_USER}'@'%';" && \
    mariadb -e "FLUSH PRIVILEGES;" && \
    service mariadb stop

EXPOSE 3306

CMD ["mysqld_safe", "--port=3306", "--bind-address=0.0.0.0", "--datadir=/var/lib/mysql"]
