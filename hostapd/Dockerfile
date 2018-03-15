FROM phusion/baseimage:0.10.0
MAINTAINER Gustavo Henrique "gustavo@gustavohenrique.net"

ADD hostapd.sh /usr/bin/hostapd.sh

RUN bash -c 'apt-get update \
 && apt-get install -y iproute2 hostapd iptables \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && chmod +x /usr/bin/hostapd.sh'

CMD ["/usr/bin/hostapd.sh"]
