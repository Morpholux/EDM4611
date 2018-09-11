// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 3.0b6
// samedi, 12 septembre 2015

// Pastiche d’une animation de Ryoji Ikeda (data.tron)
// Cliquez dans le sketch pour interrompre l’animation

int pige;
color blanc;

void setup() {
  // Largeur doit être divisible par 4 sans reste (comme 1200)
  // Hauteur doit être divisible par 6 sans reste (comme 900)
  // On soustrait 1 à chaque longueur pour enlever
  // les marges à droite et en bas.
  //size(1200-1, 900-1);
  
  size(1199, 899, FX2D);
  noSmooth(); // https://github.com/processing/processing/issues/3795
  //size(1199, 899, P2D);
  blanc = color(255);
}

void draw() {
  background(0);
  loadPixels();
  for (int j=0; j < height; j+=6) {
    for (int i=0; i < width; i+=4) {
      pige = floor(random(0, 10));
      switch(pige) {
      case 0:
        zero(i, j);
        break;
      case 1:
        un(i, j);
        break;
      case 2:
        deux(i, j);
        break;
      case 3:
        trois(i, j);
        break;
      case 4:
        quatre(i, j);
        break;
      case 5:
        cinq(i, j);
        break;
      case 6:
        six(i, j);
        break;
      case 7:
        sept(i, j);
        break;
      case 8:
        huit(i, j);
        break;
      case 9:
        neuf(i, j);
        break;
      }
    }
  }
  updatePixels();
  
}

void mousePressed() {
  println(frameRate);
  noLoop();
  //save("pastiche_ikeda"+millis()+".tga");
}

void mouseReleased() {
  loop();
}

// dessin des chiffres
void zero(int posX, int posY) {
  int index = (posY*width)+posX;
  for (int i = 0; i<3; i++) {
    pixels[i+index] = blanc;
  }
  for (int i = 1; i<4; i++) {
    pixels[index+(width*i)] = blanc;
    pixels[index+(width*i)+2] = blanc;
  }
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*4)] = blanc;
  }
}

void un(int posX, int posY) {
  int index = (posY*width)+posX;
  for (int i = 0; i<5; i++) {
    pixels[index+(width*i)+1] = blanc;
  }
}

void deux(int posX, int posY) {
  int index = (posY*width)+posX;
  for (int i = 0; i<3; i++) {
    pixels[i+index] = blanc;
  }
  pixels[index+width+2] = blanc;
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*2)] = blanc;
  }
  pixels[index+(width*3)] = blanc;
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*4)] = blanc;
  }
}

void trois(int posX, int posY) {
  int index = (posY*width)+posX;
  for (int i = 0; i<3; i++) {
    pixels[i+index] = blanc;
  }
  pixels[index+width+2] = blanc;
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*2)] = blanc;
  }
  pixels[index+(width*3)+2] = blanc;
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*4)] = blanc;
  }
}

void quatre(int posX, int posY) {
  int index = (posY*width)+posX;
  for (int i = 0; i<3; i++) {
    pixels[index+(width*i)] = blanc;
  }
  pixels[index+(width*2)+1] = blanc;
  for (int i = 0; i<5; i++) {
    pixels[index+(width*i)+2] = blanc;
  }
}

void cinq(int posX, int posY) {
  int index = (posY*width)+posX;
  for (int i = 0; i<3; i++) {
    pixels[i+index] = blanc;
  }
  pixels[index+width] = blanc;
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*2)] = blanc;
  }
  pixels[index+(width*3)+2] = blanc;
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*4)] = blanc;
  }
}

void six(int posX, int posY) {
  int index = (posY*width)+posX;
  pixels[index] = blanc;
  pixels[index+width] = blanc;
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*2)] = blanc;
  }
  pixels[index+(width*3)] = blanc;
  pixels[index+(width*3)+2] = blanc;
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*4)] = blanc;
  }
}

void sept(int posX, int posY) {
  int index = (posY*width)+posX;
  for (int i = 0; i<2; i++) {
    pixels[i+index] = blanc;
  }
  for (int i = 0; i<5; i++) {
    pixels[index+(width*i)+2] = blanc;
  }
}

void huit(int posX, int posY) {
  int index = (posY*width)+posX;
  for (int i = 0; i<3; i++) {
    pixels[i+index] = blanc;
  }
  for (int i = 1; i<4; i++) {
    pixels[index+(width*i)] = blanc;
  }
  pixels[index+(width*2)+1] = blanc;
  for (int i = 1; i<4; i++) {
    pixels[index+(width*i)+2] = blanc;
  }
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*4)] = blanc;
  }
}

void neuf(int posX, int posY) {
  int index = (posY*width)+posX;
  for (int i = 0; i<3; i++) {
    pixels[i+index] = blanc;
  }
  pixels[index+width] = blanc;
  pixels[index+width+2] = blanc;
  for (int i = 0; i<3; i++) {
    pixels[i+index+(width*2)] = blanc;
  }
  pixels[index+(width*3)+2] = blanc;
  pixels[index+(width*4)+2] = blanc;
}