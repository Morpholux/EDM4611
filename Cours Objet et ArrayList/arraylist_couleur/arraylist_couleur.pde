// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 2.2.1
// vendredi, 12 septembre 2014


ArrayList<Couleur> tableauJava;


void setup() {
  size(200, 200);
  background(0);
  fill(255);
  noStroke();
  noLoop();

  tableauJava = new ArrayList<Couleur>();

  tableauJava.add(new Couleur(random(255), random(255), random(255)));
}

void draw() {
  //if (tableauJava.size() > 0) {
  //  Couleur cTemp = (Couleur)tableauJava.get(tableauJava.size()-1);
  //  background(color(cTemp.c));
  //} else {
  //  background(127);
  //}

  Couleur cTemp = (Couleur)tableauJava.get(tableauJava.size()-1);
  background(color(cTemp.c));
}

void mouseDragged() {
  tableauJava.add(new Couleur(random(255), random(255), random(255)));
  println("Le tableau compte "+tableauJava.size()+" couleurs.");
  redraw();
}

void keyPressed() {
  tableauJava.clear();
  tableauJava.add(new Couleur());
  redraw();
}


class Couleur {
  color c;
  float r, g, b, a;

  Couleur() {
    c = color(#CCCCCC); // grayscale 204
  }

  Couleur(float _k) {
    r = _k; 
    g = _k; 
    b = _k;
    c = color(r, g, b);
  }

  Couleur(float _k, float _a) {
    r = _k; 
    g = _k; 
    b = _k; 
    a = _a;
    c = color(r, g, b, a);
  }

  Couleur(float _r, float _g, float _b) {
    r = _r; 
    g = _g; 
    b = _b;
    c = color(r, g, b);
  }

  Couleur(float _r, float _g, float _b, float _a) {
    r = _r; 
    g = _g; 
    b = _b; 
    a = _a;
    c = color(r, g, b, a);
  }
}
