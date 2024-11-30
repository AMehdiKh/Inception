
FROM	alpine:latest

RUN		apk update && apk upgrade && apk add --no-cache \
		nginx \
		openssl

RUN		mkdir -p /run/nginx && \
		mkdir -p /etc/nginx/ssl

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:4096 -sha256 \
		-keyout /etc/nginx/ssl/nginx.key \
		-out /etc/nginx/ssl/nginx.crt \
		-subj "/C=MA/ST=Tanger-Tetouan-Hoceima/L=Tetouan/O=1337 Coding School/OU=Inception/CN=ael-khel.42.fr"

COPY	conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE	80

EXPOSE	443

CMD		[ "nginx", "-g", "daemon off;" ]


# docker run -d --name nginx -p 8080:443 nginx_image
# docker build -t nginx_image .
