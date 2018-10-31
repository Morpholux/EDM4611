// - - - - - - - - - - - - - - - - - - - - - -

// Fonctions de dessin d’une flèche orientée.

// - - - - - - - - - - - - - - - - - - - - - -

// Fonction à deux arguments :
// un vecteur et une couleur.
// Il faut gérer le repositionnement dans le draw() avec un translate().

void dessinFleche( PVector monVect, color c) {
  // orientation de la flèche
  float theta = monVect.heading2D();
  // ligne de la flèche
  stroke(c);
  noFill();
  line(0, 0, monVect.x, monVect.y);
  // pointe de la flèche
  if (monVect.mag() > 0) {
    pushMatrix();
    translate(monVect.x, monVect.y);
    rotate(theta);
    noStroke();
    fill(c);
    beginShape();
    vertex(2, 0);
    vertex(-12, 6);
    vertex(-4, 0);
    vertex(-12, -6);
    endShape(CLOSE);
    popMatrix();
  }
}

// - - - - - - - - - - - - - - - - - - - - - -

// Fonction à quatre arguments :
// un vecteur, une translation en x, une translation en y et une couleur.
// On gère le repositionnement à même la fonction.

void dessinFleche(PVector monVect, float translationX, float translationY, color c) {
  pushMatrix();
  translate(translationX, translationY);
  float theta = monVect.heading2D();
  stroke(c);
  line(0, 0, monVect.x, monVect.y);
  if (monVect.mag() > 0) {
    pushMatrix();
    translate(monVect.x, monVect.y);
    rotate(theta);
    noStroke();
    fill(c);
    beginShape();
    vertex(2, 0);
    vertex(-12, 6);
    vertex(-4, 0);
    vertex(-12, -6);
    endShape(CLOSE);
    popMatrix();
    popMatrix();
  }
}