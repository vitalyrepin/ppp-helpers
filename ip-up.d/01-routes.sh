#!/bin/bash

# This script is called with the following arguments:
# Arg Name
# $1 Interface name
# $2 The tty
# $3 The link speed
# $4 Local IP number
# $5 Peer IP number
# $6 Optional ``ipparam'' value foo

# Finding out default gateway
DEFAULT_GW=`ip route show 0.0.0.0/0 | grep -oP 'via \K\S+'`

# Getting the IP of a remote server (given to us through ipparam value)
REMOTE_REAL_IP=`getent hosts $6  | awk '{ print $1 }'`

ip route add $REMOTE_REAL_IP via $DEFAULT_GW dev eth0 proto static
ip route del default
ip route add default dev ppp0
