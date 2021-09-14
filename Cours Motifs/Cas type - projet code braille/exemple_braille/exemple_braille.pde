// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mercredi, 8 septembre 2021


int nbCols = 2, nbRangs = 3;
int tailleCel = 200;
float taillePoint = tailleCel*0.85;
int index;

// L’ordre des valeurs est à lire  de gauche à droite, puis de haut en bas.
int [] listeGris = {255, 255, 255, 20, 20, 255};

void setup() {
  size(600, 800);
  //pixelDensity(displayDensity()); // pour doubler la résolution du rendu avec Retina.
  noStroke();
  noLoop(); // un seul frame, puis on interrompt le draw()
}

void draw() {
  background(40, 40, 60);
  translate(tailleCel, tailleCel);
  for (int j = 0; j < nbRangs; j++) {
    for (int i = 0; i < nbCols; i++) {

      index = (j * nbCols) + i;
      //println(index);

      //fill(map(index, 0, 5, 0, 255));
      fill(listeGris[index]);

      circle(i*tailleCel, j*tailleCel, taillePoint);
    }
  }

  //save("render_01.jpg");
}
