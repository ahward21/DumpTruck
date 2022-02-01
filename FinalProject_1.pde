/*
This program is used to display received data from arduino and
calculate certain values

Made by:
Alexander Ward
Erik Schuit
Sariyeva Dana

Date: 31-01-2022
*/



//Importing libraries
import processing.serial.*;
//Importing fonts
PFont pixelFont;

//Defining objects
Serial port;
firstScene firstSceneClass;
secondScene secondSceneClass;


//State boolean
boolean firstScene = true;

//Defining variables to receive arduino data
float oilTemp;
float waterTemp;
String receivedString;
int end = 10;

//Defining variables for a timer
float time;
float wait = 1000;
float state = 0;


void setup() {
  size(800, 600, P3D);
  firstSceneClass = new firstScene();
  secondSceneClass = new secondScene();
  imageMode(CENTER);
  pixelFont = createFont("PixelGosub.otf", 50);
  textFont(pixelFont);
  time = millis();
  port = new Serial(this, Serial.list()[0], 9600);
}

void draw() {

  //Receive values from arduino
  while (port.available()  > 0) {
    receivedString = port.readStringUntil(end);
  }  
  if (receivedString != null) {  //if the string is not empty, print the following

    String[] a = split(receivedString, ',');  // a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)

    oilTemp= Float.parseFloat(a[0].trim()); //Make it a float
    waterTemp= Float.parseFloat(a[1].trim()); //Make it a float

    //Method to get values
    secondSceneClass.getValues(waterTemp, oilTemp, state);
  }

  //Displaying 2 different screens
  if (firstScene == true) {
    firstSceneClass.display();
  } else if (firstScene == false) {
    secondSceneClass.display();
    //Timer
    if (millis() - time >= wait) {
      state = 1;
      time = millis();
    } else {
      state = 0;
    }
  }
}

void mousePressed() {
  //If mouse is pressed, set boolean to false
  if (firstScene == true) {
    if (mouseX > width/2 - 253 && mouseX < width/2 + 253 && mouseY > height/2 - 198 && mouseY < height/2 + 198) {
      firstScene = false;
    }
  }
}
