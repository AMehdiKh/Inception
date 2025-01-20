# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ael-khel <ael-khel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/16 05:26:42 by ael-khel          #+#    #+#              #
#    Updated: 2025/01/17 22:14:07 by ael-khel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Base image
FROM alpine:3.21.2

# Install MariaDB and dependencies
RUN apk update && apk upgrade && apk add --no-cache \
    bash \
    mariadb \
    mariadb-client \
    mariadb-server-utils \
    gosu --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing/

# Healthcheck script to check if the database is ready to use 
ADD https://raw.githubusercontent.com/MariaDB/mariadb-docker/refs/heads/master/11.4/healthcheck.sh /usr/local/bin/

# Init database script to create the database, user and grant all privileges 
COPY ./conf/init-db.sh /init-db.sh

# Create the necessary directories and set the correct permissions 
RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql /usr/local/bin/healthcheck.sh && \
	chmod +x /usr/local/bin/healthcheck.sh /init-db.sh

# Initializes the MariaDB data directory and creates the system tables in the mysql database
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db

# Expose the MariaDB port
EXPOSE 3306/tcp

# Entrypoint to initialize the database
ENTRYPOINT [ "bash", "init-db.sh" ]
