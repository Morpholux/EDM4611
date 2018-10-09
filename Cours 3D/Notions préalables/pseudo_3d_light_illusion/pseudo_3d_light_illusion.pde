// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.3
// vendredi, 6 janvier 2017

// Adaptation de : https://github.com/bit101/lab/blob/master/dailies/170101.js

int numPoints = 100;
Point [] points = new Point[numPoints];
float a = 0.000001; // Ne peut pas équivaloir 0, comme dans le code original
float s = 0.02;
boolean onSauve = false;

void setup() {
  size(800, 800);
  pixelDensity(displayDensity());
  background(0);
  noFill();
  strokeWeight(10);
  //smooth(8);

  for (int i = 0; i < numPoints; i++) {
    float offset = random(TWO_PI), slices = 16, slice = TWO_PI/slices;
    points[i] = new Point(random(width/4), random(-height/2, height/2), random(10, 50), i*slice);
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < numPoints; i++) {
    Point p = points[i];
    pushMatrix();
    scale(sin(a + p.offset), 1);
    stroke(map((cos(((a+p.offset)*2)+PI))%TWO_PI, -1, 1, 0, 255));
    ellipse(p.x, p.y, p.r, p.r);
    popMatrix();
  }
  a += s;

  if (onSauve) {
    save("rendu.png");
    onSauve = false;
  }
}

class Point {
  float x, y, r, offset;
  Point(float _x, float _y, float _r, float _offset) {
    x = _x;
    y = _y;
    r = _r;
    offset = _offset;
  }
}

void keyPressed() {
  if (key == 's') {
    onSauve = true;
  }
}