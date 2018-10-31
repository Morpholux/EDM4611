// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// vendredi, 9 octobre 2015

// Exemple de gestion du déplacement par PVector.
// Cas simple d’un seul mobile à vitesse constante, mais dont la vitesse
// sera affectée par une force aléatoire.

Mobile m1;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  rectMode(CENTER);
  m1 = new Mobile();
}

void draw() {
  background(0);

  m1.update();
  m1.display();
}

class Mobile {
  PVector loc, vel, brownien; // ajout d’un vecteur
  float angle;

  Mobile() {
    // Position initiale du mobile :
    loc = new PVector(300, 300);

    // Direction de déplacement à la création de l'objet:
    vel = new PVector(0,-2,0);

    // On règle l’orientation du mobile.
    angle = vel.heading();

    // création d’une force aléatoire
    brownien = PVector.random2D();
    brownien.normalize();
    // Réduction de la force par rapport à un vecteur normé
    brownien.mult(0.05);
  }

  void update() {
    
    // 1. Mise à jour constante de la force
    brownien = PVector.random2D();
    brownien.normalize();
    // Réduction de la force par rapport à un vecteur normé
    brownien.mult(0.05);

    // 2. Mise à jour de la vélocité selon la force aléatoire
    vel.add(brownien);
    
    // 3. On limite la vélocité
    vel.limit(2);
    
    // 4. Mise à jour de l'emplacement selon la vélocité
    loc.add(vel);

    // On appelle la méthode qui permet de vérifier le contact avec les bords du sketch.
    boucleTopologique();

    // Mise à jour de l’orientation du carré dans l’axe de déplacement
    angle = vel.heading();
  }

  void display() {
    //Recours aux transformateurs géométriques, en raison de l’utilisation de la rotation
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    //rect(0, 0, 50, 5);
    // Forme de l’objet :
    beginShape();
    vertex(-20, 0);
    vertex(20, -4);
    vertex(20, -8);
    vertex(30, 0);
    vertex(20, 8);
    vertex(20, 4);
    endShape(CLOSE);
    popMatrix();
  }

  // Pour continuer de suivre le déplacement de notre mobile
  // lorsqu’il quitte la zone du sketch.
  void boucleTopologique() {
    if (loc.x > width) {
      //loc.x = 0;
      loc.set(0, loc.y, 0);
    } else if (loc.x < 0) {
      loc.set(width, loc.y, 0);
    }

    if (loc.y > height) {
      //loc.y = 0;
      loc.set(loc.x, 0, 0);
    } else if (loc.y < 0) {
      loc.set(loc.x, height, 0);
    }
  }
}
