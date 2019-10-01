// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.1.1
// vendredi, 22 juillet 2016

ArrayList<Mobile> mobiles = new ArrayList<Mobile>();
int nbMob = 1000;
float secteurAngle, axeCentral, taille, opaciteInit;
boolean onSauve = false;

void nouveauxMobiles() {
  secteurAngle = 300;
  axeCentral = 270;
  taille = 1;
  opaciteInit = 0.25;
  for (int i = 0; i < nbMob; i++) {
    mobiles.add(new Mobile(new PVector(width*0.5, height*0.5, 0), radians((axeCentral+random(secteurAngle))-secteurAngle*0.5), random(0.1, 2.5), random(0.005, 0.01), random(0.005, 0.01), taille, opaciteInit));
  }
}

void setup() {
  size(1000, 1000);
  pixelDensity(displayDensity());
  background(0);
  fill(255);
  noStroke();

  // une valeur comme 0.54321 permet approximativement de recentrer les valeurs du noise
  noiseDetail(4, 0.54321); // Valeur par défaut : (4, 0.5)

  nouveauxMobiles();
}

void draw() {
  //background(0);

  for (int i = mobiles.size()-1; i >=0; i--) {
    Mobile m = mobiles.get(i);
    if (m.existe == true) {
      m.update();
      m.display();
    } else {
      mobiles.remove(i);
    }
  }

  if (frameCount%30 == 0) {
  }
  
  if (mobiles.size() == 0) {
    //nouveauxMobiles();
  }

  if (onSauve) {
    save("rendu.tga");
    exit();
  }

  //println(mobiles.size());
}

class Mobile {
  // Variables membres:
  PVector loc, vel, sourceLoc, initVel, velPrec, fFriction, fDeriv, fDerivPerp, fDerivPerpOpposee;
  float initTheta, coefFriction, coefDeriv, mapAmpli, amp1, amp2, noiseSpeed, opacite, tailleMob, chrono, delai;
  int offsetTemps1, offsetTemps2;
  boolean bouge, existe;

  // Constructeur:
  Mobile(PVector _sl, float _it, float _mv, float _cf, float _cd, float _t, float _o) {
    // Position initiale du mobile
    sourceLoc = _sl.copy();
    // Position changeante du mobile
    loc = sourceLoc.copy();

    // Orientation et vélocité initiales
    initTheta = _it;
    initVel = PVector.fromAngle(initTheta);
    // Vélocité changeante du mobile
    vel = initVel.copy();
    // Puis on fixe l’envergure de la première enjambée de notre vecteur.
    vel.setMag(_mv);
    // On prend note de la vélocité dans l’historique…
    // La valeur de cette variable doit être égale ou supérieure,
    // sans quoi la condition de la méthode update()
    // s’appliquerait dès la création de l’objet
    velPrec = vel.copy();

    // Création d’une force de friction
    fFriction = vel.copy();
    // Inversion de la direction du vecteur
    fFriction.mult(-1);
    // Ajustement de la force par rapport à la vitesse
    coefFriction = _cf;
    fFriction.mult(coefFriction);


    coefDeriv = _cd;
    // Création de deux forces aléatoires opposées, perpendiculaires à la vélocité
    if (coefDeriv > 0) {
      mapAmpli = map(coefDeriv, 0, 1, 0, vel.mag());
      offsetTemps1 = int(random(12345));
      offsetTemps2 = int(random(12345));
      noiseSpeed = 0.005;

      fDerivPerp = vel.copy();
      fDerivPerp.normalize();
      fDerivPerp.rotate(HALF_PI);
      fDerivPerpOpposee = fDerivPerp.copy();
      fDerivPerpOpposee.mult(-1);

      amp1 = (noise((millis()+offsetTemps1)*noiseSpeed))*mapAmpli;
      amp1 = constrain(amp1, 0, mapAmpli);
      amp2 = (noise((millis()+offsetTemps2)*noiseSpeed))*mapAmpli;
      amp2 = constrain(amp2, 0, mapAmpli);

      fDerivPerp.setMag(amp1);
      fDerivPerpOpposee.setMag(amp2);
    }

    // État du mobile
    bouge = true;
    existe = true;

    // Taille du mobile lorsqu’il est affiché (méthode display)
    tailleMob = _t;
    // Opacité (normalisée) du mobile
    opacite = _o;
    // Durée d’existence après l’arrêt du mobile
    delai = 4;
  }

  // Méthodes:

  void update() {
    // La comparaison permet de savoir si le mobile est en train de rebrousser chemin
    if (vel.mag() > velPrec.mag()) {
      // On veut donc arrêter le mobile
      bouge = false;
      // On lance le décompte
      chrono = millis();
    }

    if (bouge) {
      // Mise en mémoire de la vélocité AVANT les nouveaux calculs
      velPrec = vel.copy();

      // mise à jour de la force perpendiculaire (suivant l’orientation de la vélocité)
      fDerivPerp = vel.copy();
      fDerivPerp.normalize();
      fDerivPerp.rotate(HALF_PI);
      fDerivPerpOpposee = fDerivPerp.copy();
      fDerivPerpOpposee.mult(-1);

      // mise à jour de la force de friction (toujours en direction opposée à la vélocité)
      fFriction = vel.copy();
      fFriction.mult(-1);
      fFriction.mult(coefFriction);

      // et selon la force aléatoire de dérivation, le cas échéant
      if (coefDeriv > 0) {

        amp1 = (noise((millis()+offsetTemps1)*noiseSpeed))*mapAmpli;
        amp1 = constrain(amp1, 0, mapAmpli);
        amp2 = (noise((millis()+offsetTemps2)*noiseSpeed))*mapAmpli;
        amp2 = constrain(amp2, 0, mapAmpli);


        fDerivPerp.setMag(amp1);
        fDerivPerpOpposee.setMag(amp2);

        // Addition des deux forces perpendiculaires contraires
        fDeriv = PVector.add(fDerivPerp, fDerivPerpOpposee);
        // Mise à jour de la vélocité selon la force de dérivation finale
        // Remarque : celle-ci demeure perpendiculaire
        // et ne ralenti pas le mobile comme tel.
        vel.add(fDeriv);
      }

      // Mise à jour de la vélocité selon la force de friction
      vel.add(fFriction);
    } else {
      // On est prêt à arrêter le mouvement du mobile
      vel.set(0, 0, 0);
      // Modification de l’apparence entre l’arrêt et la disparition du mobile
      tailleMob*=0.975;
      //tailleMob*=1.0025;
      opacite*=0.975;
    }


    // Mise à jour de l'emplacement selon la vélocité, en poursuivant le ralentissement
    loc.add(vel);

    // Délai en secondes entre l’arrêt du mobile et sa disparition du ArrayList
    if ((((millis()-chrono)*0.001) > delai)&&(!bouge)) {
      existe = false;
    }
  }


  void display() {
    pushStyle();
    fill(255, map(opacite, 0, 1, 0, 255));
    noStroke();
    ellipse(loc.x, loc.y, tailleMob, tailleMob);
    popStyle();
  }
}


void mousePressed() {
  nouveauxMobiles();
}

void keyPressed() {
  onSauve = true;
}