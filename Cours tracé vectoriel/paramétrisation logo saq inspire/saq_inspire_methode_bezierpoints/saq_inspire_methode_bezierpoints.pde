// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 19 septembre 2017

// Reproduction Logo SAQ Inspire

float rayon = 200;
float centrex, centrey;

// Formule permettant d’établir la distance d’un levier dans une figure circulaire
// voir http://pomax.github.io/bezierinfo/#circles_cubic
float fraction = 4*((sqrt(2)-1)/3.0);


void setup() {
  size(600, 600);
  //size(600, 600, FX2D);
  background(0);

  noStroke();
  centrex = width/2;
  centrey = height/2;
  
  noLoop();

  // Valeurs des couleurs originales
  // turquoise: fill(99, 191, 179);
  // bourgogne: fill(116, 25, 68);

  println(fraction);
}

void draw() {
  background(255);

  pushMatrix();
  translate(centrex, centrey-70);
  scale(0.75);
  fill(99, 25, 68); // quantité de rouge correspondant au turquoise 

  beginShape();
  vertex(0-rayon, 0);
  bezierVertex(0-rayon, 0-(rayon*fraction), 0-(rayon*fraction), 0-rayon, 0, 0-rayon);
  bezierVertex(0+(rayon*fraction), 0-rayon, 0+rayon, 0-(rayon*fraction), 0+rayon, 0);
  bezierVertex(0+rayon, 0+(rayon*fraction), 0+20, (2*rayon)-80, 0, 400);
  //bezierVertex(0-20, (2*rayon)-80, 0-rayon, 0+(rayon*fraction), 0-rayon, 0);
  // Le dernier segment de courbe est remplacé par une suite de vertex qui sont reliés par des droites
  // Plus le nombre de vertex est grand, plus le contour s’apparente à une courbe
  int steps = 40;
  for (int i = 0; i <= steps; i++) {
    float t = i / float(steps);
    float x = bezierPoint(0, 0-20, 0-rayon, 0-rayon, t);
    float y = bezierPoint(400, (2*rayon)-80, 0+(rayon*fraction), 0, t);
    vertex(x, y);
    //ellipse(x,y,10 ,10); // si l’on veut voir les points
  }
  endShape(CLOSE);
  popMatrix();

  // Filtrage de la portion supérieure pour obtenir le turquoise
  pushMatrix();
  translate(centrex, centrey);
  pushStyle(); // BlendMode contraint à la forme ci-dessus
  blendMode(ADD);
  // recette custom, pour obtenir un turquoise après blend mode à ADD
  fill(0, 166, 111);
  beginShape(QUAD);
  vertex(0-(width/2), 0+200);
  vertex((width/2), 0-400);
  vertex(width/2, 0-height/2);
  vertex(0-(width/2), 0-height/2);
  endShape();
  popStyle();
  popMatrix();

  // Ajustement de la couleur bourgogne dans la portion inférieure
  pushMatrix();
  translate(centrex, centrey);
  pushStyle();
  blendMode(ADD);
  // recette custom, pour obtenir un bourgogne après blend mode à ADD
  fill(17, 0, 0); // On ajoute la différence de rouge manquante entre les deux recettes de couleurs
  beginShape(QUAD);
  vertex(0-(width/2), 0+200);
  vertex((width/2), 0-400);
  vertex(width/2, 0+height/2);
  vertex(0-(width/2), 0+height/2);
  endShape();
  popStyle();
  popMatrix();
}