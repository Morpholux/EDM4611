// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0b6
// samedi, 26 septembre 2015

int [][] histogramme1 = new int [600][1];
int [][] histogramme2 = new int [600][1];

void setup() {
  size(600, 600);
  background(0);
  noStroke();
  noLoop();
  
  for (int i = 0; i < histogramme1.length; i++) {
    histogramme1[i][0] = 0;
    histogramme2[i][0] = 0;
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < histogramme1.length; i++) {
    int index = floor(random(600));
    histogramme1[index][0]++;
  }
  
  for (int i = 0; i < histogramme2.length; i++) {
    int index = floor(300 + (randomGaussian() * 150));
    index = constrain(index,0,599); // il peut y avoir des valeurs au-delà des limites
    histogramme2[index][0]++;
  }
  
  
  
  // On dessine les histogrammes
  fill(255,0,0);
  for (int i = 0; i < histogramme1.length; i++) {
    int x = histogramme1[i][0];
    x*=5;
    rect(width/2, i, -x, 1);
  }
  
  fill(0,0,255);
  for (int i = 0; i < histogramme2.length; i++) {
    int x = histogramme2[i][0];
    x*=5;
    rect(width/2, i, x, 1);
  }
  
}

void mousePressed() {
  background(0);
  redraw();
  // comme les variables ne sont pas réinitialisées,
  // les valeurs s’additionnent.
}