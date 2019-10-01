// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 148
// Jeudi 25 septembre 2008


// Déclaration des objets de la classe PVector
// Les deux objets requis pour gérer la dynamique du mouvement (vitesse + accélération).
PVector acc;
PVector vel;

// L’objet pour régler la position
PVector loc;

// Deux objets pour calculer l’orientation du vecteur dans l’espace
PVector cibleLoc;
PVector SoustractionDeuxVecteurs;

float cibleX = 300, cibleY = 300;


void setup() {
  size(600,600);
  background(100);
  noStroke();
  smooth();
  acc = new PVector(0.0, 0.0);
  vel = new PVector(0.0, 0.0); 
  loc = new PVector(100, 200);
  cibleLoc = new PVector(cibleX, cibleY);

  SoustractionDeuxVecteurs = PVector.sub(cibleLoc, loc);
  vel.x = SoustractionDeuxVecteurs.x*0.01;
  vel.y = SoustractionDeuxVecteurs.y*0.05;
}

void draw() {

  fill(100,150);
  rect(0,0,width,height);

  fill(255);
  ellipse(cibleX, cibleY, 10, 10);
  fill(0);


  SoustractionDeuxVecteurs = PVector.sub(cibleLoc, loc);
 
  acc.x = SoustractionDeuxVecteurs.x*0.001;
  acc.y = SoustractionDeuxVecteurs.y*0.001;

  vel.add(acc);
  // L’emplacement est mis à jour en fonction des vecteurs de vitesse.
  loc.add(vel);

  // Affichage d'une figure à l'emplacement désigné
  ellipse(loc.x, loc.y, 16, 16);

}

