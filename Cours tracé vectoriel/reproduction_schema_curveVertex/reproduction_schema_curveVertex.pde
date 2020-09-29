import processing.pdf.*;

size(600, 600);


beginRecord(PDF, "export.pdf");

translate(width*0.5, height * 0.5);



for (int i = 0; i < 360; i += int(360*0.125)) {
  pushMatrix();
  rotate(radians(i));
  
  curveTightness(map(i, 0, 360-(360*0.125), -2, 2));
  
  fill(255, map(i, 0, 360-(360*0.125), 0, 255), 60, 80);
  beginShape();
  curveVertex(0, -200);
  curveVertex(200, 0);
  curveVertex(0, 200);
  curveVertex(-200, 0);
  curveVertex(0, -200);
  curveVertex(200, 0);
  curveVertex(0, 200);
  endShape(CLOSE);
  
  popMatrix();
}

endRecord();
