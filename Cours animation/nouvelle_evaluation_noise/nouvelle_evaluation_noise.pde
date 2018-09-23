// Utilisation de la commande noise()
// Usage de base, avec variations sur une seule dimension

/* Note :
 // Correction d’un ancien sketch, où je réalisais une incrémentation du temps
 // à l’aide d’un float, ce qui entrainait des erreurs d’arrondissement et des problèmes
 // observés dans l’étude des «limites de la commande noise».
 // Il faut plutôt incrémenter l’horloge par des entiers (variable timeSteps de type int
 // et commande timeSteps++ par incrément de 1),
 // puis fractionner ce compteur à l’aide d’une valeur float (variable noiseScale).
 */

// Variables essentielles
int timeSteps = 0; // privilégier le format de type entier
float noiseScale = 1.0/100.0; // plus la fraction est petite, plus l’évolution sera lente
float amplitude =600; // servira à faire le mappage des valeurs (0-1) vers la nouvelle échelle

// Variables destinées à l’affichage des points
float deltaX = 0, posInit;
int nbIterations = 1; // nombre de fois que l’on effectue l’évaluation avant 


void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  noFill();
  noLoop();

  // Optionnel :
  // Si l’on veut que le parcours erratique soit identique à chaque compilation
  // noiseSeed(0);
  // Si l’on veut s’assurer d’un nouveau parcours à chaque démarrage du sketch :
  noiseSeed(System.currentTimeMillis());

  // Fortement conseillé :
  // L’état du NoiseDetail() par défaut tend à retourner des valeurs qui seront en moyenne décentrées (< 0.5)
  // Les arguments 4 et 0.54321 permettent de recentrer les valeurs du noise et de les maintenir à l’intérieur des limites 0,1
  noiseDetail(4, 0.54321); // Valeur par défaut : (4, 0.5)
  
  posInit = width/2;
}

void draw() {
  //background(0);

  // Effet de trace partielle (avec effacement progressif dans le temps)
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);


  // La boucle permet de simuler l’évolution de la valeur obtenue par le noise,
  // et de visualiser ces changements en laissant une trace verticale
  noFill();
  stroke(255);
  for (int y = 0; y < height; y++) {
    for (int j = 0; j < nbIterations; j++) {
      // Ci-dessous, les deux étapes proposées pour "bien" formater
      // la valeur obtenue par la commande noise()
      deltaX = ((noise(timeSteps*noiseScale))*amplitude)-(amplitude*0.5);
      deltaX = constrain(deltaX, -(amplitude*0.5), (amplitude*0.5)); // on ne dépassera pas les limites
      point(posInit+deltaX, y);
      timeSteps++;
    }
  }

  // Repère vertical au centre du sketch
  stroke(255, 0, 0);
  line(posInit, 0, posInit, height);


  // Pour fixer le nombre d’itérations qui seront complétées
  // *0 implique un seul passage, *1, deux itérations, etc.
  //if (timeSteps > (height*nbIterations)*0) {
  //  timeSteps = 0;
  //  noLoop();
  //}
}

void mousePressed() {
  println(timeSteps);
  redraw();
}
