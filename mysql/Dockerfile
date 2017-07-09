FROM alpine
MAINTAINER gustavo@gustavohenrique.net

RUN apk add --update bash mysql mysql-client

ADD my.cnf /etc/mysql/my.cnf
ADD start /start

EXPOSE 3306

VOLUME ["/var/lib/mysql"]
VOLUME ["/run/mysqld"]

CMD ["/start"]
