// Utilisation des commandes pushMatrix() et popMatrix()
// On dessine un bras articulé. Les touches a, s, d, f contrôlent la rotation soit de tout le bras, soit seulement de l'avant-bras.

// Q : Comment devrions-nous réaménager les commandes push et pop s'il fallait ajouter une croix fixe, au centre,
// par dessus tous les objets existants?

float rotation1 = 0, rotation2 = 0;
boolean toucheA = false, toucheS = false, toucheD = false, toucheF = false;

void setup() {
  size(400,400);
  background(100);
  noStroke();
  smooth();
}

void draw() {
  background(100);
  // incrémentation ou décrémentation des valeurs des variables de rotation
  if (toucheA == true) {
    rotation1+=0.05;
  } else if (toucheS == true) {
    rotation1-=0.05;
  } 
  if (toucheD == true) {
    rotation2-=0.1;
  } else if (toucheF == true) {
    rotation2+=0.1;
  } 
  if ((toucheA == false) || (toucheS == false)) {
    rotation1 = rotation1;
  } 
  if ((toucheD == false) || (toucheF == false)) {
    rotation2 = rotation2;
  }


  // Déplacer le système de coordonnées au centre du sketch
  translate(width/2, height/2);

  // Gérer la rotation de tous les éléments du sketch
  rotate(rotation1);
  // On dessine la portion supérieure du bras
  fill(255, 100, 20);
  rect(0, 0-5, 100, 10);


  // Restreindre les transformateurs à certains objets : ici, l'avant-bras.
  pushMatrix();
  // Faire glisser le repère 0, 0  à la base de l'avant-bras (au point de l'articulation).
  translate(90,0);


  // Effectuer la rotation à partir de ce point
  rotate(rotation2);
  fill(50,50,100);
  rect(0, 0-5, 100, 10);

  // Dessiner un cercle à l'emplacement de l'articulation
  fill(200);
  ellipse(0,0,25,25);
  // Dessiner le noeud de l'articulation
  stroke(0);
  noFill();
  line(0,0,12,0);
  noStroke();

  // Revenir à l'état précédent du système de coordonnées (avant les changements sur l'avant-bras.
  popMatrix();

}

// gestion des touches du clavier
void keyPressed() {
  if ((key == 'a') || (key == 'A')) {
    toucheA = true;
  }
  if ((key == 's') || (key == 'S')) {
    toucheS = true;
  } 
  if ((key == 'd') || (key == 'D')) {
    toucheD = true;
  } 
  if ((key == 'f') || (key == 'F')) {
    toucheF = true;
  }
}

void keyReleased() {
  if ((key == 'a') || (key == 'A')) {
    toucheA = false;
  }
  if ((key == 's') || (key == 'S')) {
    toucheS = false;
  } 
  if ((key == 'd') || (key == 'D')) {
    toucheD = false;
  } 
  if ((key == 'f') || (key == 'F')) {
    toucheF = false;
  }
}

