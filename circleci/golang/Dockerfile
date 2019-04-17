FROM circleci/golang:1.12

ENV DOCKERIZE_VERSION v0.6.1
ENV PROTOC_VERSION 3.7.1

RUN sudo apt-get update \
 && sudo apt-get install -y apt-transport-https postgresql-client \
 && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && sudo tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && wget https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip \
 && unzip protoc-$PROTOC_VERSION-linux-x86_64.zip \
 && sudo mv bin/protoc /usr/local/bin \
 && rm *.zip \
 && go get github.com/onsi/ginkgo/ginkgo \
 && go get google.golang.org/grpc \
 && go get github.com/golang/protobuf/proto \
 && go get github.com/golang/protobuf/protoc-gen-go \
 && wget -qO - https://packages.fluentbit.io/fluentbit.key | sudo apt-key add - \
 && echo "deb https://packages.fluentbit.io/debian/stretch stretch main" | sudo tee /etc/apt/sources.list.d/fluentbit.list \
 && sudo apt-get update \
 && sudo apt-get install -y td-agent-bit \
 && echo "/opt/td-agent-bit/bin/td-agent-bit -c //etc//td-agent-bit/td-agent-bit.conf &" | sudo tee /usr/local/bin/fluentbitd \
 && sudo chmod +x /usr/local/bin/fluentbitd

COPY td-agent-bit.conf /etc/td-agent-bit/


