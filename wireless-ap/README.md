# wireless-ap

> Setup a wireless AP using Docker containers in Ubuntu/Mint distros.

## Introduction

You need a wireless adpater that supports AP mode.  
Compatible devices I am sure that works:

- Realtek Semiconductor Corp. RTL8192CU 802.11n WLAN Adapter

Try to identify your wireless adapter and supported modes:

```
iw list
lsusb
```

## Setup

### Changing the NetworkManager configuration

Set the wireless adapter to be unmanaged by NetworkManager adding the mac address and comment the `dnsmasq` line.

```
cat > /etc/NetworkManager/NetworkManager.conf <<EOF
[main]
plugins=ifupdown,keyfile,ofono
#dns=dnsmasq

[ifupdown]
managed=false

[keyfile]
unmanaged-devices=mac:e8:4e:06:13:7f:8e
EOF
```

And restart the service

```
sudo systemctl restart NetworkManager
```

### Running 

#### All-in-one command

Using docker-compose:

```
docker-compose up -d
```

#### dnsmasq

Dnsmasq is a lightweight DNS server.

```
# Create the volumer dir
mkdir ~/.dnsmasq

# It is an example file
cat > $HOME/.dnsmasq/dnsmasq.conf <<EOF
domain-needed
bogus-priv
no-hosts
keep-in-foreground
#no-resolv
expand-hosts
server=8.8.8.8
server=8.8.4.4
address=/gustavohenrique.com/10.0.3.108
EOF

# Running
docker run -d --name dnsmasq --cap-add=NET_ADMIN --net=host -v $HOME/.dnsmasq:/etc/dnsmasq gustavohenrique/dnsmasq
```

#### hostapd

Hostapd (Host access point daemon) is a user space software access point capable of turning normal network interface cards into access points and authentication servers. 

```
docker run --net=host --cap-add=NET_ADMIN --name=hostapd -e INTERFACE=wlxe84e06137f8e -e SSID=virus -e PASSWORD=12345678 -e HIDDEN=0 -e IP=10.10.0.1 gustavohenrique/hostapd
```

#### udhcpd

Udhcpd is a simple dhcp server.

```
# Volume dir
mkdir ~/.udhcpd

# Configuration file
cat > $HOME/.udhcpd/udhcpd.conf <<EOF
start         10.10.0.20
end           10.10.0.100
max_leases    81
interface     wlxe84e06137f8e
opt dns       8.8.8.8 4.2.2.2
opt router    10.10.0.1
opt wins      10.10.0.1
option subnet 255.255.255.0
option domain local
option lease  864000
lease_file    udhcpd.leases
EOF

# Empty leases file
touch ~/.udhcpd/udhcpd.leases

# Run the container
docker run -d --net=host -p 67:67 -p 67:67/udp -p 68:68 -p 68:68/udp --name=udhcpd -v $HOME/.udhcpd:/udhcpd gustavohenrique/udhcpd
```

