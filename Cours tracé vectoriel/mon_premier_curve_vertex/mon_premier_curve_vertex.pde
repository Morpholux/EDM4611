size(600,600);

int l1x = 300;
int l1y = 100;
//circle(l1x, l1y, 10);

int [] ptsX = {500, 300, 100, 300};
int [] ptsY = {300, 500, 300, 100};

// option avec boucle for
noFill();
beginShape();
curveVertex(ptsX[ptsX.length-1], ptsY[ptsX.length-1]); // levier premier point
for (int i = 0; i <= ptsX.length; i++) {
  curveVertex(ptsX[i%ptsX.length], ptsY[i%ptsX.length]); // remarquer l’usage du modulo afin de créer un dernier pont d’ancrage èa la même position que le premier ancrage
}
//curveVertex(ptsX[0], ptsY[0]);
curveVertex(ptsX[1], ptsY[1]); // levier dernier point
endShape(CLOSE);


//curveTightness(0.5);
//noFill();
//beginShape();
//curveVertex(l1x, l1y); // levier premier point
//// dessin du tracé à partir d’ici
//curveVertex(500, 300); // premier ancrage
//curveVertex(300, 500); // deuxième ancrage
//curveVertex(100, 300); // troisième ancrage
//curveVertex(300, 100); // quatrième ancrage
//curveVertex(500, 300); // cinquième ancrage = premier ancrage
//// fin du tracé visible
//curveVertex(300, 500); // levier dernier point
//endShape(CLOSE);
