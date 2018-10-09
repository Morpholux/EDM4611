// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// dimanche, 8 octobre 2017

// L’importation d’un fichier OBJ se fait à travers un type PShape

// De plus, nous exploitons ici la librairie PeasyCam
// Voir http://mrfeinberg.com/peasycam/

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

PShape model;

boolean onSauve = false;

void setup() {
  size(600, 600, P3D);
  pixelDensity(displayDensity());

  model = loadShape("oeuf_polygones.obj"); // Model must be in the data directory
  model.scale(150); // important de calibrer l’échelle
  model.scale(1, -1); // Inversion de l’axe Y

  //model.setStroke(true);
  //model.setStroke(color(255)); // needs to be different from black
  //model.setStrokeWeight(0.01f); // if the weight is too small, the stroke won't be visible            

  //model.setFill(false);
  model.setFill(color(255));



  // Positionnement de la caméra (distance de la cible)
  cam = new PeasyCam(this, 300);
  // Propriété de la roulette pour une souris à trois boutons
  cam.setMinimumDistance(150); // limite rapprochement
  cam.setMaximumDistance(1500); // limite éloignement

  smooth(8);
}

void draw() {
  background(0);

  // L’utilisation de de la librairie Peasy Cam
  // ne requiert pas de faire un translate au centre du sketch,
  // comme dans un projet de 3D habituel.
  // Les objets dessinés aux coordonnées 0,0,0 (coin gauche) sont vues
  // en plein milieu, devant la caméra.

  //translate(width/2, height/2, 0);

  // Rappel : Ce n’est pas l’objet qui pivote sur lui-même,
  // mais la caméra qui orbite autour de celui-ci.
  // On peut inscrire un mouvement à la caméra.
  cam.rotateY(TWO_PI/360); // rotation autour de l'axe y de 1 degré par frame

  // Gestion de l’éclairage
  //lights();
  ambientLight(20, 20, 50);
  //spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
  //directionalLight(250, 215, 0, 0, -1, -1);
  directionalLight(255, 255, 255, 0, -1, 1);
  directionalLight(90, 90, 90, 0.5, 1, -1);

  // Dessin du modèle OBJ
  // La coloration a été établi dans le Setup
  
  //pushMatrix();
  //translate(0,0,-200);
  shape(model);
  //popMatrix();


  // Coloration et affichage des autres primitives 3D
  noFill();
  stroke(255, 50);
  //noStroke();
  //fill(255);
  box(100, 1000, 100);
  box(1000, 100, 100);
  box(100, 100, 1000);

  // Option de sauvegarde d’une image matricielle
  if (onSauve) {
    save("rendu.jpg");
    onSauve = false;
  }
}

void keyPressed() {
  if (key == 's') {
    onSauve = true;
  }
}