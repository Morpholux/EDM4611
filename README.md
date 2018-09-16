EDM4611
=======

Contenu du cours «Image de synthèse et interactivité : processus génératifs»<br>
UQAM - Université du Québec à Montréal<br>
Programme de Baccalauréat en médias interactifs<br>
Session automne 2018

Enseignant : <a href="mailto:renaud.jean-francois@uqam.ca">Jean-François Renaud</a> (professeur)

<br>
_ _ _

<br>
<br>

![Our Medium is Computation](https://dl.dropboxusercontent.com/s/hsvcnobh727vwki/medium_is_computation.jpg
"Citation tirée d’une conférence donnée par Jessica Rosenkrantz")

<br>
<br>
_ _ _

### Description des travaux d’atelier

E1 . **Atelier Pixels** - semaine 2

![Maeda psychédélique](https://dl.dropboxusercontent.com/s/abzqccrq6iw17ud/maeda.jpg
"Traitement d’unne image pixel par pixel")

• Expérimenter avec les méthodes de lecture et d’écriture des composants d’un affichage matriciel, les pixels. Ceux-ci sont interprétés/altérés directement dans le sketch ou depuis des fichiers importés. On évite l’utilisation des commandes set() ou get() pour lire ou écrire la donnée de couleur. On lui préfère la commande pixels[]. On exploite la fonction permettant de convertir une position x,y dans le sketch vers un index dans le tableau des pixels, et vice versa. Enfin, on voit comment extraire les valeurs RGB ou HSB à l’aide d’opérations <i>Bitwise</i>. Voir le dossier comprenant les notes de cours.

Notions à considérer :

`pixels[], loadPixels(), updatePixels(), loadImage(), PImage`

<br>
<br>

E2 . **Atelier tracé vectoriel** - semaine 3

![Structure folioles](https://dl.dropboxusercontent.com/s/967i1011w1vv3e4/folioles.jpg
"Structuration des folioles d’une feuille")

• Expérimenter avec la création d’un motif ou d’une structure graphique, potentiellement animée. Le dessin des figures se fait à l’aide d’une méthode exclusivement vectorielle, c’est-à-dire que les formes sont constituées de tracés (droites, courbes), et donc de points de contrôle (ancrages, leviers) pouvant être modifiés à travers le code. On évite l’utilisation des primitives 2D line(), rect() ou ellipse(), bien que ces dernières soient également de la famille des objets vectoriels. En combinant ces méthodes de dessin et l’exportation en format PDF, il vous sera possible de conserver l’accès à cette structure, contrairement à une sauvegarde matricielle.

Notions à considérer :

`vertex(), curve(), bezier(), curveVertex(), bezierVertex(), beginShape() endShape(), PShape`

<br>
<br>