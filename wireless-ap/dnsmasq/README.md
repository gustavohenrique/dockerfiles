# dnsmasq

## Usage

```
mkdir ~/.dnsmasq
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
docker run -d --name dnsmasq --cap-add=NET_ADMIN --net=host -v $HOME/.dnsmasq:/etc/dnsmasq gustavohenrique/dnsmasq
```
