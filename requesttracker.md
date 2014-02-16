*Request Tracker*, ou *RT* pour les intimes est un logiciel de centre d'assistance écrit en Perl^[It's gonna be LEGEN… Wait for it… DARY!].

Si cela ressemble fortement à un logiciel de suivi de problèmes, le *workflow* en est différent.

En effet, les demandes d'assistance sont bien plus variées que celle d'un *bugtracker* :

* réseau en panne
* demande de changement du toner de l'imprimante
* demande de renseignement
* demande de fonctionnalité (qui pourront faire l'objet d'un rapport de *bug* dans le *bugtracker* !)
* …

Le logiciel d'assistance est destiné à un plus grand nombre d'utilisateurs et si un bug peut rester dans les tréfonds d'un *bugtracker* pendant des années^[True story!], les demandes d'assistance doivent être résolues dans un certain délai.

Bref, comme je l'ai déjà dit : « À chaque besoin sa solution ».

##Travail demandé
Toute la documentation est là : <http://bestpractical.com/docs/rt/4.2/README.html> mais celle disponible sur <http://requesttracker.wikia.com/wiki/> est aussi très intéressante et parfois plus simple.

###Installation
Pour éviter les écueils de ces derniers temps, nous allons utiliser une base *SQLite*.

```
cd /tmp
wget http://download.bestpractical.com/pub//rt/release/rt-4.2.2.tar.gz
tar xvf rt-4.2.2.tar.gz
cd rt-4.2.2
./configure --prefix /opt/rt4 \
 --with-db-type=SQLite \
 --with-web-user=www-data \
 --with-web-group=www-data \
 --with-web-handler=fastcgi
make testdeps
```

Si le script annonce des erreurs :
```
su
apt-get install libserver-starter-perl
make fixdeps
exit
make testdeps
```

```
su
make install
```

Dans un autre terminal, créez des adresses `test1` et `test2` qui renvoient vers votre utilisateur (appelez moi, on testera) :
```
vim /etc/aliases
newaliases
```

