Un wiki est souvent un outil indispensable au sein d'une entreprise, qu'elle soit orientée informatique ou non.
En effet, le wiki permet à chacun de stocker des informations précieuses sur les procédures de l'entreprise, les petits trucs à savoir ou tout simplement la documentation de la photocopieuse.

Un des moteurs de wiki les plus utilisés est *MediaWiki*, propulsant l'un des cinq sites les plus visités au monde : Wikipedia.
C'est ce moteur que nous allons installer et personnaliser.

##Travail demandé
###Installation
1. téléchargez la dernière version de *MediaWiki*^[<https://www.mediawiki.org/wiki/Download>] ;
2. lisez le fichier INSTALL
(lire le fichier INSTALL, s'il existe, est **TOUJOURS** la première chose que vous devez faire. Lire le fichier README est aussi une bonne pratique à intégrer) ;
3. installez la version que vous avez téléchargé :
    * créez une base de données et un utilisateur pour celle-ci ;
    * choisissez une thématique pour votre wiki.
4. testez votre installation en créant trois pages différentes comportant des références vers les deux autres pages ainsi que des accents.
Vous utiliserez aussi des éléments de mises en forme (**gras**, *italique*, etc) et des éléments de structurations (liste à puce, liste numérotées, titre, etc.).

###Personnalisation
* trouvez à quel endroit vous pouvez personnaliser les messages standard de *MediaWiki*. Modifiez le message d'un des items du menu de gauche (*Accueil*, *Modifications récentes*, *Page au hasard*) ;
* laisser le fichier de configuration contenant les informations de connexion au SGBD dans l'arborescence visible par le serveur web est à éviter lorsque cela est possible.
Trouvez la documentation expliquant comment faire et mettez-la en œuvre ou une autre solution analogue.
* installez un nouveau logo sur votre wiki (+5 points de charisme s'il y a une référence geek) ;
* trouvez la liste des différents profils d'utilisateurs supportés par *MediaWiki* ;
* créez deux nouveaux comptes en leur associant des profils différents ;
* choisissez un mot qui s'y prète (ou pas) et gérez une page d'homonymie ;
* comment empêcher les utilisateurs de se créer eux-mêmes de nouveaux comptes. Quelle solution peut alors être mise en place pour créer de nouveaux comptes ?

##Si vous avez le temps ou si vous êtes juste un peu curieux
*MediaWiki* est un wiki très répandu, mais touffu et parfois complexe (sans compter la laideur de sa syntaxe ou de son éditeur).
Sa notoriété en fera sans doute le choix par défaut lors de la mise en place d'un wiki, mais ce n'est pas la bonne façon de raisonner.

Pour choisir un wiki, il est bon de se poser la question des besoins que ce wiki doit remplir :

* pouvoir le remplir avec plein d'informations : bah, euh, c'est le but de tous les wikis, non ?
* passage à l'échelle ou pas ;
* quel est le public ? Expérimenté ou non ? Aura-t'il peur de la syntaxe wiki ?
* etc.

La plupart du temps, un simple *DokuWiki*^[<http://www.dokuwiki.org/dokuwiki>] (moteur de wiki sans base de données) peut faire amplement l'affaire tout en soulageant l'administrateur système d'un certain nombres de tâches.

Pour le fun, répétez tout ce que vous avez fait mais avec *DokuWiki* (+10 points d'expérience).


##Conseil
Lors du choix d'un outil, il est bon d'adopter l'adage « À chaque besoin sa solution ».

Une solution, si populaire soit-elle, n'est pas forcément l'outil qui remplira au mieux les fonctions demandées, ou nécessitera beaucoup d'adaptations ou beaucoup de maintenance.

Il faut toutefois faire attention à ne pas tomber dans l'excès inverse et ne pas installer 10 applications là où une seule, plus complexe répondrait à tous les besoins.
Il faut donc bien peser les avantages, les inconvénients et la réponse aux besoins (et donc établir un cahier des charges avant de chercher l'outil qui y répondra).

##Questions
Trouvez deux points qui soulagent l'administrateur système lorsqu'il s'occupe d'un wiki sans base de données par rapport à un wiki avec base de données.

Envoyez vos réponses à asrall[AT]fiat-tux.fr

Est-ce que ça comptera dans la note ? Mmh, bonne question… #Suspense #BastardOperatorFromHell

##Copyright
Ce cours est honteusement pompé sur celui de Lucas \textsc{Nussbaum}, avec son aimable autorisation.
