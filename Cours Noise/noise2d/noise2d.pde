// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 10 novembre 2020

// Un noise 2D est un premier noise (1D) affecté par un second.
// La série semi-continue des valeurs obtenues par le premier noise
// évolue suivant des transformations également semi-continues.
// Autrement dit, on peut exploiter le noise 2D pour créer des figures
// dont le contour serait non seulement «irrégulier» à la base, mais
// également «déformé» à l’intérieur d’une animation «bruitée».
// Le noise 1D fixe la nature du contour, le noise 2D agit sur
// l’évolution de ce contour dans le temps.

int incrementNoise = 0;
float echelleNoise = 0.005;

int incrementNoise2d = 0;
float echelleNoise2d = 0.01;

float amplitude = 200;


void setup() {
  size(600, 600);

  //noLoop();

  //noiseDetail(4, 0.5); // le noise detail par défaut
  noiseDetail(4, 0.54321); // un noise detail qui permet de centrer les résultats sur 0.5
  //noiseDetail(2, 0.5);
}

void draw() {
  background(0);
  
  noFill();
  stroke(255, 0, 0);
  line(0, height/2, width, height/2);

  // La deuxième dimension du noise permet d’animer le noise 1D
  noFill();
  stroke(255);
  beginShape();
  for (int i = 0; i <= width; i++) {
    float n1 = noise(incrementNoise*echelleNoise, incrementNoise2d*echelleNoise2d);
    float posy = map(n1, 0, 1, -amplitude, amplitude);
    vertex(i, height/2 + posy);
    incrementNoise++;
  }
  endShape();

  incrementNoise = 0; // reset du décompte de l’horloge pour le noise 1D, donc aucune évolution entre chaque frame
  incrementNoise2d = frameCount; // Avancement du décompte pour l’horloge utilisée dans la deuxième dimension du noise
}
