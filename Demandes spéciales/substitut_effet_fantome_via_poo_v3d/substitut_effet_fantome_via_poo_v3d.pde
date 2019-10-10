// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.3
// mardi, 8 octobre 2019

// Cas simple d’un seul mobile à vitesse constante, mais dont la direction
// sera affectée par une force aléatoire.
// Toutefois, l’instance du mobile est dupliquée afin de produire un chapelet.
// Chaque segment du chapelet dispose d’un statut indépendant.
// Le but est de démontrer une autre manière de créer une trainée d’objets
// sans passer par la technique du fond semi-transparent (effet fantome).

import processing.pdf.*;
boolean dosave=false;

ArrayList <Chapelet> chapelets = new ArrayList();
PVector posNaissance;
int posz = 0;

void setup() {
  size(600, 600, P3D);
  background(0);
  //hint(DISABLE_DEPTH_TEST);
}

void draw() {
  
  if(dosave) {
    // set up PGraphicsPDF for use with beginRaw()
    PGraphicsPDF pdf = (PGraphicsPDF)beginRaw(PDF, "chapelets3D.pdf"); 

    // set default Illustrator stroke styles and paint background rect.
    pdf.strokeJoin(MITER);
    pdf.strokeCap(SQUARE);
    pdf.fill(0);
    pdf.noStroke();
    pdf.rect(0,0, width,height);
  }

  background(0);

  if (chapelets.size() > 0 ) {

    for (int i = chapelets.size()-1; i >= 0; i--) {
      // Affichage des chapelets
      chapelets.get(i).update();
      chapelets.get(i).display();
    }
  }

  if(dosave) {
    endRaw();
    dosave=false;
  }
}

void mousePressed() {
  // création d’un chapelet de mobiles
  posNaissance = new PVector(mouseX, mouseY, posz);
  // Trois arguments : emplacement création chapelet, nombre de segments, delai entre création segements.
  chapelets.add(new Chapelet(posNaissance, 50, 2));
  
  // Décalage optionnel dans l’axe z de chacun des chapelets
  // posz += 5;
}

void keyPressed() {
  if (key == ' ') {
    chapelets.clear();
    posz = 0;
  }


  if (key == 's') {
    dosave=true;
  }
}
