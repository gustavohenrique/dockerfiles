FROM alpine:edge

LABEL maintainer="gustavo@gustavohenrique.net"

RUN apk add --no-cache curl tor

ADD ./torrc /etc/tor/torrc

EXPOSE 9050

VOLUME ["/var/lib/tor"]

USER root

CMD ["tor"]
