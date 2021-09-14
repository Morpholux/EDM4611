// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 4 février 2020

// Création d’un motif de dallage.
// On exploite le principe de création d’une fonction

// Recette des cinq couleurs :
color bleuclair = color(129, 163, 208);
color bleusombre = color(21, 77, 160);
color beige = color(234, 234, 210);
color noir = color(38, 25, 51);
color orange = color(225, 101, 77);

// Variables de taille et de nombre
int tailleCell = 75;
int nbCol = 19, nbRow = 12;
int nbStepsA, nbStepsB;

void settings() {
  size(int(nbCol * tailleCell), int(nbRow * tailleCell));
}

void setup() {
  background(0);
  fill(255);
  noStroke();
  noLoop();

  if ( nbCol % 2 == 0) {
    //println("nombre colonnes pair");
    nbStepsA = int(nbCol / 2.0);
    nbStepsB = nbStepsA;
  } else {
    //println("nombre colonnes impair");
    nbStepsA = int(nbCol / 2.0);
    nbStepsB = nbStepsA - 1;
  }
}

void draw() {
  background(0);
  
  // Formule pour déterminer le nombre de répétitions verticales
  int nbStepsVertical = floor(nbRow / 4.0);

  for (int k = 0; k <= nbStepsVertical; k++) {
    pushMatrix();
    translate(0, 4*tailleCell*k);

    for (int j = 0; j < 2; j++) {

      if (j == 0) {
        // deux premières rangées
        for (int i = 0; i <= nbStepsA; i++) {
          ma(i * (tailleCell*2), 0);
        }

        for (int i = 0; i <= nbStepsB; i++) {
          pushMatrix();
          translate(tailleCell, 0);
          mb(i * (tailleCell*2), 0);
          popMatrix();
        }

        for (int i = 0; i <= nbStepsA; i++) {
          pushMatrix();
          translate(0, tailleCell);
          mc(i * (tailleCell*2), 0);
          popMatrix();
        }

        for (int i = 0; i <= nbStepsB; i++) {
          pushMatrix();
          translate(tailleCell, tailleCell);
          md(i * (tailleCell*2), 0);
          popMatrix();
        }
      } else {
        // rangées trois et quatre
        pushMatrix();
        translate(0, tailleCell*2);

        for (int i = 0; i <= nbStepsA; i++) {
          mb(i * (tailleCell*2), 0);
        }

        for (int i = 0; i <= nbStepsB; i++) {
          pushMatrix();
          translate(tailleCell, 0);
          ma(i * (tailleCell*2), 0);
          popMatrix();
        }

        for (int i = 0; i <= nbStepsA; i++) {
          pushMatrix();
          translate(0, tailleCell);
          md(i * (tailleCell*2), 0);
          popMatrix();
        }

        for (int i = 0; i <= nbStepsB; i++) {
          pushMatrix();
          translate(tailleCell, tailleCell);
          mc(i * (tailleCell*2), 0);
          popMatrix();
        }
        popMatrix();
      }
    }
    popMatrix();
  }
  
  save("rendu_motif_dallage.jpg");
}

// Quatre modules

// Motif A:
void ma(int tx, int ty) {
  pushMatrix();
  translate(tx, ty);
  fill(beige);
  triangle(0, 0, tailleCell, 0, 0, tailleCell);
  fill(noir);
  triangle(tailleCell, 0, tailleCell, tailleCell, 0, tailleCell);
  popMatrix();
}


// Motif B:
void mb(int tx, int ty) {
  pushMatrix();
  translate(tx, ty);
  fill(bleuclair);
  triangle(0, 0, tailleCell, tailleCell, 0, tailleCell);
  fill(bleusombre);
  triangle(0, 0, tailleCell, 0, tailleCell, tailleCell);
  popMatrix();
}

// Motif C:
void mc(int tx, int ty) {
  pushMatrix();
  translate(tx, ty);
  fill(noir);
  triangle(0, 0, tailleCell, 0, 0, tailleCell);
  fill(orange);
  triangle(tailleCell, 0, tailleCell, tailleCell, 0, tailleCell);
  fill(bleusombre);
  triangle(0, 0, tailleCell, tailleCell, 0, tailleCell);
  popMatrix();
}

// Motif D:
void md(int tx, int ty) {
  pushMatrix();
  translate(tx, ty);
  fill(orange);
  triangle(0, 0, tailleCell, tailleCell, 0, tailleCell);
  fill(bleuclair);
  triangle(0, 0, tailleCell, 0, tailleCell, tailleCell);
  fill(beige);
  triangle(tailleCell, 0, tailleCell, tailleCell, 0, tailleCell);
  popMatrix();
}
