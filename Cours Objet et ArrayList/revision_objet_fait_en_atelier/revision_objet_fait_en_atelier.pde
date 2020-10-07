
ArrayList <Arc> arcs;
//Arc a;

void setup() {
  size(800, 800);
  arcs = new ArrayList <Arc> ();

  //a = new Arc(int(width * 0.5), int(height * 0.5));
}


void draw() {
  background(0);

  //a.update();
  //a.display();

  // Utilisation du ArrayList
  if (arcs.size() > 0) {
    // On boucle à reculons
    for (int i = arcs.size() - 1; i >= 0; i--) {
      // copie de notre instance dans la liste que l’on attribue à un objet temporaire
      //Arc a  = arcs.get(i);
      //a.update();
      //a.display();

      // Accès direct l’instance dans le Arraylist et appel de ses méthodes
      arcs.get(i).update();
      arcs.get(i).display();
    }
  }
}

void mousePressed() {
  for (int i = 0; i < 10; i++) {
    float x = random(100, width-100);
    float y = random(100, height-100);
    arcs.add(new Arc(int(x), int(y)));
  }

  //Arc tempArc = new Arc(mouseX, mouseY);
  //arcs.add(tempArc);
}

void keyPressed() {
  if (key == ' ') {
    arcs.clear();
    //arcs.get(0).angle = 1;
  }
}
