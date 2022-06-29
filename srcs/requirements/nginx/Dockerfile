#SHOULD BE DOING THIS INSIDE VM!!!

FROM alpine:3.14.6

LABEL maintainer="abonnel@student.42lyon.fr"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache nginx \
	&& adduser -D -g 'www' www
	#no need bc nginx already creates a user

#no nead for apk clean (apt-get clean) cmd, alpine does it automatically

#n'expose pas reellement le port, c'est une convention
EXPOSE 443 80

#Has to be in list form to prevent ambiguity with entrypoint,
#when under list form, will be well concatenated
#https://aws.amazon.com/fr/blogs/france/demystifier-entrypoint-et-cmd-dans-docker/
#if ENTRYPOINT is just a string (not a list) then CMD will be ignored
#THERE IS ONLY ONE CMD INSTRUCTION IN A DOCKERFILE
CMD [ "nginx", "-g", "daemon off;"]

#docker run -it -p 80:80 -p 443:443 alpine:latest
#docker exec -ti bf5a5ff4e7a5 /bin/sh
#docker run -ti mynginx /bin/sh
#docker run --name contt -ti mynginx /bin/sh


#check if user www was correctly added / run that cmd inside container
#cat etc/passwd | grep www

#exit nginx container without stopping it : ctrl+p then ctrl+q


#pour utiliser no-cache on peut le mettre au niveau de la commande build :
#docker build --no-cache -t test .

