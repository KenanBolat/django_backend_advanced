FROM python:3.7-alpine
MAINTAINER "Kenan BOLAT"

ENV PYHONUNBUFFERED 1

COPY requirements.txt /requirements.txt
RUN apk add --no-cache --update postgresql-client
RUN apk add --no-cache --update --virtual .tmp-build-deps  \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps




RUN pip install --upgrade pip
RUN pip install -r /requirements.txt
RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
