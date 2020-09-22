// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// mardi, 11 septembre 2018

PImage imgVirtuelle;
PImage palette;

void setup() {
  size(600, 600);
  imgVirtuelle = createImage(width, height, RGB);
  palette = loadImage("palette.gif");

  background(0);
  //fill(255);
  //noStroke();
  palette.loadPixels();
}

void draw() {
  background(0);

  imgVirtuelle.loadPixels();


  for (int y = 0; y<height; y++) {
    int pige = floor(random(palette.width*palette.height));
    for (int x = 0; x<width; x++) {
      int pige2 = floor(random(4));
      color newC = palette.pixels[pige];
      if (pige2 < 2) {
        imgVirtuelle.pixels[(y*imgVirtuelle.width)+x] = color(red(newC), green(newC), blue(newC), 255 );
      } else {
        imgVirtuelle.pixels[(y*imgVirtuelle.width)+x] = newC;
      }
    }
  }
  imgVirtuelle.updatePixels();
  
  tint(255, 127);
  image(imgVirtuelle, 0, 0, width, height*0.5);
  image(imgVirtuelle, 0, 0, width*0.5, height);

  //println(frameRate);
}
