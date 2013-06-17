#!/bin/bash
# iptables configuration script

# -------------- configuration section -----------------
# DROP or REJECT filtered packets
#POLICY=DROP
POLICY=REJECT

# ssh port
SSH_PORT=22

# tcp & udp ports to allow (include ssh port here)
TCP_PORTS=(22 80)
UDP_PORTS=()

# ---------- end of configuration section --------------
# flush all rules
iptables -F

# set default policies
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# create new chains
iptables -N DROP_SSH

### input rule chain ###

# first, drop all packets from a source that is in the ssh block list
iptables -A INPUT -m recent --rcheck --name blocked_ssh --rsource -j DROP

# default rules to allow established, loopack & icmp packets
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT

# drop all packets from a source that is in the ssh block list
iptables -A INPUT -m recent --rcheck --name blocked_ssh --rsource -j DROP

# drop all invalid packets
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# monitor packets headed for the ssh port
iptables -A INPUT -p tcp -m tcp --dport ${SSH_PORT} -m state --state NEW -m recent --set --name ssh_watch --rsource
iptables -A INPUT -p tcp -m tcp --dport ${SSH_PORT} -m state --state NEW -m recent --update --seconds 60 --hitcount 4 --name ssh_watch --rsource -j DROP_SSH

# open ports for services
for OPEN_PORT in ${TCP_PORTS[@]}
do
    iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport ${OPEN_PORT} -j ACCEPT
done

for OPEN_PORT in ${UDP_PORTS[@]}
do
    iptables -A INPUT -p tcp -m state --state NEW -m udp --dport ${OPEN_PORT} -j ACCEPT
done

# final rule
iptables -A INPUT -j DROP

### forward rule chain ###

iptables -A FORWARD -j DROP

### drop_ssh rule chain ###

# add the source to the permanent block list
iptables -A DROP_SSH -m recent --set --name blocked_ssh --rsource

# log the blocked source
iptables -A DROP_SSH -j LOG --log-prefix "iptables ssh block: " --log-level 7

# finally, drop the packet
iptables -A DROP_SSH -j DROP

