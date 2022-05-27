#include <Arduino.h>
#define RXp2 16
#define TXp2 17

 float serial_data;
 unsigned char serial_buffer[4];
 float input2[16];
 int flag=0;
 int pos=0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial2.begin(115200, SERIAL_8N1, RXp2, TXp2);
}
void loop()
{
  if (flag==0){
    Serial2.write('*');
    Serial.println("Solicite datos");
    flag=1;
  }
  if(flag==2){
    for (int i=0; i<sizeof(input2)/sizeof(float);i++){
      Serial.println(input2[i],4);
    }
    Serial.println("------------------");
    flag=3;
  }
     
}
void serialEvent2(){
  if(Serial2.available()){
    if(flag==1){
      if (Serial2.readBytesUntil('<',serial_buffer, sizeof(float)) == sizeof(float)){
        memcpy(&serial_data, serial_buffer, sizeof(float));
        input2[pos]=serial_data;
        Serial.print("Asigne");
        Serial.println(serial_data,4);
        flag=1;
        pos++;
      }else{
        Serial.println("done");
        flag=2;
      }
    }

  }
}