// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.3
// dimanche, 21 mai 2017

float [][] lookupTable = new float [180][2];
float insideRadius = 100, outsideRadius=200;

void setup() {
  // Seul le mode P2D (ou P3D) donne une coloration uniforme
  // Les autres modes (JAVA_2D, FX2D) laissent entrevoir des arêtes
  // entre les faces des polygones, du moins lorsque ces arêtes ne sont pas
  // colinéaires à la grille de pixels.
  size(600, 600, P2D);
  pixelDensity(displayDensity());
  smooth(8);
  background(0);
  fill(255);
  noStroke();
  for (int i = 0; i < lookupTable.length; i++) {
    lookupTable[i][0] = cos(TWO_PI*(float)i/(lookupTable.length-1));
    lookupTable[i][1] = sin(TWO_PI*(float)i/(lookupTable.length-1));
  }
  noLoop();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  scale(-1, 1);
  beginShape(QUAD_STRIP);
  for (int i = 0; i < lookupTable.length; i++) {
    fill(map(i, 0, lookupTable.length, 0, 255));
    vertex(lookupTable[i][0]*insideRadius, lookupTable[i][1]*insideRadius);
    vertex(lookupTable[i][0]*outsideRadius, lookupTable[i][1]*outsideRadius);
  }
  endShape();
  //save("render.png");
}