FROM debian:bullseye

RUN apt-get update && apt-get install -y sudo nginx openssl

RUN openssl genpkey -algorithm RSA -out /etc/nginx/youmoukh.key

RUN openssl req -new -x509 -key /etc/nginx/youmoukh.key -out /etc/nginx/youmoukh.crt -days \
365 -subj "/C=GR/ST=Berlin/L=Berlin/O=CC LTD/OU=Data/CN=youmoukh@42.fr/emailAddress=youmoukh@42.fr"

COPY nginx.conf /etc/nginx


CMD ["nginx", "-g", "daemon off;"]
