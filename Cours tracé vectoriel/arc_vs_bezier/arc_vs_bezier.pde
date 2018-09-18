// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0b6
// dimanche, 20 septembre 2015

float rayon = 200;

// formule permettant d’établir la distance d’un levier dans une figure circulaire
// voir http://pomax.github.io/bezierinfo/#circles_cubic
float fraction = 4*((sqrt(2)-1)/3.0);


void setup() {
  size(600, 600);
  background(0);
  noFill();
  println(fraction);
}

void draw() {
  background(0);
  stroke(255);
  arc(200, 400, rayon*2, rayon*2, PI+HALF_PI, TWO_PI);
  
  translate(-mouseX, 0);
  stroke(255,0,0);
  bezier(300,200,300+(rayon*fraction),200,500,400-(rayon*fraction),500,400);
}