#!/bin/bash
# iptables port configuration script

# -------------- configuration section -----------------
# DROP or REJECT filtered packets
#POLICY=DROP
POLICY=REJECT

# ssh port
SSH_PORT=22

# tcp & udp ports to allow (include ssh port here)
TCP_PORTS=(22 80 443) 
UDP_PORTS=(37035)

# ---------- end of configuration section --------------

