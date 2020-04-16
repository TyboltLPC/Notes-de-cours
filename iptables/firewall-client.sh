#!/bin/sh
### BEGIN INIT INFO
# Provides:		iptables
# Required-Start:
# Should-Start:
# Required-Stop:
# Should-Stop:
# Default-Start:	2 3 4 5
# Default-Stop:	 	0 1 6
# Short-description:	iptables
# Description: 		Firewall
### END INIT INFO
# start/stop iptables
#
# Author: hypathie <hypathie@debian-facile>
#
##Set up /etc/init.d/firewall-client
case "$1" in
'start')
##Set up firewall-client
# Clear any FILTER existing rules
/sbin/iptables -F
# Delete all User-specified chains
/sbin/iptables -X
#set default policy to DROP
/sbin/iptables -P INPUT DROP
/sbin/iptables -P OUTPUT DROP
/sbin/iptables -P FORWARD DROP
# Allow trafic with DNS server
/sbin/iptables -t filter -A OUTPUT -p udp --dport 53 -m conntrack --ctstate NEW         -j ACCEPT
/sbin/iptables -t filter -A INPUT  -p udp --sport 53 -m conntrack --ctstate ESTABLISHED -j ACCEPT
#Allow trafic on internal network
/sbin/iptables -t filter -A INPUT -i lo -j ACCEPT
/sbin/iptables -t filter -A OUTPUT -o lo -j ACCEPT
#Allow ping to internal network
/sbin/iptables -A OUTPUT -o eth0 -p icmp -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A INPUT -i eth0 -p icmp -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
#Get web
/sbin/iptables -t filter -A OUTPUT -p tcp -m multiport --dports 80,443,8000 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -t filter -A INPUT -p tcp -m multiport --sports 80,443,8000 -m conntrack --ctstate ESTABLISHED -j ACCEPT
#Allow mailing protocols (IMAP and SMTP)
/sbin/iptables -A INPUT -m multiport -p tcp --sport 25,2525,587,465,143,993,995 -m state --state ESTABLISHED -j ACCEPT
/sbin/iptables -A OUTPUT -m multiport -p tcp --dport 25,2525,143,465,587,993,995 -m state --state NEW,ESTABLISHED -j ACCEPT
#Allow cups
iptables -A INPUT -i eth0 -s 192.168.0.0/24 -d 192.168.0.22 -p tcp --dport 631 -m state --state NEW,ESTABLISHED -j ACCEPT
 
iptables -A OUTPUT -o eth0 -s 192.168.0.22 -d 192.168.0.0/24 -p tcp --sport 631 -m state ! --state INVALID -j ACCEPT
#Allow cups from sub-net
/sbin/iptables -A INPUT -i eth0 -s 192.168.1.0/24 -d 192.168.0.22 -p tcp --dport 631 -m state --state NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -A OUTPUT -o eth0 -s 192.168.0.22 -d 192.168.1.0/24 -p tcp --sport 631 -m state ! --state INVALID -j ACCEPT
#Set up a user chain for ssh outgoing 
/sbin/iptables -t filter -N OutGoingSSH
/sbin/iptables -I INPUT -p tcp --dport 22 -j OutGoingSSH
/sbin/iptables -A OutGoingSSH -j LOG --log-prefix '[OUTGOING_SSH] : '
#Set up a user chain for ssh incoming 
/sbin/iptables -t filter -N InComingSSH
/sbin/iptables -I OUTPUT -p tcp --sport 22 -j InComingSSH
/sbin/iptables -A InComingSSH -j LOG --log-prefix '[INCOMING_SSH] : '
#Allow ssh connection from inside to outside
#Change in nexts lines this range ip "192.168.0.0/24" with your internal network
/sbin/iptables -t filter -A INPUT -i eth0 -s 192.168.0.0/24 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -t filter -A OUTPUT -o eth0 -p tcp -m tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
/sbin/iptables -A OUTPUT -o eth0 -p tcp --dport 22 -j ACCEPT
# Allow ssh connection form external to inside
/sbin/iptables -t filter -A OUTPUT -o eth0 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -t filter -A INPUT -i eth0 -s 192.168.0.0/24 -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
echo "set up firewall-client .........> [OK]"
/sbin/iptables-save > /etc/firewall-client
echo "iptables-save > /etc/firewall-client .........> [OK]"
RETVAL=$?
;;
'stop')
# delete any existing rules
/sbin/iptables -t filter -F
/sbin/iptables -t nat -F
/sbin/iptables -t mangle -F
/sbin/iptables -t raw -F
/sbin/iptables -t filter -P INPUT ACCEPT
/sbin/iptables -t filter -P OUTPUT ACCEPT
/sbin/iptables -t filter -P FORWARD ACCEPT
echo "FILTER [ALL RULES .... [FLUSH] ..... POLICY ......> [ACCEPT]"
/sbin/iptables -t nat -P PREROUTING ACCEPT
/sbin/iptables -t nat -P POSTROUTING ACCEPT
/sbin/iptables -t nat -P OUTPUT ACCEPT
/sbin/iptables -t mangle -P PREROUTING ACCEPT
/sbin/iptables -t mangle -P OUTPUT ACCEPT
/sbin/iptables -t mangle -P POSTROUTING ACCEPT
/sbin/iptables -t mangle -P FORWARD ACCEPT
/sbin/iptables -t mangle -P INPUT ACCEPT
/sbin/iptables -t raw -P OUTPUT ACCEPT
/sbin/iptables -t raw -P PREROUTING ACCEPT
echo "ALL TABLES ....[FLUSH] ..... ALL POLICY .......> [ACCEPT]"
RETVAL=$?
;;
'restart')
/sbin/iptables-restore < /etc/firewall-client
echo "/etc/firewall-client ........[OK]"
RETVAL=$?
;;
'status')
/sbin/iptables -L -n --line-numbers
/sbin/iptables -t nat -L -n --line-numbers
RETVAL=$?
;;
*)
echo "Usage: $0 { start | stop | restart | status }"
RETVAL=1
;;
esac
exit $RETVAL