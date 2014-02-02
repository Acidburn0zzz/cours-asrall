[…]

##Travail demandé
###Installation

[…]

Prenez soin de faire disparaître le *warning* `SYSTEM WARNING: 'date_default_timezone_get()…'` s'il apparaît.

**Pour cela, réglez la timezone dans le fichier `/etc/php5/apache2/php.ini` (`date.timezone =  Europe/Paris`)**

###Personnalisation

1. Recherchez dans les préférences comment passer le langage à `auto`.

**Mon Compte > Préférences**

2. Recherchez dans les fichiers de configuration comment passer le langage à `auto` par défaut.

**`$g_default_language = 'auto';` dans le fichier `config_inc.php`**

3. Recherchez dans le fichier `config_defaults_inc.php` la variable qui contient le nom de clé de session et modifiez ce nom.

**Variable `$g_session_key`**

D'après vous, dans quel fichier faut-il surcharger cette variable ?

**Dans le fichier `config_inc.php` et non `config_defaults_inc.php` car ce dernier sera vraisemblablement écrasé lors d'une mise à jour**

4. Modifiez la configuration de *Mantis* pour afficher les noms de votre binôme sur chaque page de *Mantis*.

**Variable `$g_window_title` à surcharger dans `config_inc.php`**

###Intégration avec git
[…]

###Utilisation

1. Créez un compte pour chacun des membres de votre binôme ;

**Administration > Gérer les utilisateurs > Créer un nouveau compte**

2. Créez un produit « ASRALL » comprenant les composantes suivantes :
    * installation
    * core
    * extensions

**Je tiens à vous présenter mes excuses : il n'y a pas de « produit » dans Mantis. J'avais rédigé cette partie pour *BugZilla*.**

**J'aurais dû dire « Créez un projet « ASRALL » avec 3 sous-projets. »**

**Administration > Gérer les projets > Créer un nouveau projet**

**Cliquer sur le projet > Créer un nouveau sous-projet**

3. Ajoutez quelques bugs et assignez-les à un des comptes créés ;

**En haut à droite, sélectionner le projet kivabien > Rapporter un bogue**

4. Appelez-moi, on testera l'intégration à git;

**Là aussi, une petite erreur : c'est après la création du projet et sa sélection qu'il aurait fallu configurer le dépôt git**

##Questions
Réponses à envoyer à asrall[AT]fiat-tux.fr avant le samedi 1er février à minuit, timezone Europe/Paris.

Je sais que le délai est plus court, mais ça me laisse plus de temps pour répondre.

Encore une fois, la réponse peut être fausse, du moment que vous réfléchissez et que votre réponse suit une certaine logique, ça me va.

* Pourquoi cela est-il une mauvaise idée de modifier le fichier `default.css` ? Ce n'est pas grave, mais c'est une mauvaise idée. Pourquoi ?

**On m'a souvent répondu qu'on risquait de flinguer l'affichage du site, ou de choisir de mauvaises couleurs, introduisant par là de la confusion avec les couleurs de statut des bugs.**
**Ce n'est pas ça^[Sinon on ne toucherait jamais rien, hors on le fait relativement souvent], c'est juste que cette modification sautera à la prochaine mise à jour.**

* Là par contre il n'y a qu'une seule bonne réponse à me donner. Donnez-moi la réponse à ce *regex crossword* : <http://regexcrossword.com/challenges/beginner/puzzles/5> (hé, il est simple celui-là).
Les expressions rationnelles^[Véritable traduction de *regular expression*] sont une chose **très** utile dans la vie d'un admin car elle lui permette de modifier un fichier facilement (voir le `sed` du TP), de chercher les variables idoines dans un fichier de configuration, de rechercher un *pattern* dans un fichier journal (*log*), de créer des rapports, etc. Bref, habituez-vous à elles, aimez-les et elles vous le rendront bien.

```
19
84
```
**Si vous ne voyez pas comment on arrive à ce résultat, n'hésitez pas à me demander une petite explication.**
