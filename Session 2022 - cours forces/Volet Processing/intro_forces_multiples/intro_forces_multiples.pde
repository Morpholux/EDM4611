// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 10 octobre 2022

PVector loc = new PVector(0, 0, 0);
PVector vel = new PVector();
PVector friction = new PVector();
PVector perpendiculaire = new PVector();
PVector z;


float a; // angle
float m; // multiple

void setup() {
  size(600, 600);
  background(0);

  noFill();
  stroke(255);

  // Initialisation
  a = random(0, HALF_PI);
  vel = PVector.fromAngle(a); // à un argument : angle en radian

  m = random(2, 5);
  vel.mult(m);


  // actions à chaque frame
  if (int(random(2)) == 0) {
    z = new PVector(0, 0, 1);
  } else {
    z = new PVector(0, 0, -1);
  }
  perpendiculaire = vel.cross(z);
  perpendiculaire.setMag(vel.mag() * 0.05);

  vel.add(perpendiculaire);

  friction = PVector.mult(vel, -1); // inversion du vecteur, sens contraire
  friction = PVector.mult(friction, 0.006);

  vel.add(friction);
  loc.add(vel);

  //println(vel.array());
  //println(friction.array());
}

void draw() {
  //background(0);

  if (vel.mag() > 0.5) { // détermine un seuil pour interrompre le calcul de forces, et éviter que la friction ne devienne prioritaire

    // actions à chaque frame
    if (int(random(2)) == 0) {
      z = new PVector(0, 0, 1);
    } else {
      z = new PVector(0, 0, -1);
    }
    perpendiculaire = vel.cross(z);
    perpendiculaire.setMag(vel.mag() * 0.05);

    vel.add(perpendiculaire);

    friction = PVector.mult(vel, -1); // inversion du vecteur, sens contraire
    friction = PVector.mult(friction, 0.006);

    vel.add(friction);
    loc.add(vel);

    //line(0, 0, loc.x, loc.y);
    circle(loc.x, loc.y, vel.mag() * 5);
  } else {
    //line(0, 0, loc.x, loc.y);
    circle(loc.x, loc.y, vel.mag() * 5);
  }
}

void mousePressed() {
  // réinitialisation des valeurs de départ
  loc.set(0, 0, 0);

  // nouvelles piges :
  a = random(0, HALF_PI);
  vel = PVector.fromAngle(a); // à un argument : angle en radian

  m = random(2, 5);
  vel.mult(m);
}
