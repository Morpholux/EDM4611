// déclaration variables globales
int ax = 90;
int ay = 450;
int bx = 500;
int by = 80;
int nbIntervalles = 6;
float fractionIntervalle = 1.0/float(nbIntervalles);
float delta;

boolean onSauve = false;
int compteur = 1;

// Setup
void setup() {
  size(600, 600);

  //noLoop();
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
  float potentielDeviation = fractionIntervalle * 0.25;

  for (int i = 1; i < nbIntervalles; i++) {

    delta = random(-potentielDeviation, potentielDeviation);
    float portionChemin = fractionIntervalle*i;
    portionChemin = portionChemin + delta;

    float posx = lerp(ax, bx, portionChemin);
    float posy = lerp(ay, by, portionChemin);

    circle(posx, posy, 10);
  }

  if (onSauve) {
    save("intervalles_choix_"+str(compteur)+".jpg");
    compteur++;
    onSauve = false;
  }
}

void mousePressed() {
  onSauve =  true;
  //noLoop();
}

void mouseReleased() {
  loop();
}
