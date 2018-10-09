// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// dimanche, 7 octobre 2018

PShape s, tes;
float scaleObj = 300;

void setup() {
  size(600, 600, P3D);
  background(0);
  fill(255);
  noStroke();
  smooth(16);

  s = loadShape("oeuf_quadball.obj");
  //s = loadShape("oeuf_tesselation.obj");
  tes = s.getTessellation();
}

void draw() {
  background(0);
  directionalLight(150, 200, 240, 1, 1, -1);
  directionalLight(180, 10, 100, -1, -1, 0.5);

  translate(width/2, height/2, -200);
  
  pushMatrix();
  
  rotateY(millis()*0.0001%TWO_PI);
  scale(-1, -1, 1);


  stroke(255, 60);
  strokeWeight(1);
  fill(255);
  //noFill();

  beginShape(TRIANGLES);
  //beginShape(QUADS);
  //beginShape(LINES);
  for (int j = 0; j < tes.getVertexCount(); j++) {
    if(j%(int(map(mouseX,0,width,1,48)))==0) {
    PVector v = tes.getVertex(j);
    vertex(v.x*scaleObj, v.y*scaleObj, v.z*scaleObj);
    }
  }
  endShape();
  popMatrix();

  //fill(255);
  //noStroke();
  //scale(scaleObj);
  //shape(s);
}
