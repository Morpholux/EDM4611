// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// dimanche, 13 septembre 2021

// Technique pour produire motif avec figures alternées aléatoirement


// Variables globales:
int zoneGrille, marge;
float ratioZoneVsSketch = 0.75; // Définir ici la taille relative de la zone d’occupation
int nbItems = 12; // Définir ici le nombre d’items
float ratioTailleVsZoneGrille = 1.25; // Définir ici la taille relative de l’item
float tailleItem;

void setup() {
  size(1200, 1200, FX2D); // Le reste du programme nous oblige à exploiter un format carré
  background(0);
  noFill();

  rectMode(CENTER);

  zoneGrille = int(width * ratioZoneVsSketch);
  //println(zoneGrille);
  marge = round((width - (zoneGrille))*0.5);
  //println(marge);

  tailleItem = (zoneGrille / float(nbItems - 1)) * ratioTailleVsZoneGrille;

  noLoop();
}

void draw() {
  background(0);

  // Transformateur géométrique. Ne requiert pas de pushMatrix() popMatrix(), puisque non cumulatif.
  translate(marge, marge);


  for (int j = 0; j <nbItems; j++) {
    for (int i = 0; i <nbItems; i++) {
      float posX = map(i, 0, nbItems-1, 0, zoneGrille);
      float posY = map(j, 0, nbItems-1, 0, zoneGrille);
      stroke(255);
      float pige = round(random(1.0));
      if (pige == 1) {
        circle(posX, posY, tailleItem);
      } else {
        pushMatrix();
        translate(posX, posY);
        rotate(PI/4);
        rect(0, 0, tailleItem, tailleItem);
        popMatrix();
      }
    }
  }
  
  save("rendu.jpg");
}
