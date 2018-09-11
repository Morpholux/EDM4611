// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// samedi, 10 septembre 2016

// Les informations ci-dessous peuvent s’avérer utile dans les processus de lecture des pixels.
// On cherche à éviter l’erreur d’une lecture d’index en dehors de la taille du tableau,
// celui contenant l’image importée, l’image virtuelle créée ou les pixels du sketch.

int posX, posY;
boolean sourisAuDessusSketch = false;

void setup() {
  size(200, 200);
  background(127);
  noFill();
  stroke(255);
  strokeWeight(0.5);
  //noCursor();
  println(posX+", "+posY); // Notez les valeurs de 0 par défaut, sans initialisation
}

void draw() {
  background(127);

  if (sourisAuDessusSketch) {
    set(posX, posY, color(255));
    ellipse(posX, posY, 10, 10);
  }
}



void mousePressed() {
  // S’applique une seule fois, au moment du clic enfoncé.
  posX = constrain(mouseX, 0, width-1);
  posY = constrain(mouseY, 0, height-1);
  sourisAuDessusSketch = true;
  println(posX+", "+posY);
}

void mouseMoved() {
  // S’applique sans avoir besoin de cliquer, du moment que la souris est en déplacement.
  // Interruption de l’action si la souris est immobile, ou qu’elle est en dehors du sketch.
}

void mouseDragged() {
  // S’applique lors du cliquer-glisser
  
  // La simple lecture de la position de la souris
  //posX = mouseX;
  //posY = mouseY;

  // La même lecture, mais contrainte dans l’espace du sketch
  // *** Usage recommandé ***
  posX = constrain(mouseX, 0, width-1);
  posY = constrain(mouseY, 0, height-1);

  // Preuve que la souris envoi toujours des valeurs en dehors de la surface du sketch
  if ((mouseX>=width)||(mouseX<0)||(mouseY>=height)||(mouseY<0)) {
    println("Allo Houston, on a un problème");
    sourisAuDessusSketch = false;
  } else {
    sourisAuDessusSketch = true;
  }
}

void mouseReleased() {
  // S’applique tant à l’intérieur qu’à l’extérieur du sketch.
}