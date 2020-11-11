// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 10 novembre 2020

int incrementNoise = 0;
float echelleNoise = 0.005;

float incrementNoise2d = 0;
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
  stroke(255);
  beginShape();
  for (int i = 0; i <= width; i++) {
    float n1 = noise(incrementNoise*echelleNoise, incrementNoise2d*echelleNoise2d);
    float posy = map(n1, 0, 1, -amplitude, amplitude);
    vertex(i, height/2 + posy);
    incrementNoise++;
  }
  endShape();





  incrementNoise = 0;
  incrementNoise2d = 100 * (sin(map(frameCount%60, 0, 59, 0, TWO_PI)));
}
