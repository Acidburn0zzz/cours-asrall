Une forge logicielle est un système de développement collaboratif de logiciel.
Il regroupe un certain nombre de logiciels vus auparavant comme un wiki et/ou un bugtracker avec — généralement – un gestionnaire ou un navigateur^[Navigateur au sens de navigateur de fichiers] de dépôts (git, svn, etc.).

*GitLab* est une forge logicielle récente (2011) et est un clone libre de Github.
Si toutes les fonctionnalités de Github ne sont pas présentes (en particulier son côté réseau social comme le suivi d'un projet), le cycle de développement rapide de *GitLab*^[Une release tous les 22 du mois] et ses déjà nombreuses fonctionnalités en font un allié de poids, que ce soit en entreprise ou pour un usage plus modeste^[Ça m'agace de dire du bien d'un projet en Ruby, mais il est **vraiment** bien fait].

##Questions
Je pose les questions au début, sinon je sais que vous allez vous mordre les doigts de ne les voir qu'à la fin, une fois que vous aurez fait le TP.
Les réponses sont à rendre pour samedi minuit au plus tard.

C'est assez simple : donnez-moi le chemin des menus par lequels vous avez fait ce que je vous demande.

Exemple : si je vous demande sur Firefox de changer la langue du navigateur, vous devez me répondre « Préférences > Contenu > Langage ».

##Travail demandé
###Installation
Installez GitLab en suivant le tutoriel disponible sur <http://lstu.fr/asrall-gitlab>^[<https://gitlab.com/gitlab-org/gitlab-ce/blob/master/doc/install/installation.md>].
Ceci ne doit pas prendre plus d'une heure (ok, un peu plus avec le réseau pourri).
Appelez dès qu'il y a un problème.

###Utilisation
####Minimum légal
 

Posez votre clé SSH sur le compte par défaut.

Créez un autre utilisateur que celui par défaut.
Ouvrez un autre navigateur ou une nouvelle fenêtre en mode privé^[Ctrl+Shift+P dans Firefox], loguez-vous avec ce nouvel utilisateur et posez-y une autre clé SSH.

Créez un groupe contenant les deux utilisateurs.

####Création de dépôts^[Projets, dans la terminologie *GitLab*]
 

Pour chacun des utilisateurs et pour le groupe :

* créez un projet public ;
* créez un projet protégé (seuls les utilisateurs loggés pourront le cloner) ;
* créez un projet privé.

Vérifiez avec les différents utilisateurs et une autre fois sans être logué les accès aux différents projets.
Essayez d'en cloner et de pusher (clonez par les protocole HTTP pour éviter les conflits de clés SSH).

####Utilisation des outils disponibles
 

Choisissez un projet public ou protégé d'un des deux utilisateurs et effectuez les actions suivantes :

* créez une ou deux pages de wiki ;
* activez les *snippets*^[Bouts de code publiés sur une page, à la pastebin] publics et créez-en un ;
* activez le mur et postez-y un ou deux messages ;
* créez un rapport de *bug* ;
* avec l'autre utilisateur, *forkez* le projet, éditez un fichier^[Vous pouvez le faire depuis l'interface si au moins un fichier existe] et mettez un message de commit indiquant la résolution du *bug* ;
* créez une *merge request* ;
* avec l'utilisateur de départ, acceptez la *merge request* ;
* ajouter l'autre utilisateur comme faisant partie du projet (et oui, pas besoin de créer un groupe pour bosser sur un projet).

####Administration
 

Dans l'interface d'administration :

* diffusez un message à tous les utilisateurs pendant les prochaines 24h ;
* supprimez le groupe ;
