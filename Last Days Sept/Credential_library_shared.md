# Pré requis pour la réalisation du scénarios

Avoir une machine Kali linux (vm possible) fonctionelle
Avoir installé Wireguard (voir doc associé) avec les différents fichiers VPN (wg [numero du pmx])


# Credential library 

pmx[numero du srv dédié].analystlpc.tech

# Step 0 

Comprendre l'architecture réseau 

chaque pmx prend un numéro
celui-ci se retrouve donc dans le sous domaine a analystlpc.tech 
par exemple 

pmx[1].analystlpc.tech 

Pour des raisons de facilités de réplication nous avons choisi de garder le numero du pmx dans la structure des adresses réseaux 

Exemple sur le pmx1
() numéro du vmbr
[] numéro du pmx


pmx1.analystlpc.tech dispose de quatres interfaces réseau 
VMBRO ip extérieure
VMBR1 172.16.(1)[1].0
VMBR2 172.16.(2)[1].0
WG0 10.0.1[1].0


Donc a chaque nouveau pmx les ip seront differentes. 

# Step 1 

Installation de Wireguard sur le poste client à l'instar de la dernière session SIMPLON (Effectué par l'ensemble de la promo)
apt install wireguard wireguard-tools linux-headers-$(uname -r)

Aller récupérer le fichier template sous le pmx[].analystlpc.tech en question

Récuparation du fichier autogénéré wg0 (côté apprenants )ou tech(côté formateur) sur l'arbre d'arborescence suivant 

/root/wg_config_file/
├── student
│   └── wg2.conf
└── tech
    └── wg2.conf

pour le pmx 2 fichier tech accès VPN   cela nous donne : 

[Interface]
Address = 10.0.12.3
PrivateKey = AEi4H8eY+QwD2otkktqrEqQkFzGa9GV2eFAsMkxiS2Q=

[Peer]
PublicKey = NN/+Cecvk/TfzwN1bIJyn09oYWo+H8GoYp3+eqhMkzU=
Endpoint = pmx2.analystlpc.tech:51820
AllowedIPs = 10.0.12.0/24, 172.16.12.0/24, 172.16.22.0/24
PersistentKeepalive = 25




copié-coller le template sur sont espace local dans /etc/wireguard/ (pour démarrer le service vpn)

Si le service vpn ne démarre aucune des routes ne sera faites et les scénars ne seront pas réalisable. 
Déjà vérifié techniquement en amont avec MathieuB

SELKS OK
MISP OK (faire un enregistrement dans ton /etc/hosts de l'ip de la MISP pour avoir un misp.local)
Metasploitble 1 NOK (remplacement à prévoir )
Metasploitable 2 OK (non accomplie à ce jour - je finirais en août)
Metasploitable 3 OK (information permettant de rebondir sur la Win SAFE)
WEB OK (faire un enregistrement de wordpress.local dans ton /etc/hosts)
WIN Safe OK 
Win Poor OK 


# Step 2 

Se faciliter l'accès aux différentes machines du lab 

copie de sa clé ssh 

ssh-copy-id -i /root/.ssh/id_rsa.pub  ssh-copy

Cela permet de prendre la main sur les outils comme SELKS 



Faire un ping sur chaque plage réseau pour notament les vmbr1 et vmbr2 respectifs 

# Step 3 

## Les crédentials sur les users 

### Proxmox 

accès Web : 

https://pmx[2].analystlpc.tech:8006


pve_users:
  - { user: 'formateur@pve', password: 'UtBSjvKNMjHTeGyuTT9C', privileges: 'Administrator'}
  - { user: 'apprenant@pve', password: 'WEaoVUi9npzKfzZX8BrZ', privileges: 'PVEVMUser'}




ssh possible 


## Machine SELKS 
SELKS disponible sur l'ip 172.16.1[1].99

 user: selks-user
 mdp : selks-user

version 6 
no desktop 


ssh disponible

Elasticsearch (par l'interface graphique attendre que selks soit vert)est long à démarrer mais si jamais des services avait du mal à se relancer 
 voici la doc de référence 

# COMMANDE A NE SURTOUT PAS FAIRE (plante les dashboards)
**selks-upgrade_stamus || apt update && apt upgrade **


La montée en version de kibana n'est pas encore bonne !


(https://github.com/StamusNetworks/SELKS)[SELKS-Guide]
(https://github.com/StamusNetworks/SELKS/wiki)[User-Documentation]

Port mirroring actif sur le serveur dédié vers l'ip de la SELKS

Le Full Packet Capture est activé et celui-ci est géré avec Moloch 
Une rotation de 1880 minutes pour 10 fichiers de 20G0

CPU 8 
RAM 32 Go 

les fichiers suivants ont été modifiés

Interface Réseau  - ens18  
/etc/suricata/suricata.yaml 

allocation de la RAM pour les elasticsearch et logstash. 
/etc/elasticsearch/jvm.option
/etc/logtsash/jvm.option


https://github.com/StamusNetworks/SELKS/wiki/First-time-setup#first-time-setup

## Kali

user kalif
mdp Kalif1337

ip 172.16.(2)[1].100/24 
gateway 172.16.21.1
DNS 9.9.9.9

## MISP 

voir console  directement les liens sont créées au démarrage

Génération de l'iso

[https://github.com/MISP/misp-book](USER GUIDE MISP OFFICIAL)
[https://github.com/MISP/MISP/tree/2.4/INSTALL](INSTALLATION GUIDE MISP OFFICIAL)

pensez à modifier votre /etc/hosts pour misp.local


### MISP ACCES normal 

admin@admin.test Tardigrad@1337

https://172.16.11.110

### MISP Modules 

(no-credentials)
https://172.16.11.110:6666

### MISP dashboard 

(no-credentials)
http://172.16.11.110:8001

### Viper Web

https://172.16.11.110:8888

### Jupiter Dashboard 

http://172.16.11.110:8889

### Serveur WeB

root : SerialKiller

web-user : WebWeb

Suite d'outils pour effectuer de l'analyse de log

lnav 
auditd
lynis 
rkhunter
chkrootkit
suite clamav

### Windows 10 

En DHCP récupérer leurs ip par la kali . 

Coralie ilfebo
Fleurs86

Michel Henton
D@vidson




