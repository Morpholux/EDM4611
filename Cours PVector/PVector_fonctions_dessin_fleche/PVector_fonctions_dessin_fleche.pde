PVector v1, v2, v3;
color rouge, vert, bleu;

void setup() {
  size(400, 400);
  background(255);
  v1 = new PVector();
  v2 = new PVector(100,-50,0);
  v3 = new PVector();
  rouge = color(255,0,0);
  vert = color(0,255,0);
  bleu = color(0,0,255);
}

void draw() {
  background(255);
  
  v1.set(mouseX, mouseY, 0);
  dessinFleche(v1, rouge);
  
  dessinFleche(v2, v1.x, v1.y, bleu);
  
  v3 = PVector.add(v1, v2);
  dessinFleche(v3, 0, 0, vert);
}