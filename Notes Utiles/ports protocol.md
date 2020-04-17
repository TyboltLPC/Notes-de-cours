# Common IP Protocols
*   	ICMP (ping)  
* 6 	TCP  
* 17 	UDP  
* 47 	GRE (PPTP)  
* 50 	ESP (IPSec)  
* 51 	AH (IPSec)  

# Common TCP and UDP Ports
* TCP 	20 	FTP échange de fichiers via FTP (data)  
* TCP 	21 	FTP échange de fichiers via FTP (control)
*       22, pour l'accès à un shell sécurisé Secure SHell, également utilisé pour l'échange de fichiers sécurisés SFTP
* TCP 	23 	Telnet  
* TCP 	25 	SMTP (E-mail)  
* TCP/UDP 	53 	DNS résolution de noms de domaine en adresses IP
* UDP 	67/68 	DHCP (Dynamic IP address configuration)
*       69   pour le TFTP
* TCP 	80 	HTTP (Web)
* ___   88  KERBEROS
* TCP 	110 	POP3 (E-mail)  
* TCP 	119 	NNTP (Newsgroups)
* ___   123   NTP synchronisation de l'horloge : Network Time Protocol   
* TCP 	143 	IMAP4 (E-mail)  
* TCP 	389 	LDAP (Directory service)  
* TCP 	443 	HTTPS (Web SSL)
* ___   465   SMTPS
* ___   500   port utilisé pour le canal d'échange de clés IPsec
* ___   520   RIP
* ___   530   RPC
* ___   636   Utilisation d'une connexion à un LDAP sécurisé par une couche SSL/TLS
* ___   853   DNS SEC
* ___   989   FTPS (Transfert)
* ___   990   FTPS (Control)  
* UDP 	1701 	L2TP (Virtual Private Networks)  
* TCP 	1723 	PPTP (Virtual Private Networks)  
* ___   3306  MYSQL
# Classe d'adresses

* A   1 > 127/8
* B   128 > 191/16
* C   192 > 223/24
* D   224 > 239
* E   240 > 255
# Private and Automatic IP Address Ranges
* A 	10.0.0.0 to 10.255.255.255 (10.0.0.0/8)  
* B 	172.16.0.0 to 172.31.255.255 (172.16.0.0/12)  
* C 	192.168.0.0 to 192.168.255.255 (192.168.0.0/16)  
* APIPA 	169.254.0.0 to 169.254.255.255 (169.254.0.0/16)
