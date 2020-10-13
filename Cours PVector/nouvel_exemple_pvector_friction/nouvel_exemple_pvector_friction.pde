// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 12 octobre 2020

PVector pos, vel, friction;
int decompteFrames;

void setup() {
  size(600, 600);
  
  background(0);
  fill(255);
  noStroke();
  
  pos = new PVector(width/2, height/2, 0);
  vel = vel.random2D(); // retourne un vecteur, donc pas nécessaire de faire new PVector();
  //println(vel.mag());
  vel.mult(10);

  //friction = new PVector(vel.x, vel.y, vel.z);
  friction = vel.copy();
  friction.mult(-0.02); // force opposée, mais beaucoup plus faible
  //println(friction.mag());
}

void draw() {
  background(0);

  if (vel.mag() > 1) { // si velocité du mobile plus grande que 1 pixel par frame
    vel.add(friction); // la force de friction produit une décélération progressive
    pos.add(vel);
  } else {
    vel.mult(0); // on arrête le mobile
    decompteFrames = frameCount;
  }

  ellipse(pos.x, pos.y, 20, 20);

  pushStyle();
  noFill();
  stroke(127);
  ellipse(width/2, height/2, 485, 485);
  popStyle();
  
  if (decompteFrames == frameCount) {
    println(pos.x);
    println(pos.y);
    println(pos.z);
    println();
  }
}

void mousePressed() {
  pos = new PVector(width/2, height/2, 0);
  vel = vel.random2D();
  vel.mult(10);
  friction = vel.copy();
  friction.mult(-0.02);
}
