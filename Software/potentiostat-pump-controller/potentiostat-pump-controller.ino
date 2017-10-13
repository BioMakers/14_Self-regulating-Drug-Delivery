#include <Wire.h>
#define DAC_ADD 0x48 // Digital to Analog Converter Address for I2C communication
#define DAC_DATA_REG 0x00 // Data Register address of DAC for I2C communication
#define PROX_ADD 0x60 // Proximity sensor address for I2C communication
#define ALS_CONF 0x00 // Ambient Light Sensor Config Register address for Proximity sensor address for I2C communication
#define ALS_REG 0x09 // Ambient Light Sensor Data Register for Proximity sensor address for I2C communication

//Flow control variables
const int REST = 0;
int func = 0;
byte commandbuffer[5];

//Potentiostat Sweep Variables
const int SWEEP = 1;
int DACLevel = 0; //range from 0-255
int DACMax = 255; //range from 0-255
int DACMin = 0; //range from 0-255
int DACDelay = 0; //in milliseconds
int DACIncreasing = true;
float resistanceused = 10000;

//Pin Values
int TSA5017in1 = 12;
int TSA5017in2 = 13;

//Potentiostat Sweep
int runSweep() {
  Wire.beginTransmission(DAC_ADD);
  Wire.write(DAC_DATA_REG);
  Wire.write(DACLevel);
  Wire.endTransmission();
  int sensorval = analogRead(A0);
  float voltage = (sensorval / 1023.0 * 5.0);
  float current = voltage / resistanceused;
  Serial.print(DACLevel / 256.0 * 3.3,3);
  Serial.print(" ");
  Serial.print((float)(voltage-1.024)/resistanceused,10);
  Serial.print("\n");
  if(DACIncreasing) DACLevel++;
  else DACLevel--;
  if(DACLevel == DACMax || DACLevel == DACMin) func = 0;
  delay(DACDelay);
}

boolean increasing = true;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(TSA5017in1, OUTPUT);
  pinMode(TSA5017in2, OUTPUT);
  Wire.begin();
  digitalWrite(TSA5017in1,LOW);
  digitalWrite(TSA5017in2,LOW);
}

void loop() {
  //Check input from serial
  if(Serial.available()) {
    Serial.readBytes(commandbuffer,5);
    func = commandbuffer[0];
    switch(func) {
      case SWEEP:
        DACMax = commandbuffer[1];
        DACMin = commandbuffer[2];
        DACIncreasing = (commandbuffer[3] == byte(0)) ? true : false;
        DACDelay = commandbuffer[4];
        DACLevel = (DACIncreasing) ? DACMin : DACMax;
        break;
      default:
        break;
    }
  }
  if(func == SWEEP) runSweep();
}
