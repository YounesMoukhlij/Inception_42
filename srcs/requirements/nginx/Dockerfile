FROM debian:bullseye

RUN apt-get update && apt-get install -y sudo nginx openssl

RUN openssl genpkey -algorithm RSA -out /etc/nginx/youmoukh.key

RUN openssl req -new -x509 -key /etc/nginx/youmoukh.key -out /etc/nginx/youmoukh.crt -days \
365 -subj "/C=GR/ST=Berlin/L=Berlin/O=CC LTD/OU=Data/CN=tempsite.com/emailAddress=tempemail@gmail.com"

COPY nginx.conf /etc/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
