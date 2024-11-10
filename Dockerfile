FROM	alpine:latest

RUN		apk update && apk upgrade && apk add --no-cache \
		nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf

CMD		[ "nginx", "-g", "daemon off;" ]