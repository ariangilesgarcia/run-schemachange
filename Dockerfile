FROM python:3.10-bullseye

RUN pip install schemachange==3.4.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
