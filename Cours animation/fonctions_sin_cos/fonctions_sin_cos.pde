// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// lundi, 25 septembre 2017


void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);

  float horloge = millis();

  float tx = fonctionSin(horloge, 0.5, 0, 300);
  ellipse(tx, -100, 10, 10);

  tx = fonctionSin(horloge, 0.5, HALF_PI, 300);
  ellipse(tx, 0, 10, 10);

  tx = fonctionCos(horloge, 0.5, 0, 300);
  ellipse(tx, 50, 10, 10);

  tx = fonctionSin(horloge, 0.5, PI, 300);
  ellipse(tx, 150, 10, 10);
}

// Fonctions proposées pour gérer les mouvements cycliques

float fonctionSin(float temps, float freq, float phase, float amp) {
  float onde = sin((temps/((1000.0/TWO_PI)/freq))+phase);
  onde *= amp;
  return onde;
}

float fonctionCos(float temps, float freq, float phase, float amp) {
  float onde = cos((temps/((1000.0/TWO_PI)/freq))+phase);
  onde *= amp;
  return onde;
}