### Q.3 1
Le matériel réseau A est un switch/commutateur. Son rôle est de transmettre les trames Ethernet uniquement au destinataire concerné (donc ici l'un des 5 pc entre PC1 et PC5). Dans l'autre sens, il transmettra leurs communications vers l'équipement B (quand son adresse MAC sera appelée).

### Q3.2
Le matériel réseau B correspond à un routeur. Son rôle pour le réseau en 10.10.0.0/16 consiste à rediriger les communications qui entreront par son interface f0/0 vers la route qui lui sera indiquée dans sa table de routage (dans ce cas, la route par défaut vers R2 donc en direction de l'interface g2/0)


### Q3.3
Il s'agit des adresses d'interface de la carte réseau de B. Elles sont au nombre de 2. Il s'agit de conventions de nommage pour les routeurs Cisco.


### Q3.4
Il s'agit de son **CIDR**. C'est-à-dire la taille en bits de son préfixe réseau, correspondant à son masque de sous-réseau.


### Q3.5
C'est l'adresse IP de sa passerelle par défaut, i.e. que s'il souhaite "sortir" du réseau pour ses communications, il devra passer par cette adresse. Elle lui permettra de communiquer vers l'extérieur.





### Q3.6
|                      |      PC1      |      PC2      |      PC5      |
| :------------------- | :-----------: | :-----------: | :-----------: |
| Adresse de réseau    | 10.10.0.0/16  | 10.11.0.0/16  | 10.10.0.0/15  |
| Première adresse     |   10.10.0.1   |   10.11.0.1   |   10.10.0.1   |
| Dernière adresse     | 10.10.255.254 | 10.11.255.254 | 10.11.255.254 |
| Adresse de diffusion | 10.10.255.255 | 10.11.255.255 | 10.11.255.255 |


### Q3.7
PC1 et PC2 ne pourront pas communiquer entre eux, ils ne sont pas sur le même réseau : PC1 est sur 10.10.x.x et PC2 est sur 10.11.x.x, même s'ils ont le même masque de sous-réseau.
En revanche, PC5 est sur un sur-réseau de ceux de PC1 et PC2. Il est capable de communiquer avec PC1 et avec PC2 car ces deux derniers sont sur deux sous-réseaux qui appartiennent à son réseau. Le CIDR étant plus petit, il englobe les deux réseau en /16 étant donné que ceux ci sont entre 10.10.x.x et 10.11.x.x.


### Q3.8
Tous les PC sauf PC2 pourront atteindre 172.16.5.0/24 car pour accéder à ce réseau il faut pouvoir communiquer avec le routeur et avec son interface en 10.10.255.254/16. Ce qui n'est pas le cas pour PC2 dont l'adresse ne fait pas partie du même réseau.


### Q3.9
Aucune. L'adresse IP de l'hôte ne change pas, quel que soit le port du switch sur lequel ce dernier est branché.


### Q3.10
Tout dépendra de notre configuration DHCP. Il peut y avoir un serveur pour chaque réseau (ici 2) qui relayeront à un serveur DHCP qui gèrera les différents sous-réseaux. On pourra alors déterminer les plages de réseaux disponibles, adresses réservées....
En théorie, les ordinateurs obtiendront des configurations IP valides pour leur sous réseau, en fonction des plages qui seront gouvernées par les DHCP.






### Q3.11
L'adresse MAC du matériel qui initialise la communication est : 00:50:79:66:68:03 (nom).
Il s'agit d'une carte réseau dont le nom (n'étant pas indiqué) est sa propre adresse.


### Q3.12
Oui la communication a réussi. Il s'agit d'un ping entre les machines 10.10.4.1 et 10.10.4.2.


### Q3.13
Le request correspond à la carte réseau privée de 10.10.4.1 avec l'adresse MAC : 00:50:79:66:68:00
Le reply à la carte réseau privée de 10.10.4.2 avec l'adresse MAC : 00:50:79:66:68:03


### Q3.14
Il s'agit du protocole ARP. Il permet de relier une adresse IP à une adresse de machine physique donc MAC.


### Q3.15
A a formulé une requête ICMP en direction de l'adresse 10.10.4.2 qui en l'occurrence appartient à B (grâce à ARP). Celui-ci a "répondu" via ICMP aussi à A. Ce qui confirme qu'il peuvent bien communiquer tous les deux.






### Q3.16
L'initialisation de la communication est faite par la carte réseau privée de la machine 10.10.80.3.


### Q3.17
Il s'agit du protocole ICMP. C'est un ping entre deux machines, qui permet de savoir si elles peuvent bien 'communiquer' entre elles.


### Q3.18
Non. Cela n'a pas fonctionné car visiblement les deux machines n'appartiennent pas au même réseau aux vues de leurs adresses IP respectives 10.10.80.3 et 10.11.80.2.


### Q3.19
Cette ligne indique que l'hôte distant n'est pas joignable. C'est l'adresse 10.10.255.254 qui le communique à l'hôte 10.10.80.3 (il s'agit sans doute de l'adresse de la passerelle du réseau de '10.10.80.3')


### Q3.20
A a formulé un ping (ICMP) à destination de l'adresse de B (10.11.80.2), qui n'a pu être atteint...il n'a donc pas vraiment joué de rôle.





### Q3.21
Le matériel source est : 
- carte réseau : ca:01:da:d2:00:1c (nom)
- IP : 10.10.4.2
Le matériel destinataire est :
- carte réseau : ca:03:9e:ef:00:38 (nom)
- IP : 172.16.5.253


### Q3.22
L'adresse MAC source est : ca:01:da:d2:00:1c.
L'adresse MAC destination est : ca:03:9e:ef:00:38.
Comme le préfixe 'ca' est commun, il s'agit peut être du même fabricant...


### Q3.23
Cela dépend du point de capture choisi sur l'infrastructure réseau. Cela peut être au niveau du point d'accès internet, ou au niveau de l'interface de la machine elle-même.
