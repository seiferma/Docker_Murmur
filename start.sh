#!/bin/sh

USER_NAME=murmur-server
GROUP_NAME=murmur-server

echo "Generating user account"
if [ "$MURMUR_GID" == "" ]; then
	export MURMUR_GID=1000
fi
if [ "$MURMUR_UID" == "" ]; then
	export MURMUR_UID=1000
fi
addgroup -g $MURMUR_GID $GROUP_NAME
adduser -D -H -G $GROUP_NAME -u $MURMUR_UID $USER_NAME
chown $USER_NAME:$GROUP_NAME $DATA_VOLUME

echo "Generating server configuration"
cat /opt/murmur.base.ini | envsubst > /etc/murmur.ini
if [ "$MURMUR_CERT" != "" -o "$MURMUR_KEY" != "" ]; then
	echo "Encryption is enabled."
	cat /opt/murmur.enc.ini | envsubst >> /etc/murmur.ini
fi

if [ "$1" == "default" ]; then
        echo "Starting murmur server"
        su-exec $USER_NAME murmurd -ini /etc/murmur.ini -v -fg
else
	echo "Executing command"
	exec "$@"
fi
