// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 148
// Samedi 08 novembre 2008

/** 
 * Esquisse permettant d’évaluer la coloration moyenne des pixels pour une région donnée dans une image.<br>
 * Touches claviers : flèche haut, flèche bas, e, r.
 */

// La surface analysée peut être modifiée dynamiquement en taille et en forme.
// Les touches «flèche haut» et «flèche bas» augmentent ou réduisent la taille de la zone.
// Les touches «r» ou «e» servent à fixer la configuration de la surface d'analyse,
// en lui donnant respectivement la forme d’un carré ou d’une région circulaire.
// Enfin, un clic de souris affichera dans la console diverses informations sur le nombre
// de pixels traités lors de l’analyse.


PImage monImage;
PFont maPolice;
int zoneAnalyse = 50;
int centreX, centreY, indexCible, r, g, b, decompte=0, locX, locY, increment = 5;
color couleurMoyenne;
boolean afficherZone = false, modeEllipse = false, modeRectangle = true;

color [] matricePixels = new color [zoneAnalyse*zoneAnalyse];
boolean [] matricePixelsCercle = new boolean [zoneAnalyse*zoneAnalyse];
PGraphics calque;


void setup() {
  monImage = loadImage("poires.jpg");
  //size(monImage.width, monImage.height);
  surface.setSize(monImage.width, monImage.height);
  calque = createGraphics(width, height, JAVA2D);
  smooth();
  noCursor();
  rectMode(CENTER);
  maPolice = loadFont("LucidaGrande-10.vlw");
  textFont(maPolice);
}

