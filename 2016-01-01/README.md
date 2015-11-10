# Riemann

Tout sur le [Nantes Monitoring Meetup](http://www.meetup.com/fr/Nantes-Monitoring/) de janvier consacré à [Riemann](http://riemann.io).

## Infrastructure

Quelques outils et scripts pour installer un serveur riemann...

* `riemann`: Un conteneur [docker](http://docker.io) pour exécuter un serveur riemann
* `riemann-dashboard`: un conteneur pour le dashboard, une interface graphique simple utilisant une connexion websockets pour grapher des événements riemann
* `stunnel`: un conteneur pour lancer un serveur [stunnel](https://www.stunnel.org/index.html) afin de protéger les communications entre clients et serveurs riemann
