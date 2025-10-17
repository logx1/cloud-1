FROM debian:bookworm


RUN echo "deb http://ftp.us.debian.org/debian/ bookworm main" > /etc/apt/sources.list


# Install required packages
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    curl \
    wget \
    unzip \
    php8.2 \
    php8.2-fpm \
    php8.2-mysql


# Instal mariadb-client

RUN apt-get install -y mariadb-client


# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Create WordPress directory
RUN mkdir -p /var/www/wordpress

# Download WordPress using WP-CLI



RUN wp core download --path=/var/www/wordpress --allow-root

RUN rm -rf /var/www/wordpress/wp-config-sample.php && rm -rf /var/www/wordpress/wp-config.php

# Set permissions
RUN chown -R www-data:www-data /var/www/wordpress

# Create wp-config.php

WORKDIR /var/www/wordpress

COPY ./conf/start.sh /var/www/wordpress


# RUN wp core config --dbname=wordpress_db --dbuser=wordpress_user --dbpass=wordpress_password --dbhost=mariadb:3306 --dbprefix=wp_ --allow-root


RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

# RUN bash /var/www/wordpress/start.sh


# Start PHP-FPM
CMD ["bash", "/var/www/wordpress/start.sh"]
