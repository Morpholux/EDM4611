// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0b6
// samedi, 12 septembre 2015

int index = 0;

void setup() {
  size(50, 50);
  background(0);
  fill(255);
  noStroke();
  noCursor();
}

void draw() {
  color gris = color(map(index, 0, (width*height)-1, 0, 255));
  background(gris);
  index = positionXyVersIndex(mouseX, mouseY, width, height);
  loadPixels();
  pixels[index] = color(256-(gris & 0xFF));
  updatePixels();
  println(index);
  //println(positionXyVersIndex(mouseX, mouseY, width, height));
}

int positionXyVersIndex(int posX, int posY, int tailleLargeur, int tailleHauteur) {
  // Les positions sont contraintes aux limites de la surface, considérant l’usage
  // d’une position de souris par exemple et sachant que les données retournées
  // par mouseX et mouseY débordent parfois la taille d’un sketch.
  posX = constrain(posX, 0, tailleLargeur-1);
  posY = constrain(posY, 0, tailleHauteur-1);
  int monIndex = (posY* tailleLargeur)+posX;
  return monIndex;
}
