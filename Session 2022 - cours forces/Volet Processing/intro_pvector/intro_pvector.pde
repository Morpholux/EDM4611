// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 10 octobre 2022

PVector p1 = new PVector();

void setup() {
  size(600, 600);
  background(0);

  noFill();
  stroke(255);

  noLoop();
}

void draw() {
  background(0);

  for (int i=0; i < 100; i++) {

    float a = random(0, HALF_PI);
    p1 = PVector.fromAngle(a); // à un argument : angle en radian
    //PVector.fromAngle(a, p1); // à deux arguments : angle, PVector ciblé

    float m = random(100, 600);
    p1.mult(m);


    line(0, 0, p1.x, p1.y);
  }
}

void mousePressed() {
  redraw();
}
