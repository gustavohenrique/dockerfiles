#!/bin/sh

chown -R squid:squid /var/cache/squid
chown -R squid:squid /var/log/squid

squid -z && squid -NYCd 1
