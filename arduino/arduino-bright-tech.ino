#include <DHT.h> //incluindo biblioteca do DHT11
#include <DHT_U.h>
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <DHT_U.h>
#include "DHT.h"
#define DHTPIN A0 //definindo variáveis e a localização do pin
#define LM35PIN A1
DHT dht(DHTPIN, DHT11); //uma variável que está sendo puxada da biblioteca

void setup() //comando para iniciar o programa
{
pinMode(DHTPIN, INPUT); //declarando que a porta do DHTPIN é para entrada de dados
Serial.begin(9600); //definindo que a comunicação será em 9600bps(bits per seconds)
dht.begin(); //dando start na biblioteca do DHT
}

void loop() //criada a subrotina de loop de todo o bloco de comando abaixo
{
float dht11_umidade = dht.readHumidity(); //declarando o tipo de variável, neste caso, 'float'
float dht11_temperatura = dht.readTemperature();
Serial.print("Umidade:");
Serial.print(dht11_umidade); 
Serial.print("%");
Serial.print(";");
Serial.print("U-Temp:"); 
Serial.print(dht11_temperatura);
Serial.print(";");
float lm35_temperatura = analogRead(LM35PIN);
lm35_temperatura = lm35_temperatura * 0.00488; // operação para transformar pulso em temperatura | '0.00488' é a voltagem de pulsos que o sensor capta
lm35_temperatura = lm35_temperatura * 100; 
Serial.print("Temperatura:");
Serial.print(lm35_temperatura);
Serial.print(";");
Serial.println(); //pula uma linha para ficilitar a leitura
delay(5000); //fica no loop e tem delay de 5 segundos para recomeçar o loop
}
