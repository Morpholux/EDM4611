// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 5 octobre 2020

// Clics de souris sur la surface du sketch génèrent des groupes de figures en arc de cercle

ArrayList<Arc> arcs = new ArrayList<Arc>();

void setup() {
  size(800, 800);
  fill(255);
  noStroke();
}

void draw() {
  background(0);

  // la boucle fonctionne à rebours dans la liste
  for (int i = arcs.size() - 1; i >= 0; i--) {
    arcs.get(i).update();
    arcs.get(i).display();
  }

  // Optionnel
  blendMode(ADD);
}

void mousePressed() {
  int nbRepetition = int (random(3, 10));
  for (int i = 0; i < nbRepetition; i++) {
    arcs.add(new Arc(mouseX, mouseY));
  }
  //println(arcs.size());
}

class Arc {
  // variables membres
  int posx, posy;
  float taille, angle, vitesseAngle;

  // constructeurs
  Arc(int _posx, int _posy) {
    posx = _posx;
    posy = _posy;

    taille = 100 + random(50, 200);
    angle = 360;

    vitesseAngle = random(0.9, 0.985);
  }

  // Deux méthodes : update et display
  void update() {
    if (angle > 1) {
      angle *= vitesseAngle;
    } else {
      angle = 0;
    }
  }

  void display() {
    noStroke();
    fill(210, 190, 50, 100);

    arc(posx, posy, taille, taille, 0, radians(angle), PIE);

    if (angle == 0) {
      arcs.remove(this);
      //println(arcs.size());
    }
  }
}
