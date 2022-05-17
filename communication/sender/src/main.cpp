#include <Arduino.h>
#define RXp2 16
#define TXp2 17
String st ="0.018006956204771996";
float f2=0.018006956204771996;
float arr[2]={0.471124,0.018006};

int flag=0;
//int f=20;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial2.begin(115200, SERIAL_8N1, RXp2, TXp2);
}
void loop() {

//Serial.printf("Entre al loop %d",flag);
if(flag==0){
  Serial.println("Empiezo a imprimir");
  Serial2.println(sizeof(arr)/sizeof(arr[0]));
  delay(500);

  Serial.printf("Mande tamaño %d \n",sizeof(arr)/sizeof(arr[0]));
  for (int i=0; i<sizeof(arr)/sizeof(arr[0]);i++){
    Serial.println("Estoy en el for "+String(arr[i],6));
    Serial2.println(String(arr[i],6));
  delay(500);
  }
  //flag=-1;
  Serial.println("Termine de imprimir");
}
  delay(500);



  //Serial2.println(st);
  //Serial.print(st.toFloat(),8);


//Serial.printf("Flag es %d \n",flag); 
}  