// Rotation circulaire autour d'un point à l’aide de la classe PVector
// en sept commandes successives : add, normalize, mult, sub, normalize, mult, set.


// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 1.0.9
// mardi, 20 octobre 2009

PVector pointPeripherie, mouvementTangentiel, additionVecteurs;
float magnitudeRayon, magnitudePas;
float rayon = 200, pas = 5;
float tempsNoise = 0.0, ecartRayon = 100;


void setup() {
  size(600, 600);
  background(0);
  noStroke();
  smooth();


  pointPeripherie = new PVector (rayon, 0);
  mouvementTangentiel = new PVector (0, pas); // vers le bas, pour commencer

  // Les deux variables suivantes servent à conserver la magnitude des vecteurs initiaux.
  magnitudeRayon = pointPeripherie.mag();
  magnitudePas = mouvementTangentiel.mag();
}

void draw() {
  background(0);
  translate(width/2, height/2);

  fill(#497906);
  ellipse(0,0, 10, 10);

  // * * * Procédure de rotation
  // À quel endroit un objet en rotation irait-il s'il n'était pas contraint par sa force centripete?
  additionVecteurs = PVector.add(mouvementTangentiel, pointPeripherie);
  // On ajuste la pointe du vecteur résultant de l'addition en fonction de la longeur du rayon.
  // On détermine ainsi l’emplacement que devrait avoir l’objet au prochain frame
  additionVecteurs.normalize();
  additionVecteurs.mult(magnitudeRayon);

  // Il faut maintenant corriger la direction du mouvement tangentiel
  // en comparant la future position de l’objet à son ancien emplacement.
  // mouvementTangentiel.x = additionVecteurs.x-pointPeripherie.x;
  // mouvementTangentiel.y = additionVecteurs.y-pointPeripherie.y;

  // Plus simplement, on peut écrire :
  mouvementTangentiel = PVector.sub(additionVecteurs, pointPeripherie);

  // La magnitude du vecteur est ajustée pour respecter l’impulsion du mouvement initial
  mouvementTangentiel.normalize();
  mouvementTangentiel.mult(magnitudePas);

  // Le nouveau point de l’objet en rotation est mis à jour :
  pointPeripherie.set(additionVecteurs);

  // On pourrait aussi écrire :
  // pointPeripherie.add(mouvementTangentiel);

  // * * * *

  // Dessin du point en rotation
  fill(#D5D609);
  ellipse(pointPeripherie.x, pointPeripherie.y, 5, 5);

  // On peut, au besoin, faire varier l'amplitude des pas:
  // Notons que la valeur utilisée doit être supérieure à 0
  // sans quoi l’objet pourra s’immobiliser...
  // (avec le vecteur de mouvementTangentiel qui devient nul).
  //magnitudePas = 0.01+(50*abs(sin(millis()*0.001)));

  // De la même façon, on peut faire varier l’amplitude du rayon:
  /*
  tempsNoise += 0.01;
   magnitudeRayon = rayon+(ecartRayon*noise(tempsNoise));
   */
}

