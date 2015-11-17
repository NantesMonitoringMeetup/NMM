
Initialement publié sur https://www.logilab.org/blogentry/2567263


Hier soir je suis allé faire un tour au meetup `"Nantes Monitoring
Meetup #3"
<http://www.meetup.com/Nantes-Monitoring/events/226156602/>`_ à la
Cantine. La présentation principale était sur le glossaire et
vocabulaire du monitoring et aussi sur `livestatus
<http://mathias-kettner.de/checkmk_livestatus.html>`_ qui permet de
requêter un système de monitoring (nagios, shinken, etc.).

Voici quelques liens glanés pour l'occasion de technologies dont nous avons parlé :

* `LQL - The Livestatus Query Language <http://mathias-kettner.de/checkmk_livestatus.html#H1:LQL%20-%20The%20Livestatus%20Query%20Language>`_
* `SIEM Security Information and Event Management
  <https://en.wikipedia.org/wiki/Security_information_and_event_management>`_
* NPM - Network Performance Monitor
* `Canopsis <http://www.canopsis.com/>`_ qui semblerait avoir un bus
  `AMQP <http://www.amqp.org/>`_ (d'ailleurs `shinken semblerait savoir parler à canopsis via ce bus <https://github.com/capensis/canopsis/wiki/Shinken>`_)
* `Mod-Gearman <http://mod-gearman.org/>`_
* `OpenNMS <http://www.opennms.org/>`_
* `OMD - The Open Monitoring Distribution <http://omdistro.org/>`_
* le "Call me Maybe" de `Aphyr <https://aphyr.com/>`_ (stress tests et critiques des bases de données distribuées)
* `Diapos du meetup précédent <http://fr.slideshare.net/CheckMyWebsite/foss-monitoring-in-2015>`_
* `Ceres - Distributable time-series database <https://github.com/graphite-project/ceres>`_ du projet `Graphite <https://github.com/graphite-project>`_ (créé pour palier les limitations de `Whisper <https://github.com/graphite-project/whisper>`_)
* `KairosDB <http://kairosdb.github.io/>`_



À `Logilab <http://www.logilab.fr>`_, nous avons adopté plusieurs de ces
outils pour la supervision de nos services :

* `Shinken (python) <http://www.shinken-monitoring.org/>`_
* `Graphite (python aussi) <http://graphite.readthedocs.org/>`_
* `Grafana <http://grafana.org/>`_
* `Uptime <https://github.com/fzaninotto/uptime>`_
* le tout orchestré par `Salt <http://saltstack.org/>`_ notamment via
  le `Returner
  <https://docs.saltstack.com/en/latest/ref/returners/index.html>`_
  `carbon_return
  <https://docs.saltstack.com/en/latest/ref/returners/all/salt.returners.carbon_return.html>`_
  (cf `Monitoring our websites before we deploy them using Salt
  <https://www.logilab.org/blogentry/288175>`_)

.. image:: https://www.logilab.org/file/2568077/raw/monitoring_salt_shinken_uptime_graphite_grafana.png

Dans nos cartons nous avons des choses comme `Tessera
<http://urbanairship.github.io/tessera/>`_ et `Cabot - monitor and
alert <http://cabotapp.com/>`_

Le prochain meetup aura lieu début janvier et sera sous la forme d'un
atelier autour de `Riemann <http://riemann.io/>`_, qui semble très
prometteur. Inscrivez-vous au `meetup
<http://www.meetup.com/Nantes-Monitoring/>`_ pour ne pas rater la
prochaine date !

.. image:: https://www.pagerduty.com/assets/riemann-logo.png

