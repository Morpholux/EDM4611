// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// dimanche, 25 septembre 2016

// Incluant le problème du mouvement Overshoot

Mobile m1;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  m1 = new Mobile();
}

void draw() {
  background(0);
  m1.update();
  m1.display();
}

class Mobile {
  //1. Variables membres
  PVector loc, vel, cible, attraction;

  //2. constructeur
  Mobile() {
    loc = new PVector(0, 1, 0);
    //loc.normalize();
    loc.setMag(300);
    //loc.mult(300);

    // C’est ici que l’on créé la vitesse
    vel = new PVector(0, 1, 0); // 90 degrés, donc vers le bas
    vel.normalize();
    vel.setMag(1); // impulsion initiale

    cible = new PVector(300, 300, 0); // centre du sketch

    attraction = new PVector();
    // On trouve la force qui pointe vers cette cible
    attraction = PVector.sub(cible, loc);
    // On réduit considérablement cette force
    attraction.normalize();
    attraction.mult(0.05);
  }


  void update() {

    // Il faut continuellement mettre à jour la force d’attraction
    attraction = PVector.sub(cible, loc);
    // On réduit à nouveau cette force
    // afin d’atteindre la cible progressivement
    attraction.normalize();
    attraction.mult(0.05);

    // non-static
    vel.add(attraction);
    loc.add(vel);
    boucleTopologique();

    // static
    //PVector v1 = PVector.add(loc, vel);
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    ellipse(0, 0, 20, 20);
    // représentation des forces conjugées
    pushStyle();
    noFill();
    stroke(255, 0, 0);
    line(0, 0, vel.x*10, vel.y*10); // magnification 10x
    popStyle();
    popMatrix();
  }

  // Accessoirement, on fait réapparaître le mobile s'il sort du sketch
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