*Mantis* est un système de suivi de problèmes écrit en PHP.
S'il est fort utile en tant que système de gestion de *bugs*, il peut tout aussi bien servir de système de gestion de requêtes ou de planification de fonctions.

##Rappel

Posez-moi des questions, demandez-moi de venir vous voir si ça ne va pas.
Je sais qu'il est plus gratifiant de trouver les problèmes tout seul, mais ça ne sert à rien si ça vous empèche de faire le TP.

##Pendant ce temps, à Veracruz

Petit aparté pour vous faire installer un superbe outil qui renvoie `grep` à l'âge de pierre : `ack`^[<http://beyondgrep.com/>].

Ceci a pour but de vous familiariser avec la commande `cpan` qui permet l'installation de modules Perl via le CPAN^[Comprehensive Perl Archive Network, voir <http://www.cpan.org/>].
**Vous en aurez besoin lors du TP noté.** (de `cpan`, pas d'`ack`)

Tapez les commandes suivantes en `root` :
```
cpan
```

Choisissez la configuration automatique puis modifiez un peu la configuration (voir <http://lstu.fr/cpan1> et <http://lstu.fr/cpan2>)
```
o conf build_requires_install_policy yes
o conf prerequisites_policy follow
o conf commit
```

Puis on passe à l'installation proprement dite :
```
install P/PE/PETDANCE/ack-2.10.tar.gz
exit
```

Normalement, on installerait ce module Perl via la commande `cpan App::Ack` mais la dernière version (2.12) de cette application a un problème à l'installation.

On n'a pas trop le temps, mais jouez un peu avec `ack` à la place de `grep`, vous verrez que ça change la vie^[De même que les logiciels `htop` et `multitail`, installez-les !].

##Travail demandé
###Installation

Récupérez l'archive de la version stable de *Mantis*^[<http://sourceforge.net/projects/mantisbt/files/mantis-stable/>].

Décompressez l'archive et installez *Mantis* (avec le SGBD que vous voulez, *PostgreSQL* ou *MySQL*).

Prenez soin de faire disparaître le *warning* `SYSTEM WARNING: 'date_default_timezone_get()…'` s'il apparaît.

###Personnalisation

1. Recherchez dans les préférences comment passer le langage à `auto`.
Vérifiez que *Mantis* s'adapte bien à la langue par défaut du navigateur^[Pour changer la langue par défaut de Firefox : Préférences, Contenu, Langues].
Installez l'anglais sur votre navigateur si nécessaire et faites le test.
1. Recherchez dans les fichiers de configuration comment passer le langage à `auto` par défaut.
Créez un utilisateur avec les droits administrateur et vérifiez que son langage par défaut soit bien à `auto`.
1. Recherchez dans le fichier `config_defaults_inc.php` la variable qui contient le nom de clé de session et modifiez ce nom.
D'après vous, dans quel fichier faut-il surcharger cette variable ?
1. Modifiez la configuration de *Mantis* pour afficher les noms de votre binôme sur chaque page de *Mantis*.
Avec un peu de css (fichier `css/default.css`), faites en sorte que cela soit bien visible (on se fiche que ce soit joli, on veut juste que cela ressorte).

###Intégration avec git
1. Appliquez ce patch : <http://lstu.fr/bt-patch>  ;
1. Installez le *plugin* Source Integration : <http://lstu.fr/bt-plugin> (n'installez que le plugin SourceGithub en plus du Source) ;
1. Depuis le répertoire `plugins`, exécutez
```
sed -e "s@1.2.16@1.2.15@" -i SourceGithub/SourceGithub.php
```
1. Activez le *plugin* Source **avant** le plugin SourceGithub (qui de toute façon refusera de s'installer autrement) ;
1. Configurez le *plugin* Source :
    * Cochez la case « Résoudre les demandes résolues » ;
    * Passez le paramètre « Status de résolution de la demande » à « résolu » ;
    * Ajoutez 4 lettres (les deux premières de chaque nom de votre binôme par exemple) dans le début de la regex « Regex de résolution de demande, Passe 1 » (après le premier `/`) ;
    * donnez-lui une clé d'API ;
1. Allez dans l'onglet « Dépôts ». Créez un nouveau dépôt de type « Github ».
    * URL : `https://github.com/ldidry/asrall.git`
    * GitHub Username : `ldidry`
    * GitHub Repository Name : `asrall`

###Utilisation

1. Créez un compte pour chacun des membres de votre binôme ;
1. Créez un produit « ASRALL » comprenant les composantes suivantes :
    * installation
    * core
    * extensions
1. Ajoutez quelques bugs et assignez-les à un des comptes créés ;
1. Appelez-moi, on testera l'intégration à git;

##Questions
Réponses à envoyer à asrall[AT]fiat-tux.fr avant le samedi 1er février à minuit, timezone Europe/Paris.

Je sais que le délai est plus court, mais ça me laisse plus de temps pour répondre.

Encore une fois, la réponse peut être fausse, du moment que vous réfléchissez et que votre réponse suit une certaine logique, ça me va.

* Pourquoi cela est-il une mauvaise idée de modifier le fichier `default.css` ? Ce n'est pas grave, mais c'est une mauvaise idée. Pourquoi ?
* Là par contre il n'y a qu'une seule bonne réponse à me donner. Donnez-moi la réponse à ce *regex crossword* : <http://regexcrossword.com/challenges/beginner/puzzles/5> (hé, il est simple celui-là).
Les expressions rationnelles^[Véritable traduction de *regular expression*] sont une chose **très** utile dans la vie d'un admin car elle lui permette de modifier un fichier facilement (voir le `sed` du TP), de chercher les variables idoines dans un fichier de configuration, de rechercher un *pattern* dans un fichier journal (*log*), de créer des rapports, etc. Bref, habituez-vous à elles, aimez-les et elles vous le rendront bien.
