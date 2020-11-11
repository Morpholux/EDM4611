// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 10 novembre 2020

int incrementNoise = 0;
float echelleNoise = 0.005;
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
  line(0, 0, 0, height);
  stroke(0, 150, 0);
  line(0, height/2, width, height/2);


  fill(255, 0, 0);
  noStroke();
  float n2 = noise(incrementNoise*echelleNoise); // retourne entre 0 et 1
  circle(width/2, 200, n2 * amplitude);


  // Section qui permet de montrer, à l’avance, le déroulement des 600 prochains états du noise
  noFill();
  stroke(255);
  beginShape();
  for (int i = 0; i <= width; i+=1) {
    float n1 = noise(incrementNoise*echelleNoise); // entre 0 et 1
    float posy = map(n1, 0, 1, amplitude, -amplitude);
    vertex(i, height/2 + posy);
    // Permet de faire l’évaluation «anticipée» du noise
    incrementNoise++;
  }
  endShape();



  // Important si l’on veut progresser ou pas dans l’avancement de l’horloge

  //incrementNoise = 0; // equivalent noloop()
  //incrementNoise++;
  incrementNoise = frameCount; // annule l’incrémentation de la boucle for, mais avance d’un incrément par frame

  //if (frameCount == width) {
  //  exit();
  //}
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}
