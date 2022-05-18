#include <Arduino.h>
#define RXp2 16
#define TXp2 17
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial2.begin(115200, SERIAL_8N1, RXp2, TXp2);
}
void loop() {
    Serial.println("Message Received: ");
    String data=Serial2.readString();
    Serial.println(data.toFloat(),8);
}