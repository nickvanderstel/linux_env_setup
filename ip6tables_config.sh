#!/bin/bash
# ip6tables configuration script

# -------------- configuration section -----------------
# DROP or REJECT filtered packets
#POLICY=DROP
POLICY=REJECT

# ssh port
SSH_PORT=22

# tcp & udp ports to allow (include ssh port here)
TCP_PORTS=(22 135 139 445)
UDP_PORTS=(137 138 38294)

# ---------- end of configuration section --------------
# flush all rules
ip6tables -F
ip6tables -X

# set default policies
ip6tables -P INPUT DROP
ip6tables -P OUTPUT ACCEPT
ip6tables -P FORWARD DROP

# create new chains
ip6tables -N DROP_SSH
ip6tables -N UDP
ip6tables -N TCP


### input rule chain ###

# default rules to allow established & loopack packets
ip6tables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
ip6tables -A INPUT -i lo -j ACCEPT

# drop invalid/malformed packets
ip6tables -A INPUT -m conntrack --ctstate INVALID -j DROP

# allow pings for proper network operation
ip6tables -A INPUT -p icmpv6 --icmpv6-type echo-request -m conntrack --ctstate NEW -j ACCEPT

# drop all packets from a source that is in the ssh block list
ip6tables -A INPUT -m recent --rcheck --name blocked_ssh6 --rsource -j DROP

# monitor packets headed for the ssh port
ip6tables -A INPUT -p tcp -m tcp --dport ${SSH_PORT} -m state --state NEW -m recent --set --name ssh_watch6 --rsource
ip6tables -A INPUT -p tcp -m tcp --dport ${SSH_PORT} -m state --state NEW -m recent --update --seconds 60 --hitcount 4 --name ssh_watch6 --rsource -j DROP_SSH

# send new tcp and udp packets to their respective rule
ip6tables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP
ip6tables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP

# final rules, reject all other packets
ip6tables -A INPUT -p tcp -j REJECT --reject-with tcp-reset
ip6tables -A INPUT -p udp -j REJECT --reject-with icmp6-port-unreachable
ip6tables -A INPUT -j REJECT --reject-with icmp6-port-unreachable


### output rule chain ###

# allow all outgoing packets
ip6tables -A OUTPUT -j ACCEPT


### forward rule chain ###

# do not allow any packet forwarding
ip6tables -A FORWARD -j DROP


### drop_ssh rule chain ###

# add the source to the permanent block list
ip6tables -A DROP_SSH -m recent --set --name blocked_ssh6 --rsource

# log the blocked source
ip6tables -A DROP_SSH -j LOG --log-prefix "ip6tables ssh block: " --log-level 7

# finally, drop the packet
ip6tables -A DROP_SSH -j DROP


### udp rule chain ###

for OPEN_PORT in ${UDP_PORTS[@]}
do
    ip6tables -A UDP -p udp --dport ${OPEN_PORT} -j ACCEPT
done


### tcp rule chain ###

# open ports for services
for OPEN_PORT in ${TCP_PORTS[@]}
do
    ip6tables -A TCP -p tcp --dport ${OPEN_PORT} -j ACCEPT
done

