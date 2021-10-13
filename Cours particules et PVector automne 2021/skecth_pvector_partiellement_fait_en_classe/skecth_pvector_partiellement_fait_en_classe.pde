// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 12 octobre 2021

PVector loc, velocite, friction;

void setup() {
  size(600, 600, FX2D);
  background(0);
  noFill();
  stroke(255);

  //velocite = new PVector(1,1);
  //velocite = PVector.random2D();
  velocite = PVector.fromAngle(radians(random(0, 360)));
  velocite.normalize();
  velocite.mult(25);

  friction = velocite.copy();
  friction.mult(-1);
  friction.mult(0.05);


  loc = new PVector(0, 0); // Coordonnées de la position initiale
}

void draw() {
  //background(0);
  translate(width/2, height/2);
  


  if (velocite.mag() > 1) { // la modification de la vélocité se fera uniquement si sa magnitude dépasse 1.
    velocite.add(friction); // vitesse réduite par l’ajout de la force de friction (qui lui est opposée).
  } else {
    // On annule les forces, donc le mobile s’arrêtera
    velocite.setMag(0);
    friction.setMag(0);
  }
  // mise à jour de la position
  loc.add(velocite);

  pushMatrix();
  translate(loc.x, loc.y);
  circle(0, 0, 50);
  //circle(0, 0, map(velocite.mag(), 5, 0, 50, 5));
  line(0, 0, velocite.x, velocite.y);
  popMatrix();


  circle(0, 0, 10);
}


void mousePressed() {
  //background(0);

  velocite = PVector.fromAngle(radians(random(0, 360)));
  velocite.normalize();
  velocite.mult(25);

  friction = velocite.copy();
  friction.mult(-1);
  friction.mult(0.05);


  loc = new PVector(0, 0); // Coordonnées de la position initiale
}
