float increment = 0;
int resolution = 20;

void setup() {
  size(600, 600, P3D);
  background(0);
  
  //noStroke();
  fill(55,150,250);
  
  
  stroke(255);
  //noFill();
}

void draw() {
  background(0);
  // Éclairage
  lights();
  directionalLight(255,255,100,0,-1,0);
  directionalLight(255,100,150,0,1,0);
  
  translate(width/2, height/2, -300);
  rotateX(millis()*0.00025);

  


  // La surface plane en mouvement
  beginShape(TRIANGLE_STRIP);
  for (int x = -400; x < 400; x+=resolution) {
    vertex(x, -200-(30*cos(increment*0.002+(millis()*0.002))), -20*(cos(increment*0.04+(millis()*0.005))));
    vertex(x+(resolution/2), 200-(20*sin(increment*0.007+(millis()*0.002))), 30*(sin(increment*0.04+(millis()*0.005))));
    increment += 4;
  }
  endShape();
  increment = 0;
}