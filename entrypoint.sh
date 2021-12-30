#!/bin/sh

if [ -f "/data/session.cookie" ]; then
	cp "/data/session.cookie" ./session.cookie
else
	python sample.py
	cp ./session.cookie "/data/session.cookie"
fi

CMD="$1"

python sample.py "${CMD}"
