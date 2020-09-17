# Décortiquer rules SURICATA:
___
___
## Rule 1:
### régle:
alert ftp $EXTERNAL_NET any -> $HOME_NET any (msg:"GPL FTP SITE EXEC format string attempt"; flow:to_server,established; content:"SITE"; nocase; content:"EXEC"; distance:0; nocase; pcre:"/^SITE\s+EXEC\s[^\n]*?%[^\n]*?%/smi"; classtype:bad-unknown; sid:2101971; rev:5; metadata:created_at 2010_09_23, updated_at 2010_09_23;)
### traduction:
Alerte avec message "GPL FTP SITE EXEC format string attempt", si il y a une connexion en ftp ext vers co maison et qui contient "SITE"et "EXEC"; sid n°2101971; version 5 du 23/09/2010
___
## Rule 2:
### régle:
alert http $HOME_NET any -> $EXTERNAL_NET 443 (msg:"ET MALWARE MarketScore.com Spyware SSL Access"; flow: to_server,established; content:"www.marketscore.com"; content:"InstantSSL1"; nocase; reference:url,www.marketscore.com; reference:url,www.spysweeper.com/remove-marketscore.html; reference:url,doc.emergingthreats.net/bin/view/Main/2001563; classtype:policy-violation; sid:2001563; rev:7; metadata:created_at 2010_07_30, former_category ADWARE_PUP, updated_at 2010_07_30;)
### traduction:
Alerte avec message "ET MALWARE MarketScore.com Spyware SSL Access", si connection maison en http, pointe une co externe sur port 443et contient "www.marketscore.com"; content:"InstantSSL1"; nocase; sid n°2001563; version 7 du 30/07/2010
___
## Rule 3:
### régle:
alert udp $EXTERNAL_NET 41170 -> $HOME_NET any (msg:"ET P2P Manolito Connection (1)"; dsize:<48; content:"|3d 4a d9|"; depth:3; reference:url,doc.emergingthreats.net/2009097; classtype:policy-violation; sid:2009097; rev:2; metadata:created_at 2010_07_30, updated_at 2010_07_30;)
### traduction:
Alerte avec message "ET P2P Manolito Connection (1)", si connection en udp,
externe port 41170 se connecte sur quelque chose de co maison et contient "|3d 4a d9|"; sid n°2009097; version 2 du 30/07/2010
___
___
# Rule 2020 1:
### régle:
alert http $HOME_NET any -> $EXTERNAL_NET any (msg:"ET P2P LimeWire P2P Traffic"; flow:established; content:"LimeWire"; nocase; depth:8; http_user_agent; reference:url,www.limewire.com; reference:url,doc.emergingthreats.net/bin/view/Main/2001808; classtype:policy-violation; sid:2001808; rev:9; metadata:created_at 2010_07_30, updated_at 2019_10_15;)
### traduction:
En cas de co de chez nous vers exterieur en http, affiche:"ET P2P LimeWire P2P Traffic" quand ça contient "LimeWire"
# Rule 2020 2:
### régle:
alert smtp any any -> any any (msg:"ET SMTP Possible ComputerCop Log Transmitted via SMTP"; flow:to_server,established; content:"Subject|3a 20|CCOP|20|"; nocase; fast_pattern; reference:url,www.eff.org/deeplinks/2014/09/computercop-dangerous-internet-safety-software-hundreds-police-agencies; classtype:trojan-activity; sid:2019340; rev:3; metadata:created_at 2014_10_02, former_category CURRENT_EVENTS, updated_at 2019_10_07;)
### traduction:
Peut importe la co en smtp; affiche:"ET SMTP Possible ComputerCop Log Transmitted via SMTP" si ça contient "Subject|3a 20|CCOP|20|"
# Rule 2020 3:
### régle:
alert http $HOME_NET any -> $EXTERNAL_NET any (msg:"ET DELETED Win32/NixScare Stealer CnC Checkin"; flow:established,to_server; content:"POST"; http_method; content:"/gate.php"; http_uri; content:"zipx=UEs"; http_client_body; depth:8; fast_pattern; reference:md5,b04981c338165b27fc2e1e19c9713379; classtype:trojan-activity; sid:2030845; rev:2; metadata:affected_product Windows_XP_Vista_7_8_10_Server_32_64_Bit, attack_target Client_Endpoint, created_at 2020_09_07, deployment Perimeter, former_category MALWARE, malware_family NixScare, performance_impact Low, signature_severity Major, tag Stealer, updated_at 2020_09_09;)
### traduction:
Co d'une adresse renseigné vers exterieur en http, affiche:"ET DELETED Win32/NixScare Stealer CnC Checkin";lorsque ça contient "POST"; http_method" ou "/gate.php"; http_uri" ou "zipx=UEs"; http_client_body"
