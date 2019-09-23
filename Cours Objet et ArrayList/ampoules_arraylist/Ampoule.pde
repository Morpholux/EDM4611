class Ampoule {
  // Variables membres
  int x, y, life, id;
  color c;
  int alpha;

  // Contructeurs
  Ampoule (int _x, int _y, int _life) {
    x = _x;
    y = _y;
    life = _life;
    c = color(#EAB70E);
  }

  Ampoule (int _x, int _y, int _life, int _id) {
    x = _x;
    y = _y;
    life = _life;
    id = _id;
    alpha = 255;
    c = color(#EAB70E, alpha);
  }

  // Méthodes
  void update() {
    if (life > 0) { 
      life --;
      if (alpha > 0) {
        alpha --;
        c = color(#EAB70E, alpha);
      }
    } else {
      life = 0;
    }
  }

  void display() {
    fill(c);
    stroke(#EAB70E);
    strokeWeight(4);
    // la taille est caractérisée par la longévité
    ellipse(x, y, life, life);

    if (life == 0) {
      ampoules.remove(this);
      //println(ampoules.size());
    }
  }
}
