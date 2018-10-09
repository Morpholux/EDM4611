// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 10 octobre 2017

PImage img;

void setup() {
  size(600, 600, P3D);
  background(0);
  fill(255);
  noStroke();
  img = loadImage("ratio_2_1.jpg");
  
  // Le mode par défaut est IMAGE et non NORMAL
  // Les coordonnées UV seront soit en pixels, soit entre 0-1
  //textureMode(IMAGE);
  textureMode(NORMAL);
  
  //textureWrap(CLAMP); // the default behavior
  //textureWrap(REPEAT);
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  //rotateY(radians(-45));
  
  beginShape(QUAD);
  texture(img);
  // Sens horaire (même sens pour les Vertex et les coordonnées UV)
  vertex(-200, -200, 0, 0, 0);
  vertex(200, -200, 0, 0.5, 0); // 
  vertex(200, 200, 0, 0.5, 1);
  vertex(-200, 200, 0, 0, 1);
  endShape();
}