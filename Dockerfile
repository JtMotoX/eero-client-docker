FROM python:3.7-alpine

RUN apk add --no-cache curl

RUN apk add --no-cache jq

RUN pip install --no-cache-dir \
		six \
		&& \
	echo "Finished installing prerequisite modules"

WORKDIR /eero-client
COPY ./eero-client .
RUN rm -f session.cookie
RUN chmod 755 *.py
RUN python ./setup.py install

RUN ln -s /data/session.cookie ./session.cookie

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
