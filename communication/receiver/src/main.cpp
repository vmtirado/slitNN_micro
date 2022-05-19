#include <Arduino.h>
#define RXp2 16
#define TXp2 17

 float serial_data;
 unsigned char serial_buffer[4];
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial2.begin(115200, SERIAL_8N1, RXp2, TXp2);
}
void loop()
{
 if (Serial2.readBytes(serial_buffer, sizeof(float)) == sizeof(float)){
   Serial.print("Asigne");
   memcpy(&serial_data, serial_buffer, sizeof(float));
   Serial.println(serial_data,4);
 }
     
}