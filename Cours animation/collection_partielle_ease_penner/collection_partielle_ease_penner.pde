// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 2.0.3
// jeudi, 26 septembre 2013

float posX;
int pas = 0, nbPas = 100;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  posX = 100;
}

void draw() {
  background(0);
  pas++;
  pas%=nbPas;
  // Quatre arguments : ratio du parcours, valeur au départ, distance à parcourir, échelle de durée du trajet
  posX = easeInExpo(pas, 100, 400, nbPas);
  ellipse(posX, 300, 20, 20);
}

// Linéaire (aucune atténuation)
float linearTween (float t, float b, float c, float d) {
  return c*t/d+b;
}


// Atténuation en entrée
// In
float easeInQuad (float t, float b, float c, float d) {
  return c*(t/=d)*t+b;
}

float easeInCubic (float t, float b, float c, float d) {
  return c*(t/=d)*t*t+b;
}

float easeInQuart (float t, float b, float c, float d) {
  return c*(t/=d)*t*t*t+b;
}

float easeInQuint (float t, float b, float c, float d) {
  return c*(t/=d)*t*t*t*t+b;
}

float easeInSine (float t, float b, float c, float d) {
  return c * (1 - cos(t/d * (PI/2))) + b;
}

float easeInExpo (float t, float b, float c, float d) {
  return c * pow(2, 10 * (t/d - 1)) + b;
}

float easeInCirc (float t, float b, float c, float d) {
  return c * (1 - sqrt(1 - (t/=d)*t)) + b;
}


// Atténuation en sortie
// Out
float easeOutQuad (float t, float b, float c, float d) {
  return -c*(t/=d)*(t-2)+b;
}

float easeOutCubic (float t, float b, float c, float d) {
  return c*((t=t/d-1)*t*t+1)+b;
}

float easeOutQuart (float t, float b, float c, float d) {
  return -c*((t=t/d-1)*t*t*t-1)+b;
}

float easeOutQuint (float t, float b, float c, float d) {
  return c*((t=t/d-1)*t*t*t*t+1)+b;
}

float easeOutSine (float t, float b, float c, float d) {
  return c * sin(t/d*(PI/2))+b;
}

float easeOutExpo (float t, float b, float c, float d) {
  return c * (- pow(2, -10 * t/d) + 1) + b;
}

float easeOutCirc (float t, float b, float c, float d) {
  return c * sqrt(1 - (t=t/d-1)*t) + b;
}

// Atténuation en entrée-sortie
// InOut
float easeInOutQuad (float t, float b, float c, float d) {
  if ((t/=d/2) < 1) return c/2 * t * t + b;
  return -c/2 * ((--t)*(t-2) - 1) + b;
}

float easeInOutCubic (float t, float b, float c, float d) {
  if ((t/=d/2) < 1) return c/2 * pow(t, 3) + b;
  return c/2 * (pow(t-2, 3) + 2) + b;
}

float easeInOutQuart (float t, float b, float c, float d) {
  if ((t/=d/2) < 1) return c/2 * pow(t, 4) + b;
  return -c/2 * (pow(t-2, 4) - 2) + b;
}

float easeInOutQuint (float t, float b, float c, float d) {
  if ((t/=d/2) < 1) return c/2 * pow(t, 5) + b;
  return c/2 * (pow(t-2, 5) + 2) + b;
}

float easeInOutSine (float t, float b, float c, float d) {
  return c/2 * (1 - cos(PI*t/d)) + b;
}

float easeInOutExpo (float t, float b, float c, float d) {
  if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
  return c/2 * (- pow(2, -10 * --t) + 2) + b;
}

float easeInOutCirc (float t, float b, float c, float d) {
  if ((t/=d/2) < 1) return c/2 * (1 - sqrt(1 - t*t)) + b;
  return c/2 * (sqrt(1 - (t-=2)*t) + 1) + b;
}
