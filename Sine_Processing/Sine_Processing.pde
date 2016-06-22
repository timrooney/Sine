//import processing.pdf.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float value;
float thickness = 5;

int xspacing = 1;   // How far apart should each horizontal location be spaced
int w;// Width of entire wave

int r;
int g;
int b;
//int x2;
//int x;

float theta = 0.01;  // Start angle at 0
float amplitude = 300.0;  // Height of wave
float period = 500;  // How many pixels before the wave repeats
//float period2 = 500;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
//float dx2;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/period")==true)
  {
    period = theOscMessage.get(0).floatValue();
  //  print(period);
  }
   if (theOscMessage.checkAddrPattern("/r")==true)
  {
    r = theOscMessage.get(0).intValue();
   // print(r);
  }
     if (theOscMessage.checkAddrPattern("/g")==true)
  {
    g = theOscMessage.get(0).intValue();
   // print(g);
  }
     if (theOscMessage.checkAddrPattern("/b")==true)
  {
    b = theOscMessage.get(0).intValue();
   // print(b);
  }
    if (theOscMessage.checkAddrPattern("/xspacing")==true)
  {
    xspacing = theOscMessage.get(0).intValue();
    print(xspacing);
  }
}

void setup() {
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("10.2.88.210", 12001);

  //beginRecord(PDF,"test.pdf");
  
  size(1400, 800);
  w = width+1000;
  yvalues = new float[w/xspacing];
  
//fullScreen();
}

void draw() {
    if (keyPressed == true) {
  exit();
  }
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {

  dx = (TWO_PI / period) * xspacing;
 // dx2 = (TWO_PI / period2) * xspacing;
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.08;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
 //   x2+=dx2;
  }
}

void renderWave() {
  noStroke();

  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    fill(r,g,b); 
    ellipse(x*xspacing -80, height/2+yvalues[x], thickness, thickness);
  fill(r-20,g-20,b-20); 
      ellipse(x*xspacing-70, height/2+yvalues[x], thickness, thickness);
 fill(r-40,g-40, b-40);
  ellipse(x*xspacing-60, height/2+yvalues[x], thickness, thickness);
 fill(r-60,g-60, b-60);
   ellipse(x*xspacing-50, height/2+yvalues[x], thickness, thickness);
  fill(r-80,g-80, b-80); 
 ellipse(x*xspacing-40, height/2+yvalues[x], thickness, thickness);
 fill(r-100,g-100, b-100);
       ellipse(x*xspacing-30, height/2+yvalues[x], thickness, thickness);
 fill(r-120,g-120, b-120);
    ellipse(x*xspacing-20, height/2+yvalues[x], thickness, thickness);
 fill(r-140,g-140, b-140);
  //  ellipse(x*xspacing-10, height/2+yvalues[x], thickness, thickness);
 noStroke();
 
} 

}

//void mousePressed(){
    
 //endRecord();
//}