FROM debian:11

RUN    apt-get update && apt-get install -y sudo mariadb-server

COPY script.sh script.sh

RUN chmod 777 script,sh

CMD ["./script.sh"]
