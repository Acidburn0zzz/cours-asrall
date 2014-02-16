###Configuration de *RT*
Dans la partie « Admin » :

[…]

* Modifiez les droits de groupe pour donner le droit au groupe `asrall` de :
    * s'identifier en tant que demandeur ou CC de file ou de ticket ;
    * voir la file ;
    * voir les informations de base des tickets.

**Pour ajouter un groupe à une file, il faut taper le nom de la file en bas à gauche, la sélectionner lors de l'autocomplétion, cocher les droits kivonbien et enregistrer. Par la suite, le groupe sera sélectionnable dans la liste de gauche.**

* Créez un « Scrip » :
    * condition : Changement de statut ;
    * action : Avertir les demandeurs ;
    * modèle : Status change in HTML.\
Comprenez-vous ce que vous venez de faire, ce qu'est un « Scrip » ?\

**Un « Scrip » est tout simplement une action déclenchée par un évènement. Cette action utilise un modèle.**

###Jouons un peu
####Avec la Web UI
 

En tant que `test2`, créez un ticket pour la file Asrall.

En tant que `test1`, prenez le ticket et baladez-vous un peu dans les menus en haut à droite.
Modifiez la date d'échéance pour une date déjà passée. Enregistrez et retournez sur l'écran d'accueil.\
Que constatez-vous ?

**Normalement, le ticket se retrouve dans la liste des tickets à traiter en priorité.**

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

**Suivant votre configuration, la partie du sujet du mail « [localhost…] » pourra être différente. « [rt…] » par exemple.**

##Questions
Encore une fois à renvoyer à asrall[AT]fiat-tux.fr pour au plus tard samedi minuit, fuseau horaire de Paris.\
Cette fois-ci les questions ne sont pas ouvertes (il y a les bonnes réponses et les mauvaises réponses), il s'agit de voir si vous savez chercher.

* Nous avons configuré *Apache* pour utiliser *RT* avec le module *fastcgi*. Quels sont les autre modules *Apache* que nous aurions pu utiliser^[RTFM] ?

**Nous aurions pu utiliser *mod_perl* ou *mod_fcgid*^[http://bestpractical.com/docs/rt/4.2/web_deployment.html]. On m'a aussi donné comme réponse *mod_speedycgi*, qui n'est pas dans la documentation officielle, mais cela doit pouvoir fonctionner.**

* Donnez-moi l'URL d'une page expliquant comment configurer *exim4* (c'est le *mail transfer agent* par défaut de Debian) pour qu'il fonctionne avec *RT*.
Je ne vous demande pas de tester cela, juste de me trouver une doc kivabien.

**Par exemple <http://requesttracker.wikia.com/wiki/EximConfigVirtualDomain>, mais il y en a plein d'autres.**
