// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.3
// mardi, 24 septembre 2019

//Ligne l1, l2;
ArrayList<Ligne> Lignes = new ArrayList<Ligne>();
int nbLignes;

void setup() {
  size(600, 600);
  background(0);

  nbLignes = 100;
  for (int i = 0; i <nbLignes; i++) {
    // Sur deux lignes de code
    //Ligne lTemp = new Ligne(width-i, height);
    //Lignes.add(lTemp);

    // Sur une seule ligne de code
    Lignes.add(new Ligne(width-(i*6), height));
  }

  //println(Lignes.size());
  //println(Lignes.get(49).p2x);
}

void draw() {
  background(0);
  // boucle itérative inversée, pour éviter le flickering
  for (int i = Lignes.size()-1; i > 0; i--) {
    ((Ligne)Lignes.get(i)).update();
    ((Ligne)Lignes.get(i)).display();
  }
}
