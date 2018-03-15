# hostapd

## Usage

Default values:

- **INTERFACE**: wlxe84e06137f8e
- **SSID**: virus
- **MODE**: g
- **CHANNEL**: 1
- **COUNTRY**: BR
- **PASSWORD**: %GuSt4v0
- **HIDDEN**: 0 (0 for visible, 1 for hidden)
- **IP**: 10.10.0.1
- **SUBNET_MASK**: 24

```
docker run --net=host --cap-add=NET_ADMIN --name=hostapd -e INTERFACE=wlxe84e06137f8e -e SSID=virus -e PASSWORD=12345678 -e HIDDEN=0 -e IP=10.10.0.1 gustavohenrique/hostapd
```

To quit:

```
docker kill hostapd
```

