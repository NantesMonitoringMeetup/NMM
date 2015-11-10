# Riemann

Tout sur le [Nantes Monitoring Meetup](http://www.meetup.com/fr/Nantes-Monitoring/) de janvier consacré à [Riemann](http://riemann.io).

## Agenda

* Riemann Crash Course (Arnaud): 15' de présentation rapide de riemann et clojure
* Atelier en binôme
* Rétrospective

## Atelier - Scénario

Quelques pistes de choses à étudier pendant l'atelier:

* installer riemann pour monitorer un parc de machines
    * installation du serveur
    * installation de collectd pour injecter des métriques systèmes
    * installation d'une appli de test pour injecter des métriques applicatives
* utiliser le dashboard pour construire rapidement des pages de supervision
* injection dans d'autres outils: graphite, grafana, influxdb, nagios, <you name it>
* connexion à un canal [slack](https://slack.com/) dédié pour diffusion de notifications (e.g. système up/down, threshold)
* simulation d'incidents, e.g. faire tomber n machines, split-brain dans le cluster...
* configuration de riemann
    * manipulation des streams et événements
    * comment construire et tester un modèle de supervision?
    

## Infrastructure

Quelques outils et scripts pour installer un serveur riemann...

* `riemann`: Un conteneur [docker](http://docker.io) pour exécuter un serveur riemann
* `riemann-dashboard`: un conteneur pour le dashboard, une interface graphique simple utilisant une connexion websockets pour grapher des événements riemann
* `stunnel`: un conteneur pour lancer un serveur [stunnel](https://www.stunnel.org/index.html) afin de protéger les communications entre clients et serveurs riemann
