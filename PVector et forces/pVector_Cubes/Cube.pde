// Description de la classe
class Cube {
  // Variables membres
  PVector loc;
  PVector vel;
  PVector acc;
  float rotationCube;
  float friction = random(0.92, 0.99);

  //Constructeur
  Cube (PVector a, PVector v, PVector l, float rc) {
    acc = a;
    vel = v;
    loc = l;
    rotationCube = rc;
  }

  void draw() {
    if (vel.mag() < 0.1) { // Seuil de vitesse
      // On arrête le mouvement
      acc.mult(0);
      vel.mult(0);
    } 
    else if ((loc.y > 200)&&(toucheClavier==true)) {
      // On arrête le mouvement et on annule la rotation des cubes
      acc.mult(0);
      vel.mult(0);
      loc.y = 200;
      rotationCube = 0;
   }  
    else {
      // On réduit progressivement la vitesse
      vel.mult(friction);
      // Vitesse également affectée par l’accélération. Aucun changement lorsque vecteur acc est à 0.
      vel.add(acc);
      // println(vel.magnitude());
      // L’emplacement est mis à jour en fonction des vecteurs de vitesse.
      loc.add(vel);
    }

    // Affichage d'une figure à l'emplacement désigné
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    rotateX(rotationCube);
    box(40);
    popMatrix();
  }
}

