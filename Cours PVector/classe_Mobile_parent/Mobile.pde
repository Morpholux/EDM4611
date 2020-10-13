class Mobile {
  // Variables membres:
  PVector loc, vel, sourceLoc, initVel, fFriction, fDeriv, fDerivPerp, fDerivPerpOpposee, deltaLoc;
  float initTheta, coefFriction, coefDeriv, mapAmpli, amp1, amp2, noiseSpeed, opacite, tailleMob, chrono, delai;
  float regression, seuil;
  int offsetTemps1, offsetTemps2;
  boolean bouge, existe;
  Mobile parent;


  // Constructeur:
  Mobile(PVector _sl, float _it, float _mv, float _cf, float _cd, float _t, float _o) {
    // Position initiale du mobile
    sourceLoc = _sl.copy();
    // Position changeante du mobile
    loc = sourceLoc.copy();
    deltaLoc = new PVector(0, 0, 0);

    // Orientation et vélocité initiales
    initTheta = _it;
    initVel = PVector.fromAngle(initTheta);
    // Puis on fixe l’envergure de la première enjambée de notre vecteur.
    initVel.setMag(_mv);
    // Vélocité changeante du mobile
    vel = initVel.copy();

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
      mapAmpli = map(coefDeriv, 0, 1, 0, initVel.mag());
      offsetTemps1 = int(random(12345));
      offsetTemps2 = int(random(12345));
      noiseSpeed = 0.005;

      fDerivPerp = vel.copy();
      fDerivPerp.normalize();
      fDerivPerp.rotate(HALF_PI);
      fDerivPerpOpposee = fDerivPerp.copy();
      fDerivPerpOpposee.mult(-1);

      // Une valeur comme 0.54321 permet approximativement de recentrer les valeurs du noise
      noiseDetail(4, 0.54321); // Valeur par défaut : (4, 0.5)
      amp1 = (noise((millis()+offsetTemps1)*noiseSpeed))*mapAmpli;
      amp1 = constrain(amp1, 0, mapAmpli);
      amp2 = (noise((millis()+offsetTemps2)*noiseSpeed))*mapAmpli;
      amp2 = constrain(amp2, 0, mapAmpli);

      fDerivPerp.setMag(amp1);
      fDerivPerpOpposee.setMag(amp2);
    } else if (coefDeriv <= 0) {
      fDerivPerp = new PVector(0, 0, 0);
      fDerivPerpOpposee = new PVector(0, 0, 0);
      fDeriv = new PVector(0, 0, 0);
    }

    // État du mobile
    bouge = true;
    existe = true;
    
    // Facteur permettant de minimiser progressivement l’effet de la force de dérivation
    regression = 0.985;
    // Vitesse minimale déterminant l’arrêt du mobile
    seuil = 0.005;

    // Taille du mobile lorsqu’il est affiché (méthode display)
    tailleMob = _t;
    // Opacité (normalisée) du mobile
    opacite = _o;
    // Durée d’existence après l’arrêt du mobile
    delai = 4;
  }


  // Méthodes:
  // La méthode ci-dessous s’applique si le mobile est enfant d’un parent
  void update(Mobile _p) {
    // La comparaison permet de savoir si le mobile est presque arrêté
    if ((vel.mag() < seuil)&&(bouge)) {
      // On peut donc arrêter le mobile
      bouge = false;
      // On lance le décompte une seule fois
      chrono = millis();
    }

    if (bouge) {
      // mise à jour de la force de friction (toujours en direction opposée à la vélocité)
      fFriction = vel.copy();
      fFriction.mult(-1);
      fFriction.mult(coefFriction);
      // Mise à jour de la vélocité selon la force de friction
      vel.add(fFriction);

      // et selon la force aléatoire de dérivation, le cas échéant
      if (coefDeriv > 0) {

        // mise à jour de la force perpendiculaire (suivant l’orientation de la vélocité)
        fDerivPerp = vel.copy();
        fDerivPerp.normalize();
        fDerivPerp.rotate(HALF_PI);
        fDerivPerpOpposee = fDerivPerp.copy();
        fDerivPerpOpposee.mult(-1);

        if (mapAmpli > 0.1) {
          mapAmpli*=regression;
        } else {
          mapAmpli = 0;
        }

        amp1 = (noise((millis()+offsetTemps1)*noiseSpeed))*mapAmpli;
        amp1 = constrain(amp1, 0, mapAmpli);
        amp2 = (noise((millis()+offsetTemps2)*noiseSpeed))*mapAmpli;
        amp2 = constrain(amp2, 0, mapAmpli);


        fDerivPerp.setMag(amp1);
        fDerivPerpOpposee.setMag(amp2);

        // Addition des deux forces perpendiculaires contraires
        fDeriv = PVector.add(fDerivPerp, fDerivPerpOpposee);
        // Mise à jour de la vélocité selon la force de dérivation finale
        vel.add(fDeriv);
      }
    } else {
      // On est prêt à arrêter le mouvement du mobile
      vel.set(0, 0, 0);
      // Modification de l’apparence entre l’arrêt et la disparition du mobile
      tailleMob*=0.985;
      //tailleMob*=1.0025;
      opacite*=0.975;
    }


    // Mise à jour de l'emplacement selon la vélocité, en poursuivant le ralentissement
    loc.add(vel);

    // Délai en secondes entre l’arrêt du mobile et sa disparition du ArrayList
    if ((((millis()-chrono)*0.001) > delai)&&(!bouge)) {
      existe = false;
    }

    // Pour terminer, on enregistre le décalage de position, advenant
    // que le mobile doive en suivre un second
    parent = _p;
    PVector temp = new PVector();
    // On récupère la donnée de position du parent
    temp = parent.deltaLoc.copy();
    temp.sub(sourceLoc);
    deltaLoc = PVector.add(loc, temp);
  }

  // La méthode ci-dessous s’applique si le mobile est orphelin
  void update() {
    // La comparaison permet de savoir si le mobile est presque arrêté
    if ((vel.mag() < seuil)&&(bouge)) {
      // On peut donc arrêter le mobile
      bouge = false;
      // On lance le décompte une seule fois
      chrono = millis();
    }

    if (bouge) {
      // mise à jour de la force de friction (toujours en direction opposée à la vélocité)
      fFriction = vel.copy();
      fFriction.mult(-1);
      fFriction.mult(coefFriction);
      // Mise à jour de la vélocité selon la force de friction
      vel.add(fFriction);

      // et selon la force aléatoire de dérivation, le cas échéant
      if (coefDeriv > 0) {

        // mise à jour de la force perpendiculaire (suivant l’orientation de la vélocité)
        fDerivPerp = vel.copy();
        fDerivPerp.normalize();
        fDerivPerp.rotate(HALF_PI);
        fDerivPerpOpposee = fDerivPerp.copy();
        fDerivPerpOpposee.mult(-1);

        if (mapAmpli > 0.1) {
          mapAmpli*=regression;
        } else {
          mapAmpli = 0;
        }

        amp1 = (noise((millis()+offsetTemps1)*noiseSpeed))*mapAmpli;
        amp1 = constrain(amp1, 0, mapAmpli);
        amp2 = (noise((millis()+offsetTemps2)*noiseSpeed))*mapAmpli;
        amp2 = constrain(amp2, 0, mapAmpli);


        fDerivPerp.setMag(amp1);
        fDerivPerpOpposee.setMag(amp2);

        // Addition des deux forces perpendiculaires contraires
        fDeriv = PVector.add(fDerivPerp, fDerivPerpOpposee);
        // Mise à jour de la vélocité selon la force de dérivation finale
        vel.add(fDeriv);
      }
    } else {
      // On est prêt à arrêter le mouvement du mobile
      vel.set(0, 0, 0);
      // Modification de l’apparence entre l’arrêt et la disparition du mobile
      tailleMob*=0.985;
      //tailleMob*=1.0025;
      opacite*=0.975;
    }


    // Mise à jour de l'emplacement selon la vélocité, en poursuivant le ralentissement
    loc.add(vel);

    // Délai en secondes entre l’arrêt du mobile et sa disparition du ArrayList
    if ((((millis()-chrono)*0.001) > delai)&&(!bouge)) {
      existe = false;
    }

    // Enfin, il n’y aura aucun décalage de position,
    // donc on reconduit celle-ci dans deltaLoc
    deltaLoc = loc.copy();
  }

  // Méthode pour l’affichage
  void display() {
    pushStyle();
    fill(255, map(opacite, 0, 1, 0, 255));
    noStroke();
    ellipse(deltaLoc.x, deltaLoc.y, tailleMob, tailleMob);
    popStyle();
  }
}