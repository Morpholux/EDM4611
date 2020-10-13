// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 13 octobre 2020

PVector pos, vel, acc;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  rectMode(CENTER);

  pos = new PVector(width/2, height/2);
  vel = new PVector(); // vélocité nulle au départ du sketch
  acc = new PVector(); // accélération nulle au départ du sketch
}

void draw() {
  background(0);

  /*
  // cas 1:
   // incrémentation du vecteur de position par la vélocité
   // vitesse constante si vel reste inchangé
   pos.add(vel);
   */


  // cas 2:
   // Incrémentations des deux vecteurs (pos et vel)
   // La vitesse est donc variable et subit une accélération
   vel.add(acc);
   // Ici, il est d’usage d’insérer une limitation, afin de s’assurer que vel ne dépasse une vitesse maximale
   vel.limit(10); // pas plus de 10 pixels par frame
   
   pos.add(vel);
 


  // option 1 : le mobile réapparaît lorsque qu’il sort de la zone du sketch
  //boucleTopologique();


  // option 2 : le mobile rebondi sur les bords du sketch (il faudrait soustraire la largeur du bloc pour améliorer l’illusion)
  rebond();

  rect(pos.x, pos.y, 20, 20);
}

// Pour continuer de suivre le déplacement de notre mobile
// lorsqu’il quitte la zone du sketch.
void boucleTopologique() {
  if (pos.x > width) {
    //pos.x = 0;
    pos.set(0, pos.y, 0);
  } else if (pos.x < 0) {
    pos.set(width, pos.y, 0);
  }

  if (pos.y > height) {
    //pos.y = 0;
    pos.set(pos.x, 0, 0);
  } else if (pos.y < 0) {
    pos.set(pos.x, height, 0);
  }
}

// fonction de rebond sur les limites du sketch
void rebond() {
  if (pos.x > width) {
    pos.set(width, pos.y, pos.z); // repositionner le mobile avant la limite décrite ci-dessus
    vel.set(vel.x * -1, vel.y, vel.z); // on inverse la vélocité sur un axe seulement

    // idée: perte d’énergie cinétique au contact des "murs"
    vel.mult(0.5);

    // vecteur d’accélération remis à jour en fonction du vecteur de vélocité modifié
    acc = vel.copy();
    acc.mult(0.02);
  } else if (pos.x < 0) {
    pos.set(0, pos.y, pos.z);
    vel.set(vel.x * -1, vel.y, vel.z);
    vel.mult(0.5);
    acc = vel.copy();
    acc.mult(0.02);
  }

  if (pos.y > height) {
    pos.set(pos.x, height, pos.z);
    vel.set(vel.x, vel.y * -1, vel.z);
    vel.mult(0.5);
    acc = vel.copy();
    acc.mult(0.02);
  } else if (pos.y < 0) {
    pos.set(pos.x, 0, pos.z);
    vel.set(vel.x, vel.y * -1, vel.z);
    vel.mult(0.5);
    acc = vel.copy();
    acc.mult(0.02);
  }
}


void mousePressed() {
  pos.set(mouseX, mouseY);

  // L’orientation de la vélocité est pigée au hasard
  vel = vel.random2D();
  //vel.mult(0.5); // on réduit un peu la magnitude, qui était de 1 dans ce cas-ci
  vel.mult(2); // ou on augmente un peu la magnitude

  // l’accélération est une force qui pointe dans la même direction que la vélocité
  // mais dont la magnitude ne vaut que 1%.
  acc = vel.copy();
  acc.mult(0.01);
}
