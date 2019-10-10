class Chapelet {
  ArrayList <Mobile> mobiles = new ArrayList<Mobile>();
  int nbMobiles;
  int idMobile;
  int delaiEntreCreationMobile;
  PVector locChapelet = new PVector();
  PVector velChapelet;

  // Constructeur
  Chapelet(PVector _lc, int _nm, int _decm) {
    locChapelet.set(_lc);
    velChapelet = PVector.random2D();
    velChapelet.z = 1; //les mobiles se déplacent vers l’avant
    velChapelet.mult(2); // Vitesse initiale des mobiles
    

    nbMobiles = _nm;
    delaiEntreCreationMobile = _decm;
    idMobile = 0;
  }

  void update() {

    // On remplit progressivement le ArrayList dans l’instance de la classe Chapelet
    if (mobiles.size() <= nbMobiles) {
      // On ne crée pas nécessairement de nouveaux mobiles à chaque frame
      if ((frameCount % delaiEntreCreationMobile) == 0) {
        // Ajout d’un mobile
        mobiles.add(new Mobile(locChapelet, velChapelet, idMobile, nbMobiles));
        idMobile++; // Prochain segment aura un ID supérieur
        //println(mobiles.size());
      }
    }
  }

  void display() {
    // On dessine tous les mobiles au fur et à mesure de l'ajout dans le chapelet
    for (int i = mobiles.size()-1; i >= 0; i--) {
      mobiles.get(i).update();
      mobiles.get(i).display();
    }
  }
}