Ajoutez aussi ceci à votre fichier `/etc/aliases` (n'oubliez pas de lancer `newaliases` après) :
```
rt: "|/opt/rt4/bin/rt-mailgate --queue Asrall --action correspond --url http://localhost/"
rt-comment: "|/opt/rt4/bin/rt-mailgate --queue Asrall --action comment --url http://localhost/"
```

Pour faire plus simple, installez `postfix` (la configuration avec `exim4` est une horreur sans nom).

Lancez l'interface d'installation :
```
/opt/rt4/sbin/rt-server --port=8002
```

* Ouvrez votre navigateur à l'adresse <http://localhost:8002> ;
* Choisissez *SQLite* comme type de base de données ;
* Suivez les instructions ;
* Mettez `localhost` comme nom de domaine, votre `login@localhost` pour le mail de l'admin et `rt@localhost` et `rt-comment@localhost` pour les autres adresses ;
* Coupez le serveur avec Ctrl-C.

###Configuration d'*Apache*

La documentation est là : <http://bestpractical.com/docs/rt/4.2/web_deployment.html>

```
su
apt-get install libapache2-mod-fastcgi
```

```
<VirtualHost 127.0.0.1:80>
    ServerName localhost

    ServerAdmin webmaster@localhost

    ErrorLog ${APACHE_LOG_DIR}/rt.error.log
    CustomLog ${APACHE_LOG_DIR}/rt.access.log combined

    AddDefaultCharset UTF-8

    ScriptAlias / /opt/rt4/sbin/rt-server.fcgi/
    SetHandler fastcgi-script

    DocumentRoot /opt/rt4/share/html/
    <Directory /opt/rt4/share/html>
        Options FollowSymLinks 
        Order allow,deny
        Allow from all

        # Décommentez ceci et commentez le Order… si vous êtes sur Apache 2.4
        #Require all granted
    </Directory>


    <Location />
        Order allow,deny
        Allow from all

        # Décommentez ceci et commentez le Order… si vous êtes sur Apache 2.4
        #Require all granted
        Options +ExecCGI
        AddHandler fastcgi-script fcgi
    </Location>
</VirtualHost>
```

###Configuration de *RT*
Dans la partie « Admin » :

* Créez un groupe : `asrall` ;
* Créez deux utilisateurs : `test1` et `test2` (adresses mail `test1@localhost` et `test2@localhost`).
  Cochez « Autoriser cet utilisateur à recevoir des droits (Privilégié) » pour l'utilisateur `test1`.
  Mettez ces deux utilisateurs dans le groupe précédemment créé.\
  **NB : Il faut taper le mot de passe du compte `root` de *RT* pour configurer le mot de passe des utilisateurs.**
* Modifiez la file « Général » pour la renommer en `Asrall` avec un délai de résolution de 2 jours ;
* Pour cette file, modifiez les droits pour permettre à tout le monde de :
    * poser des commentaires sur le ticket ;
    * créer des tickets.
* Pour tout le monde, mais dans l'onglet des intervenants, cochez « Modifier les tickets » ;
* Modifiez les droits de groupe pour donner le droit au groupe `asrall` de :
    * s'identifier en tant que demandeur ou CC de file ou de ticket ;
    * voir la file ;
    * voir les informations de base des tickets.
* Toujours pour cette file, donnez toutes les permissions générales et les permissions pour les intervenants aux utilisateurs privilégiés ;
* Créez un « Scrip » :
    * condition : Changement de statut ;
    * action : Avertir les demandeurs ;
    * modèle : Status change in HTML.\
Comprenez-vous ce que vous venez de faire, ce qu'est un « Scrip » ?\
**NB :Vous pouvez désactivez les « Scrips » file par file.**

###Jouons un peu
####Avec la Web UI
 

En tant que `test2`, créez un ticket pour la file Asrall.

En tant que `test1`, prenez le ticket et baladez-vous un peu dans les menus en haut à droite.
Modifiez la date d'échéance pour une date déjà passée. Enregistrez et retournez sur l'écran d'accueil.\
Que constatez-vous ?

Toujours en tant que `test1`, changez le statut du ticket.
`test2` a-t'il bien reçu un mail l'avertissant du changement de statut ?

####Avec les mails
 

Une des grandes forces de *RT* est sa capacité à interagir avec les utilisateurs par mail.

Envoyez un mail pour créer un ticket :
```
echo "Ça marche pas !" | mail -s "Au secours !" rt@localhost;
```

Prenez le ticket avec l'utilisateur `test1`.
L'utilisateur ayant envoyé le mail a du recevoir un mail de confirmation (commande `mail` si vous n'avez pas configuré de redirection de vos mails locaux vers une adresse externe).

Renvoyez un mail pour ajouter du courrier au ticket (prenez soin de bien mettre l'identifiant du ticket dans le sujet) :
```
echo "Ça marche toujours pas !" | mail -s "[localhost #3] Au secours !" rt@localhost;
```

Envoyez un commentaire pour ce ticket (notez bien que l'adresse de destination a changé) :
```
echo "L'ordinateur n'est pas branché. Ça peut jouer ?" | mail \
 -s "[localhost #3] Une piste ?" rt-comment@localhost;
```

##Questions
Encore une fois à renvoyer à asrall[AT]fiat-tux.fr pour au plus tard samedi minuit, fuseau horaire de Paris.\
Cette fois-ci les questions ne sont pas ouvertes (il y a les bonnes réponses et les mauvaises réponses), il s'agit de voir si vous savez chercher.

* Nous avons configuré *Apache* pour utiliser *RT* avec le module *fastcgi*. Quels sont les autre modules *Apache* que nous aurions pu utiliser^[RTFM] ?
* Donnez-moi l'URL d'une page expliquant comment configurer *exim4* (c'est le *mail transfer agent* par défaut de Debian) pour qu'il fonctionne avec *RT*.
Je ne vous demande pas de tester cela, juste de me trouver une doc kivabien.
