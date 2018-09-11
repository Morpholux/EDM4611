// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.4
// jeudi, 8 juin 2017

// For now, work only with square image
// and we know the resolution of source image : 500 x 500 px

import java.awt.Color;

// This variable could be adjusted as you wish
int tileSize = 20; // Choose a value with exact division of 500

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

// Lists for HSB after conversion
float hueList [] = new float[nbTiles];
float saturationList [] = new float[nbTiles];
float brightnessList [] = new float[nbTiles];

// Variable to manage position of tiles
int xOffset, yOffset;

void setup() {
  img = loadImage("portrait_500x500px.jpg");
  surface.setSize(img.width, img.height);
  noStroke();

  // No need to loop... draw will happen only once
  noLoop();

  xOffset = 0; 
  yOffset = 0;
  // First, analyse the average color for each tile.
  img.loadPixels();
  for (int k = 0; k < nbTiles; k++) {
    // declare and reset local variables
    float totalr = 0, totalg = 0, totalb = 0;

    for (int j = 0; j < tileSize; j++) { // height of one tile
      for (int i = 0; i < tileSize; i++) { // width of one tile
        // grab color value for every pixel inside the tile surface of imported image
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
    // Calculate average value for each channel and register in lists
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

  // Create HSB lists from RGB lists
  for (int i = 0; i < nbTiles; i++) {
    float[] colConverted = new float[3];
    // Use the function to make conversion of values
    colConverted = rgbToHsbFloat(color(redList[i], greenList[i], blueList[i]));
    hueList[i] = colConverted[0];
    saturationList[i] = colConverted[1];
    brightnessList[i] = colConverted[2];
  }

  /*
  // Rounding values in lists, adapting colors for a restricted palette
   int steps = 16;
   for (int i = 0; i < nbTiles; i++) {
   hueList[i] = norm(floor(map(hueList[i], 0.0, 1.0, 0, steps)), 0, steps);
   saturationList[i] = norm(floor(map(saturationList[i], 0.0, 1.0, 0, steps)), 0, steps);
   brightnessList[i] = norm(floor(map(brightnessList[i], 0.0, 1.0, 0, steps)), 0, steps);
   }
   */
}

void draw() {
  background(0);
  /*
  // Drawing tiles with RGB values
   // Default color mode is RGB
   for (int j=0; j<nbTilesOneAxis; j++) {
   for (int i=0; i<nbTilesOneAxis; i++) {
   // Coloring each tile with values in R, G, and B lists
   fill(redList[(j*nbTilesOneAxis)+i], greenList[(j*nbTilesOneAxis)+i], blueList[(j*nbTilesOneAxis)+i]);
   rect(i*tileSize, j*tileSize, tileSize, tileSize);
   }
   }
   */

  // Or drawing tiles with HSB values
  colorMode(HSB, 1.0, 1.0, 1.0); // change color mode
  for (int j=0; j<nbTilesOneAxis; j++) {
    for (int i=0; i<nbTilesOneAxis; i++) {
      // Coloring each tile with values in H, S, and B lists
      fill(hueList[(j*nbTilesOneAxis)+i], saturationList[(j*nbTilesOneAxis)+i], brightnessList[(j*nbTilesOneAxis)+i]);
      //fill(brightnessList[(j*nbTilesOneAxis)+i]);
      rect(i*tileSize, j*tileSize, tileSize, tileSize);
    }
  }
}

// Useful function, converting x and y coordinates to index position in pixels array
int positionXyVersIndex(int posX, int posY) {
  int monIndex = (posY*img.width)+posX; 
  return monIndex;
}

// HSB conversion, at the standard HSB colorMode(HSB,360,255,255)
int [] rgbToHsbInt(color cRgb) {
  int r = (cRgb >> 16) & 0xFF;
  int g = (cRgb >> 8) & 0xFF;
  int b = cRgb & 0xFF;
  float[] hsb = new float[3];
  Color.RGBtoHSB(r, g, b, hsb);
  int[] hsbInt = new int[3];
  hsbInt[0] = int(map(hsb[0], 0.0, 1.0, 0, 360));
  hsbInt[1] = int(map(hsb[1], 0.0, 1.0, 0, 255));
  hsbInt[2] = int(map(hsb[2], 0.0, 1.0, 0, 255));
  return hsbInt;
}

// HSB conversion, with normalized values, from 0.0 to 1.0
float [] rgbToHsbFloat(color cRgb) {
  int r = (cRgb >> 16) & 0xFF;
  int g = (cRgb >> 8) & 0xFF;
  int b = cRgb & 0xFF;
  float[] hsb = new float[3];
  Color.RGBtoHSB(r, g, b, hsb);
  return hsb;
}