// déclaration variables globales
int ax = 90;
int ay = 450;
int bx = 500;
int by = 80;
int nbIntervalles = 4;
float fractionIntervalle = 1.0/float(nbIntervalles);
float delta;

// Setup
void setup() {
  size(600, 600);

  noLoop();
  //println(lerp(ax, bx, fractionIntervalle));
  //println(lerp(ay, by, fractionIntervalle));
}

// draw
void draw() {
  background(0);

  noFill();
  stroke(100);
  line(ax, ay, bx, by);

  noStroke();
  fill(255);
  circle(ax, ay, 10);
  ellipse(bx, by, 10, 10);

  fill(255, 0, 0);

  // On établit une distance maximale pour les déviations
  float potentielDeviation = fractionIntervalle * 0.25;

  // L’itération permet d’établir chacune des positions de nos subdivisions  
  for (int i = 1; i < nbIntervalles; i++) {

    // Le ratio cumulé de nos subdivisions : 1/4, 2/4, 3/4.
    float portionChemin = fractionIntervalle*i;

    // Décalage par rapport à position idéale d’une subdivision
    delta = random(-potentielDeviation, potentielDeviation);
    // Donc la première borne est située au quart du chemin à parcourir, plus ou moins une valeur d’écart unique à cette fraction.
    // Idem pour les bornes suivantes.
    portionChemin = portionChemin + delta;

    float posx = lerp(ax, bx, portionChemin);
    float posy = lerp(ay, by, portionChemin);
    circle(posx, posy, 10);
  }
}

void mousePressed() {
  redraw();
}
