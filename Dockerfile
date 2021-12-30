FROM python:3.10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y \
		jq \
		&& \
	rm -rf /var/lib/apt/lists/*

RUN pip install \
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
