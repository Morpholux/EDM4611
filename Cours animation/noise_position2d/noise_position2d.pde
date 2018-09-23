// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// dimanche, 23 septembre 2018

// Exemple de récupération de la méthode permettant
// de générer des valeurs de noise sur une dimension
// et l’adaptant à des besoins de déplacement sur deux dimensions,
// ou en vue d’une situation où l’on tente de combiner plusieurs noise()
// en évitant leur synchronisation

// Variables importantes
int timeSteps1 = 0; // privilégier le format de type entier
int timeSteps2 = 0;
float noiseScale1 = 1.0/500.0; // plus la fraction est petite, plus l’évolution sera lente
float noiseScale2 = 1.0/500.0;
float amplitude1 = 600; // servira à faire le mappage des valeurs (0-1) vers la nouvelle échelle
float amplitude2 = 600;
int timeIncrement1 = 1;
int timeIncrement2 = 1;
float deltaX = 0, deltaY = 0, posInitX, posInitY;

// Les modifications apportées au noiseScale et à timeIncrement
// auront à la fois des conséquences sur la vitesse de déplacement
// du point et sur la souplesse des changements de direction

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();

  // Ajustement du noiseDetail() conseillé
  noiseDetail(4, 0.54321);
  
  // Décalage des horloges, pour éviter des déplacements contraints sur une diagonale
  timeSteps2 = timeSteps1 + 100000;
  // remarque : impossible ici d’utiliser noiseSeed() car les deux noise()
  // seraient affectés de la même manière.
  

  // Initialisation de la position de référence : le centre
  posInitX = width/2;
  posInitY = height/2;
}

void draw() {
  //background(0);

  // Chaque axe dispose de son repère temporel (timesteps),
  // de son échelle temporelle (noiseScale) et de son amplitude
  deltaX = ((noise(timeSteps1*noiseScale1))*amplitude1)-(amplitude1*0.5);
  deltaX = constrain(deltaX, -(amplitude1*0.5), (amplitude1*0.5)); // on ne dépassera pas les limites

  deltaY = ((noise(timeSteps2*noiseScale2))*amplitude2)-(amplitude2*0.5);
  deltaY = constrain(deltaY, -(amplitude2*0.5), (amplitude2*0.5)); // on ne dépassera pas les limites

  ellipse(posInitX+deltaX, posInitY+deltaY, 5, 5);
  
  // autre visualisation
  pushStyle();
  noFill();
  stroke(255, 0, 0, 5);
  line(posInitX+deltaX, posInitY+deltaY, posInitX, height);
  popStyle();

  // Progression des horloges
  timeSteps1+=timeIncrement1;
  timeSteps2+=timeIncrement2;
}

void mousePressed() {
  background(0);
}
