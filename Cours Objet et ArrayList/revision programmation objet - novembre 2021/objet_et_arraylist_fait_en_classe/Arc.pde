class Arc {
  // 1- Variables membres
  int posx, posy;
  float taille, angle, facteur;
  color c;
  boolean alive;


  // 2- Contructeurs
  Arc () { // instance par défaut
    posx = width/2;
    posy = height/2;
    taille = 100;
    angle = 1;
    facteur = 1.2;
    c = color(255);
    alive = true;
  }

  Arc (int _posx, int _posy) {
    posx = _posx;
    posy = _posy;
    taille = random(80, 200);
    angle = 1;
    facteur = 1.01 + random(0, 0.1); // entre 1.01 et 1.11
    c = color(random(50, 255));
    alive = true;
  }

  // 3- Méthodes
  void update() {
    angle *= facteur;
    if (angle >= 360) {
      //angle = 1;
      alive = false;
    }
  }

  void display() {
    if (alive) {
      fill(c, 150);
      stroke(c);
      arc(posx, posy, taille, taille, 0, radians(angle), PIE);
    } else { // instance est morte
      arcs.remove(this);
    }
  }
}
