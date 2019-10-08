// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.3
// mardi, 8 octobre 2019

PVector [] ptshaut = new PVector[10];
PVector [] ptsbas = new PVector[10];


void setup() {
  size(600, 600, P3D);
  // surface.setSize(img.width, img.height);
  // pixelDensity(displayDensity());
  background(0);
  fill(255);
  //noStroke();
  stroke(0, 50);
  
  for (int i = 0; i<ptshaut.length; i++) {
    ptshaut[i] = new PVector(-200+(i*40), -200, 0);
  }
  
  for (int i = 0; i<ptshaut.length; i++) {
    ptsbas[i] = new PVector(-200+(i*40), 200, 0);
  }
  
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, width, PI, -PI));
  
  
  
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i<ptshaut.length; i++) {
    
  float deltaz = 50*sin(i);
    vertex(ptshaut[i].x, ptshaut[i].y, ptshaut[i].z + deltaz);
    vertex(ptsbas[i].x, ptsbas[i].y, ptsbas[i].z);
  }
  endShape();
}
