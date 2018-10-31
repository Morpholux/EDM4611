// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// dimanche, 28 octobre 2018

// Exemple de gestion du déplacement par PVector.
// Cas simple d’un seul mobile dont la vitesse initiale
// sera affectée par une force inverse destinée à freiner son élan.

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
  PVector loc, vel, friction; // ajout d’un vecteur
  float angle;

  Mobile() {
    // Position initiale du mobile :
    loc = new PVector(100, 300);

    // C’est maintenant le temps de préciser la direction du déplacement:
    vel = new PVector(1, 0.15, 0);

    // Puis on fixe l’envergure des enjambées de notre vecteur.
    // Ici, il s’agit d’un déplacement équivalant à 20 pixels pour le premier frame.
    // La distance parcoure est la même, peut importe que le déplacement se fasse
    // parallèlement à l’un des deux axes du plan cartésien ou pas.
    vel.setMag(20);

    // On règle l’orientation du mobile.
    angle = vel.heading();

    // création d’une force de friction
    friction = new PVector();
  }

  void update() {

    // La flèche est tournée dans la direction de la vélocité
    angle = vel.heading();

    // On récupère la force de vitesse
    friction = vel.copy();
    // Inversion de la direction du vecteur
    friction.mult(-1);
    // Réduction de la force par rapport à la vitesse
    // donc, 40 x moindre
    friction.mult(0.025);

    // 1. Mise à jour de la vélocité selon la force de friction
    vel.add(friction);
    // 2. Mise à jour de la position selon la vélocité
    loc.add(vel);




    // On appelle la méthode qui permet de vérifier le contact avec les bords du sketch.
    boucleTopologique();

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

// Comment le relancer dans une autre direction, avec une autre vitesse.
void mousePressed() {
  //m1.vel.set(random(-1,1),random(-1,1),0);
  // ou bien
  m1.vel = PVector.random2D();
  m1.vel.setMag(random(15, 25));
}
