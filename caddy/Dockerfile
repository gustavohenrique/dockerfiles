FROM alpine
MAINTAINER Gustavo Henrique <gustavo@gustavohenrique.net>

RUN apk add --update openssh-client git tar

RUN mkdir /caddysrc \
 && curl -sL -o /caddysrc/caddy_linux_amd64.tar.gz "https://caddyserver.com/download/build?os=linux&arch=amd64&features=cors&git&ipfilter&jsonp&search" \
 && tar -xf /caddysrc/caddy_linux_amd64.tar.gz -C /caddysrc \
 && mv /caddysrc/caddy /usr/bin/caddy \
 && chmod 755 /usr/bin/caddy \
 && rm -rf /caddysrc \
 && printf "0.0.0.0\nbrowse" > /etc/Caddyfile

RUN mkdir /srv

EXPOSE 2015

WORKDIR /srv

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
