class Particule {
  // Variables membres
  PVector vCentre, loc, vel, acc;
  float diametre, masse, facteurAccel;

  // *** Valeurs à modifier au besoin :
  float forceCentrifugeInitiale = 3000, friction = 0.9;

  //Constructeur
  Particule (PVector vc, float d) {
    vCentre = vc;

    diametre = d;
    masse = PI*(sq(diametre*0.5)); // formule de l’aire d'un disque : S = PI*((rayon)^2)

    // Les vecteurs d’accélération pointent dans toutes les directions
    acc = new PVector(random(-1, 1), random(-1, 1));
    // On normalise les vecteurs d’accélération afin qu’ils aient tous la même magnitude
    // Tout ce que l’on souhaite, ce sont des flèches tournées sur 360 degrés.
    acc.normalize();
    // Enfin, l’accélération initiale de la particule dépend de sa masse.
    facteurAccel = forceCentrifugeInitiale/masse;
    // Le multiplicateur vient modifier la magnitude du vecteur, mais pas sa direction
    acc.mult(facteurAccel);


    vel = new PVector(0, 0); // Vitesse nulle (magnitude = 0), pour le moment.
    loc = new PVector(vCentre.x, vCentre.y);

    // La vitesse initiale est déterminée par l’impulsion de l’explosion
    vel.add(acc);
    //println(vel.toString());
  }

  // * * * * *
  // Méthode permettant l’affichage de la particule
  // * * * * *
  void draw() {
    if (vel.mag() < 0.1) { // Seuil de vitesse
      // On arrête le mouvement
      acc.mult(0);
      vel.mult(0);
    } 
    else {
      // On réduit progressivement la vitesse
      vel.mult(friction);
      // L’emplacement est mis à jour en fonction du vecteur de vitesse.
      loc.add(vel);
    }

    // Affichage d'une figure à l'emplacement désigné
    // Opacité dépend de la vitesse
    // fill(0, vel.mag()*50);
    // Opacité totale
    fill(0);
    ellipse(loc.x, loc.y, diametre, diametre);
  }
}












