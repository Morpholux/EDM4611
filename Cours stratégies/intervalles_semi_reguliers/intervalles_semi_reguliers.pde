// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 15 septembre 2020

int ax = 90;
int ay = 520;
int bx = 490;
int by = 75;
int nbIntervalles = 4;
float delta;

void setup() {
  size(600, 600);
  background(0);
  
  noLoop();
}

void draw() {
  background(0);
  
  noFill();
  stroke(100);
  line(ax, ay, bx, by);
  
  fill(255);
  noStroke();
  ellipse(ax, ay, 10, 10);
  ellipse(bx, by, 10, 10);
  
  fill(255, 0, 0);
  float fractionIntervalle = 1/float(nbIntervalles);
  for (int i = 1; i < nbIntervalles; i++) {
    float portionTrajet = i/float(nbIntervalles);
    //println(portionTrajet);
    float proportionEcart = fractionIntervalle * 0.25; // 0.5 ou plus implique des chevauchements
    delta = random(-proportionEcart, proportionEcart);
    float posx = lerp(ax, bx, portionTrajet + delta);
    float posy = lerp(ay, by, portionTrajet + delta);
    ellipse(posx, posy, 10, 10);
  }
}

void mousePressed() {
  redraw();
}
