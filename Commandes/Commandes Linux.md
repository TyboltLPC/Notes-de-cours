# **Commandes LiNUX**
___
___
## Autocompletion ignorer case
`nano /etc/inputrc`
coller "set completion-ignore-case on"
## Lister partitions
`lsblk`
## APT

```
apt --fix-broken install
apt install ****
apt update
apt upgrade
apt full-upgrade
apt dist-upgrade
apt autoremove
```
## ECHO
copier dans un fichier  
`echo 'XXXXXXXXXXX'>blabla.txt`

## WHOAMI
`whoami` => qui suis je?!
## TAR.GZ
Pour archiver et compresser un dossier avec Gunzip:

`tar cvzf mon_archive.tar.gz dossier1/`

Pour extraire une archive tar.gz, tapez :

`tar xvzf mon_archive.tar.gz`

## Gunzip/gzip
`gzip -d <.zip>`

## DD

`dd if=/*xxxxx/*xxxxxx of=/****/****`

`conv=noerror`	pour sauvegarde

`conv=fsync`	pour restauration


# sauvegarde
`dd if=/*xxxxx/*xxxxxx of=/****/**** status=progress conv=noerror`
# save entargz par dd
`dd if=/dev/mm*** conv=noerror | tar > image_debian.img.tar.gz`  

# lister materiel
`lspci`


## Activer SSH au démarrage  
`update-rc.d ssh enable && invoke-rc.d ssh start`

## JOHN
`john wordlist=/usr/share/wordlist/rockyou /chemin/fichieratest.txt`

## Attribuer adresse IP
`ifconfig eth0 192.168.1.10 netmask 255.255.255.0 up`
## Ajouter route
`route add default gw 10.10.10.254`
## Rclone et Google Drive
```
#apt install Rclone
#rclone ifconfig
#rclone mount remote: /chemin/dest --daemon
```
Faire un script et le lancer au démarrage
```
#! /bin/bash
rclone mount XXX:/ j/k/l --daemon
```
Placer le script dans /etc/init.d
