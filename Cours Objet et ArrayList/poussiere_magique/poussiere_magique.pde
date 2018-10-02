// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// samedi, 29 septembre 2018

// Effet de poudre de fée clochette

float facteurHDversFullHD = 1.0;

ArrayList listeGrains = new ArrayList();

float vitesseSouris = 0;

void setup() {
  size(1280, 720, P2D);
  surface.setSize(int(1280*facteurHDversFullHD), int(720*facteurHDversFullHD));

  background(0);
  smooth();
  fill(255);
  noStroke();
}

void draw() {
  background(0);

  if (listeGrains.size() > 0) {
    for (int i=listeGrains.size()-1; i>=0; i--) {
      Grain g = (Grain)listeGrains.get(i);
      g.update();
      g.draw();
    }
    // On retire des objets au-delà d’une certaine limite
    if (listeGrains.size()>5000) {
      for (int i=listeGrains.size()-1; i>=0; i--) {
        if (i < 1000) {
          listeGrains.remove(i);
        }
      }
    }
  }
}


void mousePressed() {
  for (int i=0; i<10; i++) {
    listeGrains.add(new Grain(mouseX, mouseY, random(5, 15)));
  }
}

void mouseDragged() {
  if ((pmouseX > 0)&&(pmouseY > 0)) {
    vitesseSouris = dist(pmouseX, pmouseY, mouseX, mouseY);
    for (int i=0; i<floor(vitesseSouris); i++) {
      listeGrains.add(new Grain(mouseX-floor(random(0, vitesseSouris)), mouseY-floor(random(0, vitesseSouris*0.5)), random(10, 25)));
    }
  }
}

void mouseReleased() {
  println(listeGrains.size());
}
