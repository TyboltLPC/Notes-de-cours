#!/bin/sh


#IPTABLES RULES BY HYP# 
#######################
# utlisation de la carte Wlan0
#
# listing iptables 
# iptables -n -L -v 
# Vidange des tables
iptables -F 
# Réinitialisation des tables 
iptables -X

# On bloque toutes les connections "robinet fermé"
iptables --policy INPUT DROP
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP

# connections etablies & nouvelles acceptés
iptables -A INPUT -i wlan0 -p all -m state --state ESTABLISHED,NEW,RELATED -j ACCEPT
iptables -A FORWARD -i wlan0 -p all -m state --state ESTABLISHED,NEW,RELATED  -j ACCEPT
iptables -A FORWARD -o wlan0 -p all -m state --state ESTABLISHED,NEW,RELATED  -j ACCEPT
iptables -A OUTPUT -o wlan0 -p all -m state --state ESTABLISHED,NEW,RELATED -j ACCEPT

# Loopback connection
iptables -A INPUT -i lo -j ACCEPT
iptables -A FORWARD -i lo -j ACCEPT
iptables -A FORWARD -o lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#Drop Private Network Address On Public Interface
# iptables -A INPUT -i eth1 -s 192.168.1.0/24 -j DROP
# iptables -A INPUT -i eth1 -s 10.0.0.0/8 -j DROP



# SSH 
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
# specific source et destination 
# iptables -A INPUT -p tcp --dport 22 –s 10.0.0.0/8 –d 192.168.100.101 -j DROP

# Web
iptables -A INPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate ESTABLISHED -j ACCEPT


# MAIL

## imapS
iptables -A INPUT -p tcp --dport 993 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 993 -m conntrack --ctstate ESTABLISHED -j ACCEPT

## SMTP
iptables -A INPUT -p tcp --dport 25 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 25 -m conntrack --ctstate ESTABLISHED -j ACCEPT



# ICMP (Ping)
iptables -A INPUT -i wlan0 -p icmp -j ACCEPT
iptables -A OUTPUT -o wlan0 -p icmp -j ACCEPT
iptables -A FORWARD -i wlan0 -p icmp -j ACCEPT
iptables -A FORWARD -o wlan0 -p icmp -j ACCEPT
 
# IRC 
iptables -A INPUT -p tcp --sport 6667  -j ACCEPT
iptables -A INPUT -p udp --sport 6667 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 6667 -j ACCEPT 
iptables -A OUTPUT -p udp --sport 6667 -j ACCEPT

# SMB - serveur 
iptables -A INPUT -p tcp -m multiport --dport 139,445 -j ACCEPT
iptables -A INPUT -p udp -m multiport --dport 139,445 -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --sport 139,445 -j ACCEPT
iptables -A OUTPUT -p udp -m multiport --sport 139,445 -j ACCEPT

# TOR 
iptables -A INPUT -p tcp --sport 9001 -j ACCEPT
iptables -A INPUT -p udp --sport 9001 -j ACCEPT
iptables -A FORWARD -i wlan0 -p tcp --sport 9001 -j ACCEPT
iptables -A FORWARD -o wlan0 -p tcp --dport 9001 -j ACCEPT
iptables -A FORWARD -i wlan0 -p udp --sport 9001 -j ACCEPT
iptables -A FORWARD -o wlan0 -p udp --dport 9001 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 9001 -j ACCEPT
iptables -A OUTPUT -p udp --dport 9001 -j ACCEPT

iptables -A INPUT -p tcp --sport 9050 -j ACCEPT
iptables -A INPUT -p udp --sport 9050 -j ACCEPT
iptables -A FORWARD -i wlan0 -p tcp --sport 9050 -j ACCEPT
iptables -A FORWARD -o wlan0 -p tcp --dport 9050 -j ACCEPT
iptables -A FORWARD -i wlan0 -p udp --sport 9050 -j ACCEPT
iptables -A FORWARD -o wlan0 -p udp --dport 9050 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 9050 -j ACCEPT
iptables -A OUTPUT -p udp --dport 9050 -j ACCEPT


