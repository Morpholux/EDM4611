// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0b6
// mardi, 22 septembre 2015

int ax1, ay1, lx1, ly1, lx2, ly2, ax2, ay2;
void setup() {
  size(600, 600);
  background(0);
  noFill();
  stroke(255);
}

void draw() {
  background(0);
  
  ax1 = 100;
  ay1 = 100;
  lx1 = ax1+frameCount%400;
  ly1 = ay1;
  ax2 = 500;
  ay2 = 500;
  lx2 = ax2;
  ly2 = ay2-frameCount%400;
  
  bezier(ax1,ay1,lx1,ly1,lx2,ly2,ax2,ay2);
}