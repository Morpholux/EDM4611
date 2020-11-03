// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// mardi, 11 octobre 2016

// Une fois la vue plein écran lancée, cliquez au moins une fois dans la scène,
// puis bouger la souris pour générer des segments additionnels.

ArrayList<Point>points = new ArrayList<Point>();
int nbPoints = 2;
PVector zVect;

void setup() {
  fullScreen(P3D);
  background(0);
  fill(255);
  stroke(255, 0, 0);
  strokeWeight(2);
  for (int i = 0; i < nbPoints; i++) {
    if (points.size()%2==0) {
      zVect = new PVector(0, 0, random(0.5, 4));
    }
    points.add(new Point(new PVector (random(50, width-50), random(50, height-50)), zVect));
  }
  noCursor();
}

void draw() {
  background(0);

  if (points.size() != 0) {
    if ((points.get(0).pos.z > 650)&&(points.size()>=2)) {
      if (points.size()%2==0) { // nombre pair de points
        points.remove(1);
        points.remove(0);
      }
    }
  }

  noStroke();
  for (int i = points.size()-1; i>=0; i--) {
    points.get(i).display();
  }


  for (int i = points.size()-1; i>=0; i--) {
    if (((i%2)==0)&&(i<points.size()-1)) {
      //if (((i%3)==0)&&(i<points.size()-2)) {
      stroke(255, 0, 0, map(points.get(i).pos.z, 0, 650, 255, 0));
      line(points.get(i).pos.x, points.get(i).pos.y, points.get(i).pos.z, points.get(i+1).pos.x, points.get(i+1).pos.y, points.get(i+1).pos.z);
      //line(points.get(i+1).pos.x, points.get(i+1).pos.y, points.get(i+2).pos.x, points.get(i+2).pos.y);
    }
  }

  for (int i = points.size()-1; i>=0; i--) {
    PVector vTemp = points.get(i).pos;
    vTemp.add(points.get(i).zoomIn);
    points.get(i).pos = vTemp.copy();
  }
}

void mouseMoved() {
  if (points.size()%2==0) {
    zVect = new PVector(0, 0, random(0.5, 4));
  }
  points.add(new Point(new PVector (mouseX+random(-80, 80), mouseY+random(-80, 80)), zVect));
}

class Point {
  PVector pos;
  PVector zoomIn;
  Point(PVector p, PVector z) {
    pos = p.copy();
    zoomIn = z.copy();
  }
  void display() {
    pushMatrix();
    translate(0, 0, pos.z+1);
    ellipse(pos.x, pos.y, 4, 4);
    popMatrix();
  }
}