FROM alpine

RUN sh -c 'apk add --update --no-cache wget \
 && wget https://temporal.download/cli.sh \
 && sh cli.sh \
 && mv ~/.temporalio/bin/temporal /usr/local/bin/'

CMD ["temporal", "server", "start-dev", "--ip", "0.0.0.0"]
