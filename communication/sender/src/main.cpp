#include <Arduino.h>
#define RXp2 16
#define TXp2 17
String st ="0.018006956204771996";
float f2=0.018006956204771996;
float arr[2]={0.4711245596408844,0.018006956204771996};

int flag=0;
//int f=20;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial2.begin(9600, SERIAL_8N1, RXp2, TXp2);
}
void loop() {
  Serial2.println(st);


/*
Serial.printf("Entre al loop %d",flag);
if(flag==0){
  Serial.println("Empiezo a imprimir");
  Serial2.println(sizeof(arr)/sizeof(arr[0]));
  Serial.printf("Mande tamaño %d \n",sizeof(arr)/sizeof(arr[0]));
  for (int i=0; i<sizeof(arr)/sizeof(arr[0]);i++){
    Serial.println("Estoy en el for "+String(f2,9));
    Serial2.println(String(arr[i],9));
  }
  //flag=-1;
  Serial.println("Termine de imprimir");
}
  delay(5000);

*/

  //Serial2.println(st);
  //Serial.print(st.toFloat(),8);
  delay(5000);


//Serial.printf("Flag es %d \n",flag); 
}  