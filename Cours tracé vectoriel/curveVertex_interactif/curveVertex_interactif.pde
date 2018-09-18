// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0b6
// mardi, 22 septembre 2015


int ax1, ay1, lx1, ly1, lx2, ly2, ax2, ay2;
float delta, facteur;

void setup() {
  size(600, 600);
  background(0);
  noFill();
  stroke(255);
  //noLoop();
  facteur = 10.0;
}

void draw() {
  background(0);
  delta = (dist(mouseX,mouseY,width/2,height/2))*facteur;
  
  // Quadrant inférieur-gauche
  if ((mouseX < width/2)&&(mouseY > height/2)) {
    delta*=-1;
    // delta = delta * -1;
  } else if ((mouseX > width/2)&&(mouseY > height/2)) { // q inf droit
    delta*=0.25;
    // delta = delta * -1;
  }

  ax1 = 100;
  ay1 = 100;
  lx1 = ax1-floor(delta);
  ly1 = ay1;
  ax2 = 500;
  ay2 = 500;
  lx2 = 500;
  ly2 = ay2+floor(delta);

  //bezier(ax1,ay1,lx1,ly1,lx2,ly2,ax2,ay2);
  //curve(lx1,ly1,ax1,ay1,ax2,ay2,lx2,ly2);

  beginShape();
  curveVertex(lx1, ly1);
  curveVertex(ax1, ay1);
  // point additionnel
  curveVertex(width/2,height/2);
  curveVertex(ax2, ay2);
  curveVertex(lx2, ly2);
  endShape();
}