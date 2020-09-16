// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mercredi, 4 mars 2020


int numPoints = 7;
float[] posX = new float[numPoints];
float[] posY = new float[numPoints];
float radius;
float theta = TWO_PI / numPoints;

void setup() {
  size(600, 600);
  background(0);
  fill(239, 91, 49);
  noStroke();

  curveTightness(-0.5);

  noLoop();
}

void draw() {
  background(47, 53, 144);


  // Create vertex position
  for (int i = 0; i < posX.length; i++) {
    if ((i%2) == 0) {
      radius = 150 + (random(2) * 50);
    } else {
      radius = 150 + (random(2) * -50);
    }
    posY[i] = sin(theta * i) * radius;
    posX[i] = cos(theta * i) * radius;
  }

  translate(width/2, height/2);

  beginShape();
  curveVertex(posX[posX.length-1], posY[posX.length-1]);
  for (int i = 0; i < posX.length; i++) {
    curveVertex(posX[i], posY[i]);
  }
  curveVertex(posX[0], posY[0]);
  curveVertex(posX[1], posY[1]); // additional Curvevertex are use to close the shape
  endShape();

  save("render_"+frameCount+".jpg");
}

void mousePressed() {
  redraw();
}
