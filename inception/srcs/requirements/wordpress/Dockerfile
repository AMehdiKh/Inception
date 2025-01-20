# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ael-khel <ael-khel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/16 05:26:50 by ael-khel          #+#    #+#              #
#    Updated: 2025/01/19 18:27:28 by ael-khel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Base image
FROM alpine:3.21.2

# Argument for the WordPress path
ARG WP_PATH

# Install PHP and required extensions needed for WordPress
RUN apk update && apk upgrade && apk add --no-cache \
	php82 \
	php82-fpm \
	php82-mysqli \
	php82-curl \
	php82-dom \
	php82-exif \
	php82-fileinfo \
	php82-pecl-imagick \
	php82-intl \
	php82-xml \
	php82-zip \
	php82-phar \
	php82-pecl-redis

# Download WordPress CLI
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

# Copy the PHP-FPM configuration file
COPY ./conf/php-fpm/www.conf /etc/php82/php-fpm.d/

# Copy the WordPress installation script
COPY ./conf/wp-install.sh /

# Set WordPress CLI and the installation script executable
RUN chmod +x /usr/local/bin/wp /wp-install.sh && ln -s /usr/bin/php82 /usr/bin/php

# Create the WordPress directory and download the WordPress core files
RUN mkdir -p ${WP_PATH} && wp core download --path=${WP_PATH}

# Expose the port 9000
EXPOSE 9000/tcp

# Entrypoint to install WordPress
ENTRYPOINT	[ "sh", "wp-install.sh" ]