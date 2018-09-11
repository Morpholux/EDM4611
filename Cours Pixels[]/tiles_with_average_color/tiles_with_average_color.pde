// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.4
// jeudi, 8 juin 2017

// For now, work only with square image
// and we know the resolution of source image : 500 x 500 px

// This variable could be adjusted as you wish
int tileSize = 25; // Choose a value with exact division of 500

int imgTotalPixelsResolution = 500*500; // Since the image is 500x500 px :
// for 500x500 image and 25x25 px for 1 tile >>> we will need 400 tiles
// 250000 pixels / 625 pixels = 400 tiles
int nbTiles = imgTotalPixelsResolution / (tileSize*tileSize); // total number of tiles
int nbTilesOneAxis = int(sqrt(nbTiles)); // work with square format only

// RGB Mode seem to be the only working color mode for pixels[]
int redList [] = new int[nbTiles];
int greenList [] = new int[nbTiles];
int blueList [] = new int[nbTiles];
color c;
PImage img;

// Variable to manage position of tiles
int xOffset = 0, yOffset = 0;

void setup() {
  img = loadImage("portrait_500x500px.jpg");
  surface.setSize(img.width, img.height);
  noStroke();

  // No need to loop... draw will happen only once
  noLoop();

  // First, analyse the average color for each tile.
  img.loadPixels();
  for (int k = 0; k < nbTiles; k++) {
    // declare and reset local variables
    float totalr = 0, totalg = 0, totalb = 0;

    for (int j = 0; j < tileSize; j++) { // height of one tile
      for (int i = 0; i < tileSize; i++) { // width of one tile
        // grab color value for every pixel inside the tile surface
        c = img.pixels[positionXyVersIndex(i+xOffset, j+yOffset)];

        // traditionnal method to extract color
        /*float r = red(c);
         totalr += r;
         float g = green(c);
         totalg += g;
         float b = blue(c);
         totalb += b;
         */

        // Faster Bit Shifting method to isolate RGB values of pixel
        float r = (c >> 16) & 0xFF;
        // Addition of all red value in one tile
        totalr += r;
        float g = (c >> 8) & 0xFF;
        totalg += g;
        float b = c & 0xFF;
        totalb += b;
      }
    }
    // Calculate average value and register in lists
    redList[k] = int(totalr/float(tileSize*tileSize));
    greenList[k] = int(totalg/float(tileSize*tileSize));
    blueList[k] = int(totalb/float(tileSize*tileSize));

    if (k%nbTilesOneAxis == nbTilesOneAxis-1) { // When finish with last tile in a row
      yOffset += tileSize; // Step down
      xOffset = 0; // Start over for new row
    } else {
      xOffset += tileSize; // Step to right
    }
  }

  /*
  printArray(redList);
   println();
   printArray(greenList);
   println();
   printArray(blueList);
   println();
   */
}

void draw() {
  background(0);
  // Drawing tiles
  for (int j=0; j<nbTilesOneAxis; j++) {
    for (int i=0; i<nbTilesOneAxis; i++) {
      // Coloring each tile with values in R, G, and B lists
      fill(redList[(j*nbTilesOneAxis)+i], greenList[(j*nbTilesOneAxis)+i], blueList[(j*nbTilesOneAxis)+i]);
      rect(i*tileSize, j*tileSize, tileSize, tileSize);
    }
  }
}

// Useful function, converting x and y coordinates to index position in pixels array
int positionXyVersIndex(int posX, int posY) {
  int monIndex = (posY*img.width)+posX; 
  return monIndex;
}