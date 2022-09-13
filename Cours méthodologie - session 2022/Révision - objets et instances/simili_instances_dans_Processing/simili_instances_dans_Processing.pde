// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// jeudi, 1 septembre 2022

ArrayList<Rect> rects = new ArrayList<Rect>();
int nbObjets = 50;

void setup() {
  size(1024, 1024);
  // surface.setSize(img.width, img.height);
  // pixelDensity(displayDensity());
  background(0);
  fill(255);
  noStroke();

  rectMode(CENTER);

  noLoop();
}

void draw() {
  background(0);
  translate(width/2, height/2);

  for (int i = 0; i < nbObjets; i++) {
    int tempx = int(random(-width/2, width/2));
    int tempy = int(random(-width/2, width/2));
    float tempw = random(10, 500);
    float temph = random(10, 500);
    rects.add(new Rect(tempx, tempy, tempw, temph));
  }

  for (int i = 0; i < rects.size(); i++) {
    Rect r = rects.get(i);
    r.display();
  }
  filter(ADD);
  
  save("render.jpg");
}

void mousePressed() {
  rects.clear();
  redraw();
}
