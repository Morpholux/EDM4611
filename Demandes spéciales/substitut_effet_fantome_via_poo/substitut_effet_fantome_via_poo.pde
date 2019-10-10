// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.3
// mardi, 8 octobre 2019

// Le but est de démontrer une autre manière de créer une trainée d’objets
// sans passer par la technique du fond partiellement transparent (effet fantome).
// On a plutôt recours à la programmation objet.
// Des traces, demeurant visibles, ressemblent à des résidus de cercles
// dessiné, mais qui auraient été progressivement effacés. En réalité,
// ce sont des instances d’un même objet mobile, distribuées à la queue leu leu.

// Une «chaîne» est composée de plusieurs «maillons» : chaque maillon est un mobile
// en mouvement, dont le comportement est identique, mais décalé dans le temps.
// Comme l’ajout d’un maillon se fait progressivement, on peut déterminer le rythme
// de construction à travers un délai de création plus ou moins grand.
// Enfin, on peut démultiplier le nombre de chaînes en cliquant la souris à différents
// endroits dans le sketch.

// Procédure d’exportation au format vectoriel
import processing.pdf.*;
boolean saveOneFrame = false;

// Liste comprenant les chaînes créées au fur et à mesure des clics
ArrayList <Chaine> Chaines = new ArrayList();

void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  if (saveOneFrame == true) {
    beginRecord(PDF, "rendu_chaines.pdf");
  }

  background(0);

  if (Chaines.size() > 0 ) {
    for (int i = Chaines.size()-1; i >= 0; i--) {
      // Constitution et affichage des chaînes
      Chaines.get(i).update();
      Chaines.get(i).display();
    }
  }

  // Procédure d’enregistrement vers un fichier externe
  if (saveOneFrame == true) {
    endRecord();
    saveOneFrame = false;
  }
}

void mousePressed() {
  // création d’un chaîne de Maillons
  PVector posInit = new PVector(mouseX, mouseY, 0);
  // Trois arguments :
  // 1) emplacement création d’une chaîne
  // 2) nombre de maillons
  // 3) delai entre création des maillons (en frame).
  Chaines.add(new Chaine(posInit, 50, 2));
}

void keyPressed() {
  if (key == ' ') {
    Chaines.clear();
  }


  if (key == 's') {
    saveOneFrame = true;
  }
}
