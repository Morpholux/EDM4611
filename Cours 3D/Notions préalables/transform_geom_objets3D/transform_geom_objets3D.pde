
int tailleRect = 40;
PImage monJpg;

void setup() {
  size(1200,600,P3D); // Le smooth ne peut s'appliquer avec le mode P3D. Par d�faut, le bord des images sera donc cr�nel�.
  background(255);
  fill(127);
  noStroke();
  smooth(8);
  //noLoop();
  frameRate(1);
  monJpg = loadImage("kraftwerk.jpg");
}

void draw() {
  background(255);
  translate(width/2, height/2, 0);
  for (int i=-3; i<4; i++) { // la boucle donnera les valeurs de i suivantes : -3, -2, -1, 0, 1, 2, 3
    pushMatrix();
    // les transformateurs geometriques sont a l'interieur du pushMatrix()/popMatrix()
    // choisir un des translate suivants :
    translate(i*50, 0, 400); // nouvelles positions des reperes, donc position du prochain objet
    //translate(i*50, 0, random(0,400)); // si on veut faire varier la profondeur
    
    // rotation sur les trois axes
    rotateX(radians(random(-45,45)));
    rotateY(radians(random(-45,45)));
    rotateZ(radians(random(-45,45)));
    
    // dessin de l'image:
    // les parametres disponibles grace a imageMode(CORNER) permette de centrer l'image en fonction du nouveau point de reference
    imageMode(CORNER);
    image(monJpg,0-(tailleRect/2),0-(tailleRect/2),tailleRect,tailleRect);
    popMatrix();
  }
}
