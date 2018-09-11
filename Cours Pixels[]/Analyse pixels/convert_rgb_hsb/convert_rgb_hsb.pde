// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.4
// vendredi, 9 juin 2017

// Pour réaliser conversion mode couleur
// http://docs.oracle.com/javase/1.5.0/docs/api/java/awt/Color.html
import java.awt.Color;

void setup() {
  size(600, 600);
  noStroke();
  noLoop();
}

void draw() {
  background(0);
  colorMode(RGB);
  color cRgb = color(127,34,95);
  fill(cRgb);
  rect(0, 90, width, 200);
  
  
  
  int[] colConverted = new int[3];
  colConverted = rgbToHsbInt(cRgb);
  
  colorMode(HSB,360,255,255);
  color cHsb = color(colConverted[0], colConverted[1], colConverted[2]);
  fill(cHsb);
  rect(0, 310, width, 200);
}

// Valeurs HSB conforme au colorMode(HSB,360,255,255)
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

// Valeurs HSB normalisées, de 0.0 à 1.0
float [] rgbToHsbFloat(color cRgb) {
  int r = (cRgb >> 16) & 0xFF;
  int g = (cRgb >> 8) & 0xFF;
  int b = cRgb & 0xFF;
  float[] hsb = new float[3];
  Color.RGBtoHSB(r, g, b, hsb);
  return hsb;
}