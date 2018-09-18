// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 19 septembre 2017

// Reproduction Logo SAQ Inspire
// Version entièrement vectorielle, avec coloration
// sur deux figures fermées distinctes (à chaque portion du symbole)
// Le dessin exporté en PDF dévoile bien la structure.

import processing.pdf.*;

float rayon = 200;
float centrex, centrey;

// Formule permettant d’établir la distance d’un levier dans une figure circulaire
// voir http://pomax.github.io/bezierinfo/#circles_cubic
float fraction = 4*((sqrt(2)-1)/3.0);

int steps = 100; // Nombre de pas pour chacun des segments de courbe (minimum de 5)
int nb_segments = 4; // Il y en a quatre
// Tableau pour mettre en mémoire la position des vertex
float [] posx = new float[nb_segments*steps];
float [] posy = new float[nb_segments*steps];


void setup() {
  size(600, 600);
  //size(600, 600, FX2D);
  background(0);


  centrex = width/2;
  centrey = height/2;

  noLoop();

  // Valeurs des couleurs originales
  // turquoise: fill(99, 191, 179);
  // bourgogne: fill(116, 25, 68);

  //println(fraction);

  // On fait les calculs pour trouver la position de tous les points formant la figure

  // Commandes de dessin initiales :
  //vertex(0-rayon, 0);
  //bezierVertex(0-rayon, 0-(rayon*fraction), 0-(rayon*fraction), 0-rayon, 0, 0-rayon);
  //bezierVertex(0+(rayon*fraction), 0-rayon, 0+rayon, 0-(rayon*fraction), 0+rayon, 0);
  //bezierVertex(0+rayon, 0+(rayon*fraction), 0+20, (2*rayon)-80, 0, 400);
  //bezierVertex(0-20, (2*rayon)-80, 0-rayon, 0+(rayon*fraction), 0-rayon, 0);


  // Premier segment
  for (int i = 0; i < steps; i++) { // un pas avant le dernier point
    float t = i / float(steps);
    posx[i] = bezierPoint(0-rayon, 0-rayon, 0-(rayon*fraction), 0, t);
    posy[i] = bezierPoint(0, 0-(rayon*fraction), 0-rayon, 0-rayon, t);
  }
  // Deuxième segment
  for (int i = 0; i < steps; i++) {
    float t = i / float(steps);
    posx[i+(steps)] = bezierPoint(0, 0+(rayon*fraction), 0+rayon, 0+rayon, t);
    posy[i+(steps)] = bezierPoint(0-rayon, 0-rayon, 0-(rayon*fraction), 0, t);
  }
  // Troisième segment
  for (int i = 0; i < steps; i++) {
    float t = i / float(steps);
    posx[i+(steps*2)] = bezierPoint(0+rayon, 0+rayon, 0+20, 0, t);
    posy[i+(steps*2)] = bezierPoint(0, 0+(rayon*fraction), (2*rayon)-80, 400, t);
  }
  // Quatrième segment
  for (int i = 0; i < steps; i++) {
    float t = i / float(steps);
    posx[i+(steps*3)] = bezierPoint(0, 0-20, 0-rayon, 0-rayon, t);
    posy[i+(steps*3)] = bezierPoint(400, (2*rayon)-80, 0+(rayon*fraction), 0, t);
  }
}

void draw() {
  beginRecord(PDF, "exportation_logo_saq_inspire.pdf");
  background(255);
  noStroke();

  pushMatrix();
  translate(centrex, centrey-70);
  scale(0.75);

  // L’indication pour l’index des bornes est arbitraire et convient pour 400 échantillons
  // revoir les valeurs si l’on change le nombre de pas (variable steps)
  //int borneIndex1 = (nb_segments*steps)-32;
  //int borneIndex2 = (nb_segments*steps)-260;
  
  // Approche normalisée (permet de modifier la variable de nombre de pas, steps)
  int borneIndex1 = (nb_segments*steps)-int(0.08*nb_segments*steps);
  int borneIndex2 = (nb_segments*steps)-int(0.65*nb_segments*steps);
  
  println(borneIndex1);
  println(borneIndex2);

  // Portion du haut de la figure
  fill(99, 191, 179); // couleur turquoise
  beginShape();
  for (int i = borneIndex1; i < nb_segments*steps; i++ ) {
    vertex(posx[i], posy[i]);
    //ellipse(posx[i], posy[i], 2, 2);
  }
  for (int i = 0; i <= borneIndex2; i++ ) {
    vertex(posx[i], posy[i]);
    //ellipse(posx[i], posy[i], 2, 2);
  }
  endShape(CLOSE);

  // Portion du bas
  fill(116, 25, 68); // couleur bourgogne
  beginShape();
  for (int i = borneIndex2; i < (borneIndex1 + 1); i++ ) {
    vertex(posx[i], posy[i]);
    //ellipse(posx[i], posy[i], 2, 2);
  }
  endShape(CLOSE);

  popMatrix();

  endRecord();
}