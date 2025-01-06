
FROM alpine:latest

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

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

RUN chmod +x /usr/local/bin/wp && ln -s /usr/bin/php82 /usr/bin/php

RUN wp core download --skip-content --path=/var/www/

EXPOSE 9000

ENTRYPOINT [ "php-fpm82", "--allow-to-run-as-root", "-F" ]