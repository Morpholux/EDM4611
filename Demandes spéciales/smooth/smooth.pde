float smoothValX, smoothValY, posSourisX, posSourisY;
float facteurLissage = 0.25; // Entre 0 et 1. Plus le chiffre est petit, plus le filtre est important, et plus le mobile tarde à rejoindre sa destination.
float seuil = 1; // Détermine à partir de quand le lissage sera calculé. Une petite valeur implique une évaluation constante.

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0);
  
  posSourisX = mouseX;
  posSourisY = mouseY;

  if ((abs(smoothValX-posSourisX) > seuil)||(abs(smoothValY-posSourisY) > seuil)) {
    // Formule empruntée à Thomas Frederics
    smoothValX = (posSourisX-smoothValX)*facteurLissage+smoothValX;
    smoothValY = (posSourisY-smoothValY)*facteurLissage+smoothValY;
  } else {
    smoothValX = posSourisX;
    smoothValY = posSourisY;
  }

  rect(smoothValX, smoothValY, 40, 40);
}
