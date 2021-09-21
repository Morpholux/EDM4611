// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0b6
// samedi, 26 septembre 2015

// Pige sans répétition. Toutefois, l’historique ne dépasse pas une pige.

//int [] possibilites = {100, 200, 300, 400, 500};
String [] possibilites = {"Pierre", "Jean", "Jacques"};

int pige, pigePrecedente;
PFont police;
boolean flashRouge = false;

void setup() {
  size(200, 200);
  background(0);
  fill(255);
  noStroke();
  police = loadFont("Dax-Light-36.vlw");
  textAlign(LEFT);
  textFont(police, 36);

  pige = floor(random(0, possibilites.length));
  pigePrecedente = -1;

  rectMode(CENTER);
}

void draw() {

  if (flashRouge) {
    background(255, 0, 0);
  } else {
    background(0);
  }

  text(possibilites[pige], width/2-80, (height/2)+10);

  pushStyle();
  fill(100);
  textSize(18);
  if (pigePrecedente != -1) { // on affiche les piges précédentes après la première relance
    text(possibilites[pigePrecedente], width/2-80, (height/2)+80);
  }
  popStyle();

  pushStyle();
  fill(200, 150, 0);
  rect(2+map(pige, 0, possibilites.length-1, 0, 196), 0, 4, 100);
  popStyle();

  flashRouge = false;
}

void mousePressed() {
  pigePrecedente = pige; // construction de l’historique de piges (un seul événement)
  // Nouvelle pige
  pige = floor(random(0, possibilites.length));

  if (pige == pigePrecedente) println(); // simplement pour clarifier dans la console

  // Pour s’assurer d’une pige sans répétition :
  while (pigePrecedente == pige) {
    println("On a pigé le même numéro que le précédent, soit le "+pige);
    pige = floor(random(0, possibilites.length));
  }

  // OK au marqueur visuel
  flashRouge = true;
}