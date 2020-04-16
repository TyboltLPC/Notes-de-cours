# SWITCH CISCO
"terminal en root"

## Petits tips utiles
`do`= Exécute la commande comme si on était à la racine  
`?`= Peut sauver la vie .....  
`no`= Faire l'inverse
`end`= Retour racine
## Obtenir des infos
		Switch#show run								(#voir running config)
		Switch#show run | section include interface	(#voir section interface)
		Switch#show vlan
		Switch#show interface trunk
		Switch#show run | section include router
		Switch#show ip route
		Switch#show rn | section include acc*	(info ACL)


## decouvrir interface connecté
`dmesg | grep -i tty`

réponse:
```
[    0.188924] printk: console [tty0] enabled
[    4.251464] systemd[1]: Created slice system-getty.slice.
[22004.954182] usb 1-3: pl2303 converter now attached to ttyUSB0
[23758.701998] pl2303 ttyUSB0: error sending break = -19
[23758.702187] pl2303 ttyUSB0: pl2303 **converter now disconnected from ttyUSB0**
[23762.206213] usb 1-3: pl2303 converter now attached to ttyUSB0
```
## connecter sur interface de la reponse
`screen /dev/ttyUSB0`

## passer en mode "root"
`Switch>enable`


## Vérifier l'install (présence d'un OS)

`show running-config all | include ip routing`
`show running-config | section include interface`
`show conf` ou `show run`

## Créer vlan
`Switch(config)#interface vlan X`

## Lister les vlans
`Switch#show vlan`


## Renommer le Switch
`Switch(config)#hostname XXXXXX`

## Configurer MdP
`XXXXX(config)#enable secret MdPXXXXX`

## passer en config
`Switch#config`	(choix:terminal)  ou `conf t`
## Création vlan
`Switch(config)#vlan XXX`
## Definir nom des vlans
`Switch(config-vlan)#name ******`

## Definir range des vlans
```
Switch(config)#interface range Fa2/0/5-15	(config de la range)
Switch(config)#interface Fa2/0/5	(config de l'interface)
Switch(config-if-range)#switchport mode access
Switch(config-if-range)#switchport access vlan N°
Switch(config-if-range)#exit
```

## Suprimer VlanXX

```
Switch#no vlan XX
Switch#exit
```
## Définir loopback
	Routeur(config)# interface loopback 1
	Routeur(config-if)#ip address XXX.XXX.XXX.XXX 255.255.255.0
## Configurer dhcp

***A VALIDER***
## Configuration du service DHCP sur le Switch
```
Switch(config)#ip dhcp pool VLAN10
Switch(dhcp-config)#network 192.168.10.0 255.255.255.0
Switch(dhcp-config)#default-router 192.168.10.254
Switch(dhcp-config)#dns-server x.x.x.x
Switch(dhcp-config)#exit

Switch(config)#ip dhcp pool VLAN20
Switch(dhcp-config)#default-router 192.168.20.254
Switch(dhcp-config)#network 192.168.20.0 255.255.255.0
Switch(dhcp-config)#dns-server x.x.x.x
Switch(dhcp-config)#exit
```

## Configuration des stations de travail

Les stations de travail PC0 et PC1 sont à configurer en client DHCP. Leurs paramètres IP sont dynamiquement attribués par
le routeur dans cette topologie. À partir du routeur, on peut voir les baux attribués.

`Switch#show ip dhcp binding`

	IP address Client-ID/ Lease expiration Type
	Hardware address
	192.168.10.1 0090.2B12.7E97 -- Automatic
	192.168.20.1 0040.0BA5.6964 -- Automatic
***A VALIDER***

## Vérification configuration actuelle
`Switch#show running-config`

## Sauvegarder la config actuelle dans la config startup
`Switch#copy running-config startup-config` ou `Switch#write memory` ou `Switch#write`

# VTP Virtual Trunck Protocol

## Changer domaine
	SwitchX(vlan)#vtp domain XXXXXX
## Mode server| client | transparent
	SwitchX(vlan)#vtp server #ou
	SwitchX(config)# vtp mode (server | client | transparent)
## Set password
	SwitchX(config)#vtp password XXXXXXX
## Set version
	SwitchX(config)#vtp version 2
## Truncker un switchport
	switch# configure t
	switch(config)#interface GiX/X
	switch(config-if)# switchport mode trunk
Sur GNS (virtuel)

	SwitchX(conf-if)#switchport trunk encapsulation dot1q
## Par range
	switch(config)#interface range GiX/X-Y

# **Routage IP**
# by RIP

## Attribuer adresse IP
	Routeur#conf t
	Routeur(config)# interface Gi 0/0
	Routeur(config-if)#ip address XXX.XXX.XXX.XXX 255.255.255.0

## afficher table routage
	Routeur#show ip route

## Modifier table Routage

	ip route IPDest netmask IPPassage (prochain saut) X(priorité métrique)

## Supprimer table Routage

	no ip route IPDest netmask IPPassage (prochain saut) X(priorité métrique)

## Activer mode debug RIP
	Routeur#debug ip rip
## Configuration RIP
	router(config)#router rip
	router(config-router)#version 2
	router(config-router)#network 10.0.0.0
# by OSPF
	router(config)#router ospf XXX
	router(config-router)#router-id X.X.X.X
	router(config-router)#network 10.10.10.0 255.255.255.252 area 1
	router(config-router)#redistribute connected subnet
	router(config-router)#do show ip ospf neigbor
## partager les connexions
	router(config-router)#redistribute connected subnet
	router(config-router)#redistribute ospfX subnet
# **ACL**
## Créer Acces-list
	Routeur(config)#ip acces-list extended 100
	Routeur(config-ext-nacl)#permit (protocol) (IP source) (netmask) (ip dest) (netmask)
## Appliquer ACL
	Routeur(config)#interface Gi 0/0
	Routeur(config-if)#
## Nommer ACL
	Routeur(config)#ip acces-list extended TOTO
