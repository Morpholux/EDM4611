// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// mardi, 11 septembre 2018

PImage img;
color c;

void setup() {
  size(100, 100);
  img = loadImage("capture.png");
  background(0);
  fill(255);
  noStroke();
  //noLoop();
  noCursor();
}

void draw() {
  //background(0);
  //image(img, frameCount%width,20);

  if ((mouseX>=0)&&(mouseX<width)&&(mouseY>=0)&&(mouseY<height)) {

    int index = positionXyVersIndex(mouseX, mouseY, width);

    img.loadPixels();
    c = img.pixels[index];
    //println(red(c));

    fill(c, 20);
    noStroke();
    ellipse(mouseX, mouseY, 10, 10);
  }


  //println(positionXyVersIndex(mouseX, mouseY, width));
}

int positionXyVersIndex(float posX, float posY, int largeur) {
  int monIndex = int((posY*largeur)+posX);
  return monIndex;
}
