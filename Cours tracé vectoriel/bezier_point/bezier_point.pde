noFill();
//bezier(85, 20, 10, 10, 90, 90, 15, 80);
fill(255);
int steps = 100;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = bezierPoint(85, 10, 90, 15, t);
  float y = bezierPoint(20, 10, 90, 80, t);
  point(x, y);
}
