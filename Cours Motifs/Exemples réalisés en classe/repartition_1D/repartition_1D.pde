// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 14 septembre 2021

int taille, tailleInitiale;
int pas;
int nbItems;

void setup() {
  size(800, 800, FX2D);
  background(0);

  rectMode(CENTER);

  tailleInitiale = 200;
  taille = tailleInitiale;

  pas = int(taille*0.2);

  nbItems = 18;

  noLoop();
}

void draw() {
  background(0);

  pushStyle();

  stroke(255);
  fill(80, 80, 150, 100);

  for (int i = 0; i <nbItems; i++) {
    rect(taille + (i*pas), (height/2), taille, taille, taille*0.25); // 5e argument == rayon des coins
    taille *= 0.85; // régression de la taille dans la boucle
  }

  taille = tailleInitiale; // la variable «taille» est ramenée à sa valeur de départ

  popStyle();
  
  save("rendu.jpg");
}
