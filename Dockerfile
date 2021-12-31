FROM python:3.7-alpine

ENV DEBIAN_FRONTEND=noninteractive

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

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
