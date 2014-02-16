##Travail demandé
###Utilisation
####Minimum légal
 

Posez votre clé SSH sur le compte par défaut.

**Clic sur l'icône du compte (en haut à droite) > Edit profile settings > SSH keys > Add SSH key**

Créez un autre utilisateur que celui par défaut.

**Clic sur l'icône avec des engrenages > Users > New User**

Ouvrez un autre navigateur ou une nouvelle fenêtre en mode privé^[Ctrl+Shift+P dans Firefox], loguez-vous avec ce nouvel utilisateur et posez-y une autre clé SSH.

Créez un groupe contenant les deux utilisateurs.

**Clic sur l'icône avec des engrenages > Groups > New group**

####Création de dépôts^[Projets, dans la terminologie *GitLab*]
 

Pour chacun des utilisateurs et pour le groupe :

* créez un projet public ;

**Clic sur l'icône avec le « + » > choisir la visibilité Public**

* créez un projet protégé (seuls les utilisateurs loggés pourront le cloner) ;

**Clic sur l'icône avec le « + » > choisir la visibilité Internal**

* créez un projet privé.

**Clic sur l'icône avec le « + » > choisir la visibilité Private**

Vérifiez avec les différents utilisateurs et une autre fois sans être logué les accès aux différents projets.
Essayez d'en cloner et de pusher (clonez par les protocole HTTP pour éviter les conflits de clés SSH).

####Utilisation des outils disponibles
 

Choisissez un projet public ou protégé d'un des deux utilisateurs et effectuez les actions suivantes :

* créez une ou deux pages de wiki ;

**Dans le dashboard, choisir un projet > Wiki**

* activez les *snippets*^[Bouts de code publiés sur une page, à la pastebin] publics et créez-en un ;

**Dans le dashboard, choisir un projet > Settings > cocher les snippets**

* activez le mur et postez-y un ou deux messages ;

**Dans le dashboard, choisir un projet > Settings > cocher le wall**

* créez un rapport de *bug* ;

**Dans le dashboard, choisir un projet > Issues > New Issue**

* avec l'autre utilisateur, *forkez* le projet, éditez un fichier^[Vous pouvez le faire depuis l'interface si au moins un fichier existe] et mettez un message de commit indiquant la résolution du *bug* ;

**Sur la page du projet > Fork repository**

* créez une *merge request* ;

**Depuis la page de votre fork > Merge requests > New merge request > Sélectionner les projets et les branches kivonbien > Submit merge request**

* avec l'utilisateur de départ, acceptez la *merge request* ;

**Sur la page du projet > Merge requests > Clic sur la merge request > Accept merge request**

* ajouter l'autre utilisateur comme faisant partie du projet (et oui, pas besoin de créer un groupe pour bosser sur un projet).

**Sur la page du projet > Settings > Members**

####Administration
 

Dans l'interface d'administration :

* diffusez un message à tous les utilisateurs pendant les prochaines 24h ;

**Clic sur l'icône avec des engrenages > Messages**

* supprimez le groupe ;

**Clic sur l'icône avec des engrenages > Groups > Destroy**
