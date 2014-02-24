La gestion de parc est une des tâches classique d'un administrateur.
Cela concerne principalement :

* l'inventaire du matériel, des logiciels, périphériques, consommables… ;
* les tickets d'incidents liés à l'infrastructure informatique ;
* les fournisseurs ainsi que les modalités liées à chacun d'entre eux ;
* le prêt et la réservation de matériel.

De nombreux outils existent pour faciliter cette gestion.
Nous nous pencherons sur *GLPI* (Gestion Libre de Parc Informatique)^[<http://www.glpi-project.org/spip.php?lang=fr>]

##Travail demandé
###Installation

Une fois n'est pas coutume, nous allons installer *GLPI* depuis les paquets de la distribution.
Assurez-vous d'avoir un serveur *MySQL* installé avant d'installer *GLPI*

```
apt-get install glpi
```

Après l'installation, les identifiants et mots de passe par défaut sont :

* glpi/glpi pour le compte administrateur ;
* tech/tech pour le compte technicien ;
* normal/normal pour le compte normal ;
* post-only/postonly pour le compte postonly.

Prenez un peu de temps pour vous familiariser avec l'environnement puis ajoutez votre ordinateur à l'inventaire.
Créez au passage toutes les entrées nécessaires à cet ajout.

Complétez avec quelques données relatives au parc informatique simulé : logiciels, fournisseurs…

###Configuration

* Activer le système de tickets. Réaliser des tests en simulant des utilisateurs créant des tickets et des techniciens y répondant ;
* Activer le système de réservation sur du matériel créé précédemment et réservez-le.
* Lire la documentation et trouver le moyen de réaliser de façon (semi-)automatique l'inventaire de l'existant. Tentez l'installation d'un des moyens, depuis les paquets ou non. Si cela fonctionne, réalisez l'inventaire de votre machine.

##Copyright
Ce cours est honteusement pompé sur celui de Lucas \textsc{Nussbaum}, avec son aimable autorisation.
