// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mercredi, 29 novembre 2017

PShape s;
PImage tex;

void setup() {
  size(600, 600, P3D);
  //smooth(8);

  tex = loadImage("indicatrice_de_tissot.png");

  sphereDetail(50);
  s = createShape(SPHERE, 220);
  s.setTexture(tex);
  s.setFill(true);
  s.setFill(color(random(100, 255), random(100, 255), random(100, 255)));
  s.setStroke(false);

  //Utile si la sphère reçoit des commandes de rotation en x
  //qui débordent -30 à -150 degrés:

  //hint(DISABLE_DEPTH_TEST);
}

void draw() {
  background(0);

  translate(width/2, height/2, 0);

  // La position de l’éclairage semble fixe, bien qu’affecté par les translate

  spotLight(255, 255, 255, 0, 0, 400, 0, -1, -0.25, PI/2, 1);
  spotLight(255, 255, 255, 0, 0, 400, 0, 1, -0.25, PI/2, 1);

  //directionalLight(255, 255, 255, 0, 1, -0.25);
  //directionalLight(255, 255, 255, 0, -1, 0.25);




  //lights();

  //pointLight(100, 100, 100, 0, 0, 0);
  // Key light
  //directionalLight(255, 255, 255, 1, -0.8, -0.35);
  // Back light
  //directionalLight(255, 255, 255, -1, 0.4, 0.8);
  // Fill light
  //ambientLight(50,50,50);

  //float pulseLight = 128+(sin(millis()*0.02)*127);
  float pulseLight = 255;
  directionalLight(pulseLight, pulseLight, pulseLight, -1, 0.4, -0.8);

  pushMatrix();
  // On restreint les transformateurs géométriques (translation, rotation) au PShape
  //translate(0, 0, 500+((millis()*0.1%1000)*-1));
  translate(0, 0, -50);

  // On doit contraindre la rotation en x entre -30 et -150 degrés
  // si l’on ne veut pas voir apparaître les artefacts de la géométrie
  // dans la sphère (visible au travers de la transparence de la texture).
  rotateX(-HALF_PI+(sin(millis()*0.001)*radians(60)));

  // Pas de problème pour une rotation complète en y
  rotateY(-HALF_PI+(sin(millis()*0.0005)*radians(180)));

  // Contrôle de la visiblité du PShape
  //s.setVisible(boolean(floor(frameCount*0.1)%2));

  shape(s);
  popMatrix();

  // Si l’on veut changer la couleur (teinte, opacité) de la sphère
  // en cours de route (dans le draw), il faut rappeler toutes les commandes
  // de gestion de l’objet s, incluant sa création:
  // s = createShape(SPHERE, 220);
}
