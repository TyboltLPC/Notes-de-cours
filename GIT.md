# GIT
---
## Cloner repo
- copier/coller soit le https soit le ssh sur le site github (crer le repo dans le dossier actuel !!!)
- Télécharger et dezipper le repo à l'endroit souhaité

## Commandes de config

    git config --global user.name toto
    git config --global user.email toto@gmail.com

## Commandes de base
    git status	       #check les diffs
    git add -A	       #prend en compte tous
    git pull		   # synchro les diffs

## Commandes d'action
    git commit -m <message de MAJ>
    git push 		   #Pousse les changements


## Connection ssh

- se placer dans /home/user/.shh
- ssh-keygen        #genere cle de base, voir les options pour plus
- choisir un nom et une passphrase (ou pas)
- deux fichiers créer XXXX et XXXX.pub (clé privé et publique)
- afficher la .pub avec cat ~/.ssh/XXXX.pub
- Copier cette clé sur github/Setting/key SSH
