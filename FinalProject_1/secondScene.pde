/*
The purpose of this class is to display an overview of
all the received data from arduino on a template
*/


class secondScene {
  
  //Variables for background display
  float yoff = 0.0;
  float yOff = 0.0;
  int fluidX = 50;
  int fluidY = 200;

  //Variables for displaying information
  float initialTemp = 13; //C
  float finalTemp; //C
  float oilTemp; //C
  float differenceTemp; //C  
  float massWater = 0.0005; //Kg
  float tubeVariable = 12.5;
  float c_water = 4186; //J/Kg C
  float energy; //KJ
  float gainedEnergy; //KJ 


  secondScene() {
    rectMode(CENTER);
    imageMode(CENTER);
  }


  // 2nd dimension of perlin noise
  void display() {
    background(color(35, 48, 84));
    display1();
    display2();
    strokeWeight(4);
    stroke(1);
    translate(232, 192, 0); 
    rotateY(1);
    noFill();
    box(210, 100, 160);
    translate(0, -40, 0); 
    noFill();
    box(230, 10, 170);
    fill(0);
    translate(0, 90, 0);
    box(210, 10, 160);
    translate(0, -320, -450);
    beginShape();
    fill(0);
    curveVertex(width/2 - 100, height/2 - 150, 125);
    curveVertex(width/2 - 100, height/2- 150, 125);
    curveVertex(width/2 - 90, height/2 - 10-150, 125);
    curveVertex(width/2 - 50, height/2 - 15- 150, 125);
    curveVertex(width/2 - 20, height/2 - 40- 150, 125);
    curveVertex(width/2 - 15, height/2 - 30- 150, 125);
    curveVertex(width/2, height/2 - 40- 150, 125);
    curveVertex(width/2 + 15, height/2 - 30- 150, 125);
    curveVertex(width/2 + 20, height/2 - 40- 150, 125);
    curveVertex(width/2 + 50, height/2 - 15- 150, 125);
    curveVertex(width/2 + 90, height/2 - 10- 150, 125);
    curveVertex(width/2 + 100, height/2- 150, 125);
    curveVertex(width/2 + 90, height/2 + 10-150, 125);
    curveVertex(width/2 + 50, height/2 + 15- 150, 125);
    curveVertex(width/2 + 20, height/2 + 40- 150, 125);
    curveVertex(width/2 + 15, height/2 + 30- 150, 125);
    curveVertex(width/2, height/2 + 40- 150, 125);
    curveVertex(width/2 - 15, height/2 + 30- 150, 125);
    curveVertex(width/2 - 20, height/2 + 40- 150, 125);
    curveVertex(width/2 - 50, height/2 + 15- 150, 125);
    curveVertex(width/2 - 90, height/2 + 10- 150, 125);
    curveVertex(width/2 - 100, height/2- 150, 125);
    curveVertex(width/2 - 100, height/2- 150, 125);
    endShape();
    fill(243, 209, 115);
    noStroke();
    //We are going to draw a polygon out of the wave points
    beginShape(); 
    float xoff = 0;       // Option #1: 2D Noise
    //float xoff = yoff; // Option #2: 1D Noise
    int p = 0;
    // Iterate over horizontal pixels
    for (float x = 270; x <= width; x += 10) {
      // Calculate a y value according to noise, map to 
      float y = map(noise(xoff, yoff), 0, 1, fluidX, fluidY); // Option #1: 2D Noise
      // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
      // Set the vertex
      vertex(x, y ); 
      // Increment x dimension for noise
      xoff += 0.05;
    }
    // increment y dimension for noise
    yoff += 0.01;
    vertex(width, height/2 - 55);
    vertex(270, height/2 - 55);
    endShape(CLOSE);


    //

    beginShape(); 

    // Iterate over horizontal pixels
    for (float x = 70; x <= 270; x += 10) {
      // Calculate a y value according to noise, map to 
      float y = map(noise(xoff, yoff), 0, 1, fluidX, fluidY); // Option #1: 2D Noise
      // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise

      // Set the vertex
      vertex(x, y + 50); 
      // Increment x dimension for noise
      xoff += 0.05;
    }
    vertex(270, height/2 - 25, 0);
    vertex(70, height/2 - 25, 0);
    endShape(CLOSE);
    noStroke();
    //fill(color(234,182,118));
    fill(color(226, 135, 67));
    translate(0, 170, 360);
    box(10, 160, 10);
    fill(color(135, 62, 35));
    translate(0, -50, 0);
    box(20, 20, 20);
    fill(64);
    translate(-10, 0, 0);
    box(10, 20, 10);
    //
    fill(color(226, 135, 67));
    translate(-60, 90, 0);
    box(10, 70, 10);
    fill(color(226, 135, 67));
    translate(-30, -30, 0);
    box(70, 10, 10);
    fill(0);
    box(20, 20, 20);
    fill(64);
    translate(-35, 55, 0);
    box(5, 100, 10);
    stroke(1);
    fill(0);
    translate(130, 10, 0);
    box(10, 100, 50);
    noStroke();
    fill(255);
    translate(-90, 60, 140);
    box(10, 10, 10);
    fill(255);
    stroke(0);
    translate(50, 150, 0);
    box(220, 190, 100);
    fill(0);
    box(220, 130, 100);
    fill(255);
    translate(-40, 80, 10);
    box(300, 30, 30);
    
    //Display gained energy, in the form of hot water
    textSize(20);
    text("Energy Gained (Kj):", -70, -110, 50);
    textSize(40);
    text(gainedEnergy, -100, -30, 50);
  }

  //Displays the first part of received values
  void display1() {
    fill(255);
    rect(width/2 + 250, height/2 - 150, 250, 250);
    fill(0);
    textSize(20);
    text("initial WaterTemp:", width/2 + 129, height/2 - 250);
    text(initialTemp, width/2 + 129, height/2 - 200);
    text("final WaterTemp:", width/2 + 129, height/2 - 150);
    text(finalTemp, width/2 + 129, height/2 - 100);
  }

  //Displays the second part of received values
  void display2() {
    fill(255);
    rect(width/2 + 250, height/2 + 150, 250, 250);
    fill(0);
    textSize(20);
    text("oil Temp:", width/2 + 129, height/2 + 50);
    text(oilTemp, width/2 + 129, height/2 + 100);
    text("Temp Difference:", width/2 + 129, height/2 + 150);
    text(differenceTemp, width/2 + 129, height/2 + 200);
  }  
  
  void getValues(float temp1, float temp2, float state) {
    finalTemp = temp2;
    oilTemp = temp1;
    differenceTemp = finalTemp - oilTemp;
    energy = -1 * ((c_water * massWater * tubeVariable * differenceTemp) / 100);
    if (state == 1) {
      gainedEnergy += energy;
    }
  }  
}
