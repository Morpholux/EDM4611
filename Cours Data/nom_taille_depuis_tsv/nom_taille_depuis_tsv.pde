// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.5.4
// mardi, 21 septembre 2021

Table table;
int nbItems = 0;
String [] prenoms;
int [] tailles;

PFont font;


void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  
  table = loadTable("nom_taille.tsv", "header");

  //println(table.getRowCount() + " total rows in table"); // exclusion de l’en-tête
  
  nbItems = table.getRowCount();
  //println("Nous avons " + str(nbItems) + " personnes :");
  
  // Méthode traditionnelle
  
  prenoms = new String[nbItems];
  tailles = new int[nbItems];


  for (int i = 0; i < nbItems; i++) {
    TableRow rang = table.getRow(i);
    prenoms[i] =  rang.getString(0);
    tailles[i] =  rang.getInt(1);
    
  }
  
  printArray(prenoms);
  println();
  printArray(tailles);
  
  
  font = loadFont("Baskerville-24.vlw");
  textFont(font, 24);
  textAlign(CENTER);


// Selon la fiche sur le de Processing
  //for (TableRow row : table.rows()) {

  //  String prenom = row.getString("prénom");
  //  int taille = row.getInt("taille en pouces");


  //  println(prenom + " mesure " + taille + " pouces");
  //}
  
  
  
}

void draw() {
  background(0);
  
  translate(0, height-100);
  
  for (int i = 0; i < nbItems; i++) {
    rect((200-25) + (i* 200), 0 - tailles[i]*6, 50, tailles[i]*6);
    //text(prenoms[i], 200 + (i* 200), 0 + 30);
    
    text(table.getRow(i).getString(0), 200 + (i* 200), 0 + 30);
  }
  
}
