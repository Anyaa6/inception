#!/bin/sh

#Generate ssl key
echo "Creating SSL key"

openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 100 \
            -nodes \
            -out /etc/ssl/certs/www.crt \
            -keyout /etc/ssl/private/www.key \
			-subj "/C=FR/ST=Rhone/L=Lyon/O=Abonnel corp/OU=IT/CN=www"
			#a changer !!!


exec "$@"
