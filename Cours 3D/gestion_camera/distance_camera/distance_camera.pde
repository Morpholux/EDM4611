// Pour connaître la distance dans l'axe Z
// du "Near Clipping Plane" de la caméra par défaut
// 468 en P3D



void setup() {
  size(600, 600, P3D);
  background(0);
  noStroke();
  fill(255);
  rectMode(CENTER);
}

void draw() {
  background(0);

  //beginCamera();
  //camera();
  //translate(0,0,-100);
  //rotateY(-PI/12);
  //endCamera();

  translate(width/2, height/2, mouseX);


  rect(0, 0, 100, 100);
  println(mouseX);
}