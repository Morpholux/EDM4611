// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 148
// Jeudi 09 octobre 2008

/**
Cliquer ou taper une touche du clavier.
Click or tap any keys.
*/

import processing.opengl.*;


// Déclaration des objets de la classe PVector
// 1. Les deux objets requis pour gérer la dynamique du mouvement (vitesse + accélération).
PVector accel;
PVector veloc;

// 2. L’objet pour régler la position
PVector locat;

int nbCubes = 50;
ArrayList listeCubes = new ArrayList();
Cube objetTemporaire;

boolean toucheClavier = false;


void setup() {
  size(600,600, OPENGL);
  //hint(ENABLE_OPENGL_4X_SMOOTH);
  //hint(ENABLE_DEPTH_SORT);
  background(0);
  fill(200, 170, 0, 100);
  stroke(255);

  for (int i = 0; i<nbCubes; i++) {
    // Création des objets
    accel = new PVector(random(-10,10), random(-10,10), random(-10,10)); // on insuffle une force de départ.
    veloc = new PVector(0, 0, 0); 
    locat = new PVector(0, 0, 0);

    // La vitesse est mise à jour en fonction des vecteurs d’accélération.
    veloc.add(accel);
    // Accélération neutralisée
    accel.mult(0);
    
    // Ajout des objets au ArrayList
    listeCubes.add(new Cube(accel, veloc, locat, random(0,TWO_PI)));
  }
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  rotateY((millis()*0.001)%TWO_PI);
  
  for (int i = 0; i<nbCubes; i++) {
    objetTemporaire = (Cube) listeCubes.get(i); // ne pas oublier de upcaster le type
    objetTemporaire.draw();
  }
}



// Pour réinitialiser : Option 1
void mousePressed() {
  // On vide la liste
  listeCubes.clear();
  
  nbCubes = round(random(10, 40));
  fill(200, 170, 0, 100);
  
  // On réintroduit de nouveaux objets
  for (int i = 0; i<nbCubes; i++) {
    // Création des objets
    accel = new PVector(random(-10,10), random(-10,10), random(-10,10)); // on insuffle une force de départ.
    veloc = new PVector(0, 0, 0); 
    locat = new PVector(0, 0, 0);

    // La vitesse est mise à jour en fonction des vecteurs d’accélération.
    veloc.add(accel);
    // Option 1 : Accélération neutralisée
    accel.mult(0);
    
    // Ajout des objets au ArrayList
    listeCubes.add(new Cube(accel, veloc, locat, random(0,TWO_PI)));
  }
  
  toucheClavier = false;
  background(0);
  redraw();
}

// Pour réinitialiser : Option 2
void keyPressed() {
  // On vide la liste
  listeCubes.clear();
  
  nbCubes = round(random(10, 40));
  fill(50, 170, 255, 100);
  
  // On réintroduit de nouveaux objets
  for (int i = 0; i<nbCubes; i++) {
    // Création des objets
    accel = new PVector(random(-10,10), random(-50,0), random(-10,10)); // on insuffle une force de départ.
    veloc = new PVector(0, 0, 0); 
    locat = new PVector(0, 0, 0);

    // La vitesse est mise à jour en fonction des vecteurs d’accélération.
    veloc.add(accel);
    // Option 2 : Accélération avec vecteur y positif
    accel.set(0, 0.8, 0);
    
    // Ajout des objets au ArrayList
    listeCubes.add(new Cube(accel, veloc, locat, random(0,TWO_PI)));
  }
  
  toucheClavier = true;
  background(0);
  redraw();
}

