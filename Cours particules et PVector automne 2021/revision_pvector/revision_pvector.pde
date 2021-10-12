// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// dimanche, 10 octobre 2021

Mobile m1;
PVector posInit;

void setup() {
  size(800, 800);
  background(0);
  fill(255);
  noStroke();

  translate(width/2, height/2);
  posInit = new PVector(0, 0);
  m1 = new Mobile(posInit);
}

void draw() {
  //background(0);

  //pushStyle();
  //fill(0,10);
  //noStroke();
  //rect(0,0,width,height);
  //popStyle();

  translate(width/2, height/2);

  // Bouger et afficher objet
  m1.update();
  //println(m1.loc.mag());
  m1.display();
}

void mousePressed() {
  //background(0);
  m1 = new Mobile(posInit);
}
