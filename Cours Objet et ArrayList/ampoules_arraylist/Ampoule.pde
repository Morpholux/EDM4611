class Ampoule {
  // Variables membres
  int x, y, life, id;
  color c;

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
    c = color(#EAB70E, 40);
  }

  // Méthodes
  void update() {
    if (life > 0) { 
      life --;
    } else {
      life = 0;
    }
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, life, life);

    if (life == 0) {
      ampoules.remove(this);
      //println(ampoules.size());
    }
  }
}
