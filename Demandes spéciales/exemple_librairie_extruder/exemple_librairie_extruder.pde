// Import extruder library
import extruder.*;

int profondeur;

// Frame tracker
int f = 0;

// Extruder object
extruder e;

// Square shape
PShape square;

// List of pshapes for box
PShape[] tbox;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Set stroke to black
  stroke(0);
  // Set fill to white
  fill(255);
  // Instantiate extruder object
  e = new extruder(this);
  // Create a 200px by 200px square around the center of the image
  square = createShape();
  square.beginShape();
  square.vertex(-50, -50);
  square.vertex(50, -50);
  square.vertex(50, 50);
  square.vertex(-50, 50);
  square.endShape(CLOSE);
  
  
  profondeur = 20;

  // Extrude square with z-depth of 100 and with box edges
  // "Box" edges are rectangular edges connecting each point
  // extrude function return 3 objects currently: the top plane, the sides, and the bottom plane
  tbox = e.extrude(
    square, 
    profondeur, 
    "box"
    );
}

// Draw scene
void draw() {
  // Draw over current scene with black
  background(0);
  // Set origin of scene to center of image
  translate(width/2, height/2, 0);
  // Rotate 3 degrees per frame on the y-axis
  rotateY(radians(f*3));
  
  translate(0, 0, 0-(profondeur*0.5));
  // Draw all returned pshapes
  for (PShape p : tbox) {
    shape(p);
  }
  // Increment frame counter
  f++;
}
