FROM hypriot/rpi-alpine-scratch

RUN addgroup -S nginx \
	&& adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx

RUN apk update \
	&& apk upgrade \
	&& apk add bash \
	&& apk add nginx \
	&& rm -rf /var/cache/apk/*

VOLUME /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
