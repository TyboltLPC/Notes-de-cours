# Cybersécurité

## Glossaire (en vrac) :

+ Trojan (cheval de Troie) = entrer en ce faisant passer pour un autre.
+ Worms (Ver) = Diffusion dans réseau
+ Cyber = (gouvernail, gouvernement) OIV Organisme Importance Vitale (Energie, transport, Politique, Santé, Communication)
+ Backdoor = Porte dérobé, laisse un accès persistant
+ IDS = Intrusion detectives system, remonte des infos qui seront gérées par des humains par la suite
+ IPS = Intrusin preventive system, traitement automatisé par des règles
## IOC (indicateur de compromission)
Elément qui traduise une introduction system (nom de domaine, ip).

### IOC - Complément d'information
+ Below you can find 15 most prominent indicators of compromise.
+ Anomalies found in     Privileged User Activity
+ Red flags found in log-in activity
+ Deviant DNS requests
+ Web traffic with inhuman     behavior
+ Unusual activity in outbound network traffic
+ Geographical abnormalities
+ Increased database read volume
+ Unusual HTML response sizes
+ Changes in mobile device     profiles
+ Signs of DDoS activity
+ Wrongly placed data bundles
+ Conflicting port-application     traffic
+ More requests than usual for the same file
+ Unusual changes in registry and/or system files
+ Abrupt patching of systems

## Qualif OSINT
+ [Virus total](https://www.virustotal.com/gui/home)
+ [Threatminer](https://www.threatminer.org)
+ [Alienvault](https://otx.alienvault.com)
+ [Threatcrow](https://www.threatcrowd.org)
+ [OSINTFramework](https://osintframework.com)
+ [Robtex](https://www.robtex.com)

### Outils
+ tor + proxychains
+ dnsrecon

### Les Phases:
sources: http://www.pentest-standard.org/index.php/PTES_Technical_Guidelines
+ Recon (Intelligence gathering, reconnaissance): peut être active ou passive
  + Active > Prise d'empreinte: pare feu, service web (version), VOIP
  + Passive > Sniffing
+ Analyse vulnerability, anticipation des schéma de défense
