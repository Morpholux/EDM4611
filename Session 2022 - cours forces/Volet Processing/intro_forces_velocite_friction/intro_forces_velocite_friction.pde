// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 10 octobre 2022

PVector loc = new PVector(0,0,0);
PVector vel = new PVector();
PVector friction = new PVector();
float a; // angle
float m; // multiple

void setup() {
  size(600, 600);
  background(0);

  noFill();
  stroke(255);

  a = random(0, HALF_PI);
  vel = PVector.fromAngle(a); // à un argument : angle en radian

  m = random(2, 5);
  vel.mult(m);
  
  friction = PVector.mult(vel, -1); // inversion du vecteur, sens contraire
  friction = PVector.mult(friction, 0.005); // réduction de cette force relativement à la vélocité
  
  println(vel.array());
  println(friction.array());
  
}

void draw() {
  background(0);

  if (vel.mag() > 0.1) { // détermine un seuil pour interrompre le calcul de forces, et éviter que la friction ne devienne prioritaire
    vel.add(friction); // la vélocité est amoindrie par la friction, malgré l’opération d’addition
    loc.add(vel); // la position est mise à jour
    
    line(0, 0, loc.x, loc.y);
    circle(loc.x, loc.y, 20);
  } else {
    line(0, 0, loc.x, loc.y);
    circle(loc.x, loc.y, 20);
  }
}

void mousePressed() {
   // réinitialisation des valeurs de départ
  loc.set(0,0,0);
  
  // nouvelles piges :
  a = random(0, HALF_PI);
  vel = PVector.fromAngle(a); // à un argument : angle en radian

  m = random(2, 5);
  vel.mult(m);
  
  friction = PVector.mult(vel, -1); // inversion du vecteur, sens contraire
  friction = PVector.mult(friction, 0.005);
}
