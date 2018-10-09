// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 2.0.3
// mercredi, 30 octobre 2013

// import java.util.*;

PImage logo;
float largeurLogo, hauteurLogo, bh, bd, bb, bg;
float coinHautGaucheX, coinHautGaucheY;
float coinHautDroitX, coinHautDroitY;
float coinBasDroitX, coinBasDroitY;
float coinBasGaucheX, coinBasGaucheY;
float distanceMinimaleContact = 50;
boolean coin1=false, coin2=false, coin3=false, coin4=false;
int nbCol = 100, nbRng = 100;

void setup() {
  size(1280, 720, P2D);
  largeurLogo = width * 0.75;
  hauteurLogo = largeurLogo * 0.40625;
  background(0);
  fill(255);
  noStroke();
  logo = loadImage("Logo_Fatboy_horizontal_sm.jpg");
  textureMode(NORMAL);

  bh = -hauteurLogo*0.5;
  bd = largeurLogo*0.5;
  bb = hauteurLogo*0.5;
  bg = -largeurLogo*0.5;

  coinHautGaucheX = bg;
  coinHautGaucheY = bh;
  coinHautDroitX = bd;
  coinHautDroitY = bh;
  coinBasDroitX = bd;
  coinBasDroitY = bb;
  coinBasGaucheX = bg;
  coinBasGaucheY = bb;
}

void draw() {
  background(0);

  if (coin1) {
    coinHautGaucheX = mouseX - width/2;
    coinHautGaucheY = mouseY - height/2;
  }
  if (coin2) {
    coinHautDroitX = mouseX - width/2;
    coinHautDroitY = mouseY - height/2;
  }
  if (coin3) {
    coinBasDroitX = mouseX - width/2;
    coinBasDroitY = mouseY - height/2;
  }
  if (coin4) {
    coinBasGaucheX = mouseX - width/2;
    coinBasGaucheY = mouseY - height/2;
  }

  translate(width/2, height/2);

  beginShape();
  for (int j =0; j <= nbRng; j++) {
    float interpRng = j/float(nbRng);
    pushMatrix();
    translate(0, interpRng*hauteurLogo);
    beginShape(QUAD_STRIP);
    texture(logo);
    for (int i =0; i <= nbCol; i++) {
      float interpCol = i/float(nbCol);
      vertex(lerp(coinHautGaucheX, coinHautDroitX, interpCol), lerp(coinHautGaucheY, coinHautDroitY, interpCol), interpCol, 0);
      vertex(lerp(coinBasGaucheX, coinBasDroitX, interpCol), lerp(coinBasGaucheY, coinBasDroitY, interpCol), interpCol, 1);
    }
    popMatrix();
  }
  endShape();
  endShape();
}

void mousePressed() {
  if (sourcePresCentreCible(mouseX, mouseY, coinHautGaucheX+width/2, coinHautGaucheY+height/2, distanceMinimaleContact)) {
    coin1 = true;
  } 
  else if (sourcePresCentreCible(mouseX, mouseY, coinHautDroitX+width/2, coinHautDroitY+height/2, distanceMinimaleContact)) {
    coin2 = true;
  } 
  else if (sourcePresCentreCible(mouseX, mouseY, coinBasDroitX+width/2, coinBasDroitY+height/2, distanceMinimaleContact)) {
    coin3 = true;
  } 
  else if (sourcePresCentreCible(mouseX, mouseY, coinBasGaucheX+width/2, coinBasGaucheY+height/2, distanceMinimaleContact)) {
    coin4 = true;
  }
}

void mouseReleased() {
  coin1 = false;
  coin2 = false;
  coin3 = false;
  coin4 = false;
}

// Fonction de vérification d’une distance minimale entre le curseur et l’objet
boolean sourcePresCentreCible(float posSourceX, float posSourceY, float posCibleX, float posCibleY, float distMinim) {
  if (dist(posSourceX, posSourceY, posCibleX, posCibleY) <= distMinim) {
    return true;
  } 
  else {
    return false;
  }
}

