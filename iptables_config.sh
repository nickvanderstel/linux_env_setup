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
iptables -X

# set default policies
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# create new chains
iptables -N DROP_SSH
iptables -N UDP
iptables -N TCP


### input rule chain ###

# default rules to allow established & loopack packets
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT

# drop invalid/malformed packets
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# allow pings for proper network operation
iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT

# drop all packets from a source that is in the ssh block list
iptables -A INPUT -m recent --rcheck --name blocked_ssh --rsource -j DROP

# monitor packets headed for the ssh port
iptables -A INPUT -p tcp -m tcp --dport ${SSH_PORT} -m state --state NEW -m recent --set --name ssh_watch --rsource
iptables -A INPUT -p tcp -m tcp --dport ${SSH_PORT} -m state --state NEW -m recent --update --seconds 60 --hitcount 4 --name ssh_watch --rsource -j DROP_SSH

# send new tcp and udp packets to their respective rule
iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP
iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP

# final rules, reject all other packets
iptables -A INPUT -p tcp -j REJECT --reject-with tcp-rst
iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable
iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable


### output rule chain ###

# allow all outgoing packets
iptables -A OUTPUT -j ACCEPT


### forward rule chain ###

# do not allow any packet forwarding
iptables -A FORWARD -j DROP


### drop_ssh rule chain ###

# add the source to the permanent block list
iptables -A DROP_SSH -m recent --set --name blocked_ssh --rsource

# log the blocked source
iptables -A DROP_SSH -j LOG --log-prefix "iptables ssh block: " --log-level 7

# finally, drop the packet
iptables -A DROP_SSH -j DROP


### udp rule chain ###

for OPEN_PORT in ${UDP_PORTS[@]}
do
    iptables -A UDP -p udp --dport ${OPEN_PORT} -j ACCEPT
done


### tcp rule chain ###

# open ports for services
for OPEN_PORT in ${TCP_PORTS[@]}
do
    iptables -A TCP -p tcp --dport ${OPEN_PORT} -j ACCEPT
done

