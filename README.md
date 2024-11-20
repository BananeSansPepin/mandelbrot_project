exo1----------------------------------------------------------------------------------------------------------------------------
1) configurations faites.

2)
+-------------+
|  Makefile   |
+-------------+
       |
       v
+-------------+    +-------------+    +-------------+
|   main.c    | -> |  mandel.c   | -> |   ppm.c     |
+-------------+    +-------------+    +-------------+
       |                   |                  |
       v                   v                  v
+-------------+    +-------------+    +-------------+
|  main.o     |    |  mandel.o   |    |   ppm.o     |
+-------------+    +-------------+    +-------------+
       \              /               /
        \            /               /
         \          /               /
          \        /               /
           \      /               /
            \    /               /
             v  v               v
           +-----------------------+
           |      Exécutable       |
           +-----------------------+

Makefile: contient les instructions pour compiler le projet. Il génère un binaire en compilant et en liant les fichiers sources ensemble.

main.c Point d'entrée du programme. Il compilé en un objet .o et est ensuite lié avec d'autres objets pour produire l'exécutable final.

mandel.c: contient les fonctions liées à la génération du set de Mandelbrot. Il est compilé en un objet .o et est lié avec main.o et les autres pour former le binaire final.

ppm.c: implémente des fonctions pour gérer des fichiers PPM (un format d'image simple). Il est compilé en un objet .o et est utilisé par d'autres fichiers (comme main.c ou mandel.c) pour écrire des images résultantes.

ppm.h: déclare les fonctions et structures exportées par ppm.c. Il est inclus au niveau des sources. Il est utilisé pour assurer que le compilateur connaît les signatures de fonctions et les structures utilisées par ppm.c.

3) Documentation ppm

a)Structures
struct ppm_pixel
Représente un pixel avec des composantes RGB (valeurs de 0 à 255).

    unsigned char r, g, b : Composantes rouge, verte et bleue.

struct ppm_image
Représente une image PPM.

    unsigned int width, height : Dimensions de l'image.

    struct ppm_pixel *px : Tableau de pixels.

b)Fonctions
ppm_setpixel
Modifie les valeurs RGB d'un pixel donné.

ppm_image_init
Initialise une image avec largeur et hauteur spécifiées.

ppm_image_release
Libère les ressources d'une image.

ppm_image_setpixela
Modifie un pixel de l'image à la position (x, y).

ppm_image_dump
Enregistre l'image au format PPM dans un fichier.


EXO2----------------------------------------------------------------------------------------------------------------------------------

1) Modifications faites et compilation réussi
a) dans mandel.c j'ai juste remplacé &amp par & et &lt par <.
b) dans le makefile il manquait une indication pour que le linker trouve libppm.so. J'ai donc ajouté -Wl,-rpath,. pour spécifier le chemin de la bibliothèque partagée.
Aussi le programme utilise des fonctions mathématiques comme log() et cabs() qui nécessitent la bibliothèque mathématique (-lm).
Pour le commit j'ai utilisé successivement les commandes git add et git commit(avec un petit message pou spécifier les modifications faites).

2) Étapes du code dans mandel.c
Lignes 18-22 : Transformation des coordonnées: Conversion des indices (x, y) des pixels en coordonnées complexes dans le plan de Mandelbrot.
Lignes 25-26 : Initialisation de l'image: Création d'une image PPM de dimensions SIZEX × SIZEY.
Lignes 30-50 : Boucle sur chaque pixel: Double boucle pour traiter chaque pixel de l'image.
Calcul des valeurs de Mandelbrot en itérant sur la formule z = z² + c jusqu'à dépasser le seuil TRSH ou atteindre le nombre maximum d'itérations.
Lignes 52-53 : Coloration: Calcul d'une valeur de gris en fonction du nombre d'itérations avant dépassement du seuil.
Lignes 55-58 : Sauvegarde et libération: Enregistrement de l'image dans un fichier PPM (m.ppm).
Libération de la mémoire allouée pour l'image.

EXO3--------------------------------------------------------------------------------------------------------------------------------------  
1) avec la méthode merge
2) OUI, ici une étape manuelle est nécessaire pour résoudre les conflits et conserver les changements pertinents
3) et 4) Détails de la gestion de cette opération
-Étape 1 : Vérifier les branches existantes
git branch

-Étape 2 : Basculer sur la branche color_support
git checkout color_support

-Étape 3 : Fusionner les changements de master dans color_support
git merge master

-Étape 4 : Résoudre les conflits puis
git add mandel.c Makefile
git commit

-Étape 5 : Basculer sur master et fusionner color_support
git checkout master
git merge color_support

EXO4------------------------------------------------------------------------------------------------------------------------------------
1) je choisis github. processus de création:

gh auth login - connection à mon git
gh repo create mandelbrot_project --private
git remote remove origin - délier le dépot du pc à celui du prof
git remote add origin - lier le depot a mon depot créé
git push --all origin
git push --tags
