// Contrairement à mon sketch précédent, j’ai omis d’effectuer une incrémentation du temps
// à l’aide d’un float, ce qui entrainait des erreurs d’arrondissement et des problèmes
// observés dans l’étude des «limites de la commande noise».

// Il faut plutôt incrémenter l’horloge par des entiers (variable timeSteps et commande timeSteps++),
// puis fractionner ce compteur à l’aide d’une valeur float (variable noiseScale).


int timeSteps = 0; // maintenir le format de type entier
float noiseScale = 0.001;
float amplitude = 600;
float deltaX = 0, posInit;
int nbIterations = 1;


void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  noFill();

  // Si l’on veut que le parcours erratique soit identique à chaque compilation
  noiseSeed(0);
  //noiseSeed(System.currentTimeMillis());

  // une valeur comme 0.54321 permet approximativement de recentrer les valeurs du noise
  noiseDetail(4, 0.54321); // Valeur par défaut : (4, 0.5)
  //noiseDetail(2, 1);
  posInit = width/2;
}

void draw() {
  background(0);


  noFill();
  stroke(255);
  for (int y = 0; y < height; y++) {
    for (int j = 0; j < nbIterations; j++) {
      deltaX = ((noise(timeSteps*noiseScale))*amplitude)-(amplitude*0.5);
      deltaX = constrain(deltaX, -(amplitude*0.5), (amplitude*0.5)); // on ne dépassera pas les limites
      point(posInit+deltaX, y);
      timeSteps++;
    }
  }
  timeSteps -= height - 2;

  // Repère vertical au centre du sketch
  stroke(255, 0, 0);
  line(posInit, 0, posInit, height);
  
  
  // *0 implique un seul passage
  //if (timeSteps > (height*nbIterations)*2) {
  //  //timeSteps = 0;
  //  noLoop();
  //}
}

void mousePressed() {
  println(timeSteps);
}
