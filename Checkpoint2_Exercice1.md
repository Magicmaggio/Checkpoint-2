### Q1.1
On exécute la commande ``ping <ip_destinataire>`` ici celle du client 172.16.100.50


Celle ci ne fonctionne pas car le serveur et le client ne sont pas sur le même réseau actuellement. En effet leur masque commun étant en /24 (255.255.255.0), on voit que le troisième octet de leur adresse IP n'est pas le même, ce qui empêche la transmission de l'ICMP.



### Q1.2
Ici, on obtient le nom du client dans les paramètres puis depuis le serveur on exécute la commande ``ping <nomDuClient>`` (ici "Client1"). On observe que l'adresse IPv6 est utilisée ici.


### Q1.3
On désactive l'IPv6 en graphique. On observe ensuite que le ping pas toujours mais cette fois-ci en s'adressant à l'adresse IPv4. Ce qui visiblement ne devrait pas être le cas...


### Q1.4


### Q1.5
La toute première adresse du réseau est réservée pour l'adresse réseau. Ensuite les configurations DHCP peuvent allouer des plages précises pour les matériels qui rejoignent son autorité. Dans notre cas, sur le serveur (qui à le rôle DHCP) nous voyons quand dans la plage 172.16.10.1 - 172.16.10.254, la 'sous-plage' 172.16.10.1 - 172.16.10.19' est exclue pour l'attribution des adresses, donc, notre client recevra la première adresse après cette plage d'exclusion. Ici 172.16.10.20.


### Q1.6



### Q1.7
L'intérêt de passer le réseau en IPv6 est le fait que IPv6 intègre la configuration automatiques des adresses IP et donc facilite la gestion que l'on vient de réaliser.


### Q1.8
Il ne devient pas obsolète mais son rôle est amoindri.
Dans la fenêtre de gauche, au lieu de créer des scopes dans l'onglet IPv4, on fait la configuration dans l'onglet IPv6.