void draw() {
  image(monImage, 0, 0);

  // La superficie de la zone d'analyse est limitée par le cadre de l’image.
  if ((mouseX >= (zoneAnalyse/2)) && (mouseX<(width-(zoneAnalyse/2)))) {
    centreX = mouseX;
  } 
  else if (mouseX < (zoneAnalyse/2)) {
    centreX = (zoneAnalyse/2);
  } 
  else if (mouseX >= (width-(zoneAnalyse/2))) {
    centreX = (width-(zoneAnalyse/2));
  }
  // En y
  if ((mouseY >= (zoneAnalyse/2)) && (mouseY<(height-(zoneAnalyse/2)))) {
    centreY = mouseY;
  } 
  else if (mouseY < (zoneAnalyse/2)) {
    centreY = (zoneAnalyse/2);
  } 
  else if (mouseY >= (height-(zoneAnalyse/2))) {
    centreY = (height-(zoneAnalyse/2));
  }

  // Étape 1 :
  // On charge les pixels de l’objet PImage
  // Ce sont les pixels de l’image en mémoire et non ceux du sketch qui seront examinés.
  monImage.loadPixels();
  // * * * IMPORTANT : on rafraîchit constamment les données de la matrice des pixels analysés * * *
  for (int i = 0; i<zoneAnalyse; i++) {
    for (int j = 0; j<zoneAnalyse; j++) {
      // Formule pour rapatrier la couleur des pixels dans une zone mobile, dont la taille est déterminée dynamiquement.
      // On utilise la fonction «quelIndex()», décrite plus bas dans le code.
      matricePixels[(i*zoneAnalyse)+j] = monImage.pixels[quelIndex((centreX-(zoneAnalyse/2))+j, (centreY-(zoneAnalyse/2))+i)];
    }
  }

  // Étape 2 :
  // Zone d’évaluation circulaire
  // Mise à jour de la matrice de comparaison pour l’évaluation d’une région circulaire
  for (int i = 0; i < matricePixelsCercle.length; i++) {
    // La formule développée permet de déterminer si un pixel d'une surface donnée
    // fait parti (est à l’intérieur) d’une région circulaire ou non.
    // Si c’est le cas, on inscrit true dans le tableau.

    // 1- On reconstruit des coordonnées fictives de position en fonction d’une grille de la taille de la zone
    locY = i / zoneAnalyse; // retourne 0 pour la première rangée de la grille
    locX = i % zoneAnalyse; // retourne l’emplacement en X pour chacune des rangées

    // 2- La fonction distance dist() est utilisée pour vérifier si l’on est en dedans ou en dehors du cercle (son rayon).
    // note : il faut rendre les calculs plus précis en divisant par 2.0 et non 2, car zoneAnalyse est toujours un chiffre impair.
    // Seul le segment de droite dans l’expression doit avoir la précision d’une division par 2.0.
    if ((dist((zoneAnalyse/2), (zoneAnalyse/2), locX, locY))<=(zoneAnalyse/2.0)) {
      matricePixelsCercle[i] = true;
    } 
    else {
      matricePixelsCercle[i] = false;
    }
  }

  // Commandes d’affichage
  // On voile la région analysée pour mieux la montrer
  if (afficherZone) {
    calque.beginDraw();
    calque.rectMode(CENTER);
    calque.image(monImage, 0, 0);
    calque.fill(255, 40);
    calque.noStroke();
    if (modeRectangle) {
      calque.rect(centreX,centreY,zoneAnalyse, zoneAnalyse);
    } 
    else if (modeEllipse) {
      calque.ellipse(centreX,centreY,zoneAnalyse, zoneAnalyse);
    }
    calque.endDraw();
    image(calque, 0, 0);
  }

  // * * * important  * * *
  // On récupère la couleur moyenne avec les fonctions décrites plus bas dans le code
  if (modeRectangle) {
    couleurMoyenne = couleurMoyenneCarre(matricePixels);
    fill(couleurMoyenne);
  } 
  else if (modeEllipse) {
    couleurMoyenne = couleurMoyenneEllipse(matricePixels);
    fill(couleurMoyenne);
  }
  // On affiche la couleur moyenne dans une petite fenêtre carrée.
  noStroke();
  rect(width-50, 50, 50, 50);
  // On affiche la recette
  fill(127);
  text("R : "+ int(red(couleurMoyenne)), width-75, 90);
  text("V : "+ int(green(couleurMoyenne)), width-75, 104);
  text("B : "+ int(blue(couleurMoyenne)), width-75, 118);



  // Retour visuel montrant le périmètre de la région analysée
  noFill();
  strokeWeight(1);
  stroke(0, 100);
  if (modeRectangle) {
    if ((zoneAnalyse%2)==0) { // afin de garder l'affichage du rectangle précis
      rect(centreX, centreY, zoneAnalyse+2, zoneAnalyse+2);
    } 
    else {
      rect(centreX, centreY, zoneAnalyse+1, zoneAnalyse+1);
    }
  } 
  else if (modeEllipse) {
    ellipse(centreX, centreY, zoneAnalyse+2, zoneAnalyse+2);
  }
  ellipse(centreX, centreY, 1 , 1);
}


