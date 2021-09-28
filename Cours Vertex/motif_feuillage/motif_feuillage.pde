// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 27 septembre 2021


void setup() {
  size(600, 600);
  background(0);
  noFill();
  stroke(255);
  //curveTightness(0.25);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  groupeFeuilles();
  pushMatrix();
  rotate(HALF_PI);
  groupeFeuilles();
  popMatrix();

}

void feuille() {
  beginShape();
  curveVertex(0, 0);
  curveVertex(0, 0);
  curveVertex(0, -200);
  curveVertex(50, -250);
  curveVertex(50, -180);
  curveVertex(150, -200);
  curveVertex(0, 0);
  curveVertex(0, 500);
  endShape();
}

void groupeFeuilles() {
    feuille();
  pushMatrix();
  scale(1,-1);
  feuille();
  popMatrix();
  pushMatrix();
  scale(-1,-1);
  feuille();
  popMatrix();
  pushMatrix();
  scale(-1,1);
  feuille();
  popMatrix();
}
