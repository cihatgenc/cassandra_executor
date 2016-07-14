#!/bin/bash
set -e

localroot="/usr/local/bin"

which cqlsh

echo "Waiting for cassandra $CASSANDRA_HOST on port $CASSANDRA_PORT to become available"

while ! nc -z $CASSANDRA_HOST $CASSANDRA_PORT; do sleep 2; done


if ! [ -z "$DELAY" ]
 then
	echo "Waiting for $DELAY seconds to execute your actual command"
	sleep $DELAY
fi

exec "$@"

