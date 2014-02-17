Un système de gestion de contenu (*CMS*, *Content Management System*) est un logiciel destiné à la conception et à la mise à jour dynamique de sites Web ou d'applications multimédia^[<http://fr.wikipedia.org/wiki/Syst%C3%A8me_de_gestion_de_contenu>].

Nous allons utiliser *Wordpress*. En effet, ce moteur de blog constitue bel et bien un *CMS* selon la définition ci-dessus, et ce n'est pas un hasard si plus de 20% des 10 000 000 premiers sites web du monde^[<http://w3techs.com/technologies/overview/content_management/all/>].

##Toujours pendant ce temps, à Veracruz
On repart sur un logiciel Perl à installer pour vous préparer au TP noté : LUTIm^[<https://github.com/ldidry/lutim/>]

Pas de BDD (enfin si, *SQLite*, donc y a rien à faire à ce niveau), tout est automatique normalement, y a qu'à suivre les instructions du README.md.

Pour info, LUTIm est un service d'hébergement d'images libre et anonyme.

Ne vous en faites pas pour le proxy qu'on met normalement devant, on fera juste un test sur le port 8080.

##Travail demandé
##Questions
Pas de questions cette semaine !

###Installation
Téléchargez la dernière version de *Wordpress* : <http://fr.wordpress.org/wordpress-3.8.1-fr_FR.tar.gz>

Détarez-là dans `/var/www` (attention au propriétaire des fichiers ! Changez-le en `www-data` si nécessaire).

Faites pointer votre *virtualhost* sur `/var/www/wordpress`.

Créez la base de données et l'utilisateur kivabien :
```
create database wordpress;
create user wp@localhost identified by 'toto';
grant all on wordpress.* to wp@localhost;
```

Rendez-vous sur <http://localhost> et entrez les informations idoines.

###Configuration et bac à sable
* mettez le fichier wp-config.php dans le répertoire supérieur. Pourquoi vous ai-je demandé de faire cela selon vous ?
* personnalisez le thème en place pour afficher une page statique plutôt que les article de blog sur la page d'accueil du site (non, pas besoin de modifier des fichiers) avec un agencement en grille du contenu mis en avant ;
* ajoutez/supprimez quelques médias dans la bibliothèque de médias ;
* créez quelques articles avec ou sans le mot-clé (le *tag* `featured`) pour les mettre en avant (ce qui sera plus efficace avec une « image à la une ») ;
* créez quelques pages statiques ;
* jouez un peu avec les widgets : ajoutez-en, mettez-en dans d'autres zones, etc. ;
* créez un nouveau menu contenant un lien vers <http://asrall.fr> et d'autres vers quelques pages statiques de votre *Wordpress* ;
* désactivez les commentaires sur la page statique qui sert de page d'accueil ;
* installez un nouveau thème et utilisez-le ;
* recherchez, installez et activez une extension antispam (mais pas *akismet* qui est installée par défaut et qui demande une clé d'API) ;
* modifiez les permaliens (liens directs vers l'article ou la page) pour qu'il contiennent le titre de l'article (vous avez besoin d'activer le *mod_rewrite* d'*Apache*) ;
* allez faire un tour sur <http://codex.wordpress.org/Roles_and_Capabilities> pour connaître les différences entre les niveaux de permissions des utilisateurs et créez en un avec les permissions « contributeur ». Loguez-vous avec cet utilisateur et vérifiez que ses droits sont bien limités ;

##Conclusion
On l'a vu, pour un simple moteur de blog, *Wordpress* possède un nombre impressionnant d'options dans tous les sens, et ce n'est encore rien par rapport à son API qui permet d'écrire des thèmes et des extensions qui font presque le café.

Si, je l'espère pour vous, on ne vous demande pas de faire un site tout beau avec *Wordpress*, il est possible qu'on vous demande d'installer et configurer un *CMS*, de trouver les extensions kivonbien, éventuellement de gérer les utilisateurs, etc.
Vous voilà déjà un peu plus parés :-)
