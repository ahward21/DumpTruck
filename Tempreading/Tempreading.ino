//TEMP SENSING

#include "DHT.h"
#define DHTPIN 2 
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600);
  dht.begin();
}

void loop() {
  
 delay(1000);
 float humid = dht.readHumidity();
 float tempC = dht.readTemperature();

 Serial.print(humid);
 Serial.print(",");
 Serial.print(tempC); 
 Serial.print(" ");
 

  
}
