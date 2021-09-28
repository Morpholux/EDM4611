// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 28 septembre 2021

int tg = 100; // taille grille
float r1, r2;
float ecart = 50;

void setup() {
  size(600, 600);
  background(0);
  noFill();
  stroke(255);
  //strokeWeight(10);
  //strokeCap(ROUND);
  //strokeJoin(ROUND);

  shapeMode(CENTER);

  noLoop();
}

void draw() {
  background(0);
  translate(width/2, height*0.5);

  //monQuad();


  //// type bezier
  //beginShape();
  //vertex(-tg, tg); // premier ancrage
  //bezierVertex(-tg, -tg, tg, tg, tg, -tg); // premier et second leviers et second ancrage // lx1, ly1, lx2, ly2, ax2, ay2
  //endShape();

  // type curve
  //curveTightness(0.5);
  //beginShape();
  //curveVertex(-tg, tg+1000); // premier levier
  //curveVertex(-tg, tg); // premier ancrage
  //curveVertex(tg, -tg); // second ancrage
  //curveVertex(tg, -tg-1000); // second levier
  //endShape();


  // déposer des objets le long du chemin courbe
  int nbPas = 100;
  for (int i = 0; i <= nbPas; i++) {
    float t = i / float(nbPas);
    float x = curvePoint(-tg, -tg, tg, tg, t);
    float y = curvePoint(tg+1000, tg, -tg, -tg-1000, t);
    ellipse(x, y, 10, 10);
  }
}

void monQuad() {

  beginShape();
  r1 = random(-ecart, ecart);
  r2 = random(-ecart, ecart);
  vertex(-tg + r1, -tg + r2); // premier vertex
  vertex(tg, -tg);
  vertex(tg, tg);
  vertex(-tg, tg);
  //vertex(-tg, -tg); // dernier vertex même que premier
  endShape(CLOSE);
}
