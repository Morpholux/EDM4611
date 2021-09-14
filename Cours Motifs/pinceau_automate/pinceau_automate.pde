// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mercredi, 29 janvier 2020

PImage palette, point;
color c;

void setup() {
  size(800, 800, P2D);
  background(0);
  fill(255);
  noStroke();

  palette = loadImage("palette.gif");
  point = loadImage("point.png");

  palette.loadPixels();
  imageMode(CENTER);

  noLoop();
}

void draw() {
  //background(0);
  /*
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
  fill(255);
  */

  for (int i = 0; i < 100; i ++) {
    c= palette.pixels[floor(random(palette.width))];
    float echelle = random(0.1, 3.0);

    pushMatrix();
    translate(random(0, width), random(0, height));

    tint(c, random(10, 40));
    image(point, 0, 0, point.width*echelle, point.height*echelle);
    popMatrix();
  }
}

void mousePressed() {
  redraw();
}
