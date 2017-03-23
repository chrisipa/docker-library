#!/bin/bash

# include parent entrypoint script
source /debian-base.sh

# import trusted ssl certs into JRE default keystore
if [ -d $SSL_TRUSTED_CERTS_FOLDER ]
then
	find $SSL_TRUSTED_CERTS_FOLDER -type f | while read sslCert
	do
		alias=$(basename $sslCert)
		keystore=${JRE_SECURITY_FOLDER}/cacerts

		# ignore any keystore import errors
		keytool -noprompt -storepass changeit -keystore $keystore -import -file $sslCert -alias $alias || true
	done
fi