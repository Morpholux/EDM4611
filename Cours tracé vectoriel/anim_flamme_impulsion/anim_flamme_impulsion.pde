// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.1.1
// dimanche, 17 juillet 2016

boolean anim = false;

Mobile pah, plbg, plbd, plhg, plhd;
PVector sourceLoc, deltaLoc;
float impuls1, impuls2, impuls3, impuls4, impuls5;

void setup() {
  size(600, 600);
  background(0);
  //noFill();
  //stroke(255);

  fill(255);
  noStroke();




  sourceLoc = new PVector(300, 500, 0);
  boolean pige = boolean(floor(random(2)));
  if (pige) {
    impuls1 = random(40, 50);
    impuls2 = random(20, 40);
    impuls3 = random(20, 40);
    impuls4 = random(5, 15);
    impuls5 = random(5, 15);
  } else {
    impuls1 = random(10, 20);
    impuls2 = random(4, 8);
    impuls3 = random(4, 8);
    impuls4 = random(2, 4);
    impuls5 = random(2, 4);
  }
  pah = new Mobile(sourceLoc, new PVector(random(-0.1, 0.1), -0.5, 0), impuls1, random(0.05, 0.075));
  plbg = new Mobile(sourceLoc, new PVector(-1, random(-0.5, 0.02), 0), impuls2, random(0.05, 0.075));
  plbd = new Mobile(sourceLoc, new PVector(1, random(-0.5, 0.02), 0), impuls3, random(0.05, 0.075));
  plhg = new Mobile(sourceLoc, new PVector(random(-1, 0), 0.5, 0), impuls4, random(0.035, 0.05));
  plhd = new Mobile(sourceLoc, new PVector(random(0, 1), 0.5, 0), impuls5, random(0.035, 0.05));
}

void draw() {
  background(0);


  pah.update();
  plbg.update();
  plbd.update();
  plhg.update();
  plhd.update();

  // Mise à jour des décalages de positions dans les mobiles plhg et plhd
  plhg.deltaLoc = PVector.sub(pah.loc, sourceLoc);
  plhd.deltaLoc = PVector.sub(pah.loc, sourceLoc);

  // Randomisation des directions
  PVector vTemp = new PVector(0, noise((millis()+12345)*0.05)*2-1, 0);
  plbg.vel.add(vTemp);
  vTemp.set(0, noise(millis()*0.01)*2-1, 0);
  plbd.vel.add(vTemp);



  // dessin feuille
  beginShape();
  vertex(sourceLoc.x, sourceLoc.y+50);
  bezierVertex(plbg.loc.x, plbg.loc.y, plhg.loc.x+plhg.deltaLoc.x, plhg.loc.y+plhg.deltaLoc.y, pah.loc.x, pah.loc.y);
  bezierVertex(plhd.loc.x+plhd.deltaLoc.x, plhd.loc.y+plhd.deltaLoc.y, plbd.loc.x, plbd.loc.y, sourceLoc.x, sourceLoc.y+50);
  endShape();


  // dessin mobiles
  pah.display();
  plbg.display();
  plbd.display();
  plhg.display();
  plhd.display();

  if (anim) {
    if ((frameCount%12) == 0) {
      nouvelleFlamme();
    }
  }

  //saveFrame("####.jpg");
  //println(frameCount);
}

class Mobile {
  PVector loc, vel, friction, velPrec; // ajout d’un vecteur
  float angle;
  PVector deltaLoc;

  Mobile(PVector _sl, PVector _d, float _v, float _f) {
    // Position initiale du mobile :
    loc = _sl.copy();

    // C’est maintenant le temps de préciser la direction du déplacement:
    vel = _d.copy();

    // Puis on fixe l’envergure des enjambées de notre vecteur.
    // Icic, il s’agit d’un déplacement équivalant à 2 pixels par frame.
    // La distance parcoure est la même, peut importe que le déplacement se fasse
    // parallèlement à l’un des deux axes du plan cartésien ou pas.
    vel.setMag(_v);
    velPrec = vel.copy();

    // création d’une force de friction
    friction = new PVector();
    friction = vel.copy();
    // Inversion de la direction du vecteur
    friction.mult(-1);
    // Réduction de la force par rapport à la vitesse
    friction.mult(_f);

    deltaLoc = new PVector(0, 0, 0);
  }

  void update() {

    // Si la vélocité approche 0, on interrompt le mouvement
    // La comparaison permet de savoir si le mobile ré-accélère
    // Si oui, c’est qu’il est en train de rebrousser chemin
    if (vel.mag() > velPrec.mag()) {
      vel.set(0, 0, 0);
      // IMPORTANT :
      // il faut aussi annuler l’effet de la force de friction
      // afin d’éviter que l’objet ne parte dans la direction opposée
      friction.set(0, 0, 0);

      // Une dernière mise à jour de l'emplacement
      loc.add(vel);
      //noLoop();
    } else {
      // Mise en mémoire de la vélocité AVANT les nouveaux calculs
      velPrec = vel.copy();

      // Mise à jour de la vélocité selon la force de friction
      vel.add(friction);
      //println(vel.mag());
      // Mise à jour de l'emplacement selon la vélocité, en poursuivant le ralentissement
      loc.add(vel);
    }
  }

  void display() {
    pushStyle();
    fill(200, 150, 0);
    noStroke();
    ellipse(loc.x+deltaLoc.x, loc.y+deltaLoc.y, 8, 8);
    popStyle();
  }
}

void mousePressed() {
  nouvelleFlamme();
  //loop();
}

void nouvelleFlamme() {
  sourceLoc = new PVector(300, 500, 0);
  boolean pige = boolean(floor(random(2)));
  if (pige) {
    impuls1 = random(40, 50);
    impuls2 = random(20, 40);
    impuls3 = random(20, 40);
    impuls4 = random(5, 15);
    impuls5 = random(5, 15);
  } else {
    impuls1 = random(10, 20);
    impuls2 = random(4, 8);
    impuls3 = random(4, 8);
    impuls4 = random(2, 4);
    impuls5 = random(2, 4);
  }
  pah = new Mobile(sourceLoc, new PVector(random(-0.1, 0.1), -0.5, 0), impuls1, random(0.05, 0.075));
  plbg = new Mobile(sourceLoc, new PVector(-1, random(-0.5, 0.02), 0), impuls2, random(0.05, 0.075));
  plbd = new Mobile(sourceLoc, new PVector(1, random(-0.5, 0.02), 0), impuls3, random(0.05, 0.075));
  plhg = new Mobile(sourceLoc, new PVector(random(-1, 0), 0.5, 0), impuls4, random(0.035, 0.05));
  plhd = new Mobile(sourceLoc, new PVector(random(0, 1), 0.5, 0), impuls5, random(0.035, 0.05));
}