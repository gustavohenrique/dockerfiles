# caddy-docker

A [Docker](http://docker.com) image for [Caddy](http://caddyserver.com). This image includes all addons except *hugo*.


## Getting Started

```
$ docker run -d -v $HOME/Caddyfile:/etc/Caddyfile -v $HOME/.caddy:/root/.caddy -v -v $PWD:/srv -p 80:2015 -p 443:443 --name caddy abiosoft/caddy
```

Caddyfile sample:

```
myapp.mydomain.com {
    proxy / 172.17.0.2 {
        proxy_header Host {host}
    }

    log /var/log/myapp.log
    tls user@email.com
}


static.mydomain.com {
    root /static
    browse
    tls off
    log /var/log/static.log
    cors / {
        origin *
    }
}
```

## License

MIT