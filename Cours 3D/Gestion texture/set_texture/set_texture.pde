// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 10 octobre 2017

// Cas de "texturage" d’une sphere.
// Notez bien les caractéristiques de l’image importée:
// ratio 2:1, contraction de la texture près des pôles.
// La source est donc particulièrement adaptée au mapping sphérique

PShape s;
PImage tex;

void setup() {
  size(600, 600, P3D);
  smooth(8);
  
  //tex = loadImage("ratio_2_1.jpg");
  tex = loadImage("lune.jpg");
  
  sphereDetail(60);
  s = createShape(SPHERE, 200);
  s.setTexture(tex);
  s.setFill(true);
  s.setStroke(false);
}

void draw() {
  background(0);

  // Key light
  directionalLight(255, 255, 255, 1, -0.8, -0.35);
  // Back light
  directionalLight(255, 255, 255, -1, 0.4, 0.8);
  // Fill light
  ambientLight(20, 20, 20);

  translate(width/2, height/2, 0);
  rotateY(millis()*0.0001%TWO_PI);
  rotateX(millis()*0.00003%TWO_PI);

  shape(s);
}