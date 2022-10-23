#!/bin/sh

echo "Generating server configuration"
cat /opt/murmur.base.ini | envsubst > /etc/murmur.ini
if [ "$MURMUR_CERT" != "" -o "$MURMUR_KEY" != "" ]; then
	echo "Encryption is enabled."
	cat /opt/murmur.enc.ini | envsubst >> /etc/murmur.ini
fi

if [ "$1" == "default" ]; then
        echo "Starting murmur server"
        su-exec murmur murmurd -ini /etc/murmur.ini -v -fg
else
    echo "Executing command"
    exec "$@"
fi
