FROM debian:bullseye

RUN apt-get update && apt-get install -y sudo mariadb-server

COPY t.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY script.sh script.sh

RUN chmod 777 script.sh

CMD ["./script.sh"]
