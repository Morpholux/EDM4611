// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.4
// mardi, 30 octobre 2018

PVector loc, vel, acc, forcePonctuelle;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();

  loc = new PVector(300, 0, 0);

  vel = new PVector(0, 1, 0);

  acc = new PVector();
  
  forcePonctuelle = new PVector(0, -4, 0);
}

void draw() {
  //background(0);

  // 1. Mise à jour de l’accélération :
  // Force verticale vers le bas, avec déviation aléatoire gauche-droite
  acc.set(random(-0.2, 0.2), 0.5, 0);
  acc.setMag(0.2);

  // 2. Mise à jour de la vélocité :
  vel.add(acc);
  // La vélocité ne dépassera pas une certaine limite:
  vel.limit(12);

  // 3. Mise à jour de la position :
  loc.add(vel);

  // Rebond sur les bords du sketch
  if (loc.x >= width) {
    loc.x = width;
    vel.x *= -1;
  } else if (loc.x < 0) {
    vel.x *= -1;
  }

  if (loc.y >= height) {
    loc.y = height;
    vel.y *= -1;
  } else if (loc.y < 0) {
    vel.y *= -1;
  }
  
  fill(map(constrain(loc.y,300,600), 300, 600, 255, 0),255,map(constrain(loc.y,300,600), 300, 600, 255, 0));

  ellipse(loc.x, loc.y, 2, 2);
}

void mousePressed() {
  vel.add(forcePonctuelle);
}
