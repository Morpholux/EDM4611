// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 26 septembre 2017

float posDepart = 10.0;
float posArrivee = 90.0;
float moteur;
float valeurIntermediaire;
float valeurInterAttenuee;


void setup() {
  size(100, 100);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);

  // On détermine une valeur qui progresse dans le temps, suivant une certaine vitesse
  moteur = millis()*0.001; // moteur équivaut à l’incrémentation du nombre de secondes écoulées
  moteur %= 10.0; // Le moteur boucle sur une valeur maximale de 1.0
  // Donc, le déplacement se fera à raison d’un cycle par seconde

  // On détermine la valeur intermédiaire des pas de l’animation
  valeurIntermediaire = lerp(posDepart, posArrivee, moteur);
  // On dessine le type d’animation avec interpolation temporelle linéaire
  ellipse(valeurIntermediaire, 30, 4, 4);

  // Cette valeur, dont les intervalles sont équidistants, est altérée par une fonction d’amortissement
  // L’appel de la fonction passe par l’emploi de quatre arguments :
  // Quatre arguments : ratio du parcours, valeur au départ, distance à parcourir, échelle de durée du trajet
  valeurInterAttenuee = easeInQuart(moteur, posDepart, posArrivee-posDepart, 1.0);
  // Le deuxième point en déplacement illustre donc un mouvement varié.
  ellipse(valeurInterAttenuee, 70, 4, 4);
}


// Cas d’une fonction d’amortissement
// Atténuation en entrée, donc accélération.
float easeInQuart (float t, float b, float c, float d) {
  return c*(t/=d)*t*t*t+b;
}
