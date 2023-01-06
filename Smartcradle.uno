
#include <EEPROM.h>
#include <PubSubClient.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
#include<SD.h>
#include <SPI.h>
#include<FS.h>
File myFile;
String x;
const char* ssid = "Galaxy M31sCFBF";
const char* password = "udry7064";
const char* mqtt_server = "broker.hivemq.com";
WiFiClient client1;
WiFiClient client2;
WiFiClient espClient;
PubSubClient client(espClient);
int flag=0;
const char* serverName = "http://maker.ifttt.com/trigger/BABY
ALERT/with/key/gDbGLDlDUHY8CXSH0MwkqHX0IiEJCSgt09VgWWjAO11";
void setup() {
Serial.begin(115200);
pinMode(D2,INPUT);
WiFi.begin(ssid, password);
Serial.println("Connecting");
client.setServer(mqtt_server, 1883);
client.setCallback(callback);
while(WiFi.status() != WL_CONNECTED) {
delay(500);
Serial.print(".");
}
Serial.println("");
Serial.print("Connected to WiFi network with IP Address: ");
Serial.println(WiFi.localIP());
}
void call(){
if(digitalRead(D2)==LOW){
HTTPClient http;
Serial.println("Full");
http.begin(client1,"http://maker.ifttt.com/trigger/CRADLEWET/with/key/bahVEYeEL8d3ijNqE3-qI
C");
http.addHeader("Content-Type", "application/x-www-form-urlencoded");
String httpRequestData = "value1=" + String(random(40)) + "&value2=" +
String(random(40))+ "&value3=" + String(random(40));
int httpResponseCode = http.POST(httpRequestData);
Serial.print("HTTP Response code: ");
Serial.println(httpResponseCode);
http.end();
}
else{
Serial.println("Not Full");
}
}
void loop() {
if(flag==0){
call();
flag=1;
}}