// Commandes de modifications de taille et de changement de configuration de la zone d'analyse
void keyPressed() {

  // Attention : les sauts d’incrémentation et de décrémentation sont réglés à 5 pixels.
  // Ce ratio ne peut être modifié sans créer des impacts sur le bon fonctionnement du code
  // 1- Nous conservons les mêmes multiples peut importe si l’on augmente ou diminue la taille
  // 2- Il est préférable d’avoir une taille minimale de nombre impair pour le calcul de la matrice circulaire
  if (key == CODED) {
    // Pour modifier la taille de la zone ciblée par l’analyse
    if (keyCode == UP) {
      if (monImage.width > monImage.height) {  // format paysage
        if (zoneAnalyse >= monImage.height-((monImage.height)%increment)) {
          zoneAnalyse = monImage.height-((monImage.height)%increment);
        } 
        else {
          zoneAnalyse+=increment;
        }       
      } 
      else if (monImage.width < monImage.height) { // format portrait
        if (zoneAnalyse >= monImage.width-((monImage.width)%increment)) {
          zoneAnalyse = monImage.width-((monImage.width)%increment);
        } 
        else {
          zoneAnalyse+=increment;
        } 
      } 
      else { // format carré
        if (zoneAnalyse >= int(sqrt(monImage.width*monImage.height))) {
          zoneAnalyse = int(sqrt(monImage.width*monImage.height));
        } 
        else {
          zoneAnalyse+=increment;
        }        
      }

      // Important : Comme on change le nombre de pixels à analyser, il faut réviser la taille des listes.
      // On vide la liste et on ramène sa taille à 0
      matricePixels = expand(matricePixels, 0);
      // On reconfigure la liste à la nouvelle taille requise par le changement de dimension de la zone
      matricePixels = expand(matricePixels, (zoneAnalyse*zoneAnalyse));
      // Même chose pour la liste de la matrice de la région circulaire
      matricePixelsCercle = expand(matricePixelsCercle, 0);
      matricePixelsCercle = expand(matricePixelsCercle, (zoneAnalyse*zoneAnalyse));
    } 
    else if (keyCode == DOWN) {
      if (zoneAnalyse <= increment) {
        zoneAnalyse = increment;
      } 
      else {
        zoneAnalyse-=increment;
      }
      matricePixels = expand(matricePixels, 0);
      matricePixels = expand(matricePixels, (zoneAnalyse*zoneAnalyse));
      matricePixelsCercle = expand(matricePixelsCercle, 0);
      matricePixelsCercle = expand(matricePixelsCercle, (zoneAnalyse*zoneAnalyse));
    }
  }
  // Changement de mode
  if ((key == 'e') || (key == 'E')) {
    modeEllipse = true;
    modeRectangle = false;
  } 
  else if ((key == 'r') || (key == 'R')) {
    modeEllipse = false;
    modeRectangle = true;
  }
}


void mousePressed() {
  println("Taille de la matrice initiale : "+matricePixels.length);
  if (modeRectangle) {
    println("Nombre de pixels évalués dans le mode rectangulaire : "+matricePixels.length);
  } 
  else if (modeEllipse) {
    println("Nombre de pixels évalués dans le mode circulaire : "+decompte);
  }
  println();
  afficherZone = true;
}

void mouseReleased() {
  afficherZone = false;
}


// * * * * * * * FONCTIONS * * * * * * * * *


// 1- Faire le lien entre l’emplacement de la souris et l’index du pixel dans le tableau PImage
int quelIndex (int x, int y) {
  indexCible = (x + (y * monImage.width));
  // Mesure de sécurité, sans quoi on envoi parfois des positions de souris en dehors de la zone limite,
  // provoquant une erreur de localisation dans les tableaux.
  if (indexCible >= (monImage.width*monImage.height)-1) {
    indexCible = (monImage.width*monImage.height)-1;
  }
  return indexCible;
}


// 2- Calcul de la couleur moyenne lorsque la région analysée est rectangulaire
color couleurMoyenneCarre (int [] listeCouleurs) {
  for (int i = 0; i<matricePixels.length; i++) {
    r += listeCouleurs[i] >> 16 & 0xFF; 
    g += listeCouleurs[i] >> 8 & 0xFF; 
    b += listeCouleurs[i] & 0xFF;  
  }
  r/=matricePixels.length;
  g/=matricePixels.length;
  b/=matricePixels.length;
  return color (r, g, b);
}


// 3- Calcul de la couleur moyenne pour une région circulaire
// On fonctionne en ne retenant pour le calcul que les pixels
// d’une matrice de comparaison dont les valeurs booléennes reflètent
// la structure d’un cercle.
color couleurMoyenneEllipse (int [] listeCouleurs) {
  // initialisation de la valeur de décompte à 0
  decompte = 0;
  for (int i = 0; i<matricePixels.length; i++) {
    // On fait le cumul de la couleur seulement si le pixel est inclus
    // dans la région circulaire.
    if (matricePixelsCercle[i] == true) {
      r += listeCouleurs[i] >> 16 & 0xFF; 
      g += listeCouleurs[i] >> 8 & 0xFF; 
      b += listeCouleurs[i] & 0xFF;
      decompte ++;  
    }
  }
  r/=decompte;
  g/=decompte;
  b/=decompte;
  return color (r, g, b);
}