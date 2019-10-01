// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 1.0.7
// lundi, 19 octobre 2009

// F = m*a
// accélération = force/masse
// Seconde loi de la physique newtonienne

PVector pointImpact;

// Tableaux de particules
Particule [] petitesParticules = new Particule[100];
Particule [] grossesParticules = new Particule[10];

void setup() {
  size(600,600);
  background(255);
  smooth();
  noStroke();

  pointImpact = new PVector (width/2, height/2);
  // Création des objets
  for (int i = 0; i < petitesParticules.length; i++) {
    petitesParticules[i] = new Particule(pointImpact, random(1, 12));
  }
  for (int i = 0; i < grossesParticules.length; i++) {
    grossesParticules[i] = new Particule(pointImpact, random(15, 40));
  }

}

void draw() {
  background(255);
  for (int i = 0; i < petitesParticules.length; i++) {
    petitesParticules[i].draw();
  }
  for (int i = 0; i < grossesParticules.length; i++) {
    grossesParticules[i].draw();
  }
}

// on efface et on reprend l'animation
void mousePressed() {
  background(255);
  pointImpact = new PVector (mouseX, mouseY);
  for (int i = 0; i < petitesParticules.length; i++) {
    petitesParticules[i] = new Particule(pointImpact, random(1, 12));
  }
  for (int i = 0; i < grossesParticules.length; i++) {
    grossesParticules[i] = new Particule(pointImpact, random(15, 40));
  }

}






