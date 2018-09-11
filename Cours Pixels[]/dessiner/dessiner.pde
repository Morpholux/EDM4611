// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// mardi, 11 septembre 2018

PImage imgVirtuelle;
PImage palette;

void setup() {
  size(600, 600, P2D);
  imgVirtuelle = createImage(width, height, RGB);
  palette = loadImage("palette.gif");

  // surface.setSize(img.width, img.height);
  // pixelDensity(displayDensity());
  background(0);
  fill(255);
  noStroke();
  palette.loadPixels();
}

void draw() {
  //background(0);

  imgVirtuelle.loadPixels();


  for (int y = 0; y<height; y++) {
    int pige = floor(random(palette.width*palette.height));
    for (int x = 0; x<width; x++) {
      int pige2 = floor(random(40));
      color newC = palette.pixels[pige];
      if (pige2 < 20) {
        imgVirtuelle.pixels[(y*imgVirtuelle.width)+x] = color(red(newC), green(newC), blue(newC), 50 );
      } else {
        imgVirtuelle.pixels[(y*imgVirtuelle.width)+x] = newC;
      }
    }
  }
  imgVirtuelle.updatePixels();

  image(imgVirtuelle, 0, 0);

  //println(frameRate);
}
