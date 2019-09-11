// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.3
// mardi, 10 septembre 2019

/*
Les pixels du sketch sont colorisés dans l’ordre de lecture gauche-droite haut-bas (boucle for),
en se référant à la palette limitée d’un fichier image. Ce dernier n’est pas affiché.
Il n’agit que comme référence, en fournissant au hasard les couleurs qui seront utilisées.
De plus, la commande de pige de couleur s’ammorce suivant une condition spécifique,
où l’on contrôle de façon semi-aléatoire la fréquence des changements.
*/

PImage palette;
int pigeIndex, modulo, probabilite;
color c;

void setup() {
  size(600, 600);
  palette = loadImage("palette.gif");
  background(0);
  palette.loadPixels();
  probabilite = 40000; // plus le nombre est grand, moins fréquents seront les changements
  // Si on veut un changement de couleur, le nombre ne devrait pas dépasser la résolution
  // du sketch et doit valoir au moins 1, car utilisé comme modulo
  probabilite = constrain(probabilite, 1, width*height);
  modulo = floor(random(1, probabilite));
  noLoop();
}

void draw() {
  background(0);

  loadPixels();
  for (int i = 0; i < width*height; i++) { // la boucle permet de couvrir toute la surface du sketch
    if ((i % modulo) == 0) { // si vrai, on change ponctuellement de couleur pour l'écriture
      modulo = floor(random(1, probabilite)); // on prépare la valeur pour la prochaine comparaison
      pigeIndex = floor(random(32)); // 32 pixels dans la palette.gif
      c = palette.pixels[pigeIndex]; // c devient une des 32 couleurs
    }
    pixels[i] = c; // on écrit des pixels d’une couleur en particulier
  }
  updatePixels();
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == ' ') {
    save("motif.jpg");
  }
}
