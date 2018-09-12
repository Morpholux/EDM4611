// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// mardi, 11 septembre 2018

// On doit cliquer dans le sketch pour afficher un nouvel échantillon de texture

PImage imgVirtuelle;
PImage palette;

void setup() {
  size(1000, 1000);
  imgVirtuelle = createImage(width, height, RGB);
  palette = loadImage("palette.gif");
  background(0);
  palette.loadPixels();
  noLoop();
}

void draw() {
  background(0);

  imgVirtuelle.loadPixels();
  for (int y = 0; y<height; y++) {
    int pige = floor(random(palette.width*palette.height));
    for (int x = 0; x<width; x++) {
      int pige2 = floor(random(4));
      color c = palette.pixels[pige];
      if (pige2 == 0) {
        imgVirtuelle.pixels[(y*imgVirtuelle.width)+x] = color(red(c), green(c), blue(c), 50 );
      } else {
        imgVirtuelle.pixels[(y*imgVirtuelle.width)+x] = c;
      }
    }
  }
  imgVirtuelle.updatePixels();
  // on affiche l’image une première fois
  image(imgVirtuelle, 0, 0);

  // Ajout d’une séquence de traits verticaux
  // et écriture de nouveaux pixels dans notre image virtuelle
  imgVirtuelle.loadPixels();
  for (int x = 0; x<width; x++) {
    int pige = floor(random(palette.width*palette.height));
    for (int y = 0; y<height; y++) {
      color c = palette.pixels[pige];
      imgVirtuelle.pixels[(y*imgVirtuelle.width)+x] = color(red(c), green(c), blue(c), 100 );
    }
  }
  imgVirtuelle.updatePixels();

  // Fusion entre le rendu actuel du sketch (qui compte un premier affichage)
  // avec l’image virtuelle à nouveau modifiée
  blend(imgVirtuelle, 0, 0, width, height, 0, 0, width, height, LIGHTEST);
}

void mousePressed() {
  save("rendu.jpg");
  redraw();
}
