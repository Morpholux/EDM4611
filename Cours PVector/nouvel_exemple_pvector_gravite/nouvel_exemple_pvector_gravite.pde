// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 12 octobre 2020

PVector pos, vel, gravite;
int decompteFrames;

void setup() {
  size(600, 600);

  background(0);
  fill(255, 150);
  noStroke();

  pos = new PVector(width/2, height/2, 0);
  vel = new PVector(random(-0.3, 0.3), -1, 0);
  vel.normalize(); // on force la magnitude à 1
  vel.mult(10);

  gravite = new PVector(0, 0.25, 0);

  pushStyle();
  noFill();
  stroke(127);
  ellipse(width/2, height/2, 485, 485);
  popStyle();
}

void draw() {
  //background(0);

  if (pos.y < height-10) { // si le mobile n’a pas dépassé la limite inférieure du sketch
    vel.add(gravite);
    vel.limit(10); // la vélocité ne dépassera pas 10 pixels par frame
    pos.add(vel);
    ellipse(pos.x, pos.y, 20, 20);
  } else {
    vel.mult(0); // on arrête le mobile
    pos.y = height-10; // on détermine la position définitive, car elle n’est jamais à cet endroit
    decompteFrames = frameCount;
  }


  if (decompteFrames == frameCount) {
    pushStyle();
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 20, 20);
    popStyle();
    
    relancerMobile();
  }
}

void relancerMobile() {
  pos = new PVector(width/2, height/2, 0);
  vel = new PVector(random(-0.3, 0.3), -1, 0);
  vel.normalize();
  vel.mult(10);
  gravite = new PVector(0, 0.25, 0);
}
