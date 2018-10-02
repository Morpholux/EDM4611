// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 3 octobre 2017

// Écosystème d’amibes qui s’entre-dévorent

// Tableau Java :
ArrayList<Amibe> amibes = new ArrayList<Amibe>();

int nb_amibes = 100;




void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();

  for (int i = 0; i < nb_amibes; i++) {
    amibes.add(new Amibe(width/2+random(-100, 100), height/2+random(-100, 100), i));
  }

  // une valeur comme 0.54321 permet approximativement de recentrer les valeurs du noise
  noiseDetail(4, 0.54321); // Valeur par défaut : (4, 0.5)
}

void draw() {
  background(0);

  // On circule dans le ArrayList
  for (int i = 0; i < amibes.size(); i++) {

    Amibe aTemp = amibes.get(i); // récupération de l’un des objets
    // Le get() est fait une seule fois dans la boucle

    // Une validation des collisions implique de comparer chacune des amibes avec toutes celles de la liste
    for (int j = amibes.size()-1; j >= 0; j--) {
      Amibe aTempComparaison = amibes.get(j);
      // Collision lorsque distance inférieure à addition des rayons, mais supérieure à 0 (évitant de détecter une collision avec soi-même) 
      if ((dist(aTemp.posx, aTemp.posy, aTempComparaison.posx, aTempComparaison.posy) <= aTemp.taille/2+aTempComparaison.taille/2)&&(dist(aTemp.posx, aTemp.posy, aTempComparaison.posx, aTempComparaison.posy) > 0)) {

        // seulement si l’objet croisé est plus petit ou égal
        if (aTemp.taille >= aTempComparaison.taille) {
          // L’amibe grossit
          aTemp.taille = aTemp.taille * 1.2;

          // L’amibe devient moins lumineuse
          float luma = brightness(aTemp.couleur);
          aTemp.couleur = color(luma-10);

          amibes.remove(j); // mort de l’autre objet

          break; // IMPORTANT : On s’évite de supprimer plus d’un objet à la fois
          // Si un autre objet était détecté dans la zone de collision au même moment,
          // alors il sera évalué à nouveau au prochain frame
        }
      }
    }
    aTemp.draw(); // Affichage des objets restants
  }

  // Simplement pour connaître le gagnant de cette compétition
  if (amibes.size() == 1) {
    println("Index de l’amibe survivante : " + amibes.get(0).index);
    background(0);
    amibes.get(0).draw();
    noLoop();
  }
}





class Amibe {
  // Variables membres
  float taille, posx, posy, posxinit, posyinit;
  color couleur;
  int timeSteps1 = int(random(1000)); // maintenir le format de type entier
  int timeSteps2 = 1000+int(random(1000)); // maintenir le format de type entier
  float noiseScale = 0.005;
  float amplitude = width;
  float deltaX, deltaY;
  boolean collision;
  int index;

  // Constructeur(s)
  Amibe(float _x, float _y, int _i) {
    posxinit = _x;
    posyinit = _y;
    posx = posxinit;
    posy = posyinit;
    taille = 5;
    couleur = color(255);
    collision = false;
    index = _i;
  }

  // Méthode : les mises à jour de variables et l'affichage sont faits dans une seule méthode
  void draw() {
    deltaX = ((noise(timeSteps1*noiseScale))*amplitude)-(amplitude*0.5);
    deltaX = constrain(deltaX, -(amplitude*0.5), (amplitude*0.5)); // on ne dépassera pas les limites

    deltaY = ((noise(timeSteps2*noiseScale))*amplitude)-(amplitude*0.5);
    deltaY = constrain(deltaY, -(amplitude*0.5), (amplitude*0.5)); // on ne dépassera pas les limites

    timeSteps1++;
    timeSteps2++;

    posx = posxinit + deltaX;
    posy = posyinit + deltaY;


    noStroke();
    fill(couleur);
    ellipse(posx, posy, taille, taille);
  }
}