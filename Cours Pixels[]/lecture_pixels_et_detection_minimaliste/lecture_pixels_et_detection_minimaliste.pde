// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// mardi, 13 septembre 2016

// Exemple montrant une amorce de stratégie en «vision artificiel».
// On peut chercher la présence d’une couleur et montrer son emplacement.
// Cas très simple, avec détection qui se termine au premier cas rencontré.


PImage img;
color c;
color cImg, cLecture;
int index, resolutionImg, repereIndex;
int r, g, b;

void setup() {
  img = loadImage("big_foot.png");
  surface.setSize(img.width, img.height);
  background(0);
  fill(255);
  noStroke();
  rectMode(CENTER);

  // Exceptionnellement, on peut charger les pixels de l’image en mémoire pour analyse une seule fois, car elle ne sera pas modifiée.
  img.loadPixels();

  // Nombre de pixels au total
  resolutionImg = img.width * img.height;
}

void draw() {
  // Affichage de l’image
  image(img, 0, 0);
  // Rectangle qui affiche la couleur sous la souris
  fill(cImg);
  rect(width*0.5, height*0.5, 100, 100);


  // Une autre forme d’analyse
  // La localisation d’une couleur particulière est désignée dans le sketch
  for (int i = 0; i <resolutionImg; i++) {
    cLecture = img.pixels[i];
    r = (cLecture >> 16) & 0xFF;
    g = (cLecture >> 8) & 0xFF;
    b = cLecture & 0xFF;
    // on cherche le premier pixel qui sera rencontré avec une recette particulière,
    // soit la donnée couleur située sous la souris.
    if ((r == ((cImg >> 16) & 0xFF))&&(g == ((cImg >> 8) & 0xFF))&&(b == (cImg & 0xFF))) {
      repereIndex = i;
      // dès la première valeur trouvée, on sort de la boucle for
      break;
    }
  }
  pushStyle();
  noFill();
  stroke(255);
  // Une ellipse est dessinée à l’emplacement du premier pixel dont la couleur équivaut celle sous la souris.
  // Cet emplacement peut être au même endroit que la souris, ou ailleurs.
  // Il sera généralement en amont sachant que la fouille dans le tableau s’interrompt dès que l’on trouve une équivalence.
  ellipse(indexVersPositionX(repereIndex), indexVersPositionY(repereIndex), 40, 40);
  popStyle();
}

void mousePressed() {
  index = (positionXyVersIndex(constrain(mouseX, 0, width-1), constrain(mouseY, 0, height-1))); 
  cImg = img.pixels[index];
  println("rouge : "+int((cImg >> 16) & 0xFF)+", vert : "+int((cImg >> 8) & 0xFF)+", bleu : "+int(cImg & 0xFF));
}

void mouseMoved() {
  index = (positionXyVersIndex(constrain(mouseX, 0, width-1), constrain(mouseY, 0, height-1))); 
  cImg = img.pixels[index]; // évaluation des pixels de l’image chargés en mémoire
  c = color((cImg >> 16) & 0xFF, (cImg >> 8) & 0xFF, cImg & 0xFF); // suivant la méthode BitShifting
}

// Fonction pour convertir la position X et Y d’une coordonnée de surface (mouseX, mouseY)
// vers l’emplacement de son index correspondant dans un tableau unidimensionnel.
int positionXyVersIndex(int posX, int posY) {
  int monIndex = (posY*img.width)+posX; 
  return monIndex;
}

// En complément, on peut disposer de deux fonctions qui feront la conversion inverse,
// partant de la position de la couleur dans le tableau unidimensionnel de pixels (l’index)
// vers la position dans la surface à deux dimensions.
int indexVersPositionX (int index) {
  int maPositionenX; 
  maPositionenX = index%img.width; 
  return maPositionenX;
}

int indexVersPositionY (int index) {
  int maPositionenY; 
  maPositionenY = index/img.width; 
  return maPositionenY;
}