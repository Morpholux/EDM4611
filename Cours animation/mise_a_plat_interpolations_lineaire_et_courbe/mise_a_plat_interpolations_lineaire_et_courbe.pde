// Comparaison entre interpolation linéaire (lerp) et une interpolation courbe,
// donc affectée par une fonction d’amortissement.

float valeurDepart = 0.0;
float valeurArrivee = 100.0;
float ratioTrajet;
int resolutionInterpolation = 10;
float intervalle;


void setup() {
  fill(0);
  noStroke();

  // Exemple d’une interpolation linéaire :
  for (int i = 0; i <= resolutionInterpolation; i++) {
    ratioTrajet = i/float(resolutionInterpolation); // de 0.0 à 1.0
    intervalle = lerp(valeurDepart, valeurArrivee, ratioTrajet);
    ellipse(intervalle, 30, 2, 2);
    println(intervalle);
  }
  println();

  // Exemple d’une interpolation courbe, affectée par notre fonction d’amortissement :
  for (int i = 0; i <= resolutionInterpolation; i++) {
    ratioTrajet = i/float(resolutionInterpolation); // de 0.0 à 1.0
    // Quatre arguments : ratio du parcours, valeur au départ, distance à parcourir, échelle de durée du trajet
    intervalle = easeInQuart(ratioTrajet, valeurDepart, valeurArrivee-valeurDepart, 1.0);
    ellipse(intervalle, 70, 2, 2);
    println(intervalle);
  }
}

// Exemple d’une fonction d’amortissement
// Quatre arguments : ratio du parcours, valeur au départ, distance à parcourir, échelle de durée du trajet
float easeInQuart (float t, float b, float c, float d) {
  return c*(t/=d)*t*t*t+b;
}
