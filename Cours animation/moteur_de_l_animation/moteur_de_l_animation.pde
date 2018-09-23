// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 26 septembre 2017

int temps0 = 0;
int temps1 = 0;

void setup() {
  size(200, 200);
  background(0);
  noFill();
  stroke(255);
  //println(frameRate);
}

void draw() {
  background(0);
  //println(frameRate);

  // Cas 1
  // On test une condition qui dépend du moment où le frameRate
  // atteint le plateau de 60 images par seconde.
  //if (frameRate >= 60) {
  //  println(frameCount);
  //  exit();
  //}

  // Cas 2
  // On évalue une méthode qui permet de mesurer le temps à l’aide
  // du nombre de photogrammes écoulés
  //if (frameCount > 600) {
  //  println(millis()*0.001);
  //  exit();
  //}

  // Cas 3
  // On évalue une méthode qui permet de mesurer le temps
  // selon le nombre de millisecondes écoulées
  //if (millis()*0.001 >= 5) {
  //  println(millis()*0.001);
  //  exit();
  //}

  // Cas 4
  // On évalue l’écart de temps entre deux frames
  //if (frameCount == 60) {
  //  temps0= millis();
  //} else if (frameCount == 61) {
  //  temps1= millis();
  //  //println(temps0);
  //  //println(temps1);
  //  println(temps1 - temps0);
  //  exit();
  //}

  // Cas 5
  // Le déroulement du temps est exploité comme «moteur de l’animation»
  float vitesse = 0.1;
  float hauteur = (millis()*vitesse)%height; // On boucle sur la hauteur du sketch
  line(0, hauteur, width, hauteur);
  
  // On notera que le mouvement est constant (taux de changement est linéaire)
}