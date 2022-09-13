class Rect {
  int posx, posy;
  float w, h;
  
  Rect(int _posx, int _posy, float _w, float _h) {
    posx = _posx;
    posy = _posy;
    w = _w;
    h = _h;
  }
  
  void display() {
    fill(40, 140, 180, 100);
    stroke(255);
    strokeWeight(2);
    rect(posx, posy, w, h);
  }
  
}
