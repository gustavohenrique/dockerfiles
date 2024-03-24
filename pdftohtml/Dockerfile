FROM golang:1.21-alpine3.18 AS Builder

ENV CGO_ENABLED=1
ENV GOOS=linux
ENV TZ=America/Sao_Paulo
ENV SHELL=/bin/bash

WORKDIR /app
COPY . .

RUN apk add --no-cache \
   poppler-utils=23.05.0-r0 \
   build-base=0.5-r3 \
   bash=5.2.15-r5

ENTRYPOINT ["/usr/bin/pdftohtml"]
