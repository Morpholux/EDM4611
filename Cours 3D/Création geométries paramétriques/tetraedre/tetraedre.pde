// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 148
// Vendredi 28 novembre 2008


// Construction d’un tétraèdre
float [] [] quatreVertex = new float [4] [3];


void setup() {
  size(400, 400, P3D);
  background(127);
  stroke(255);
  fill(80);

  // Coordonnées XYZ des quatre vertex du volume
  // Le centre du tétraèdre est à  {0, 0, 0}
  float rayonVolume = 50;
  
  quatreVertex[0][0] = 0;
  quatreVertex[0][1] = (sin(radians(330)))*rayonVolume;
  quatreVertex[0][2] = 1*rayonVolume;

  quatreVertex[1][0] = (cos(radians(210)))*rayonVolume;
  quatreVertex[1][1] = (sin(radians(330)))*rayonVolume;
  quatreVertex[1][2] = (sin(radians(210)))*rayonVolume;

  quatreVertex[2][0] = (cos(radians(330)))*rayonVolume;
  quatreVertex[2][1] = (sin(radians(330)))*rayonVolume;
  quatreVertex[2][2] = (sin(radians(330)))*rayonVolume;

  quatreVertex[3][0] = 0;
  quatreVertex[3][1] = 1*rayonVolume;
  quatreVertex[3][2] = 0;
}

void draw() {

  background(127);
  translate(width/2, height/2, 0);
  rotateY(radians(mouseX));
  rotateX(radians(mouseY));

  beginShape(TRIANGLE_STRIP);
  for(int i = 0; i<7; i++) { // six fois, en raison du mode Triangle_strip
    vertex(quatreVertex[i%4][0], quatreVertex[i%4][1], quatreVertex[i%4][2]);
    // %4 car on termine le triangle_strip avec les deux premiers points de notre forme
  }
  endShape();
}