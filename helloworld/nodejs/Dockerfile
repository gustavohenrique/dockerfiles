FROM alpine
MAINTAINER Gustavo Henrique <gustavo@gustavohenrique.net>

COPY app/ /app/

RUN sh -c 'apk add --update nodejs nodejs-npm vim curl \
 && adduser -D hello'

USER hello
EXPOSE 3000
WORKDIR /app

CMD ["npm", "start"]
