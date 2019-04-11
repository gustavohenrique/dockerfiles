#!/bin/sh -eux

mkdir -p /docs
mkdir -p /aglio
mv /tmp/aglio-wrapper.sh /usr/local/bin/

apt-get update

BUILD_PKGS="autoconf automake bzip2 file g++ gcc git imagemagick libbz2-dev libc6-dev libcurl4-openssl-dev libevent-dev libffi-dev libgeoip-dev libglib2.0-dev libjpeg-dev liblzma-dev libmagickcore-dev libmagickwand-dev libmysqlclient-dev libncurses-dev libpng-dev libpq-dev libreadline-dev libsqlite3-dev libssl-dev libtool libwebp-dev libxml2-dev libxslt-dev libyaml-dev make patch xz-utils zlib1g-dev"
apt-get install -y --no-install-recommends $BUILD_PKGS

AGLIO_VERSION="2.3.0"
npm install -g aglio@$AGLIO_VERSION

# Install themes
npm install -g aglio-theme-onlicar
npm install -g aglio-theme-dlio
npm install -g aglio-theme-peperoncino


# remove installation dependencies
apt-get -y purge $BUILD_PKGS
apt-get -y clean
apt-get -y autoremove
rm -rf /var/lib/apt/lists/* /root/.npm /tmp/npm*

