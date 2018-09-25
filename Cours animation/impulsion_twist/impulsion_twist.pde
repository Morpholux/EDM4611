// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// lundi, 24 septembre 2018

float rotateInit, rotateDelta, secteurAngleRotation = 60;
boolean tourne = false;
int pasAnimation = 0;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();

  rectMode(CENTER);

  rotateInit = 0;
}

void draw() {
  background(0);

  if (tourne) {
    if (pasAnimation < secteurAngleRotation) {
      pasAnimation +=2;
      //println(pasAnimation);

      // interpolation linéaire
      //rotateDelta = lerp(rotateInit, rotateInit+secteurAngleRotation, float(pasAnimation)/secteurAngleRotation);

      // interpolation atténuée
      // Quatre arguments : ratio du parcours, valeur au départ, distance à parcourir, échelle de durée du trajet
      rotateDelta = easeOutQuart(float(pasAnimation)/secteurAngleRotation, rotateInit, secteurAngleRotation, 1.0);
      
    } else {
      rotateInit = rotateDelta;
      pasAnimation = 0;
      tourne = false;
    }
  }


  translate(width/2, height/2);
  rotate(radians(rotateDelta));
  rect(0, 0, 300, 300);
}

void mousePressed() {
  tourne = true;
}

float easeOutQuart (float t, float b, float c, float d) {
  return -c*((t=t/d-1)*t*t*t-1)+b;
}
