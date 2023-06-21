FROM python:alpine as base_image

ENV VENV_DIR="/venv"
ENV PATH="${VENV_DIR}/bin:$PATH"
ENV EERO_DIR="/eero-client"
ENV PATH="${EERO_DIR}:$PATH"

###
FROM base_image as builder_image
WORKDIR "${EERO_DIR}"
RUN apk add --no-cache git
RUN git clone -n https://github.com/343max/eero-client.git .
# RUN git checkout 629bc5719a5bc1f87498d6561c88a6393614b172
RUN git checkout master
RUN rm -rf .git
RUN python3 -m venv "${VENV_DIR}"
RUN pip install --upgrade pip
RUN pip install -r ./requirements.txt
RUN pip install .
RUN pip uninstall -y pip setuptools
RUN find "${VENV_DIR}/bin" -name '*ctivate*' -maxdepth 1 -exec rm -f {} \;
RUN find . ! -path "./sample.py" -delete
RUN sample.py --help

###

FROM base_image as final_image
RUN apk add --no-cache curl
RUN apk add --no-cache jq
COPY --from=builder_image "${VENV_DIR}" "${VENV_DIR}"
WORKDIR "${EERO_DIR}"
COPY --from=builder_image /eero-client .
RUN ln -s /data/session.cookie ./session.cookie
COPY --chmod=755 ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
