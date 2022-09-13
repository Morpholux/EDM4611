// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 1.5.1
// dimanche, 21 août 2011 (révision 6 septembre 2014)

// _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
//
// (Au moins) huit manières de tracer une ligne droite
// _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

// Dans cette version, on ajoute parfois un pixel à la fin du procédé
// car il semble que la commande line() dessine un pixel à l’emplacement
// de la terminaison, alors que d’autres, comme rect(), excluent cet emplacement.


// Variables requises par le programme pour simplifier la gestion des espacements
int posVertical = 15;
int deltaY= round((height-(posVertical*2))/7.0);
println("Espace de "+deltaY+" pixels entre chaque trait.");
int marge = 15;
int longueurLigne = width-(marge*2);
println("Chaque ligne mesure "+longueurLigne+" pixels de long.");


// 1 : la commande line(), bien entendu
line(marge,posVertical,marge+longueurLigne,posVertical);


// 2 : un rectangle étroit, rempli et sans contour
posVertical+=deltaY;
noStroke();
fill(0);
rect(marge,posVertical,longueurLigne+1,1);


// 3 : une ellipse, de hauteur nulle, sans remplissage et avec contour
posVertical+=deltaY;
noFill();
stroke(0);
ellipse(marge+(longueurLigne*0.5),posVertical,longueurLigne,0);


// 4 : une répétition de points
posVertical+=deltaY;
noFill();
stroke(0);
for(int i=marge; i<=(marge+longueurLigne); i++) { // i+=2, pour faire un pointillé
  point(i, posVertical);
  // Autre manière d’écrire cette instruction :
  // set(i, posVertical, color(0));
}


// 5 : une modification de la donnée couleur à même la liste[] de pixels du sketch.
// Cette approche est beaucoup plus performante que les commandes point() ou set() ci-dessus.
posVertical+=deltaY;
int pixelDepart = (posVertical*width)+marge;
loadPixels();
for (int i = pixelDepart; i <= (pixelDepart+longueurLigne); i++) {
  pixels[i] = color(0);
}
updatePixels();


// 6 : une forme vectorielle, traitée en tracé linéaire
posVertical+=deltaY;
beginShape(LINES);
vertex(marge, posVertical);
vertex(marge+longueurLigne, posVertical);
endShape();


// 7 : une image importée, étirée à la taille requise
posVertical+=deltaY;
PImage monGif;
monGif = loadImage("pixelnoir.gif");
image(monGif, marge, posVertical, longueurLigne+1, 1);


// 8 : une image virtuelle créée en mémoire, puis affichée
posVertical+=deltaY;
PImage img = createImage(longueurLigne+1, 1, RGB);
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
  img.pixels[i] = color(0);
}
img.updatePixels();
image(img, marge, posVertical);


/* On pourrait également évoquer d’autres manières de générer un trait, parfois encore plus fantaisistes :

- Recourir à l’objet PShape, afin d’importer le dessin vectoriel d’une ligne droite (en format svg);

- Dessiner une ligne via du texte, par la répétition de la frappe «underscore» par exemple : _________;

- Choisir d’autres approches pour contruire un rectangle, comme la commande quad() ou le paramètre QUADS dans beginShape();

- Remplacer le rectangle étroit par un cube dans un espace 3D.
S’assurer d’une vue frontale, avec projection orthogonale (point de fuite à une distance infinie).
Voir commande ortho();

- Dessiner une courbe de bézier avec deux points d’ancrage angulaires
(lorsque les leviers sont situés au même endroit que les points d’ancrage, on obtient un trait droit);

- Préciser les coordonnées de fin de la ligne à l’aide d’un seul objet PVector :
PVector monVect;
monVect = new PVector(longueurLigne, 0);
line(marge, posVertical, marge + monVect.x, posVertical + monVect.y);

*/
