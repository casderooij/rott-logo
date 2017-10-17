import processing.pdf.*;

PFont boldFont;
PFont normalFont;

String R = "R";
String O = "O";
String T1 = "T";
String T2 = "T";

int spaceBorder = 60;

int lineSpace = 50;

float randomNum = random(1, 2000);

PVector v1, v2, v3, v4;

void setup() {
  v1 = new PVector(random(0 + spaceBorder, 200 - spaceBorder), random(0 + spaceBorder, 300 - spaceBorder));
  v2 = new PVector(random(0 + spaceBorder, 200 - spaceBorder), random(301 + spaceBorder, 600 - spaceBorder));
  v3 = new PVector(random(201 + spaceBorder, 400 - spaceBorder), random(0 + spaceBorder, 300 - spaceBorder));
  v4 = new PVector(random(201 + spaceBorder, 400 - spaceBorder), random(301 + spaceBorder, 600 - spaceBorder));
  
  size(400, 600);
  pixelDensity(2);
  background(255);
  beginRecord(PDF, "test" + randomNum + ".pdf");
  blendMode(MULTIPLY);
  
  boldFont = createFont("Futura-Bold", 72);
  normalFont = createFont("Futura-medium", 24);
  textFont(boldFont);
  textAlign(CENTER, CENTER);
  fill(0);
  text(R, v1.x, v1.y);
  text(O, v2.x, v2.y);
  text(T1, v3.x, v3.y);
  text(T2, v4.x, v4.y);
  
  strokeWeight(10);
  
  // R to O
  stroke(0, 255, 94);
  //stroke(255);
  noFill();
  beginShape();
  curveVertex(v1.x, v1.y);
  curveVertex(v1.x, v1.y + lineSpace);
  
  curveVertex(random(20, 250), random(200, 400));
  
  curveVertex(v2.x + random(-20, -10), v2.y - lineSpace + 20);
  curveVertex(v2.x, v2.y);
  endShape();
  
  // O to T
  stroke(255, 118, 118);
  //stroke(255);
  noFill();
  beginShape();
  curveVertex(v2.x, v2.y);
  curveVertex(v2.x + random(10, 20), v2.y - lineSpace + 20);
  
  curveVertex(random(120, 350), random(200, 400));
  
  curveVertex(v3.x - 10, v3.y + lineSpace);
  curveVertex(v3.x, v3.y);
  endShape();
  
  // T to T
  stroke(86, 97, 255);
  //stroke(255);
  noFill();
  beginShape();
  curveVertex(v3.x, v3.y);
  curveVertex(v3.x + random(10, 20), v3.y + lineSpace);
  
  curveVertex(random(260, 380), random(200, 400));
  
  curveVertex(v4.x, v4.y - lineSpace + 20);
  curveVertex(v4.x, v4.y);
  endShape();
  
  //textFont(normalFont);
  //text("Rotterdam Open Tafel Tennis", width/2, height/2);
}

void draw() {
}

void keyPressed() {
  if(key=='Q') {
    endRecord();
    exit();
  }
}