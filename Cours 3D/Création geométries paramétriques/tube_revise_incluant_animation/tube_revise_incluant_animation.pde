// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// lundi, 9 novembre 2020

// Variables globales
int nbSegments = 40;

int nbPoints = nbSegments + 1;
float rayonIdeal = 200;
float hauteurStrip = 10;

int nbStrips = 30;

int nbAnneaux = nbStrips + 1;


ArrayList <Anneau> anneaux = new ArrayList<Anneau>();


class Anneau {
  PVector [] pts;
  float rayon;
  float [] lutCos;
  float [] lutSin;
  float posZ;

  // Constructeur
  Anneau(int _points, float _rayonIdeal, float _posZ) {
    pts = new PVector [_points];
    rayon = _rayonIdeal;
    posZ = _posZ;

    // Lookup Table
    lutCos = new float [_points];
    lutSin = new float [_points];

    for (int i = 0; i < _points; i++) {
      float rad = map(i, 0, nbPoints - 1, 0, TWO_PI);
      lutCos[i] = cos(rad); // x
      lutSin[i] = sin(rad); // y
      pts[i] = new PVector(lutCos[i], lutSin[i], posZ);
    }
  }

  // Methode
  void update() {
    for (int i = 0; i < pts.length; i++) {
      float px = rayon * lutCos[i];
      float py = rayon * lutSin[i];
      pts[i] = new PVector(px, py, posZ);
    }
  }
}


void setup() {
  size(800, 800, P3D);
  fill(255);
  stroke(100);
  smooth(8);

  // Création des anneaux
  for (int i = 0; i < nbAnneaux; i++) {
    Anneau tempAnneau = new Anneau(nbPoints, rayonIdeal, 0 - (i*hauteurStrip));
    anneaux.add(tempAnneau);
  }
}

void draw() {
  background(0);

  translate(width/2, height/2, 0);
  lights();
  
  
  pushMatrix();
  translate(0, 50, 0);
  rotateX(radians(-135));
  

  // Animation des anneaux ou du tube
  for (int i = 0; i < anneaux.size(); i++) {
    float dephase = map(i, 0, anneaux.size()-1, 0, 800); //en millisecondes
    float rayonReduit = map(i, 0, anneaux.size()-1, rayonIdeal, rayonIdeal*0.25); 
    float deltaRayon = 10;
    float vitesseOscillation = 0.01;
    anneaux.get(i).rayon = rayonReduit + (deltaRayon * (sin((millis() + dephase) * vitesseOscillation)));
    anneaux.get(i).update();
  }


  // Dessin de nos géométries
  for (int j = 0; j < nbStrips; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < nbPoints; i++) {
      vertex(anneaux.get(j).pts[i].x, anneaux.get(j).pts[i].y, anneaux.get(j).pts[i].z);
      vertex(anneaux.get(j+1).pts[i].x, anneaux.get(j+1).pts[i].y, anneaux.get(j+1).pts[i].z);
    }
    endShape();
  }
  
  popMatrix();
  
  // dessiner autre chose besoin
}
