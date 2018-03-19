FROM alpine:latest
MAINTAINER Gustavo Henrique "gustavo@gustavohenrique.net"

RUN sh -c 'apk --no-cache --update add squid squid-lang-pt alpine-sdk ncurses ncurses-dev \
 && wget http://www.rillion.net/squidview/squidview-0.86.tar.gz \
 && tar zxf squidview-0.86.tar.gz \
 && cd squidview-0.86 \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && cd \
 && rm -rf /squidview*'

ADD squid.sh /usr/bin/squid.sh

EXPOSE 3128

VOLUME ["/var/cache/squid", "/var/log/squid"]

CMD ["/usr/bin/squid.sh"]
