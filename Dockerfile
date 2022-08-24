FROM alpine/git as eero_client
WORKDIR /eero-client
RUN git clone -n https://github.com/343max/eero-client.git . && \
	git checkout 629bc5719a5bc1f87498d6561c88a6393614b172 && \
	rm -rf .git && \
	chmod 755 *.py

###

FROM python:3.7-alpine as final_image

RUN apk add --no-cache curl

RUN apk add --no-cache jq

RUN pip install --no-cache-dir \
		six \
		&& \
	echo "Finished installing prerequisite modules"

WORKDIR /eero-client
COPY --from=eero_client /eero-client .
RUN python ./setup.py install

RUN ln -s /data/session.cookie ./session.cookie

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
