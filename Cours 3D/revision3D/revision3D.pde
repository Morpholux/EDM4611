void setup() {
  size(600,600,P3D);
  background(0);
  noStroke();
  fill(255);
}

void draw() {
  background(0);

  noStroke();
  fill(255);
  
  translate(width/2, height/2, 0);
  
  // Le positionnement des instructions d'éclairage avant ou après les transformateurs de rotation
// ont un impact important sur la perception de la scène.
  directionalLight(51, 102, 126, -1, 0, -1);
  directionalLight(200, 52, 14, 1, 1, -1);
  
  rotateX(radians(map(mouseY,0,height, 180, -180)));
  rotateY(radians(map(mouseX,0,width, -180, 180)));


  
  sphereDetail(60);
  sphere(130);
  box(200);
  
  stroke(255, 50);
  strokeWeight(2);
  noFill();
  pushMatrix();
  rotateX(radians((millis()/50.0)%360));
  box(210);
  popMatrix();
  
  translate(200,0,0);
  box(50);
}
