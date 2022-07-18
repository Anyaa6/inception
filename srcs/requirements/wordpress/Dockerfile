FROM alpine:3.14.6

LABEL maintainer="abonnel@student.42lyon.fr"

#CREATE SIMPLE WORDPRESS WITHOUT DATABASE THAT I CAN JUST CONNECT TO ON LOCALHOST
#Un container Docker contenant WordPress + php-fpm (installé et configuré) uniquement sans nginx.
#SO IT MEANS IN ORDER TO HAVE WORDPRESS working, since we do not have nginx INSIDE the container then we should create a network to allow them to connect to each other from the get go otherwise wordpress will not be able to serve us pages without it's proxy/server = nginx

#Deux utilisateurs seront présents dans votre base de données WordPress, l’un d’eux étant le compte Admin. L’username de l’Admin ne devra pas comporter "admin" ou "Admin" (exemples : admin, administrator, administrateur, administratrice, admin-123, etc. ...).

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.8/community" >> /etc/apk/repositories \
	&& apk update \
	&& apk upgrade \
	#beware on tutorial it is not that database=
	&& apk add --no-cache lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml \
	&& sed -i 's/#   include "mod_fastcgi.conf"/    include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf \
	#put this in first file to be executed ? 
	&& apk add nginx openrc \
	&& chmod 775 /run/nginx/ \
	&& openrc \
	&& touch /run/openrc/softlevel \
	#continue wordpress setup
	&& rc-service lighttpd start && rc-update add lighttpd default \
	&& apk add wget php5-mysql mysql mysql-client php5-zlib \
	&& /etc/init.d/lighttpd restart \
	#installing and configuring wordpress
	&& mkdir -p /usr/share/webapps/ \
	&& cd /usr/share/webapps/ \
	&& wget http://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& chown -R lighttpd /usr/share/webapps/ \
	&& ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress \
	#config and start MySql
	&& /usr/bin/mysql_install_db --user=mysql \
	&& /etc/init.d/mariadb start \
	&& rc-update add mariadb default \
	&& /usr/bin/mysqladmin -u root password 'password' 

#Does not expose port, only a convention for letting readers know which ont it is listening to
#EXPOSE 9000

# ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "php-fpm8", "--nodaemonize" ]