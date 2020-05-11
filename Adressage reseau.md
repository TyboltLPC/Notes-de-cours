# Adressage réseau
réseau de départ > 192.168.30.0/25  

+ Puissance de 2:

  2¹ > 2    > /31  
  2² > 4    > /30  
  2³ > 8    > /29  
  2⁴ > 16   > /28  
  2⁵ > 32   > /27  
  2⁶ > 64   > /26  
  2⁷ > 128  > /25  
  2⁸ > 256  > /24  

+ LAN 1 (120 hôtes):

2⁷=128
et /25 = 255.255.255.128  
adresse réseau:192.168.30.0    
1ere adresse:192.168.30.1    
dernière adresse:192.168.30.126    
broadcast:192.168.30.127    

+ LAN 2 (90 hôtes):

adresse réseau:192.168.30.128  
1ere adresse:192.168.30.129   
dernière adresse:192.168.30.254  
broadcast:192.168.30.255

+ LAN 3 (60 hôtes):

2⁶=64 > 192.168.31.0/26  
adresse réseau: 192.168.31.0  
1ere adresse: 192.168.31.1  
dernière adresse: 192.168.31.62  
broadcast: 192.168.31.63

+ LAN 4 (24 hôtes):

2⁵=32 > 192.168.31.64/27
adresse réseau: 192.168.31.64  
1ere adresse: 192.168.31.65  
dernière adresse: 192.168.31.94  
broadcast: 192.168.31.95  

+ LAN 5 (30 hôtes):

adresse réseau: 192.168.31.96  
1ere adresse: 192.168.31.97  
dernière adresse: 192.168.31.126  
broadcast: 192.168.31.127

+ LAN 6 (20 hôtes):

2⁵ > 192.168.31.128/27
adresse réseau: 192.168.31.128  
1ere adresse: 192.168.31.129  
dernière adresse: 192.168.31.158  
broadcast: 192.168.31.159

+ LAN 7 (20 hôtes):

2⁵ > 192.168.31.160/27
adresse réseau: 192.168.31.160  
1ere adresse: 192.168.31.161  
dernière adresse: 192.168.31.190  
broadcast: 192.168.31.191
