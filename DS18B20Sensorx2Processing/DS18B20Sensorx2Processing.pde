import processing.serial.*; //import libary
Serial port;
float oilTemp;
float waterTemp;
String receivedString;
int end = 10;

void setup(){
  rectMode(CENTER);
  size(1000,1000);
  background(30,144,255);
  
  port = new Serial(this, Serial.list()[4], 9600);
}

void draw(){
  
  if (port.available()  > 0){
    receivedString = port.readString();
  }
  
  if (receivedString != null) {  //if the string is not empty, print the following

  // print(receivedString);
    String[] a = split(receivedString, ',');  // a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
    
    oilTemp= Float.parseFloat(a[0].trim()); //Make it a float
    waterTemp= Float.parseFloat(a[1].trim()); //Make it a float
  }
  
  //Draw background colour
  background(30,144,255);
  
  
  //Map the acquired value to the size of the screen
  println("The temperature of the oil is: ");
  println(oilTemp);
  println("The temperature of the water is: ");
  println(waterTemp);
  
}
