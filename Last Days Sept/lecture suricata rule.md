# Décortiquer rules SURICATA:
___
___
## Rule 1:
### régle:
alert ftp $EXTERNAL_NET any -> $HOME_NET any (msg:"GPL FTP SITE EXEC format string attempt"; flow:to_server,established; content:"SITE"; nocase; content:"EXEC"; distance:0; nocase; pcre:"/^SITE\s+EXEC\s[^\n]*?%[^\n]*?%/smi"; classtype:bad-unknown; sid:2101971; rev:5; metadata:created_at 2010_09_23, updated_at 2010_09_23;)
### traduction:
Alerte avec message "GPL FTP SITE EXEC format string attempt", si il y a une connexion ext vers co maison et qui contient "SITE"; sid n°2101971; version 5 du 23/09/2010
___
## Rule 2:
### régle:
alert http $HOME_NET any -> $EXTERNAL_NET 443 (msg:"ET MALWARE MarketScore.com Spyware SSL Access"; flow: to_server,established; content:"www.marketscore.com"; content:"InstantSSL1"; nocase; reference:url,www.marketscore.com; reference:url,www.spysweeper.com/remove-marketscore.html; reference:url,doc.emergingthreats.net/bin/view/Main/2001563; classtype:policy-violation; sid:2001563; rev:7; metadata:created_at 2010_07_30, former_category ADWARE_PUP, updated_at 2010_07_30;)
### traduction:
Alerte avec message "ET MALWARE MarketScore.com Spyware SSL Access", si connection maison pointe une co externe sur port 443et contient "www.marketscore.com"; content:"InstantSSL1"; nocase; reference:url,www.marketscore.com; reference:url,www.spysweeper.com/remove-marketscore.html; reference:url,doc.emergingthreats.net/bin/view/Main/2001563; sid n°2001563; version 7 du 30/07/2010
___
## Rule 3:
### régle:
alert udp $EXTERNAL_NET 41170 -> $HOME_NET any (msg:"ET P2P Manolito Connection (1)"; dsize:<48; content:"|3d 4a d9|"; depth:3; reference:url,doc.emergingthreats.net/2009097; classtype:policy-violation; sid:2009097; rev:2; metadata:created_at 2010_07_30, updated_at 2010_07_30;)
### traduction:
Alerte avec message "ET P2P Manolito Connection (1)", si connection externe port 41170 se connecte sur quelque chose de co maison et contient "|3d 4a d9|"; sid n°2009097; version 2 du 30/07/2010
