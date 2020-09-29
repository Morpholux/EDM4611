boolean formeComplete = false;
int [] pointsX = new int [0];
int [] pointsY = new int [0];
int nbClics = 0;


void setup()  {
  size(400,400);
  background(255);
  noFill();
  smooth();
  stroke(0,10);
}


void draw() {
  
  if (formeComplete) {
    //background(255);
    fill(127, 50);
    
    beginShape();
    for (int i = 0; i < pointsX.length; i++) {
      vertex(pointsX[i], pointsY[i]);
    }
    endShape(CLOSE);

    // On vide les listes
    pointsX = expand(pointsX, 0);
    pointsY = expand(pointsY, 0);
    // On réinitialise les valeurs au point de départ
    nbClics = 0;
    formeComplete = false;
    noFill();
  }

  // On commence à tracer seulement quand on a fait au moins un clic
  if (nbClics > 0) {
    //background(255);

    line(pointsX[nbClics-1], pointsY[nbClics-1], mouseX, mouseY);
    beginShape();
    for (int i = 0; i < pointsX.length; i++) {
      vertex(pointsX[i], pointsY[i]);
    }
    // Ici, la forme reste ouverte
    endShape();

  }
}



void mouseReleased() {

  if (pointsX.length > 0) {
    if ((dist(mouseX, mouseY, pointsX[0], pointsY[0]) < 20) && (nbClics >= 2)) {
      println("On peut fermer la figure");
      pointsX = expand(pointsX, nbClics+1);
      pointsY = expand(pointsY, nbClics+1);
      pointsX[nbClics] = pointsX[0];
      pointsY[nbClics] = pointsY[0];
      formeComplete = true;  
    }
  }

  if (formeComplete != true) {
    pointsX = expand(pointsX, nbClics+1);
    pointsY = expand(pointsY, nbClics+1);
    println(pointsX.length);
    println();

    pointsX[nbClics] = mouseX;
    pointsY[nbClics] = mouseY;
    println(pointsX[nbClics]);
    println(pointsY[nbClics]);
    println();

    nbClics++;
  }
}

