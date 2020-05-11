# Ce qui peut être demandé au TSSR

## AD :
+ Création de compte
+ Création GPO
+ Monter lecteur réseau (netuse)(dans SYSVOL)

## GLPI :
+ Création / resolution de tiket

## IPBX :

## FTP:
1.  DROITS chmod (4=read 2=write 1=Exec)

2. Redemarrer les services (exemple:openvpn):
  + systemctl restart openvpn
  + service openvpn restart
  + /etc/init.d openvpn restart
  + invoke-rc.d openvpn restart

## POWERSHELL :
+ syntaxe > verbe+nom+option et valeur
