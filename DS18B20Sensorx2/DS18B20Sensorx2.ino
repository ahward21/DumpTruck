// Team DumpTruck
//TEMP SENSING for DS18B20 

#include <OneWire.h>         //importing required libraries 
#include <DallasTemperature.h>
#define ONE_Wire_Bus_1 8      // defining the data ports
#define ONE_Wire_Bus_2 7

OneWire oneWire_OIL(ONE_Wire_Bus_1);          //assigning ports to variables within the library ONEWire
OneWire oneWire_WATER(ONE_Wire_Bus_2);

DallasTemperature sensor_OIL(&oneWire_OIL);   //assigning Oil, Water as Temp sensors using Dallas library 
DallasTemperature sensor_H20(&oneWire_WATER);

float oilTemp = 0;      //inital value 
float waterTemp = 0;    // variable declaration 


void setup() {
  Serial.begin(9600);   //communicate to serial
  sensor_OIL.begin();   //initiate 'sensing'
  sensor_H20.begin();

}

void loop() {
  sensor_OIL.requestTemperatures(); //asks for temperature using the Dalla Temp library 
  sensor_H20.requestTemperatures();
  
  oilTemp = sensor_OIL.getTempCByIndex(0);      //specifies Celcius 
  waterTemp = sensor_H20.getTempCByIndex(0);


 //Serial.print("Oil Temp - ");
 Serial.print(oilTemp);       //prints the sensor date
 Serial.print(",");
// Serial.print("Water Temp - ");
 Serial.println(waterTemp);   // sends data seperated via , and the split character 


  delay(1000);          //pause for data (to be removed/ decreased)


}
