// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0b5
// mercredi, 9 septembre 2015

// Une manière "tordue" de fixer la valeur d’une donnée couleur,
// en construisant une chaine aléatoire de 24 caractères,
// composée de 1 ou de 0, suivant une pige de type pile ou face.

boolean pigeBinaire;
String symbole, pseudoOctet = "", pseudoCouleur = "";
color c;

void setup() {
  size(100, 100);
  background(0);
  noStroke();
  noLoop();
}

void draw() {
  background(0);

  for (int j = 0; j < 3; j++) { // 1x pour le rouge, 1x pour le vert, 1x pour le bleu
    for (int i = 0; i < 8; i++) { // création d’un pseudo octet (8 symboles 0 ou 1)
      pigeBinaire = boolean(floor(random(2)));
      symbole = str(binary(byte(pigeBinaire)).charAt(7));
      pseudoOctet += symbole;
    }
    pseudoCouleur += pseudoOctet;
    // il faut vider la variable avant de créer la prochaine composante couleur
    pseudoOctet = "";
  }

  // Autre option plus synthétique:
  //while (pseudoCouleur.length() <= 24) {
  //  pigeBinaire = boolean(floor(random(2)));
  //  symbole = str(binary(byte(pigeBinaire)).charAt(7));
  //  pseudoCouleur += symbole;
  //}

  println(pseudoCouleur);

  // Il faut maintenant faire un peu de pirouettes :
  // Seule façon, dans les circonstances, de compléter la donnée couleur avec l’information de transparence.
  // Ici, l’alpha sera opaque à 100% (FF), et combiné à la «couleur» par un opérateur logique (|).
  c = color(0xFF000000 | unbinary(pseudoCouleur));
  println(binary(c));
  println((int)c);

  fill(c);
  rect(20, 20, width-40, height-40);

  // On nettoie (vide) les variables
  pseudoCouleur = "";
  pseudoOctet = "";
  println();
}

void mousePressed() {
  redraw();
}