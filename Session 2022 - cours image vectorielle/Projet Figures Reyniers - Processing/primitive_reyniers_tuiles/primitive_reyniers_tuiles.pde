// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// samedi, 24 septembre 2022

int nbPoints = 4;
float [] posX = new float[nbPoints];
float [] posY = new float[nbPoints];
//int [] seqIndex = {0, 1, 2, 3};

int nbFigures = 4;
float [] transX = new float[nbPoints];
float [] transY = new float[nbPoints];
float [] scaleX = new float[nbPoints];
float [] scaleY = new float[nbPoints];
float [] rot = new float[nbPoints];

int tailleFigure = 500;

void setup() {
  size(650, 650);
  pixelDensity(displayDensity());
  
  background(#E0D6AC);
  fill(#2D5271);
  //noStroke();
  stroke(#E0D6AC);
  strokeWeight(3);
  
  noLoop();


  // Coordonnées normalisées des quatre coins du prototype.
  // Le prototype fait 1 x 1 "pixel" (s’il était dessiné tel quel).
  posX[0] = -0.5;
  posY[0] = 0.5;
  posX[1] = 0.5;
  posY[1] = 0.5;
  posX[2] = 0.5;
  posY[2] = -0.5;
  posX[3] = -0.5;
  posY[3] = -0.5;

  // Transformateurs géométriques des quatre tuiles :
  
  // Position du centre de la tuile, relativement au point d’origine (0, 0).
  transX[0] = 200;
  transY[0] = 100;
  transX[1] = 450;
  transY[1] = 250;
  transX[2] = 50;
  transY[2] = 350;
  transX[3] = 250;
  transY[3] = 350;

  // Ajustement de l’échelle (non-proportionnelle au besoin).
  scaleX[0] = 400;
  scaleY[0] = 200;
  scaleX[1] = 100;
  scaleY[1] = 500;
  scaleX[2] = 100;
  scaleY[2] = 300;
  scaleX[3] = 300;
  scaleY[3] = 300;

  // Rotations des tuiles.
  // Quatre options : 0, HALF_PI, PI, PI+HALF_PI, soit 0, 90, 180, 270 degrées.
  rot[0] = 0;
  rot[1] = HALF_PI;
  rot[2] = HALF_PI;
  rot[3] = PI;

}

void draw() {
  background(#E0D6AC);
  
  translate((width-tailleFigure)*0.5, (height-tailleFigure)*0.5);
  
  for (int i = 0; i < nbFigures; i++) {
    figure(rot[i], scaleX[i], scaleY[i], transX[i], transY[i]);
  }
  
  save("rendu_reyniers.jpg");
}


void figure(float _r, float _sx, float _sy, float _tx, float _ty) {
  // en remplacement de la commande scale(), qui affecte la valeur de Stroke
  float [] _posX = new float[nbPoints];
  float [] _posY = new float[nbPoints];
  for (int i = 0; i < nbPoints; i++) {
    if ((abs(_r) % PI) == 0) {
      _posX[i] = posX[i] * _sx;
      _posY[i] = posY[i] * _sy;
    } else {
      // substitution des axes d’échelle, advenant les rotations à 90 ou 270 degrées.
      _posX[i] = posX[i] * _sy;
      _posY[i] = posY[i] * _sx;
    }
  }
  pushMatrix();
  translate(_tx, _ty);
  rotate(_r);
  beginShape();
  vertex(_posX[0], _posY[0]);
  bezierVertex(_posX[1], _posY[1], _posX[1], _posY[1], _posX[2], _posY[2]);
  vertex(_posX[3], _posY[3]);
  endShape(CLOSE);
  popMatrix();
}
