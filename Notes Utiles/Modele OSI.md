# Modéle OSI

## Couches:

- 7- Application: fournit services aux utilisateur, la couche la plus proche de l'utilisateur. (Protocoles: HTTP/HTTPS ; SMTP ; IMAP ; POP)
- 6- Présentation: formate le message; cryptage, compression (Protocoles: SSL ; TLS)
- 5- Session: Ouverture/Fermeture de session, définit la communication
  - simplex       >1 seul sens
  - Half duplex   >bidirectionnel alterné
  - Full duplex   >bidirectionnel simultané
- 4- Transport: utilisation des ports,transporte les messages (Protocoles: UDP ; TCP)
- 3- Réseaux: adressage et routage (Protocoles: IPv4/IPv6 ; RIP ; OSPF ; ICMP)
- 2- Liaison de donnée: s'occuper de la communication en local (Protocoles: ARP)
- 1- Physique: transporte les signaux en signaux électriques, les câblages, wifi

## Nom du message transportées (PDU):

- DATA couches 7 6 5
- SEGMENT couche 4
- PAQUET couche 3
- TRAME couche 2
- BIT couche 1

# Modéle TCP/IP

## Couches:

- Application
- transport
- Internet/Réseau
- Accès réseau

## Nom du message transportées (PDU):

- DATA couches Application
- SEGMENT couche transport
- PAQUET couche Internet/Réseau
- TRAME couche Accès réseau
