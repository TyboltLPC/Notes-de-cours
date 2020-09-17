# jour7
___
___
## Sources:
- https://doc.emergingthreats.net/bin/view/Main/SidAllocation Sid Allocation
## SELKS
connexion ssh selks-user@172.16.12.99  
connexion web https://172.16.12.99

* check status : `selks-health-check_stamus`

## Régles SURICATA en général
### ACTION
  + Pass   :laisse passé
  + Drop   : détecte et bloque
  + Reject :
  + Alert  :remonte info

### Entête de la régle (header)
+ Protocole
  + tcp, udp, icmp,ip
+ Adresse privé renseignées ($HOME_NET)
+ Adresse publique, le reste ($EXTERNAL_NET)
+ Port
  + any prend tous ([80,443];[3306:3389];[!9009,8080]exclusion)
+ Direction :sens de lecture

### OPTIONS
+ MSG :message inscrit à l'écran
+ Flux          :on zappe
+ Option du lux :on zappe
+ Content :ce que ça contient qui match
+ reference :donne des infos
+ sid
+ rev (numéro de version des régles)
