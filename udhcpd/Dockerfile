FROM phusion/baseimage:0.10.0
MAINTAINER Gustavo Henrique "gustavo@gustavohenrique.net"

CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y udhcpd

RUN mkdir /etc/service/udhcpd
ADD udhcpd.sh /etc/service/udhcpd/run
RUN chmod +x /etc/service/udhcpd/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 67
EXPOSE 67/udp
EXPOSE 68
EXPOSE 68/udp

VOLUME /udhcpd
