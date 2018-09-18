// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// mardi, 18 septembre 2018

int taille = 2;
float [] ax = new float[taille];
float [] ay = new float[taille];
float [] lx = new float[taille];
float [] ly = new float[taille];


void setup() {
  size(200, 200);
  // surface.setSize(img.width, img.height);
  // pixelDensity(displayDensity());
  background(0);
  noFill();
  strokeWeight(2);
  stroke(255);
  
  // contruction des coordonnées de nos points
  ax[0] = 0;
  ay[0] = 0;
  lx[0] = 100;
  ly[0] = 0;
  lx[1] = 200;
  ly[1] = 100;
  ax[1] = 200;
  ay[1] = 200;
}

void draw() {
  background(0);
  
  pushStyle();
  noStroke();
  fill(255,0,0,150);
  ellipse(ax[0], ay[0], 10, 10); // premier point ancrage
  ellipse(mouseX, mouseY, 10, 10); // premier levier
  ellipse(lx[1], ly[1], 10, 10);
  ellipse(ax[1], ay[1], 10, 10);
  popStyle();
  
  
  bezier(ax[0], ay[0], mouseX, mouseY, lx[1], ly[1], ax[1], ay[1]);
}
