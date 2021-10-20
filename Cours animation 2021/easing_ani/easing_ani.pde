// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 18 octobre 2021

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

float x, y;
PVector pos = new PVector();

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  
  x = width/2;
  y = height/2;
  
  pos.set(width/2, height/2);
  
  // you have to call always Ani.init() first!
  Ani.init(this);
}

void draw() {
  background(0);
  //ellipse(x, y, 120, 120);
  ellipse(pos.x, pos.y, 120, 120);
}

void mouseReleased() {
    //Ani.to(this, 1.0, "x", mouseX, Ani.BOUNCE_OUT);
    //Ani.to(this, 1.0, "y", mouseY, Ani.BOUNCE_OUT);
    
    // Si "variable" de type PVector, premier argument est le nom de l’objet:
    Ani.to(pos, 1.0, "x", mouseX, Ani.BOUNCE_OUT);
    Ani.to(pos, 1.0, "y", mouseY, Ani.BOUNCE_OUT);
}
