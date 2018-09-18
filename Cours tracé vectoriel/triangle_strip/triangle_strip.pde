// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 2.2.1
// jeudi, 11 septembre 2014

int posY, sens;

void setup() {
  size(600, 600, FX2D);
  // FX2D > mode de rendu superbe pour traduire le vectoriel
  noLoop();
}

void draw() {
  background(0);

  stroke(255, 150);
  strokeJoin(ROUND);

  for (int j = 0; j < 2; j++) {

    if (j==0) {
      fill(random(200, 255), 50, 150, 50);
      posY = 200;
      sens = 1;
      beginShape(TRIANGLE_STRIP);
    } else {
      fill(255, random(200, 255), 50, 50);
      posY = 400;
      sens = -1;
      beginShape(TRIANGLE_FAN);
    }

    //beginShape(TRIANGLES);
    //beginShape(TRIANGLE_STRIP);
    //beginShape(TRIANGLE_FAN);
    //beginShape(POINTS);
    //beginShape(LINES);
    //beginShape(QUADS);
    //beginShape(QUAD_STRIP);
    for (int i = 0; i<12; i++) {
      vertex(width/2+(map(i, 0, 11, -200, 200)), posY+(random(map(mouseY, 0, height, 50, 300)*sens))-(sens*100));
    }
    endShape();
  }
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}