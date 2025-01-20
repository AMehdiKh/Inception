#!/bin/bash

source $DB_CONFIG_FILE

initdb=$(cat <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
DELETE FROM mysql.global_priv WHERE User='';
FLUSH PRIVILEGES;
SHUTDOWN WAIT FOR ALL REPLICAS;
EOF
)

echo "$initdb" > init-db.sql

mariadbd --user=mysql --datadir=/var/lib/mysql --skip-networking=1 --init-file=/init-db.sql

rm -f /init-db.sql

exec mariadbd --user=mysql --datadir=/var/lib/mysql --skip-networking=0 \
	--bind-address=0.0.0.0 --port=3306
