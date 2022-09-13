// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 13 septembre 2022

int taille;
boolean onSauve;

void setup() {
  size(800, 800);
  // surface.setSize(img.width, img.height);
  // pixelDensity(displayDensity());
  background(0);
  fill(255);
  noStroke();
  
  taille = 0;
  onSauve = false;
}

void draw() {
  background(0);
  
  taille = int(millis()*0.1) % 600;
  ellipse(width/2, height/2, taille, taille);
  
  if (onSauve) {
    save("mon_rendu.jpg");
    onSauve = false;
  }
}


void mousePressed() {
  onSauve = true;
}
