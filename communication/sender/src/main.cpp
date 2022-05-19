#include <Arduino.h>
#define RXp2 16
#define TXp2 17
String st ="0.018006956204771996";
float f2=0.018006956204771996;
float arr[2]={0.471124,0.018006};

int flag=0;

//int f=20;
union float_split
{
    uint8_t     fBytes[sizeof( float )];
    float       fValue;
};
float_split flt;
void setup() {
  // put your setup code here, to run once:
  flt.fValue=0.471124;
  Serial.begin(9600);
  Serial2.begin(115200, SERIAL_8N1, RXp2, TXp2);
}

void loop()
{    
  
    Serial2.write( flt.fBytes, sizeof( float ) );
    Serial.println(flt.fValue,4);

    delay(1000);
    
}