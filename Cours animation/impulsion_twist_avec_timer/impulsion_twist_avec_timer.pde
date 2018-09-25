// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// lundi, 24 septembre 2018

float rotateInit = 0, rotateDelta, secteurAngleRotation = 60;

int tempsInitial = 0, tempsPresent, tempsEcoule;
int dureeTimerEnMillisecondes = 500;
boolean chronoEnMarche = false;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();

  rectMode(CENTER);
}

void draw() {
  background(0);

  //Évaluation du temps écoulé depuis le démarrage du sketch
  tempsPresent = millis();
  //Évaluation du temps écoulé depuis le démarrage du sketch
  tempsEcoule = tempsPresent - tempsInitial;

  // Le temps écoulé est-il au-delà de la durée fixée par notre minuteur?
  if (tempsEcoule >= dureeTimerEnMillisecondes) {
    //println(tempsEcoule);
    // Si oui, le chronomètre ne doit plus être en fonction
    chronoEnMarche = false;
    // la valeur de rotation hérite du dernier cumul d’angles
    rotateInit = rotateDelta;
    //println(rotateInit);
  }

  if (chronoEnMarche) {
    // interpolation atténuée
    // Quatre arguments : ratio du parcours, valeur au départ, distance à parcourir, échelle de durée du trajet
    rotateDelta = easeOutQuart(tempsEcoule, rotateInit, secteurAngleRotation, dureeTimerEnMillisecondes);
  } else {
    // option : on réactive le chrono dès qu’il a atteint sa durée limite
    tempsInitial = millis();
    chronoEnMarche = true;
  }

  translate(width/2, height/2);
  rotate(radians(rotateDelta));
  rect(0, 0, 300, 300);
}

/*
void mousePressed() {
 if (!chronoEnMarche) { // code optionnel, pour éviter la relance de la minuterie pendant le déroulement du décompte
 tempsInitial = millis();
 chronoEnMarche = true;
 }
 }
 */

float easeOutQuart (float t, float b, float c, float d) {
  return -c*((t=t/d-1)*t*t*t-1)+b;
}
