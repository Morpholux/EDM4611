// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.3
// mardi, 8 octobre 2019

PImage img;

void setup() {
  size(600, 600, P3D);
  background(0);
  fill(255);
  noStroke();
  img = loadImage("grille_points_medium.png");
}

void draw() {
  background(0);

  //hint(DISABLE_DEPTH_TEST);

  float s = map(mouseX, 0, width, 50, 200);

  translate(width/2, height/2, 0);
  //rotateY(radians(frameCount%360));





  noLights();

  pushMatrix();
  //translate(-(s/2), -(s/2), (s/2));
  //translate(-50/s*200, -50/s*200, 0/s*200);
  rotateY(radians(frameCount%360));
  rotateX(radians(frameCount%360));
  //rotateX(radians((frameCount*(1/3.0))%360));
  translate((s/2), (s/2), -(s/2));

  textureMode(NORMAL);
  beginShape(QUAD);
  texture(img);
  vertex(-150, -150, 0, 0, 0);
  vertex(150, -150, 0, 0, 1);
  vertex(150, 150, 0, 1, 1);
  vertex(-150, 150, 0, 1, 0);
  endShape();

  //lights();
  directionalLight(255, 0, 0, 1, 0, 0.5);
  directionalLight(0, 0, 255, -1, 0, -1);

  popMatrix();

  sphere(s);
  /*
  pushMatrix();
   rotateY(radians(frameCount%360));
   //float z = map(mouseX, 0, width, 0, 500);
   //translate(0,0,z);
   //println(z);
   
   
   //box(50);
   pushStyle();
   //strokeWeight(5);
   stroke(255, 0, 0);
   noFill();
   sphereDetail(3);
   sphere(50);
   popStyle();
   popMatrix();
   
   pushMatrix();
   //translate(0, -75, 0);
   rotateX(radians(frameCount%360));
   translate(0, 75, 0);
   
   rectMode(CENTER);
   rect(0, 0, 150, 150);
   popMatrix();
   
   */
}
