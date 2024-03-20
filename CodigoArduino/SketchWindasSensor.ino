#include "DHT.h" // Biblioteca DHT11
#define dht_type DHT11 //Definir tipo DHT11

int dht_pin = A0; // Definir Pino Analogico 0 para sensor DHT
DHT dht_1 = DHT(dht_pin, dht_type); // Declarar tipo do dht
int pinoSensor = 7; // Definir Pino Digital do sensor XXXX

void setup() {
  pinMode(pinoSensor, INPUT); //Iniciar entrada do Pino do sensor XXXX
  Serial.begin(9600); // Define a taxa de bits em 9600 p/ Seg.
  dht_1.begin(); // inicia dht 1
}

void loop() {
  float umidade = dht_1.readHumidity(); // Define variavel Umidade com valor Float da biblioteca DHT
  float temperatura = dht_1.readTemperature(); // Define variavel Temperatura com valor Float da biblioteca DHT
  Serial.print("Status:") //imprime no monitor Serial Status
  if(digitalRead(pinoSensor) == LOW){ // Se o sensor detectar algo.
  Serial.print(1); // Imprime 1 para sim no monitor serial 
  Serial.print(" , "); // separa os valores no monitor serial
  }
  else { // Se sensor estiver livre.
  Serial.print(0);// Imprime 0 para não no monitor serial 
  Serial.print(" , ");// separa os valores no monitor serial
  }
  if(isnan(temperatura) or isnan(umidade)){ // Se houver algum erro e não devolver os dados em numeros exibe a mensagem:
    Serial.println("Erro ao ler");  // ERRO AO LER
  } else { 
    Serial.print("Umidade:"); //imprime no monitor Serial 
    Serial.print(umidade);//imprime no monitor Serial Valor da Umidade
    Serial.print(" , "); //imprime no monitor Serial Dividindo valores
    Serial.print("Temperatura:"); //imprime no monitor Serial 
    Serial.println(temperatura); //imprime no monitor Serial valor da Temperatura e iniciando uma nova linha na sequencia


    
  }
  delay(1000);// Tempo para consultar os dados novamente
}