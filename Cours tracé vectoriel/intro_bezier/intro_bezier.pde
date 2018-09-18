// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 19 septembre 2017

float ax1, ay1, lx1, ly1, lx2, ly2, ax2, ay2;

void setup() {
  size(200, 200);
  background(0);
  noFill();
  stroke(255,10);
}

void draw() {
  //background(0);
  
  ax1 = 20;
  ay1 = 130;
  lx1 = mouseX;
  ly1 = mouseY;
  lx2 = lx1+50; // lx2 devient relatif à lx1
  ly2 = 60;
  ax2 = 180;
  ay2 = 140;
  
  bezier(ax1, ay1, lx1, ly1, lx2, ly2, ax2, ay2);
 
}