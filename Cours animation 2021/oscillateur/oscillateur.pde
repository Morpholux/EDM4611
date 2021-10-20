// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 18 octobre 2021

float t, rot;

void setup() {
  size(600, 600);
  background(0);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  
  t = (millis() * 0.001) % TWO_PI;
  //rot = map(t, 0, TWO_PI, 0, HALF_PI);
  //rot = t;
  rot = sin(t)*HALF_PI;
  
  pushMatrix();
  rotate(rot);
  fill(255, 127, 0);
  rect(0,0,300,300);
  popMatrix();
  
  
  // Option 2:
  rot = easeInOutSine(t, -HALF_PI, HALF_PI, TWO_PI);
  
  pushMatrix();
  rotate(rot);
  fill(0, 128, 255);
  rect(0,0,300,300);
  popMatrix();
  
  blendMode(ADD);
  
}


// Quatre arguments : ratio du parcours, valeur au départ, distance à parcourir, échelle de durée du trajet
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
