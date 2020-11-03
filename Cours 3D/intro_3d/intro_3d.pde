// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 3 novembre 2020

int taille = 200;

void setup() {
  size(600, 600, P3D);
  fill(255);
  noStroke();

  //noFill();
  ////strokeWeight(30);
  //stroke(255);
  smooth(8);
  
  //hint(DISABLE_DEPTH_TEST);
}

void draw() {
  background(0);
  //lights();
  translate(width/2, height/2, 0);


  ambientLight(20, 20, 50);

  // Source ponctuelle comme des ampoules 360 degrés
  // Arguments : r, g, b, posx, posy, posz
  //pointLight(255, 0, 0, -100, 0, 100);
  //pointLight(0, 255, 255, 100, 0, -100);
  //pointLight(0, 255, 0, 0, -100, 0);
  //pointLight(255, 0, 255, 0, 100, 0);

  // rayons sont parallèles
  // Arguments : r, g, b, normaleEnX, normaleEnY, normaleEnZ
  directionalLight(150, 0, 0, 1, 1, -1); // 
  directionalLight(0, 255, 0, -1, -1, 1);

  // Rayons sous forme de faisceau (conique)
  // Arguments : r, g, b, posx, posy, posz, normaleEnX, normaleEnY, normaleEnZ, angle cone éclairage (radians), niveau de concentration (1-10000) 
  //spotLight(255,255,255, -200, 0, 200, 1 , 0, -1, radians(45), 1);


  // positionnement de la boîte
  pushMatrix();
  //rotateY(radians(frameCount%360));
  //rotateX(radians((frameCount*0.3)%360));

  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));


  translate(taille*0.5, taille*0.5, taille*0.5);
  box(taille);
  
  //sphereDetail(120); // 30 par défault, > implique plus de facettes, < implique moins
  //sphere(taille);
  popMatrix();
}
