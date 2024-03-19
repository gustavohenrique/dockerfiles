FROM alpine:3.18

RUN sh -c 'apk add --update wget \
 && wget https://temporal.download/cli.sh \
 && sh cli.sh \
 && mv ~/.temporalio/bin/temporal /usr/local/bin'

ENTRYPOINT "temporal"
