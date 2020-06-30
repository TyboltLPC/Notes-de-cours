Sheet...md

nmap 10.0.0.0/24 -sn (1ere étape +discret donne les machines up)

nmap 10.0.0.0/24 -p 22,21,23,135,80,443,3389,3306,445 -oX /tmp/a.xml -Pn --open (2eme étape vision sur les services)

nmap 10.0.0.0/24 -p 80,443,8080,8443,3389,445 -sV --open -sC -T4 -A -oX /tmp/a.xml   (fingerprinting)

dirb http//..... (énumération de fichiers et sous répertoire sur un site web) marche par brute force avec un dictionnaire
