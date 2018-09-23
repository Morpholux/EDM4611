// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 2.0b8
// lundi, 6 mai 2013

int tempsZero, tempsUn;
float tempsEcoule;
boolean chronoActif = false;

float dureeMinuterie = 1.0;

void setup() {
}

void draw() {
  background(0);
  if (chronoActif) {
    tempsEcoule = millis() - tempsZero;
    tempsEcoule *= 0.001;
    if (tempsEcoule <= dureeMinuterie) {
      // affichage
      fill(255);
      rect(20, 20, 60, 60);
    } 
    else {
      // terminer avec notre animation
      chronoActif = false;
    }
  }
}

void mousePressed() {
  if (!chronoActif) {
    tempsZero = millis();
    chronoActif = true;
  }
}