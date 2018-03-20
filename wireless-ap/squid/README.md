# squid

## Usage

```
# Create dir
mkdir -p ~/.squid/{cache,log}

# Basic configuration
cat > $HOME/.squid/squid.conf <<EOF
dns_nameservers 10.10.0.1 8.8.8.8

acl localnet src 10.10.0.0/24
acl docker src 172.17.0.0/16

acl SSL_ports port 443
acl Safe_ports port 80          # http
acl Safe_ports port 21          # ftp
acl Safe_ports port 443         # https
acl Safe_ports port 70          # gopher
acl Safe_ports port 210         # wais
acl Safe_ports port 1025-65535  # unregistered ports
acl Safe_ports port 280         # http-mgmt
acl Safe_ports port 488         # gss-http
acl Safe_ports port 591         # filemaker
acl Safe_ports port 777         # multiling http
acl CONNECT method CONNECT

http_access deny !Safe_ports
http_access deny CONNECT !SSL_ports
http_access allow localnet
http_access allow docker
http_access deny all

http_port 3128

coredump_dir /var/cache/squid
logformat webapp_debug %>a %[ui %[un [%tl] "%rm %ru HTTP/%rv" %>Hs %<st "%{Referer}>h" %Ss:%Sh [REQUEST HEADERS: %>h] [RESPONSE HEADERS: %<h]
access_log /var/log/squid/access.log webapp_debug
EOF

# Running
docker run -d --name squid -v $HOME/.squid/squid.conf:/etc/squid/squid.conf:ro -v $HOME/.squid/cache:/var/cache/squid:rw -v $HOME/.squid/log:/var/log/squid:rw -p 3128:3128 gustavohenrique/squid
```

To visualize the logs:

```
docker exec -it squid squidview
```