# Blocage de tout le trafic (Entrant, sortant , naté)
iptables -A INPUT -j DROP
iptables -A FORWARD -j DROP
iptables -A OUTPUT -j DROP

##### SECURITY ##### Utilisatble en partie avec iptables 2.4.0

# Log and Drop Packets
# By default everything is logged to /var/log/messages file:
# tail -f /var/log/messagesgrep --color 'IP SPOOF' /var/log/messages

# iptables -A INPUT -i eth1 -s 10.0.0.0/8 -j LOG --log-prefix "IP_SPOOF A: "
# iptables -A INPUT -i eth1 -s 10.0.0.0/8 -j DROP

# Protection against port scanning
#iptables -N port-scanningiptables -A port-scanning -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s --limit-burst 2 -j RETURNiptables -A port-scanning -j LOG --log-prefix "SCAN_A: "
#iptables -N port-scanningiptables -A port-scanning -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s --limit-burst 2 -j RETURNiptables -A port-scanning -j DROP

#SSH brute-force protection

#iptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW -m recent --setiptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 10 -j LOG --log-prefix "SSH_Brute-force A: "
#iptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW -m recent --setiptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 10 -j DROP

#Syn-flood protection


#iptables -N syn_floodiptables -A INPUT -p tcp --syn -j syn_floodiptables -A syn_flood -m limit --limit 1/s --limit-burst 3 -j RETURN
#iptables -A syn_flood -j DROPiptables -A INPUT -p icmp -m limit --limit  1/s --limit-burst 1 -j ACCEPT
#iptables -A INPUT -p icmp -m limit --limit 1/s --limit-burst 1 -j LOG --log-prefix "PING-DROP: "
#iptables -A INPUT -p icmp -j DROPiptables -A OUTPUT -p icmp -j ACCEPT

#Mitigating SYN Floods With SYNPROXY
# iptables -t raw -A PREROUTING -p tcp -m tcp --syn -j CT --notrack
# iptables -A INPUT -p tcp -m tcp -m conntrack --ctstate INVALID,UNTRACKED -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
# iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

#Block New Packets That Are Not SYN

# iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
# iptables -t mangle -A PREROUTING -p tcp ! --syn -m conntrack --ctstate NEW -j DROP

# Force Fragments packets check

# iptables -A INPUT -f -j DROP

# XMAS packets
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j LOG --log-prefix "XMAS_PACKETS:"
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

#Drop all NULL packets

iptables -A INPUT -p tcp --tcp-flags ALL NONE -j LOG --log-prefix "NULL_Packets"
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

#Block Uncommon MSS Values

iptables -t mangle -A PREROUTING -p tcp -m conntrack --ctstate NEW -m tcpmss ! --mss 536:65535 -j LOG --log-prefix "Uncommon MSS Values"
iptables -t mangle -A PREROUTING -p tcp -m conntrack --ctstate NEW -m tcpmss ! --mss 536:65535 -j DROP

#Block Packets With Bogus TCP Flags

iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,ACK FIN -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,URG URG -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,PSH PSH -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL ALL -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,PSH,URG -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL SYN,FIN,PSH,URG -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP

#Block Packets From Private Subnets (Spoofing)
#
#_subnets=("224.0.0.0/3" "169.254.0.0/16" "172.16.0.0/12" "192.0.2.0/24" "192.168.0.0/16" "10.0.0.0/8" "0.0.0.0/8" "240.0.0.0/5")for _sub in "${_subnets[@]}" ; do  iptables -t mangle -A PREROUTING -s "$_sub" -j DROPdoneiptables -t mangle -A PREROUTING -s 127.0.0.0/8 ! -i lo -j DROP


/sbin/iptables-save > /root/iptables-works-`date +%F`
