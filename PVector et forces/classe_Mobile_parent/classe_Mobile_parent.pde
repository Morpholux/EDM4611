// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.1.1
// vendredi, 22 juillet 2016

ArrayList<Mobile> mobiles = new ArrayList<Mobile>();
int nbMob = 100;
float secteurAngle, axeCentral, taille, opaciteInit;
boolean onSauve = false;
Mobile mobParent;

void nouveauxMobiles() {
  secteurAngle = 300;
  axeCentral = 270;
  taille = 3;
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

  mobParent = new Mobile(new PVector(width*0.5, height*0.5, 0), radians(270), 2, random(0.005, 0.01), random(0.005, 0.01), 20, 0.25);
}

void draw() {
  background(0);

  mobParent.update();
  mobParent.display();

  for (int i = mobiles.size()-1; i >=0; i--) {
    Mobile m = mobiles.get(i);
    if (m.existe == true) {
      // En indiquant un mobile comme argument dans la méthode update()
      // on contraint le présent mobile à suivre une référence
      m.update(mobParent); 
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