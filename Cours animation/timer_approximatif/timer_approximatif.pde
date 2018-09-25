// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0a3
// mardi, 23 septembre 2014

int tempsInitial = 0, tempsPresent, tempsEcoule;
int dureeTimerEnMillisecondes = 1000;
boolean chronoEnMarche = true;

void setup() {
}

void draw() {
  background(0);

  //Évaluation du temps écoulé depuis le dernier clic (ou le démarrage du sketch si on n’a pas encore cliqué)
  tempsPresent = millis();
  tempsEcoule = tempsPresent - tempsInitial;

  // Le temps écoulé est-il au-delà de la durée fixée par notre minuteur?
  if (tempsEcoule > dureeTimerEnMillisecondes) {
    // Si oui, le chronomètre ne doit plus être en fonction
    chronoEnMarche = false;
  }


  // L’affichage se fait uniquement lorsque que le chronomètre est en fonction
  if (chronoEnMarche) {
    fill(255);
    rect(20, 20, 60, 60);
  }
}

void mousePressed() {
  //if (!chronoEnMarche) { // code optionnel
  tempsInitial = millis();
  chronoEnMarche = true;
  //}
}