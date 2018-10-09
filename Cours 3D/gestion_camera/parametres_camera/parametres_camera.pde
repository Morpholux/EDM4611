
float focale = 60.0; // valeur par defaut = 60.0
// Un grand chiffre (160.0) donne l'illusion d'un sujet plus grand. // effet similaire au zoom.
// Un petit chiffre (30.0) agrandi le champ de vision, mais donne l'illusion d'un sujet plus petit.
float fov = 3.0; // Valeur du champ de vision (field of vue). // effet de perspective + ou - prononce.
float distanceCible = 0;  // Une grande valeur negative (-10000) repousse d'autant le point de visee de la camera vers l'horizon.

float cameraZ; // position point de vue dans axe des z

void setup() {
  size (400, 400, P3D);
  background(0);
  fill(100);
  stroke(255);
  cameraZ = (height/2.0) / tan(PI*focale / 360.0);
  perspective(PI/fov, width/height, cameraZ/10.0, cameraZ*10.0);
}

void draw() {
  background(0);

  camera(map(mouseX, 0, width, (width/2)-1000, (width/2)+1000), map(mouseY, 0, height, (height/2)-1000, (height/2)+1000), cameraZ, width/2, height/2, distanceCible, 0, 1, 0);
  // Ci-dessus, la camera est mobile, car son emplacement depend de la position de la souris (mouseX, mouseY).


  translate(width/2, height/2, 0);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, PI, -PI));
  box(150);
}
