// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// samedi, 10 septembre 2016

// Consignes d’utilisation : dessiner les pixels inversés d’une image en cliquant-glissant la souris

// Points à retenir :
// - l’inversion de la couleur pour chaque canaux se fait par la soustraction : 255 - la variable du canal
// - au besoin, la commande constrain est appliquée au point de saisie des coordonnées de la souris, en raison du fonctionnement de mouseDragged()
// - l’inversion des valeurs RGB se fait avant le BitShifting de reconstitution de la nouvelle couleur
// - on dessine les nouveaux pixels sur une copie de l’image originale plutôt que sur le sketch, autrement l’inversion s’effectuerait en boucle
// - la contrainte de lecture de la position de la souris est ici plus efficace avec deux conditions solidaires.

PImage img, imgCopie;
color couleurImageOriginale, nouvelleCouleur;
int a, r, g, b;
int sourisX, sourisY;

// Nouvelle procédure pour obtenir un sketch dont la taille
// est ajustée aux dimensions d’une image importée.

void setup() {
  img = loadImage("ying.jpg");
  // Commande de rajustement de la taille du sketch en fonction des dimensions de l’image :
  surface.setSize(img.width, img.height);
  imgCopie = createImage(img.width, img.height, RGB); // seule la copie sera modifiée, évitant ainsi d’altérer l’original

  // On créé un double de l’image chargée en mémoire :
  //imgCopie.copy(img,0,0,width, height, 0,0,width, height);

  // Commande alternative à la commande de copie ci-dessus :
  arrayCopy(img.pixels, imgCopie.pixels);

  // On n’affiche pas le symbole du curseur, pour mieux voir sous la souris
  noCursor();
}

void draw() {
  // On affiche la copie de l’image originale.
  // C’est elle qui sera modifiée par les commandes d’écriture, dans le mouseDragged()
  background(imgCopie);

  // Dessin du curseur personnalisé
  stroke(255);
  //strokeWeight(0.5);
  noFill();
  point(mouseX, mouseY);
  rectMode(CENTER);
  rect(mouseX, mouseY, 10, 10);
}

void mouseDragged() {
  /*
  Grâce à la commande constrain(), les valeurs de la position de la souris
   ne pourront pas dépasser les dimensions du sketch, évitant ainsi les risques
   d’utiliser un index inapproprié dans la lecture (ou l’écriture) du tableau des pixels.
   Voir erreur "array index out of bounds exception".
   */

  //sourisX = constrain(mouseX, 0, width-1);
  //sourisY = constrain(mouseY, 0, height-1);

  // Une solution alternative :
  //if ((mouseX >= 0)&&(mouseX < width)) sourisX = mouseX;
  //if ((mouseY >= 0)&&(mouseY < height)) sourisY = mouseY;

  /*
  Mais le problème reste le suivant :
   Même avec la souris en dehors du sketch, l’une des deux variables peut changer.
   C’est le cas si l’on se trouve dans le prolongement des côtés du sketch.
   L’altération du pixel se poursuit le long de la bordure.
   Il faut donc rendre les deux conditions solidaires.
   */

  if ((mouseX >= 0)&&(mouseX < width)&&(mouseY >= 0)&&(mouseY < height)) {
    // La commande constrain() n’est plus nécessaire ici.
    sourisX = mouseX;
    sourisY = mouseY;

    // Portion lecture des pixels de l’image en mémoire
    img.loadPixels();
    couleurImageOriginale = img.pixels[maFonction(sourisX, sourisY)];
    a = (couleurImageOriginale >> 24) & 0xFF;
    r = (couleurImageOriginale >> 16) & 0xFF;
    g = (couleurImageOriginale >> 8) & 0xFF;
    b = couleurImageOriginale & 0xFF;
    //println("alpha : "+a+", rouge : "+r+" , vert : "+g+", bleu : "+b);

    //a = a; // pas de changement
    // inversion des valeurs RGB : 255 - valeur
    r = 255-r;
    g = 255-g;
    b = 255-b;

    //nouvelleCouleur = color(r,g,b);
    nouvelleCouleur = (a << 24) | (r << 16) | (g << 8) | b;

    // Procédure d’écriture des pixels dans une copie de l’image originale.
    // On laisse la trace de notre action, car rien ne vient l’effacer
    imgCopie.loadPixels();
    imgCopie.pixels[maFonction(sourisX, sourisY)] = color(nouvelleCouleur);
    imgCopie.updatePixels();
  }
}


// Fonction de conversion des coordonnées cartésiennes X et Y vers l’index d’un tableau unidimensionnel
int maFonction(int posX, int posY) {
  int monIndex;
  monIndex = (posY*width)+posX;
  return monIndex;
}