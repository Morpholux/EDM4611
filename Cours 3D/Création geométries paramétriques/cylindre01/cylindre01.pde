int reso = 18;
float [] [] pointsCercle = new float [reso] [2];
float [] [] pointsCercle2 = new float [reso] [2];
float rayon = 200.0, decalageY = 50;

void setup() {
  size (600,600,P3D);
  background(0);
  fill(100);
  stroke(200);

  // Construction d'une liste de points formant un cercle
  for (int i=0; i<reso; i++) {
    pointsCercle[i][0] = rayon * (cos(TWO_PI*(i/float(reso))));
    pointsCercle[i][1] = rayon * (sin(TWO_PI*(i/float(reso))));
  }

  // Construction d'une deuxième liste, avec les points décalés d'un demi intervalle
  for (int i=0; i<reso; i++) {
    pointsCercle2[i][0] = rayon * (cos(TWO_PI*(i/float(reso))+TWO_PI*(1/float(reso*2))));
    pointsCercle2[i][1] = rayon * (sin(TWO_PI*(i/float(reso))+TWO_PI*(1/float(reso*2))));
  }
}

void draw() {
  background(0);

  translate(width/2, height/2, 0);
  rotateX(radians(((height/2)-mouseY)/10.0));
  rotateY(radians((mouseX-(width/2))/10.0));

  /*
  // 1. Méthode longue
   for (int i=0; i<reso-1; i++) {
   // Premier triangle
   beginShape();
   vertex(pointsCercle[i][0], 0, pointsCercle[i][1]);
   vertex(pointsCercle[i+1][0], 0, pointsCercle[i+1][1]);
   vertex(pointsCercle[i][0], decalageY, pointsCercle[i][1]);
   endShape(CLOSE);
   // Second triangle
   beginShape();
   vertex(pointsCercle[i][0], decalageY, pointsCercle[i][1]);
   vertex(pointsCercle[i+1][0], decalageY, pointsCercle[i+1][1]);
   vertex(pointsCercle[i+1][0], 0, pointsCercle[i+1][1]);
   endShape(CLOSE);
   }
   // Il reste le dernier segment à construire
   // Premier triangle
   beginShape();
   vertex(pointsCercle[reso-1][0], 0, pointsCercle[reso-1][1]);
   vertex(pointsCercle[0][0], 0, pointsCercle[0][1]);
   vertex(pointsCercle[reso-1][0], decalageY, pointsCercle[reso-1][1]);
   endShape(CLOSE);
   // Second triangle
   beginShape();
   vertex(pointsCercle[reso-1][0], decalageY, pointsCercle[reso-1][1]);
   vertex(pointsCercle[0][0], decalageY, pointsCercle[0][1]);
   vertex(pointsCercle[0][0], 0, pointsCercle[0][1]);
   endShape(CLOSE);
   */






  // 2. Méthode optimisée, avec le mode TRIANGLE_STRIP
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<=reso; i++) {
    if (i == reso) {
      vertex(pointsCercle[0][0], -decalageY, pointsCercle[0][1]);
      vertex(pointsCercle2[0][0], decalageY, pointsCercle2[0][1]);
    } 
    else {
      vertex(pointsCercle[i][0], -decalageY, pointsCercle[i][1]);
      vertex(pointsCercle2[i][0], decalageY, pointsCercle2[i][1]);
    }
  }
  endShape();
}