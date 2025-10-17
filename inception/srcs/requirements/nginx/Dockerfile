FROM debian:bookworm

RUN echo "deb http://ftp.us.debian.org/debian/ bookworm main" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install wget -y
RUN apt-get install openssl -y
RUN apt-get install vim -y



# RUN chmod -R 755 /var/www/html

RUN openssl genpkey -algorithm RSA -out nginx.key -pkeyopt rsa_keygen_bits:2048
RUN openssl req -new -x509 -key nginx.key -out nginx.crt -days 365 -subj "/C=US/ST=New York/L=Brooklyn/O=Example Brooklyn Company/CN=www.examplebrooklyn.com"

RUN mv nginx.crt /etc/nginx
RUN mv nginx.key /etc/nginx


COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]

