#include <Arduino.h>
#define RXp2 16
#define TXp2 17

float f2=0.018006956204771996;
float arr[16]={0.0,0.4711245596408844,0.0,0.0,0.0,0.118006956204771996,0.0,0.0,0.0,0.3355330228805542,0.7829717397689819,0.13247789442539215,0.08387140184640884,0.0,0.3705844581127167,0.0};
int cont =0;
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
  
  Serial.begin(9600);
  Serial2.begin(115200, SERIAL_8N1, RXp2, TXp2);
}

void loop()
{ 
if(flag==0){
  if(Serial2.available()){
    char data=Serial2.read();
    if(data=='*'){
      Serial.println("receiver solicito envio");
      flag=1;
    }
  }
}    
if(flag==1){
  Serial.println("Entre a flag 1");
  delay(1);
    for(int i=0; i<sizeof(arr)/sizeof(arr[0]);i++){
    flt.fValue=arr[i];
    Serial2.write( flt.fBytes, sizeof( float ) );
    Serial.println(flt.fValue,4);
  delay(1);

  }
 // cont++;
  Serial2.write('<');  
  flag=0;
} 
    
}
