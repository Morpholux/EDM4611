class Arc {
  // variables membres
  int posx, posy;
  float taille, angle, facteurAttenuation;
  boolean alive;
  color [] couls = {#FFBC00, #AF4433, #BE6674, #97BC53};
  color c;


  // constructeurs
  Arc (int _posx, int _posy) {
    posx = _posx;
    posy = _posy;
    taille = 30 + (random(20, 100));
    angle = 1;
    facteurAttenuation = 1.02 + random(0.1);
    alive = true;
    c = couls[floor(random(0,couls.length))];
  }


  // méthodes
  void update() {
    angle *= facteurAttenuation;
    if (angle >= 360) {
      alive = false; // fin de vie
    }
    //angle %= 360;
  }

  void display() {
    if (alive) { // si vivant
      fill(c, 150);
      noStroke();
      arc(posx, posy, taille, taille, 0, radians(angle), PIE);
    } else { // si mort
      arcs.remove(this); // on retire du arraylist
    }
  }
}
