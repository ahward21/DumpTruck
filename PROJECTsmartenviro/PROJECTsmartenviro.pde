import processing.serial.*; //import libary
Serial port;
float Temp;
float Humid;
String receivedString;
int end = 10;

void setup(){
  rectMode(CENTER);
  size(1000,1000);
  background(30,144,255);
  port = new Serial(this, Serial.list()[0], 9600);
}

void draw(){
  
  while (port.available () > 0) { //as long as there is data coming from serial port, read it and store it 
    receivedString = port.readStringUntil(end);
  }
  if (receivedString != null) {  //if the string is not empty, print the following

    String[] a = split(receivedString, ',');  // a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
    
    Temp= Float.parseFloat(a[0].trim()); //Make it a float
    Humid= Float.parseFloat(a[1].trim()); //Make it a float
  }
  
  //Draw background colour
  background(30,144,255);
  
  //Map the acquired value to the size of the screen
  println("The temperature is: ");
  println(Temp);
  println("Humidity is: ");
  println(Humid);
  
}
