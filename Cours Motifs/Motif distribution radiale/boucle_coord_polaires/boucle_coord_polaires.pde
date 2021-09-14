// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 27 janvier 2020

int nbSteps = 180;
float angleSteps;

void setup() {
  size(800, 800);
  background(0);


  angleSteps = TWO_PI/float(nbSteps); // 360 degrés, en radians fait 2 * PI
}

void draw() {
  background(0);
  translate(width/2, height/2); // les coordonnées d’origine (0,0) sont désormais centrées

  fill(255);
  noStroke();
  for (int i = 0; i < nbSteps; i++) {
    pushMatrix(); // Il faut éviter le cumul des transformations
    
    rotate(i * angleSteps); // rotation en premier
    translate(200, 0); // ensuite, translation

    if (i % 2 == 0) {
      triangle(0, -1, 0, 1, 100, 0);
    } else {
      quad(0, -4, 0, 4, 10, 1, 10, -1);
    }
    popMatrix(); // Revient aux transformations précédant le pushMatrix()
  }

  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(0, 0, 400, 400);
}
