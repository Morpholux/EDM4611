// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// vendredi, 9 octobre 2015

// Exemple de gestion du déplacement par PVector.
// Cas simple d’un seul mobile affecté par une force de gravité
// et perdant une partie d’énergie cinétique à chaque rebond.

// Cliquez pour ajouter des occurences.


ArrayList <Mobile> mobiles =  new ArrayList<Mobile>();
Mobile m1;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  mobiles.add(new Mobile());
}

void draw() {
  background(0);

  for (int i = 0; i < mobiles.size(); i++) {
    ((Mobile)mobiles.get(i)).update();
    ((Mobile)mobiles.get(i)).display();
  }
}

class Mobile {
  PVector loc, vel, acc;
  int tailleMobile, rayon;
  color c;

  Mobile() {

    tailleMobile = floor(random(10, 50));
    rayon = floor(tailleMobile*0.5);
    c = color(random(50, 255));

    // Position initiale du mobile :
    loc = new PVector(300, 100);

    // Vélocité initiale du mobile:
    vel = new PVector(random(-5, 5), 0, 0);

    // Effet de gravité
    acc = new PVector(0, 1, 0); // force vers le bas
    acc.setMag(0.5);
  }

  void update() {
    // À réaliser dans le bon ordre :

    // 1. Mise à jour de la vitesse suivant l’accélération.
    vel.add(acc);

    // 2. Mise à jour de la position suivant la vitesse.
    loc.add(vel);


    // On appelle la méthode qui permet de vérifier le contact avec les bords du sketch.
    rebond();

    // 4. On vérifie le moment où le mobile ne bouge presque plus
    // ET on s’assure que le mobile est près du sol, car il faut prévoir
    // que la vitesse est également très lente près du SOMMET de la trajectoire parabolique.
    // Donc il nous faut une double condition :
    if ((vel.mag() < 0.1)&&(loc.y > height-rayon-10)) { // lent + se trouve près du sol
      // On arrête tout !
      acc.mult(0);
      vel.mult(0);
      loc.set(loc.x, height-rayon, 0);
    }

    // Idée en développement
    //for (int i = 0; i < mobiles.size(); i++) {
    //  if (this != mobiles.get(i)) {
    //    if (((Mobile)mobiles.get(i)).loc.y == width-((Mobile)mobiles.get(i)).rayon)
    //      ((Mobile)mobiles.get(i)).c = color (random(50, 255));
    //  }
    //}
    
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    pushStyle();
    fill(c);
    noStroke();
    ellipse(0, 0, tailleMobile, tailleMobile);
    popStyle();
    popMatrix();
  }

  void rebond() {
    // Évaluation en fonction des limites sur l’axe horizontal.
    if ((loc.x > width-rayon)||(loc.x < rayon)) {
      // Si on frappe le mur, simplement inverser le composant x du vecteur de vélocité
      // sans toucher aux autres composants.
      vel.set(vel.x * -1, vel.y, vel.z);
    }

    // Évaluation en fonction des limites sur l’axe vertical.
    if ((loc.y > height-rayon)||(loc.y < rayon)) {
      vel.set(vel.x, vel.y * -1, vel.z);
      if (loc.y > height-rayon) {
        // Perte d’énergie cinétique : on retire de la vélocité
        // à chaque contact.
        // Plus le chiffre est près de 1.0, plus l’objet conserve
        // son énergie initiale.
        // On peut aussi créer un lien avec le volume de l’objet.
        vel.mult(0.5+(map(tailleMobile,10,50,0.35,0)));
        // IMPORTANT : s’assurer de repositionner l’objet en dehors
        // de la zone d’évaluation de la condition.
        // Il y aura simplement une petite différence ici.
        // Dans la condition : plus grand que (>)
        // Dans le repositionnement : égale (=)
        loc.y = height-rayon;
      }
    }
  }
}

void mousePressed() {
  mobiles.add(new Mobile());
}

void keyPressed() {
  mobiles.clear();
}