// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 1 novembre 2021

ArrayList<Arc> arcs = new ArrayList<Arc>();
int posy;

void setup() {
  size(900, 900);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);
  if (arcs.size() > 0) {
    // Enhanced loop:
    //for (Arc arc : arcs) {
    //  arc.update();
    //  arc.display();
    //}

    // boucle à rebours
    for (int i = arcs.size()-1; i >= 0; i--) {
      Arc a = (Arc)arcs.get(i);
      a.update();
      a.display();
    }
  }

  blendMode(ADD);
}

void mousePressed() {
  posy = mouseY;
}

void mouseDragged() {
  arcs.add(new Arc(mouseX, posy));
}
