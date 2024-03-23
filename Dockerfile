# Use php:7.4-apache as the base image
FROM php:7.4-apache

# Set Apache log directory
ENV APACHE_LOG_DIR /var/log/apache2
# Set PHP log directory
ENV PHP_LOG_DIR /var/log/php

ENV MARIADB_ROOT_PASSWORD password123
ENV DB_NAME ecomdb
ENV DB_USER ecomdb-user
ENV DB_PASSWORD password123


RUN a2enmod env

# Optionally, you can configure Apache to pass all environment variables to PHP
RUN echo "PassEnv *" >> /etc/apache2/apache2.conf


# Install mysqli extension for PHP
RUN docker-php-ext-install mysqli && \
    docker-php-ext-enable mysqli

# Copy the application source code to /var/www/html/
COPY . /var/www/html/

# Expose port 80 to allow traffic to the web server
EXPOSE 80
