// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 27 septembre 2021

PShape ps;

void setup() {
  size(600, 600);
  background(0);
  fill(255, 150);
  noStroke();
  
  ps = loadShape("motif_floral.svg");
  ps.disableStyle(); // pour désactiver les styles du fichier SVG et adopter les styles dans Processing
  
  shapeMode(CENTER);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  filter(ADD);
  
  shape(ps, 0, 0, 500, 500);
  rotate(QUARTER_PI);
  shape(ps, 0, 0, 800, 800);
  rotate(QUARTER_PI);
  shape(ps, 0, 0, 300, 300);
}
