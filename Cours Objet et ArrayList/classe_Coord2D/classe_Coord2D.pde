// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// lundi, 1 octobre 2018

/*
1. Real-world objects contain state and behavior.
2. A software object's state is stored in fields.
3. A software object's behavior is exposed through methods.
*/

Coord2D c1, c2;

void setup() {
  size(400, 400);
  background(0);
  fill(255);
  noStroke();

  // création d’une instance
  c1 = new Coord2D(width/2, height/2);
  c2 = new Coord2D(100.0, 100.0);
}

void draw() {
  background(0);
  
  fill(204);
  ellipse(c1.xi, c1.yi, 40, 40);
  
  fill(200,50,80);
  ellipse(c2.xf, c2.yf, 40, 40);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      c1.est();
      c2.est();
    } else if (keyCode == DOWN) {
      c1.sud();
      c2.sud();
    } else if (keyCode == LEFT) {
      c1.ouest();
      c2.ouest();
    } else if (keyCode == UP) {
      c1.nord();
      c2.nord();
    }
  }
}

class Coord2D {
  // variables membres : les champs (fields) requis pour sauvegarder des états, ici, une position 2D
  int xi, yi;
  float xf, yf;

  // constructeurs
  Coord2D (int _xi, int _yi) {
    xi = _xi;
    yi = _yi;
  }
  
  Coord2D (float _xf, float _yf) {
    xf = _xf;
    yf = _yf;
  }

  // méthodes : les comportements (behavior) de l’objet sont «exposés» à travers des méthodes
  void est() {
    xi+=10;
    xf*=1.1;
  }
  
  void sud() {
    yi+=10;
    yf*=1.1;
  }

  void ouest() {
    xi-=10;
    xf*=0.9;
  }

  void nord() {
    yi-=10;
    yf*=0.9;
  }

}
