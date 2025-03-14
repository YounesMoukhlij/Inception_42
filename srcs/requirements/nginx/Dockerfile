FROM debian:bullseye

RUN apt-get update && apt-get install -y sudo nginx openssl

RUN openssl genpkey -algorithm RSA -out /etc/nginx/domain.key

RUN openssl req -new -x509 -key /etc/nginx/domain.key -out /etc/nginx/certif.crt -days \
365 -subj "/C=FR/ST=Paris/L=Paris/O=My Company/OU=Dev/CN=mydomain.com/emailAddress=webmaster@mydomain.com"

COPY nginx.conf /etc/nginx

EXPOSE 80

RUN  mkdir -p /tmp/files/

COPY  NginxScript.sh /tmp/files/NginxScript.sh

RUN  chmod 777 /tmp/files/NginxScript.sh

CMD ["nginx", "-g", "daemon off;"]
