// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// dimanche, 12 septembre 2021

// Exemple d’un cas de distribution gérée de manière dynamique*, à l’aide de valeurs relatives**
// * dynamique : on peut modifier à notre guise les valeurs d’entrée et le code s’adapte automatiquement aux changements
// ** relative : les dimensions secondaires découlent des précédentes, et sont calculées en fonction d’un ratio (un rapport)


// Variables globales:
int zoneGrille, marge;
float ratioZoneVsSketch = 0.75; // Définir ici la taille relative de la zone d’occupation
int nbItems = 6; // Définir ici le nombre d’items
float ratioTailleVsZoneGrille = 0.5; // Définir ici la taille relative de l’item
float tailleItem;

void setup() {
  size(800, 800); // Le reste du programme nous oblige à exploiter un format carré
  background(0);
  noStroke();

  zoneGrille = int(width * ratioZoneVsSketch);
  println(zoneGrille);
  marge = round((width - (zoneGrille))*0.5);
  println(marge);

  tailleItem = (zoneGrille / float(nbItems - 1)) * ratioTailleVsZoneGrille;
}

void draw() {
  background(0);

  // Transformateur géométrique. Ne requiert pas de pushMatrix() popMatrix(), puisque non cumulatif.
  translate(marge, marge);

  fill(50);
  rect(0 - (tailleItem*0.5), 0 - (tailleItem*0.5), zoneGrille+tailleItem, zoneGrille+tailleItem);

  fill(100);
  rect(0, 0, zoneGrille, zoneGrille);


  for (int j = 0; j <nbItems; j++) {
    for (int i = 0; i <nbItems; i++) {
      float posX = map(i, 0, nbItems-1, 0, zoneGrille);
      float posY = map(j, 0, nbItems-1, 0, zoneGrille);
      fill(255);
      circle(posX, posY, tailleItem);
    }
  }
}
