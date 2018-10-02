class Grain {
  float posX, posY, increment;
  float taille;
  color coul;

  Grain (int _posX, int _posY, float _taille) {
    posX = _posX;
    posY = _posY;
    posX += random(-8,8);
    posY += random(-8,8);
    taille = _taille;
    increment = random(1, 3);
    coul = color(255, 0);
  }

  void update() {
    posY += increment;
    // Conserver aussi cette modif de taille pour effet de scintillement lorsque petit
    taille += random(-2, 1);
    if (taille <= 0.1) {
      taille = 0.1;
    } 
    else {
      taille += random(-2.0, 1.0);
    }
    coul = color(255, int(random(0, 255)));
  }


  void draw() {
    fill(coul);
    ellipse(posX, posY, taille, taille);
    
    if (posY > height) {
      listeGrains.remove(this);
    }
  }
}
