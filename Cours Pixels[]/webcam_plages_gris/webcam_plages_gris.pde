// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// mardi, 20 septembre 2016

// Réduction tonale des niveaux de luminosité dans une captation video

// Les touches du clavier de 1 à 0 inclusivement permettent de modifer le nombre des niveaux de gris
// 1 pour du haut-contraste noir et blanc : 0-127, 128-255
// 2 pour noir, gris moyen et blanc : 0-84, 85-169, 170-255
// 3 pour noir, gris sombre, gris clair et blanc : 0-63, 64-127, 128-191, 192-255 
// etc.


import processing.video.*;
Capture cam;

int echelleGris = 3;
float [] listeCoul;
float x, y;
boolean go = false;

PImage imgVirtuelle;

void setup() {
  size(640, 480);
  background(0);
  frameRate(30);
  noSmooth();

  String[] cameras = Capture.list();
  printArray(cameras);
  // The camera can be initialized directly using an element
  // from the array returned by list():
  //cam = new Capture(this, cameras[3]);
  // Or, the settings can be defined based on the text in the list
  cam = new Capture(this, 160, 90, "FaceTime HD Camera", 30);

  listeCoul = new float[cam.width*cam.height];
  println(listeCoul.length);

  imgVirtuelle = createImage(cam.width, cam.height, RGB);



  // Start capturing the images from the camera
  cam.start();
}


void draw() {
  background(0);
  if (cam.available() == true) {
    cam.read();

    cam.loadPixels();
    imgVirtuelle.loadPixels();
    for (int i = 0; i < listeCoul.length; i++) {
      listeCoul[i] = map(brightness(cam.pixels[i]), 0, 255, 0, 1);
      listeCoul[i] *=echelleGris;
      listeCoul[i] = floor(listeCoul[i]);
      //if (listeCoul[i] >= echelleGris) {
      imgVirtuelle.pixels[i] = color(listeCoul[i]*(255/(float)echelleGris));
      //} else {
      //  imgVirtuelle.pixels[i] = color(0);
      //}
    }
    imgVirtuelle.updatePixels();
  }


  image(imgVirtuelle, 0, 0, width, height);


  //if (go) {
  //  sauvegardeImg("seconde", "tif");
  //  go = false; // à utiliser en l'absence de commande mouseReleased
  //}
}

void mousePressed() {
  //go = true;
}

void keyPressed() {
  switch(key) {
  case '1':
    echelleGris = 1;
    break;
  case '2':
    echelleGris = 2;
    break;
  case '3':
    echelleGris = 3;
    break;
  case '4':
    echelleGris = 4;
    break;
  case '5':
    echelleGris = 5;
    break;
  case '6':
    echelleGris = 6;
    break;
  case '7':
    echelleGris = 7;
    break;
  case '8':
    echelleGris = 8;
    break;
  case '9':
    echelleGris = 9;
    break;
  case '0':
    echelleGris = 255;
    break;
  default:
    echelleGris = 3;
    break;
  }
}