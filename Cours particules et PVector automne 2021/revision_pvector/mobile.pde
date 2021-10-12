class Mobile {
  // 1 - Variables membres
  PVector loc, angle, friction;
  float elanInit, tailleInit;

  // 2- Constructeur
  Mobile (PVector _loc) {
    tailleInit = 20;

    angle = PVector.random2D();
    angle.normalize();
    elanInit = random(10, 20);
    angle.mult(elanInit);

    friction = new PVector();
    friction = angle.copy();
    friction.mult(-1);
    friction.mult(0.025);

    loc = new PVector();
    loc = _loc.copy();

    // Dessin de l’objet à sa création
    //fill(255, 0, 0);
    //circle(loc.x, loc.y, tailleInit);
  }

  // 3 - Méthodes
  void update() {
    if (angle.mag() > 0.1) {
      angle.add(friction);
    } else {
      angle.setMag(0);
    }
    loc.add(angle);
  }

  void display() {
    float opacite = map(angle.mag(), 0, elanInit, 0, 255);
    fill(255, opacite);
    float taille = map(angle.mag(), 0, elanInit, 0, tailleInit);
    circle(loc.x, loc.y, taille);
  }
}
