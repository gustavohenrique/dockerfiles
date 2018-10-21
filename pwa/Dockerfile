FROM node:10-slim

RUN apt-get update && apt-get install -y openssh-client git tar curl
RUN mkdir -p /app/dist \
 && curl https://getcaddy.com | bash -s personal \
 && npm install -g @vue/cli @vue/cli-service \
 && printf "0.0.0.0\nbrowse" > /etc/Caddyfile

EXPOSE 2015

WORKDIR /app/dist

CMD ["caddy", "--conf", "/etc/Caddyfile"]
