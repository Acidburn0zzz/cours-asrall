[…]

##Travail demandé
###Installation

[…]

3. installez la version que vous avez téléchargé :
    * créez une base de données et un utilisateur pour celle-ci ;
```
CREATE DATABASE wiki;
CREATE USER 'wikiuser'@'localhost' IDENTIFIED BY 'wikipass';
GRANT ALL ON wiki.* to 'wikiuser'@'localhost';
```

    * choisissez une thématique pour votre wiki.
4. testez votre installation en créant trois pages différentes comportant des références vers les deux autres pages ainsi que des accents.
Vous utiliserez aussi des éléments de mises en forme (**gras**, *italique*, etc) et des éléments de structurations (liste à puce, liste numérotées, titre, etc.).

```
[[AutrePage|Text du lien vers l'autre page]]
'''texte en gras'''
''texte en italique''
== Titre de niveau 2 ==
=== Titre de niveau 3 ===
* 1er item d'une liste à puce
* 2ème item
# 1er item d'une liste numérotée
# 2ème item
```

###Personnalisation
* trouvez à quel endroit vous pouvez personnaliser les messages standard de *MediaWiki*. Modifiez le message d'un des items du menu de gauche (*Accueil*, *Modifications récentes*, *Page au hasard*) ;
```
vim languages/messages/MessagesFr.php
```
* laisser le fichier de configuration contenant les informations de connexion au SGBD dans l'arborescence visible par le serveur web est à éviter lorsque cela est possible.
Trouvez la documentation expliquant comment faire et mettez-la en œuvre ou une autre solution analogue.
```
mkdir -p /etc/mediawiki
mv LocalSettings.php /etc/mediawiki/
echo -e "<?php\nrequire_once('/etc/mediawiki/LocalSettings.php');" \
 > LocalSettings.php
```

**La sécurité tient ici au fait que l'on sort *LocalSettings.php* de l'arborescence du serveur web.**

* installez un nouveau logo sur votre wiki (+5 points de charisme s'il y a une référence geek) ;
```
$wgLogo = "$wgStylePath/common/images/dr_who.png"
```

* trouvez la liste des différents profils d'utilisateurs supportés par *MediaWiki* ;

**Le truc était de chercher dans les pages spéciales (dans le menu de gauche).**

```
http://wiki.asrall.fr/Sp%C3%A9cial:Liste_des_droits_de_groupe
```
* créez deux nouveaux comptes en leur associant des profils différents ;

**Pour modifier les groupes de l'utilisateur Asrall :**

**`http://wiki.asrall.fr/index.php?title=Sp%C3%A9cial%3APermissions&user=asrall`.**

**Liste des utilisateurs : `http://wiki.asrall.fr/Sp%C3%A9cial:Liste_des_utilisateurs`.**

* choisissez un mot qui s'y prète (ou pas) et gérez une page d'homonymie ;

**Créez 3 pages : *Asrall*, *Asrall2* et *Asrall3*.**

**Sur la page *Asrall*, mettez `{{homonymie}}` ainsi que des liens vers les deux autres pages.**
**Vous verrez apparaître `Modèle:Homonymie` en rouge. Cliquez dessus, mettez un texte du style `Ceci est une page d'homonymie.`. Vous venez de créer un modèle !**

**Sur les pages *Asrall2* et *Asrall3*, mettez `{{Voir homonymes|Asrall}}`.**
**Créez encore un modèle avec comme contenu `Pour les articles homonymes, voir [[{{{1|{{Titre sans précision}} (homonymie)}}}]]`.**

* comment empêcher les utilisateurs de se créer eux-mêmes de nouveaux comptes. Quelle solution peut alors être mise en place pour créer de nouveaux comptes ?
```
$wgGroupPermissions['*']['createaccount'] = false;
```

**Pour la création de compte, il convient de laisser une page avec un moyen de contacter la personne kivabien. Mail, IRC, XMPP, etc.**

[…]

##Questions
Trouvez deux points qui soulagent l'administrateur système lorsqu'il s'occupe d'un wiki sans base de données par rapport à un wiki avec base de données.

* **Facilité d'installation**
* **Facilité de maintenance et de mise à jour (pas de schéma de BDD à mettre à jour)**
* **Facilité de sauvegarde et surtout de restauration (la sauvegarde d'une BDD pose généralement peu de problème. C'est plutôt la restauration qui pose problème de temps en temps)**
* **Facilité de migration d'un serveur à un autre**

Ont été données les réponses suivantes, pas forcément fausses, mais pas forcément vraies non plus^[« Lourd est le parpaing de la réalité sur la tartelette aux fraises de nos illusions »] :

* Configuration par interface graphique sur *Dokuwiki*, par fichiers sur *Mediawiki*. Si cela est vrai dans ce cas, ce n'est pas forcément une généralité des wikis avec ou sans BDD.
* Plus grande rapidité pour les wikis sans BDD. C'est vrai dans le cas d'un wiki de petite taille voire de taille moyenne avec une fréquentation relativement peu importante, mais pensez-vous que les accès disques soient vraiment plus efficaces qu'un SGBD qui cache au moins une partie de ses données en RAM ? Et ben non.
* Pas besoin pour l'admin de connaître la syntaxe SQL. De toute façon, il faut la connaître au moins un peu, vous en mangerez nécessairement. L'admin sys doit avoir des compétences système, réseau, SGBD et même savoir mettre un peu le nez dans le code. Il doit connaître des trucs sur le bout des doigts et avoir des connaissances de base dans les autres domaines.

De bonnes réponses auxquelles je n'avais pas pensé :

* Les articles étant stockés dans des fichiers textes, on peut directement les modifier/supprimer sans avoir à passer par l'interface web ou en écrivant des requêtes SQL. J'ajouterais même qu'on peut grâce à cela les modifier en masse à grand coup de `sed`, ça peut être utile.
* Si on externalise la base de données du wiki (placé sur une autre machine), utiliser une base de données demandera plus de ressources réseau. Effectivement, même si l'admin sys n'a pas plus de boulot s'il y a plus de trafic. Par contre il devra s'assurer de la confidentialité des données (dialogue avec le SGBD chiffré) et des ouvertures correctes des pare-feux et/ou des ACLs si les deux systèmes ne sont pas dans le même VLAN.
* Moins de ressources utilisées sur la machine, moins de processus => moins de boulot :D
* Réduit la surface d'attaque : pas de crainte d'injection SQL.

#Bonus !
Un fichier de configuration Apache qui fonctionne :

```
<VirtualHost 127.0.0.1:80>
    ServerName wiki.asrall.fr

    ServerAdmin webmaster@asrall.fr
    DocumentRoot /var/www/asrall/mediawiki

    # Ça c'est pour permettre d'avoir de jolies URLs (voir plus bas)
    <Directory /var/www/asrall/mediawiki>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

```

Un `.htaccess` à mettre dans le répertoire du MediaWiki pour avoir de jolies URLs (sans `index.php`) :

```
# Enable the rewrite engine
RewriteEngine On
 
RewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} !-f
RewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} !-d
RewriteRule ^(.*)$ %{DOCUMENT_ROOT}/index.php [L]
```

Ces règles pourraient se mettre directement dans la configuration Apache, mais en cas de migration de serveur, on pourrait oublier de les reporter sur la nouvelle configuration Apache alors que le .htaccess est transféré en même temps que les autres fichiers du wiki.

Pour plus de détails, voir la page <http://www.mediawiki.org/wiki/Manual:Short_URL/Apache> (la consulter obligatoirement si votre wiki n'est pas à la racine de votre *VirtualHost*).
