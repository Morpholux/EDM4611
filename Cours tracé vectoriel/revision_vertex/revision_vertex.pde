// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// dimanche, 16 septembre 2018

int tailleArray = 11;
float [] xListe = new float[tailleArray];
float [] yListe = new float[tailleArray];
float step = 400.0/(tailleArray-1);

void setup() {
  size(600, 600);
  // surface.setSize(img.width, img.height);
  // pixelDensity(displayDensity());
  background(0);

  noFill();
  stroke(255);
  strokeWeight(4);
  strokeCap(ROUND);
  strokeJoin(ROUND);

  //noLoop();
}

void draw() {
  background(0);
  translate(100, 300);

  if (frameCount%10==0) {
    for (int i = 0; i < tailleArray; i++) {
      xListe[i] = i*step;
      yListe[i] = random(-i*i, i*i);
    }
  }

  // lignes angulaires
  //beginShape();
  //for (int i = 0; i < tailleArray; i++) {
  //  if (i < tailleArray-1) {
  //    vertex(xListe[i], yListe[i]);
  //    vertex(xListe[i+1], yListe[i+1]);
  //  } else {
  //    vertex(xListe[i], yListe[i]);
  //  }
  //}
  //endShape();


  // Lignes courbes
  beginShape();
  curveVertex(xListe[0], yListe[0]);
  for (int i = 0; i < tailleArray; i++) {
    curveVertex(xListe[i], yListe[i]);
  }
  curveVertex(xListe[tailleArray-1], yListe[tailleArray-1]);
  endShape();
}



void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}
