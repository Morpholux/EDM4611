// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 3 novembre 2020

int nbPoints = 30;
int rayon = 200;
PVector [] ptsCercle1 = new PVector[nbPoints];
PVector [] ptsCercle2 = new PVector[nbPoints];


void setup() {
  size(600, 600, P3D);
  //fill(255);
  //noStroke();
  noFill();
  stroke(255);
  smooth(8);

  for (int i = 0; i < nbPoints; i++) {
    float rad = map(i, 0, nbPoints-1, 0, TWO_PI);
    float px = rayon * cos(rad);
    float py = rayon * sin(rad);
    ptsCercle1[i] = new PVector(px, py, 50);
    rad += ((TWO_PI/nbPoints) * 0.5) % TWO_PI;
    px = (rayon * 0.75) * cos(rad);
    py = (rayon * 0.75) * sin(rad);
    ptsCercle2[i] = new PVector(px, py, -50);
  }
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  //translate(0, 100, 0);
  //lights();

  camera(0, map(mouseY, 0, height, 800, -800), 400, 0, 0, 0, 0, -1, 0);

  pushMatrix();
  //rotateX(HALF_PI);
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < nbPoints; i++) {
    vertex(ptsCercle1[i % nbPoints].x, ptsCercle1[i % nbPoints].y, ptsCercle1[i % nbPoints].z);
    vertex(ptsCercle2[i % nbPoints].x, ptsCercle2[i % nbPoints].y, ptsCercle2[i % nbPoints].z);
  }
  endShape();
  popMatrix();
}
