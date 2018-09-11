// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 12 septembre 2017

// On peut bouger la souris de gauche à droite pour modifier
// l'effet de bruit numérique

// Appuyer sur la barre d’espace pour effectuer la sauvegarde
// d’un rendu sur le champ, en format JPEG

PImage img;
color c;
int a, r, v, b;
boolean onSauve = false;

void setup() {
  //img = loadImage("maeda_portrait_200px.jpg");
  img = loadImage("maeda_portrait_600px.jpg");
  //img = loadImage("maeda_portrait_1200px.jpg");

  // La taille du sketch s’ajuste à l’image chargée en mémoire
  surface.setSize(img.width, img.height);

  // Chargement des pixels de l’image, en prévision de la lecture
  // Comme il n’y aura pas de changement apporté à ce tableau de données,
  // on peut en faire l’appel une seule fois, donc dans le setup().
  img.loadPixels();
}


void draw() {
  background(0);
  // Chargement des pixels du sketch, en prévision de la l’écriture
  loadPixels();

  // Boucle itérative, pour circuler dans tous les pixels du tableau pixels[] de notre image
  for (int i = 0; i < img.pixels.length; i++) {
    // 1- On lit tour à tour la couleur de chacun des pixels de l'image
    c = img.pixels[i];

    // 2- On décompose la donnée couleur pour en extraire les valeurs ARGB
    // Pour le rouge :
    r = (c >> 16) & 0xFF;
    // Pour le vert :
    v = (c >> 8) & 0xFF;
    // Pour le bleu :
    b = c & 0xFF;
    // Pour l’alpha :
    a = (c >> 24) & 0xFF;

    // 3- On effectue un traitement ou des calculs sur les entiers des composantes de couleur
    // Désolé, M. John Maeda, pour le "look" extraterrestre!
    // Les options à cette étape sont infinies…

    // Interversion canaux couleurs (vert devient rouge)
    // et effet d’animation sur l’inversion du canal vert
    r = (frameCount%256)-v;
    // Récupération du canal rouge d’origine, qui devient le vert
    v = (c >> 16) & 0xFF;
    // Canal bleu modifié par une donnée aléatoire
    b = floor(random(mouseX));

    // 4- On applique les nouvelles valeurs ARGB au pixels du sketch
    pixels[i] = 0xFF000000 | (r << 16) | (v << 8) | b;
  }
  // Mise à jour des pixels du sketch
  updatePixels();


  // Sauvegarde potentiel de l’image
  // Advenant que la barre d’espace ait été enfoncée
  if (onSauve) {
    save("rendu_psychedelique.jpg");
    onSauve = false;
  }
}

// Fonction de détection du clavier
void keyPressed() {
  if (key == ' ') {
    onSauve = true;
  }
}