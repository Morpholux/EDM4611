class Ligne {
  // 1- Variables membres
  float p1x, p1y, p2x, p2y;
  float alfa;
  float facteur;

  // 2- Constructeurs
  Ligne() {
    p1x = 0;
    p1y = 100;
    p2x = 300;
    p2y = 200;
  }

  Ligne(float _p2x, float _p2y) {
    p1x = 0;
    p1y = 100;
    p2x = _p2x;
    p2y = _p2y;
    alfa = 255;
    facteur = map(random(10), 0, 9.9999, 1, 0.1);
  }

  // 3- Méthodes
  void update() {
    p1x = mouseX;
    p1y = mouseY;
    alfa -= facteur;
  }

  void display() {
    if (alfa >= 1) {
      noFill();
      stroke(255, 0, 0, alfa);
      line(p1x, p1y, p2x, p2y);
    } else {
      
      Lignes.remove(this);
      //println(Lignes.size());
    }
  }
}
