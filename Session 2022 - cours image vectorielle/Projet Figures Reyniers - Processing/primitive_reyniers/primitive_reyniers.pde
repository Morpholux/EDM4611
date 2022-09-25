// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// samedi, 24 septembre 2022

int nbPoints = 4;
float [] posX = new float[nbPoints];
float [] posY = new float[nbPoints];
//int [] seqIndex = {0, 1, 2, 3};

void setup() {
  size(800, 800);
  
  background(0);
  fill(255);
  //noStroke();
  stroke(150);
  
  noLoop();

  // positions
  posX[0] = -0.5;
  posY[0] = 0.5;
  posX[1] = 0.5;
  posY[1] = 0.5;
  posX[2] = 0.5;
  posY[2] = -0.5;
  posX[3] = -0.5;
  posY[3] = -0.5;

  //for (int i = 0; i < nbPoints; i++) {
  //  posX[i] = posX[seqIndex[i]];
  //  posY[i] = posY[seqIndex[i]];
  //}
}

void draw() {
  background(0);

  //translate(width/2, height/2);
  //rotate(HALF_PI);
  //scale(400, 200); // attention, cela modifie également l’épaisseur de Stroke
  pushStyle();
  strokeWeight(4);
  noFill();
  //figure();
  // appel de la fonction à 5 arguments : angle de rotation en radians, taille largeur, taille hauteur, position en x, position en y
  figure(HALF_PI, 500, 200, width/2, height/2);
  popStyle();
}


// fonctions de constitution de la figure
// version initiale, avec les trois transformateurs géométriques (tranlate, rotate, scale)
void figure() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(HALF_PI);
  scale(400, 200); // attention, cela modifie également l’épaisseur de Stroke
  beginShape();
  vertex(posX[0], posY[0]);
  bezierVertex(posX[1], posY[1], posX[1], posY[1], posX[2], posY[2]);
  vertex(posX[3], posY[3]);
  endShape(CLOSE);
  popMatrix();
}

// version remaniée, avec une autre manière modifier la taille des figures
void figure(float _r, float _sx, float _sy, float _tx, float _ty) {
  // en remplacement de la commande scale(), qui affecte la valeur de Stroke
  float [] _posX = new float[nbPoints];
  float [] _posY = new float[nbPoints];
  for (int i = 0; i < nbPoints; i++) {
    _posX[i] = posX[i] * _sx;
    _posY[i] = posY[i] * _sy;
  }
  pushMatrix();
  translate(_tx, _ty); // on règle positionnement en premier. La translation précède la rotation.
  rotate(_r); // on fait pivoter la figure, depuis son centre, et depuis sa nouvelle position
  beginShape();
  vertex(_posX[0], _posY[0]);
  bezierVertex(_posX[1], _posY[1], _posX[1], _posY[1], _posX[2], _posY[2]);
  vertex(_posX[3], _posY[3]);
  endShape(CLOSE);
  popMatrix();
}
