// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// vendredi, 31 octobre 2018

// Examen de l’opération de soustraction de deux vecteurs

PVector souris = new PVector();
PVector centre = new PVector();
PVector soustraction = new PVector();



color rouge, vert, bleu;

void setup() {
  size(600, 600);
  background(255);
  fill(255);
  noStroke();
  rouge = color(255,0,0);
  vert = color(0,255,0);
  bleu = color(0,0,255);
  
  centre = new PVector(width/2, height/2, 0);
}

void draw() {
  background(255);
  souris.set(mouseX, mouseY, 0);
  dessinFleche(souris, 0, 0, rouge); // souris comme source
  
  dessinFleche(centre, 0, 0, bleu);  // centre comme cible
  
  // Écriture de deux façons
  // Cas 1 : on veut garder le vecteur souris intact
  soustraction = PVector.sub(souris, centre);
  
  // Cas 2 : le vecteur souris est modifié, puis copié dans le vecteur soustraction
  //soustraction = souris.sub(centre);
  
  soustraction.setMag(100);
  
  stroke(0);
  
  //option 1 :
  translate(souris.x, souris.y);
  //translate(mouseX, mouseY);
  
  // option 2 :
  //translate(centre.x, centre.y);
  
  // Option additionnelle : pointeur vers intérieur
  soustraction.mult(-1);
  line(0, 0, soustraction.x, soustraction.y);
}


// Fonction de dessin d’une flèche orientée
void dessinFleche(PVector monVect, float translationX, float translationY, color c) {
  pushMatrix();
  translate(translationX, translationY);
  float theta = monVect.heading2D();
  stroke(c);
  line(0, 0, monVect.x, monVect.y);
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
