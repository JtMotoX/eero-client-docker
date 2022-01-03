#!/bin/sh

if [ ! -d "/data" ]; then
	echo "ERROR: You need to include the data volume when you run this container."
	echo "Example: --volume eero-client-data:/data"
	exit 1
fi

if [ ! -f "session.cookie" ]; then
	if [ ! -t 0 ] ; then
		echo "You first need to log in. To do this, please include the '-it' flag in your docker run."
		exit 1
	fi
	python sample.py
fi

CMD="$1"

python sample.py "${CMD}"
