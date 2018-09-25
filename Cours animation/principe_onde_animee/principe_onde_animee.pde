// Étapes menant à la construction d'une onde en mouvement

float posX, posY, amplitude = 40, variationY, variationY2, temps = 0, vitesseOndulation, cycleComplet, sousCycle;
int debutX = 100, finX = 500, pas=10, distanceX;
color couleur1, couleur2, couleur3;

void setup() {
  size(600,800);
  background(0);
  couleur1 = color(200,150,0);
  couleur2 = color(150,240,50);
 couleur3 = color(127,127,200); 


  noStroke();
  smooth();
  rectMode(CENTER);

  // Il faut alléger le draw de tous les calculs pouvant être faits une fois seulement.
  // Longeur à parcourir
  distanceX = finX-debutX;

  // Longeur d'un cycle complet
  cycleComplet = TWO_PI/float(distanceX);
  // Longueur du 1/5 du cycle complet
  sousCycle = (TWO_PI*5)/float(distanceX);


}


void draw() {
  background(0);

  // En ligne droite
  fill(couleur3);
  posY = 50;
  for (int i = debutX; i<finX; i+=pas) {
    ellipse(i, posY, 5, 5);
  }

  // Onde fixe simple
  posY = 150;
  for (int i = debutX; i<finX; i+=pas) {
    // Suivant une fonction sin complète
    variationY = sin((i-debutX)*cycleComplet);
    // Il faut multiplier par un facteur d'amplitude sinon les variations demeurent entre -1 et 1
    variationY*=amplitude;
    ellipse(i, (posY+variationY), 5, 5);
  }

  // Onde fixe double (une petite onde le long de l'onde principale)
  posY = 240;
  for (int i = debutX; i<finX; i+=pas) {
    // Suivant une fonction sin complète
    variationY = sin((i-debutX)*cycleComplet);
    variationY *= amplitude;

    // Une onde cinq fois plus rapide cette fois :
    // Un tour complet étant égal à deux*PI, le multiple qui suit TWO_PI indique le nombre de cycles à faire
    variationY2 = sin((i-debutX)*sousCycle);
    // Le facteur d'amplitude est moindre que celui de la courbe principale
    variationY2 *= amplitude*0.3;
    ellipse(i, (posY+variationY+variationY2), 5, 5);
  }

  // Onde fixe simple animée
  // On utilise les millisecondes pour faire avancer l'état actuel de l'onde
  fill(couleur1);
  posY = 350;
  vitesseOndulation = 0.0005; // Servira à diminuer le nombre de millisecondes
  // Plus le chiffre sera petit, plus l'animation de l'onde sera lente, indépendamment de son amplitude.
  for (int i = debutX; i<finX; i+=pas) {
    temps += (millis()%i)*vitesseOndulation;
    // IMPORTANT : millis() est borné par un modulo, de telle sorte qu'à la fin de la boucle, on remet le compteur à 0.
    // Si on oublie le modulo, la décalage de l'onde ne cessera de croître et le dessin se déplacera vers le bas du sketch.
    // La valeur à inscrire après le modulo (%) est la valeur i.
    // Il faut maintenant insérer notre minuterie cyclique dans la formule :
    variationY = sin(((i-debutX)+temps)*cycleComplet);
    variationY*=amplitude;
    ellipse(i, (posY+variationY), 5, 5);
  }

  // Onde fixe simple animée avec perte d'énergie
  fill(couleur2);
  posY = 440;
  vitesseOndulation = 0.0005;
  for (int i = debutX; i<finX; i+=pas) {
    temps += (millis()%i)*vitesseOndulation;
    variationY = sin(((i-debutX)+temps)*cycleComplet);
    // Pour plus de réalisme, on peut utiliser la valeur de i pour faire varier l'effet de l'amplitude le long de l'onde.
    variationY*=(amplitude*0.2)+((i*i)/(4000));
    // La multiplication de i*i apporte les avantages d'une fonction croissante exponentielle.
    // Les changements à l'intensité de l'amplitude se feront sentir de plus en plus.
    // Il faut toutetois s'assurer de diviser la valeur maximum par un chiffre suffisamment grand(ici, 4000).
    rect(i, (posY+variationY), 5, 5);
  }

  // Onde double animée (uniquement les petits lacets).
  fill(couleur1);
  posY = 550;
  vitesseOndulation = 0.0001; // Le chiffre est encore plus petit que pour l'exemple ci-dessus
  for (int i = debutX; i<finX; i+=pas) {
    temps += (millis()%i)*vitesseOndulation;
    variationY = sin(((i-debutX))*cycleComplet);
    variationY*=amplitude;

    // Il faut insérer notre minuterie cyclique dans la formule de la petite onde :
    variationY2 = sin((i-debutX+temps)*sousCycle);
    // Le facteur d'amplitude est moindre que celui de la courbe principale
    variationY2 *= amplitude*0.3;
    ellipse(i, (posY+variationY+variationY2), 5, 5);
  }

  // Onde double animée au complet.
  fill(couleur2);
  posY = 670;
  vitesseOndulation = 0.0001;
  for (int i = debutX; i<finX; i+=pas) {
    temps += (millis()%i)*vitesseOndulation;
    // Minuterie cyclique dans la formule de la grande onde :
    variationY = sin(((i-debutX+temps))*cycleComplet);
    // formule avec perte d'énergie
    variationY*=(amplitude*0.2)+((i*i)/(4000));

    // Minuterie cyclique dans la formule de la petite onde :
    variationY2 = sin((i-debutX+temps)*sousCycle);
    // formule avec perte d'énergie
    // Le facteur d'amplitude est moindre que celui de la courbe principale
    // Inversement avec le diviseur : 16000 au lieu de 4000. Les distances d'oscillation pour la petite onde sont plus restreintes.
    variationY2 *= (amplitude*0.005)+((i*i)/(16000));
    rect(i, (posY+variationY+variationY2), 5, 5);
  }

}

