class Ligne {
  // 1. variables membres
  float tx1, ty1, tx2, ty2;
  color c;
  int id, alfa, generation;
  float epaisseur, longueur, longueurMax, duree;

  // 2. Constructeur
  Ligne(float _tx1, float _ty1, float _tx2, float _ty2, int _id, int _gen) {
    tx1 = _tx1;
    ty1 = _ty1;
    tx2 = _tx2;
    ty2 = _ty2;
    id = _id;
    generation = _gen;
    longueur = dist(tx1, ty1, tx2, ty2);
    longueurMax = sqrt(zoneDessin*zoneDessin);
    duree = longueurMax-longueur;
    epaisseur = map(duree, 0, longueurMax, 20, 1);
    c = color(255);
    alfa = int(map(duree, 0, longueurMax, 50, 255));
  }

  // 3. Méthodes

  // Update pour la mise à jour des variables membres
  void update() {
    if (duree > 0) {
      duree--;
    } else {
      duree = 0;
    }
  }

  // Display pour les conditions d’affichage, ainsi que la gestion des objets de la ArrayList.
  void display() {
    if (duree > 0) {
      stroke(c, alfa);
      strokeWeight(epaisseur);
      noFill();
      line(tx1, ty1, tx2, ty2);
    } else {

      // IMPORTANT : les instructions qui suivent sont dans la dernière méthode appelée.

      // On retire l’instance (celle-là même concernée par ce code) du ArrayList.
      collectionLignes.remove(this);

      // On ajoute un nouvel objet à la fin du ArrayList :
      float tx1Temp = random(marge, marge+zoneDessin);
      float ty1Temp = random(marge, marge+zoneDessin);
      float tx2Temp = random(marge, marge+zoneDessin);
      float ty2Temp = random(marge, marge+zoneDessin);
      // Le this. ci-dessous n’est pas obligatoire. Simplement par souci de clarté.
      this.generation++; // incrémentation de la variable membre, qui demeure accessible à ce niveau
      collectionLignes.add(new Ligne(tx1Temp, ty1Temp, tx2Temp, ty2Temp, this.id, this.generation));

      //println(collectionLignes.size());
    }
  }
}
