#!/bin/sh

if [ ! -f $DATA_VOLUME/murmur.ini ]; then
        cp murmur.ini $DATA_VOLUME
fi

if [ "$1" == "default" ]; then
        echo "Starting murmur server"
        exec murmurd -ini /data/murmur.ini -v -fg
else
    echo "Executing command"
    exec "$@"
fi
