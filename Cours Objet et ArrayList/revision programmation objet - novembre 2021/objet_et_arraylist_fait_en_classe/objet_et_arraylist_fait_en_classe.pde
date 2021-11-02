// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 2 novembre 2021

// POO
// Arc a;

ArrayList<Arc> arcs = new ArrayList<Arc>();


void setup() {
  size(900, 900);
  background(0);
  fill(255);
  noStroke();

  println(arcs.size());
}

void draw() {
  background(0);

  //if (a != null) {
  //  a.update();
  //  a.display();
  //}


  // Enhanced loop
  //if (arcs.size() > 0) {
  //  for (Arc a : arcs) {
  //    a.update();
  //    a.display();
  //  }
  //}

  // Boucle à rebours, en raison du remove()
  for (int i = arcs.size()-1; i >= 0; i--) {
    Arc a = (Arc)arcs.get(i);
    a.update();
    a.display();
  }
}

void mousePressed() {
  //a = new Arc();
  //a = new Arc(mouseX, mouseY);

  arcs.add(new Arc(mouseX, mouseY));
  println(arcs.size());
}
