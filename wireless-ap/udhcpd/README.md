# udhcpd

## Usage

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

It will usage the default udhcpd.conf if no volume was mapped.

