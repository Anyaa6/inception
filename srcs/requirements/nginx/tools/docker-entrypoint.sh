#!/bin/sh

#Generate ssl key
openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 100 \
            -nodes \
            -out /etc/ssl/certs/www.crt \
            -keyout /etc/ssl/private/www.key \
			-subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$COMMON_NAME"

exec "$@"
