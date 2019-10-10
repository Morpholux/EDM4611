class Mobile {
  PVector loc, vel, acc;
  float taille;
  int idmob;
  int nbmob;
  float opacity;


  // Constructeur avec quatre arguments
  Mobile(PVector _lc, PVector _vl, int _idmob, int _nbmob) {

    loc = new PVector();
    loc.set(_lc);
    vel = new PVector();
    vel.set(_vl);
    idmob = _idmob;
    nbmob = _nbmob;

    // Chaque mobile aura une taille qui depend de son identifiant sur le chapelet
    // La taille du premier mobile sera la plus grande
    taille = map(idmob, 0, nbmob, 30, 1);
    //taille += 15*sin(map(idmob, 0, nbmob, 0, TWO_PI));
    //taille = 30;

    if (idmob == 0) {
      opacity = 255;
    } else {
      opacity = map(idmob, 1, nbmob, 100, 0);
    }
  }

  void update() {

    loc.add(vel);

    // On appelle la méthode qui permet de vérifier le contact avec les bords du sketch.
    boucleTopologique();
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);

    noStroke();
    //stroke(255);

    if (idmob == 0) {
      fill(255);
    } else {
      fill(255, 100, 40, opacity);
    }

    // Forme de l’objet :
    //rect(-taille/2,-taille/2,taille,taille);


    //beginShape(TRIANGLE);
    //vertex(cos(radians(30))*taille, sin(radians(30))*taille);
    //vertex(cos(radians(150))*taille, sin(radians(150))*taille);
    //vertex(cos(radians(270))*taille, sin(radians(270))*taille);
    //endShape();

    beginShape();
    for (int i = 0; i<36; i++) {
      vertex(cos(radians(i*10))*taille, sin(radians(i*10))*taille);
    }
    endShape(CLOSE);


    popMatrix();
  }


  // Pour continuer de suivre le déplacement de notre mobile
  // lorsqu’il quitte la zone du sketch.
  void boucleTopologique() {
    int zoneAdditionnelle = 30;

    if (loc.x > width + zoneAdditionnelle) {
      //loc.x = 0;
      loc.set(0, loc.y, 0);
    } else if (loc.x < -zoneAdditionnelle) {
      loc.set(width, loc.y, 0);
    }

    if (loc.y > height + zoneAdditionnelle) {
      //loc.y = 0;
      loc.set(loc.x, 0, 0);
    } else if (loc.y < -zoneAdditionnelle) {
      loc.set(loc.x, height, 0);
    }
  }
}
