// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0.1
// vendredi, 27 novembre 2015

float increment, valeurAttenuation, emplacement;
int fps;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);


  fps = 60;
  increment = frameCount%fps;
  
  // Usages des fonctions d’atténuation
  // Tests avec trois formes d’atténuation :
  valeurAttenuation = (easeInQuad(increment, 0, 1.0, fps));
  //valeurAttenuation = (easeOutQuad(increment, 0, 1.0, fps));
  //valeurAttenuation = (easeInOutQuad(increment, 0, 1.0, fps));
  
  // Le lerp est donc calculé sur la valeur atténuée
  // et non sur l’incrément qui lui progresse de manière linéaire
  emplacement = lerp(100, 500, valeurAttenuation);
  
  
  ellipse(emplacement, height/2, 10, 10);
}


// Aperçu de quelques fonctions de Penner:

float easeInQuad (float t, float b, float c, float d) {
  return c*(t/=d)*t+b;
}

float easeOutQuad (float t, float b, float c, float d) {
  return -c*(t/=d)*(t-2)+b;
}

float easeInOutQuad (float t, float b, float c, float d) {
  if ((t/=d/2) < 1) return c/2 * t * t + b;
  return -c/2 * ((--t)*(t-2) - 1) + b;
}