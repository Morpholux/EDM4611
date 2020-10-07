class Arc {
  // variables membres
  int posx, posy;
  float taille, angle, facteurAttenuation;


  // constructeurs
  Arc (int _posx, int _posy) {
    posx = _posx;
    posy = _posy;
    taille = 30 + (random(20, 100));
    angle = 1;
    facteurAttenuation = 1.02 + random(0.05);
  }


  // méthodes
  void update() {
    angle *= facteurAttenuation;
    if (angle >= 360) {
      angle = 1;
    }
    //angle %= 360;
  }

  void display() {
    fill(#FFBC00, 200);
    noStroke();

    arc(posx, posy, taille, taille, 0, radians(angle), PIE);
  }
}
