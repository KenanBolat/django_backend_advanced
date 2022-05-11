FROM python:3.7-alpine
MAINTAINER "Kenan BOLAT"

ENV PYHONUNBUFFERED 1

COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt
RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
