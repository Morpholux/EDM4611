// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// samedi, 29 septembre 2018

// Version simplifiée, avec positionnement des lignes de façon traditionnelle,
// sans passer par des PVector.

// Règles:
// - Plus les lignes sont longues, plus elles sont épaisses et sombres.
// - Ces dernières disparaissent plus rapidement que les petites lignes.
// - Dès qu’une ligne disparaît, une autre est créée, avec le même identifiant.

ArrayList<Ligne> collectionLignes = new ArrayList<Ligne>();
int nbLignes = 5;
int zoneDessin = 500, marge;

void setup() {
  size(600, 600); // Calculs seront plus simples avec un sketch carré
  marge = floor((width-zoneDessin)*0.5);

  for (int i = 0; i < nbLignes; i++) {
    float tx1Temp = random(marge, marge+zoneDessin);
    float ty1Temp = random(marge, marge+zoneDessin);
    float tx2Temp = random(marge, marge+zoneDessin);
    float ty2Temp = random(marge, marge+zoneDessin);
    int identifiant = i;
    int posLignee = 0; // première génération
    collectionLignes.add(new Ligne(tx1Temp, ty1Temp, tx2Temp, ty2Temp, identifiant, posLignee));
  }
}

void draw() {
  background(0);

  // Boucle for() avec itération à reculons (i--)
  // Forme à privilégier dès que l’on supprime dynamiquement des éléments de la liste.
  // Valeur de départ à collectionLignes.size()-1
  // Valeur d’arrivée à >= 0
  for (int i = collectionLignes.size()-1; i >= 0; i--) {
    ((Ligne)collectionLignes.get(i)).update();
    ((Ligne)collectionLignes.get(i)).display();
  }
}

void mousePressed() {
  // Dans le style «Enhanced loop» :
  for (Ligne ligne : collectionLignes) { // nom classe, nom arbitraire pour instance temporaire, nom ArrayList
    println("Ligne #"+ligne.id+" gen : "+ligne.generation+" : "+ligne.longueur);
  }
  println();
}
