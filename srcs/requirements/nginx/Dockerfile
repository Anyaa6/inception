FROM alpine:3.14.6

LABEL maintainer="abonnel@student.42lyon.fr"

RUN set -ux \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache nginx openssl \
	#Is necessary ? nginx user is created automatically but not www
	&& adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	#saving original conf to nginx.conf.orig
	&& mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig \
	&& mkdir /etc/nginx/sites-available \
	&& mkdir /etc/nginx/sites-enabled
	#no nead for apk clean (apt-get clean) cmd, alpine does it automatically

COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/server.conf /etc/nginx/sites-available/
COPY ./conf/index.html /www/
COPY ./tools/docker-entrypoint.sh /

RUN ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/

#Letting readers know which port it is listening to
EXPOSE 443

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "nginx", "-g", "daemon off;"]