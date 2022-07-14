FROM alpine:3.14.6

LABEL maintainer="abonnel@student.42lyon.fr"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache nginx openssl \
	#Is necessary ? nginx user is created automatically but not www
	&& adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www 

#Need to COPY configuration and +/- index.html
COPY /conf/nginx.conf /etc/nginx/
COPY /conf/index.html /www/

#no nead for apk clean (apt-get clean) cmd, alpine does it automatically

#n'expose pas reellement le port, c'est une convention
EXPOSE 80

#ENTRYPOINT and CMD must be in list format
#https://aws.amazon.com/fr/blogs/france/demystifier-entrypoint-et-cmd-dans-docker/
#THERE IS ONLY ONE CMD INSTRUCTION IN A DOCKERFILE
CMD [ "nginx", "-g", "daemon off;"]

#docker run -it -p 80:80 -p 443:443 alpine:latest
#docker exec -ti bf5a5ff4e7a5 /bin/sh
#docker run -ti mynginx /bin/sh
#docker run --name contt -ti mynginx /bin/sh
#docker image prune -a
#docker container prune

#exit nginx container without stopping it : ctrl+p then ctrl+q

#pour utiliser no-cache on peut le mettre au niveau de la commande build :
#docker build --no-cache -t test .

