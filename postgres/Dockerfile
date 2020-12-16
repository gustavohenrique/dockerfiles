FROM postgres:13-alpine
MAINTAINER Gustavo Henrique <gustavo@gustavohenrique.net>

ENV POSTGIS_VERSION 3.0.3

RUN set -ex \
    \
    && apk add --no-cache --virtual .fetch-deps \
        ca-certificates \
        openssl \
        tar \
    \
    && wget -O postgis.tar.gz "https://github.com/postgis/postgis/archive/$POSTGIS_VERSION.tar.gz" \
    && mkdir -p /usr/src/postgis \
    && tar \
        --extract \
        --file postgis.tar.gz \
        --directory /usr/src/postgis \
        --strip-components 1 \
    && rm postgis.tar.gz \
    \
    && apk add --no-cache --virtual .build-deps \
        autoconf \
        automake \
        g++ \
        json-c-dev \
        libtool \
        libxml2-dev \
        make \
        perl \
    \
    && apk add --no-cache --virtual .crypto-rundeps \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
        libressl2.7-libcrypto \
    && apk add --no-cache --virtual .build-deps-testing \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        gdal-dev \
        geos-dev \
        proj4-dev \
        protobuf-c-dev \
    && cd /usr/src/postgis \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && apk add --no-cache --virtual .postgis-rundeps \
        json-c \
    && apk add --no-cache --virtual .postgis-rundeps-testing \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        geos \
        gdal \
        proj4 \
        protobuf-c \
    && cd / \
    && rm -rf /usr/src/postgis \
    && apk del .fetch-deps .build-deps .build-deps-testing

COPY ./anyarray/*.sql /docker-entrypoint-initdb.d/
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
COPY ./additional-db.sh /docker-entrypoint-initdb.d/additional-db.sh
COPY ./update-postgis.sh /usr/local/bin
