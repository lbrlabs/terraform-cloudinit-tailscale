#!/bin/sh
echo "set required IP forwarding kernel values
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1
