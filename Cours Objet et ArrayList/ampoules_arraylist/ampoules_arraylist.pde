// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// mardi, 2 octobre 2018

ArrayList<Ampoule> ampoules = new ArrayList<Ampoule>();


void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);


  //if (ampoules.size()>0) {

  //  //println(ampoules.get(0).life);
  //}
  
    

  // faire l’itération à rebours
  for (int i = ampoules.size()-1; i >= 0; i--) {
    ampoules.get(i).update();
    ampoules.get(i).display();
  }
}

void mousePressed() {
  //Ampoule ampTemp = new Ampoule(mouseX, mouseY, 200+floor(random(101)));
  //ampoules.add(ampTemp);
  
  // posx, posy, life, id
  ampoules.add(new Ampoule(mouseX, mouseY, 200+floor(random(101)), millis()));

  // Enhanced loop;
  for (Ampoule a : ampoules) {
    a.alpha = 255;
    //println(a.id);
  }
  //println();
}

void mouseReleased() {
  //println(ampoules.size());
}
