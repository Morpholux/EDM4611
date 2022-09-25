// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 2.2.1
// jeudi, 11 septembre 2014

import processing.pdf.*;

int intervalle = 40, nbPoints = 8, marge = 60;
int [] positionsY = new int [nbPoints];

void setup() {
  size(400, 400);
  background(0);
  noLoop();
}

void draw() {

  beginRecord(PDF, "ligne"+frameCount+".pdf");

  noFill();
  strokeWeight(10);
  strokeCap(ROUND);
  strokeJoin(ROUND);

  background(0);
  // gestion des points de rencontre des segments
  for (int i = 0; i<nbPoints; i++) {
    positionsY[i] = int((height/2)+random(-30, 30));
  }

  //beginShape(); // à essayer, pour comprendre la différence
  for (int i = 0; i<nbPoints-1; i++) {
    // Dessin de la ligne, en plusieurs segments
    stroke(random(150, 255), random(150, 255), 200, 150);
    beginShape();
    vertex(i*intervalle+marge, positionsY[i]);
    vertex(i*intervalle+intervalle+marge, positionsY[i+1]);
    endShape();
  }
  //endShape();

  endRecord();
}

void mousePressed() {
  redraw();
}

