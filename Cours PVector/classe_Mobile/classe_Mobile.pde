// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.1.1
// vendredi, 22 juillet 2016

ArrayList<Mobile> mobiles = new ArrayList<Mobile>();
int nbMob = 100;
float secteurAngle, axeCentral, taille, opaciteInit;
boolean onSauve = false;

void nouveauxMobiles() {
  secteurAngle = 300;
  axeCentral = 270;
  taille = 20;
  opaciteInit = 1.0;
  for (int i = 0; i < nbMob; i++) {
    mobiles.add(new Mobile(new PVector(width*0.5, height*0.5, 0), radians((axeCentral+random(secteurAngle))-secteurAngle*0.5), random(1, 3), random(0.005, 0.01), random(0.0005, 0.001), taille, opaciteInit));
  }
}

void setup() {
  size(1000, 1000);
  //pixelDensity(displayDensity());
  background(0);
  fill(255);
  noStroke();

  nouveauxMobiles();
}

void draw() {
  background(0);

  for (int i = mobiles.size()-1; i >=0; i--) {
    Mobile m = mobiles.get(i);
    if (m.existe == true) {
      m.update();
      m.display();
    } else {
      mobiles.remove(i);
    }
  }

  //if (frameCount%30 == 0) {
  //}

  //if (mobiles.size() == 0) {
  //  nouveauxMobiles();
  //}

  if (onSauve) {
    save("rendu.tga");
    exit();
  }

  //println(mobiles.size());
}

void mousePressed() {
  nouveauxMobiles();
}

void keyPressed() {
  //onSauve = true;
}