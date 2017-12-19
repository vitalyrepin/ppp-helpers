#!/bin/bash

# This script is called with the following arguments:
# Arg Name
# $1 Interface name
# $2 The tty
# $3 The link speed
# $4 Local IP number
# $5 Peer IP number
# $6 Optional ``ipparam'' value foo


# Getting the IP of a remote server (given to us through ipparam value)
REMOTE_REAL_IP=`getent hosts $6  | awk '{ print $1 }'`

# Finding default gateway based on the gateway for a remote server
DEFAULT_GW=`ip route show $REMOTE_REAL_IP | grep -oP 'via \K\S+'`

ip route del $REMOTE_REAL_IP 
route add default gw $DEFAULT_GW
