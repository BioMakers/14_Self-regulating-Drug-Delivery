const int pwmpin = 5;
const int apin = A0;

int sensorval = 0;
int dutycycle = 255;
bool rampup = true;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  analogWrite(pwmpin, dutycycle);
  if(rampup) dutycycle++;
  else dutycycle--;
  if(dutycycle >= 255) {
    rampup = false;
    dutycycle = 255;
  }
  if(dutycycle <= 0) {
    rampup = true;
    dutycycle = 0;
  }
  sensorval = analogRead(apin);
  float voltage = sensorval * (5.0 / 1023.0);
  Serial.println(voltage);
  delay(4);
}
