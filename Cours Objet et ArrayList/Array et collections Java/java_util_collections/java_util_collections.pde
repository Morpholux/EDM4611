// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.7
// samedi, 18 août 2018

// https://stackoverflow.com/questions/7970857/java-shifting-elements-in-an-array

import java.util.Collections;

ArrayList<Entier> entiers = new ArrayList<Entier>();

void setup() {
  size(200, 200);
  background(0);

  noLoop();

  for (int i = 1; i < 11; i++) {
    entiers.add(new Entier(i));
  }
}

void draw() {
  background(0);

  for (int i = 0; i < entiers.size(); i++) {
    print(entiers.get(i).e + ", ");
  }

  println();
  println("- - - -");
}

void mousePressed() {
  // On effectue la rotation des valeurs dans la liste, en déplacant d’un index à la fois
  Collections.rotate(entiers, 1);
  // Et si on voulait simplement changer l’ordre de façon aléatoire
  //Collections.shuffle(entiers);
  redraw();
}

// Classe simple pour mémoriser un entier
class Entier {
  int e;
  Entier(int _e) {
    e = _e;
  }
}
