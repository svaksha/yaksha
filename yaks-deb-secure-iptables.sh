#!/usr/bin/env bash
################################################################################
# File       : yaks-deb-install.sh
# Description: Bash Installation script for a new Debian-Ubuntu system.
# AUTHOR     : SVAKSHA :: http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA (http://svaksha.com/pages/Bio) AllRightsReserved
# DATES      : Created:2015nov03 - Updated:2015nov03
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# This code is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. Permission is hereby granted, free of charge, to any
# person obtaining a copy of this software, to deal in the Software without
# restriction, including without limitation the rights to use, copy, modify,
# merge, publish, redistribute, and/or sell copies of the Software and use in
# source form, with or without modification, and to permit persons to whom the
# Software is furnished to do so as per the terms in the LICENSE.md file and
# subject to the following conditions being met:
# 1. ALL copies, forks and redistributions of source code AND/OR binary form
#    must retain the above Copyright notice, the Licence file for source code
#    (AGPLv3) along with this permission notice and list of conditions and the
#    following disclaimer, in substantial portions of the Software.
# 2. Neither the name of the COPYRIGHT HOLDER(S) nor the names of its
#    contributors may be used to endorse or promote products derived from this
#    software without specific prior written permission.
################################################################################

# Credits: The amazing Carla Schroder's IPtables script posted on the techtalk list.
# An IPtables firewall script for sharing a cable/DSL Internet connection, with no public services.

#define variables
ipt="/sbin/iptables"
mod="/sbin/modprobe"
LAN_IFACE="eth0"
WAN_IFACE="wlan0"


#load kernel modules
$mod ip_tables
$mod iptable_filter
$mod iptable_nat
$mod ip_conntrack
$mod ipt_LOG
$mod ipt_limit
$mod ipt_state
$mod iptable_mangle
$mod ipt_MASQUERADE

# Flush all active rules and delete all custom chains
$ipt -F
$ipt -t nat -F
$ipt -t mangle -F
$ipt -X
$ipt -t nat -X
$ipt -t mangle -X

#Set default policies
$ipt -P INPUT DROP
$ipt -P FORWARD DROP
$ipt -P OUTPUT ACCEPT
$ipt -t nat -P OUTPUT ACCEPT
$ipt -t nat -P PREROUTING ACCEPT
$ipt -t nat -P POSTROUTING ACCEPT
$ipt -t mangle -P PREROUTING ACCEPT
$ipt -t mangle -P POSTROUTING ACCEPT


#this line is necessary for the loopback interface
#and internal socket-based services to work correctly
$ipt -A INPUT -i lo -j ACCEPT

#Enable IP masquerading
$ipt -t nat -A POSTROUTING  -o $WAN_IFACE -j MASQUERADE

#Enable unrestricted outgoing traffic, incoming
#is restricted to locally-initiated sessions only
$ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -i $WAN_IFACE -o $LAN_IFACE -m state --state
ESTABLISHED,RELATED -j ACCEPT $ipt -A FORWARD -i $LAN_IFACE -o
$WAN_IFACE -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

# Accept ICMP echo-request and time-exceeded
$ipt -A INPUT -p icmp --icmp-type echo-request  -j ACCEPT
$ipt -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
$ipt -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT

#Reject connection attempts not initiated from inside the LAN
$ipt -A INPUT -p tcp --syn -j DROP
