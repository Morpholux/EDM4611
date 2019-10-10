class Chaine {
  // Variables membres
  ArrayList <Maillon> Maillons = new ArrayList<Maillon>();
  int nbMaillons, idMaillon, delaiEntreCreationMaillon;
  PVector locChaine = new PVector();
  PVector velChaine;

  // Constructeur
  Chaine(PVector _lc, int _nm, int _decm) {
    locChaine.set(_lc);
    velChaine = PVector.random2D();
    velChaine.mult(4); // Vitesse initiale des maillons
    nbMaillons = _nm;
    delaiEntreCreationMaillon = _decm;
    idMaillon = 0;
  }

  void update() {
    // On remplit progressivement le ArrayList dans l’instance de la classe Chaine
    if (Maillons.size() <= nbMaillons) {
      // On ne crée pas nécessairement de nouveaux maillons à chaque frame
      // Cette condition permet de différer le moment où le maillon sera créé
      if ((frameCount % delaiEntreCreationMaillon) == 0) {
        // Ajout d’un maillon
        // Quatre arguments:
        // point de départ de la chaine
        // vitesse de déplacement des maillons
        // identifiant de chaque maillon
        // nombre de maillons dans la chaine
        Maillons.add(new Maillon(locChaine, velChaine, idMaillon, nbMaillons));
        idMaillon++; // Prochain maillon aura un ID supérieur
        //println(Maillons.size());
      }
    }
  }

  void display() {
    // On dessine tous les Maillons au fur et à mesure de l'ajout dans le Chaine
    for (int i = Maillons.size()-1; i >= 0; i--) {
      Maillons.get(i).update();
      Maillons.get(i).display();
    }
  }
}
