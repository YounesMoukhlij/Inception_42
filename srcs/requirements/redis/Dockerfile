FROM   debian:bulleyes

RUN    apt-get update && apt-get install -y redis

RUN sed -i "s/bind 127.0.0.1::1/#bind 127.0.0.1::1/g" /etc/redis/redis.conf


RUN chmod -R 777 /etc/redis/*

RUN  sed -i "s/bind 127.0.0.1::1/#bind 127.0.0.1::1/g" /etc/redis/redis.conf
RUN  sed -i "s|maxmemory <bytes>|maxmemory 100mb/g" /etc/redis/redis.conf

RUN sed -i "s|#maxmemorypolicy noeviction|maxmemorypolicy allkeys-lru|g" /etc/redis/redis.conf
RUN sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis/redis.conf


CMD    ["redis-server"]
