// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 2.0.3
// mardi, 3 décembre 2013

ArrayList maListe = new ArrayList();
int nbObjets = 10;
Objet objet;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  
  for(int i = 0; i < nbObjets; i++) {
    maListe.add(new Objet(random(0,width),random(0,height), random(50, 100)));
  }
}

void draw() {
  background(0);
  // La classe gère elle-même les créations et les disparitions des objets dans le Arraylist
  // Pour éviter les effets de flickering, il faut contrôler l’affichage (méthode afficher)
  // en exploitant la boucle for du Arraylist dans l’ordre inverse.
  // Ainsi, même lorsqu’un objet est détruit, les objets qui seront déplacés d’index dans le Arraylist
  // avaient déjà été traités.
  // http://forum.processing.org/one/topic/arraylist-remove-object-causes-flickering-problem-rendering.html
  for(int i = maListe.size()-1; i >= 0; i--) {
    ((Objet)maListe.get(i)).afficher();
  }
  
  
  // Voici la boucle en mode habituel, qui posait un problème d’affichage
  /*
  for(int i = 0; i < maListe.size(); i++) {
    ((Objet)maListe.get(i)).afficher();
  }
  */
  
}

class Objet {
  float posX, posY;
  float taille;
  color c = color(255, 100);
  
  Objet (float _posX, float _posY, float _taille) {
    posX = _posX;
    posY = _posY;
    taille = _taille;
  }
  
  void afficher() {
    fill(c);
    if (taille > 10) {
      
    ellipse(posX, posY, taille, taille);
    taille -=0.5;
    
    } else {
      maListe.remove(this);
      maListe.add(new Objet(random(0,width),random(0,height), random(50, 100)));
    }
  }  
}

void mousePressed() {
  println(maListe.size());
}
