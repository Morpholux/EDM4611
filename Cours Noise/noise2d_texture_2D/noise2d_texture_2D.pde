// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 10 novembre 2020

// Un noise 2D est un premier noise (1D) affecté par un second.
// La série semi-continue des valeurs obtenues par le premier noise
// évolue suivant des transformations également semi-continues.
// C’est pourquoi il est possible de générer des textures
// sur des surfaces 2D. Le principe de continuité est visible dans
// les deux axes (x, y) de l’image.
// Un noise 3D aurait pour effet de faire évoluer la texture dans le temps.


int incrementNoise = 0;
float echelleNoise = 0.005;

// Possibilité de placer des valeurs différentes dans l’horloge de la deuxième dimension
int incrementNoise2d = 0;
float echelleNoise2d = 0.005;

float amplitude = 200;

// Pour mieux voir les deux images combinées (celle de la texture et celle du graphe)
PGraphics pg1, pg2;


void setup() {
  size(600, 600);
  pg1 = createGraphics(width, height);
  pg2 = createGraphics(width, height);

  //noLoop();

  //noiseDetail(4, 0.5); // le noise detail par défaut
  noiseDetail(4, 0.54321); // un noise detail qui permet de centrer les résultats sur 0.5
  //noiseDetail(2, 0.5);
}

void draw() {
  background(0);



  // représentation du noise 2D
  pg2.beginDraw();
  pg2.loadPixels();
  for (int i = 0; i <= width; i++) {
    float n1 = noise(incrementNoise*echelleNoise, incrementNoise2d*echelleNoise2d);
    float gray = map(n1, 0, 1, 255, 0);
    pg2.pixels[(i+(frameCount*width))%(width*height)] = color(gray);
    incrementNoise++;
  }
  pg2.updatePixels();
  pg2.endDraw();
  
  image(pg2, 0, 0);

  noFill();
  stroke(255, 0, 0);
  line(0, frameCount%height, width, frameCount%height);

  incrementNoise = 0; // reset en vue du traitement suivant

  // Affichage du graphique illustrant le noise 2D
  pg1.beginDraw();
  pg1.clear();
  pg1.noFill();
  pg1.stroke(255);
  pg1.beginShape();
  for (int i = 0; i <= width; i++) {
    // La deuxième dimension du noise permet de faire évoluer le noise 1D
    float n1 = noise(incrementNoise*echelleNoise, incrementNoise2d*echelleNoise2d);
    float posy = map(n1, 0, 1, -amplitude, amplitude);
    pg1.vertex(i, height/2 + posy);
    incrementNoise++;
  }
  pg1.endShape();
  pg1.endDraw();

  image(pg1, 0, 0);

  incrementNoise = 0; // reset du décompte de l’horloge pour le noise 1D

  incrementNoise2d = frameCount; // Avancement du décompte pour l’horloge utilisée dans la deuxième dimension du noise
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}
