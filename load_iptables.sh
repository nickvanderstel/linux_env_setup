#!/bin/bash

### load ipv4 rules ###
echo "Loading IPv4 iptables rules..."
sh ./iptables_config.sh

### load ipv6 rules ###
if [ -e /proc/net/if_inet6 ]
then
    echo "Loading IPv6 iptables rules..."
    sh ./ip6tables_config.sh
else
    echo "IPv6 not supported, skipping ip6tables."
fi

echo "Complete"

