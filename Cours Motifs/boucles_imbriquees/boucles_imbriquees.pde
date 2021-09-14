// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// samedi, 25 janvier 2020

float theta = 0;
float delta = 0;
int tailleCell = 20;

void setup() {
  size(800, 800, FX2D);
  background(0);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0);

  delta = map(frameCount%600, 0, 599, 0, TWO_PI);

  for (int j = tailleCell; j < height; j+= tailleCell ) {
    for (int i = tailleCell; i < width; i+= tailleCell ) {
      pushMatrix();
      translate(i, j);

      //rotate(delta);

      if (i%(tailleCell*2) == 0) {
       rotate(theta + delta);
       } else {
       rotate(theta - delta);
       }
       
      fill(255, 150);
      rect(0, 0, map(j, tailleCell, height-tailleCell, 0.5, 30), 30);
      popMatrix();
      
      theta += QUARTER_PI*0.05;
    }
  }
  theta = 0;
}
