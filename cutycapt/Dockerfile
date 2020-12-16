FROM docker.io/library/ubuntu:10.04
COPY . /cutycapt
WORKDIR /cutycapt
RUN mv /cutycapt/sources.list /etc/apt/ \
 && apt-get update \
 && apt-get install -y xvfb build-essential libqt4-webkit libqt4-dev g++ \
 && qmake \
 && make

ENTRYPOINT ["/cutycapt/entrypoint.sh"]
