#!/bin/bash
if [ ! -f "/udhcpd/udhcpd.conf" ]; then
    echo "[warning] Configuring udhcpd.conf with default values"
    cp /etc/udhcpd.conf /udhcpd/udhcpd.conf
fi
/usr/sbin/udhcpd -f /udhcpd/udhcpd.conf
