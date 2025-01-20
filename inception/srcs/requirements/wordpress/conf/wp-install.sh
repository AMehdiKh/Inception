#!/bin/sh

source $WP_USERS_FILE
source $DB_CONFIG_FILE

cd $WP_PATH

wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" \
	--dbhost="$DB_HOST" --dbprefix="$DB_PREFIX" --force

wp core install --url="https://$DOMAIN_NAME" --title="$WEBSITE_TITLE" \
	--admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" \
	--admin_email="$WP_ADMIN_EMAIL" --skip-email

wp user create "$WP_EDITOR_USER" "$WP_EDITOR_EMAIL" \
	--role=editor --user_pass="$WP_EDITOR_PASS"

wp theme install $WP_THEME --activate --force

exec php-fpm82 --allow-to-run-as-root -F