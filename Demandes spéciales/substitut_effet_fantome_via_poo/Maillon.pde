class Maillon {
  PVector loc, vel;
  float taille, opacity;
  int idMaillon, nbMaillons;


  // Constructeur avec quatre arguments
  Maillon(PVector _lc, PVector _vl, int _idMaillon, int _nbMaillons) {
    loc = new PVector();
    loc.set(_lc);
    vel = new PVector();
    vel.set(_vl);
    idMaillon = _idMaillon;
    nbMaillons = _nbMaillons;

    // Chaque maillon aura une taille qui depend de son identifiant sur la chaîne.
    // La taille du premier maillon sera la plus grande, puis ira en diminuant.
    taille = map(idMaillon, 0, nbMaillons, 30, 1);
    //taille += 15*sin(map(idMaillon, 0, nbMaillons, 0, TWO_PI));
    //taille = 30;

    if (idMaillon == 0) {
      opacity = 255; // Opacité du premier maillon
    } else {
      opacity = map(idMaillon, 1, nbMaillons, 100, 0); // Opacité décroissante des autres maillons
    }
  }

  // Méthode pour effectuer la mise à jour des positions de chacun des maillons
  void update() {
    // Gestion de la position des maillons
    loc.add(vel);

    // On appelle la méthode qui permet de vérifier le contact avec les bords du sketch.
    boucleTopologique();
  }

  // Méthode  pour gérer l’affichage des maillons
  void display() {
    pushMatrix();
    translate(loc.x, loc.y);

    noStroke();
    //stroke(255);

    if (idMaillon == 0) {
      fill(255); // premier maillon sera blanc
    } else {
      fill(255, 100, 40, opacity); // maillons suivants
    }

    // Forme du maillon :
    ellipse(0, 0, taille, taille);
    popMatrix();
  }


  // Pour continuer de suivre le déplacement de notre maillon
  // lorsqu’il quitte la zone du sketch.
  void boucleTopologique() {
    int zoneAdditionnelle = 30; // Le repositionnement se fera un peu au-delà de la taille du sketch.

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
