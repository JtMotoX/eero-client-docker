#!/bin/sh

if [ ! -d "/data" ]; then
	echo "ERROR: You need to include the data volume when you run this container."
	echo "Example: --volume eero-client-data:/data"
	exit 1
fi

if [ -f "/data/session.cookie" ]; then
	cp "/data/session.cookie" ./session.cookie
else
	python sample.py
	cp ./session.cookie "/data/session.cookie"
fi

CMD="$1"

python sample.py "${CMD}"
