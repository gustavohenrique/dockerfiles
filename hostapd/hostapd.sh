#!/bin/bash

mkdir /hostapd 2>/dev/null
cat > /hostapd/hostapd.conf <<EOF
interface=${INTERFACE:="wlxe84e06137f8e"}
ssid=${SSID:="virus"}
hw_mode=${MODE:="g"}
wpa=2
wpa_passphrase=${PASSWORD:="%GuSt4v0"}
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
macaddr_acl=0
wme_enabled=0
ieee8021x=0
eap_server=0
channel=${CHANNEL:=1}
country_code=${COUNTRY:="BR"}
ignore_broadcast_ssid=${HIDDEN:=0}
EOF

ip link set ${INTERFACE} up 2>/dev/null
ip addr flush dev ${INTERFACE} 2>/dev/null
ip addr add ${IP:="10.10.0.1"}/24 dev ${INTERFACE} 2>/dev/null

IP_ADDR=${IP:="10.10.0.1"}
SUBNET=`echo $IP_ADDR | awk -F "." '{print $1"."$2"."$3".0"}'`
MASK=${SUBNET_MASK:=24}

iptables -t nat -D POSTROUTING -s ${SUBNET}/${MASK} ! -d ${SUBNET}/${MASK} -j MASQUERADE > /dev/null 2>&1 || true
iptables -t nat -A POSTROUTING -s ${SUBNET}/${MASK} ! -d ${SUBNET}/${MASK} -j MASQUERADE

hostapd /hostapd/hostapd.conf
