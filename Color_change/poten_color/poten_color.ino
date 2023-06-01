
int redPot = A0;
int greenPot = A1;
int bluePot = A2;

String color;

void setup() {
  Serial.begin(9600);

  pinMode(redPot, INPUT);
  pinMode(greenPot, INPUT);
  pinMode(bluePot, INPUT);
  
  pinMode(8, INPUT_PULLUP);
  pinMode(9, INPUT_PULLUP);
}

void loop() {
  int red = map(analogRead(redPot), 0, 1023, 0, 255);
  int green = map(analogRead(greenPot), 0, 1023, 0, 255);
  int blue = map(analogRead(bluePot), 0, 1023, 0, 255);

  if(digitalRead(8) == LOW){
    color = "RGB";
  } 

  if(digitalRead(9) == LOW){
    color = "HSB";
  }
  
  Serial.print(red);
  Serial.print(",");
  Serial.print(green);
  Serial.print(",");
  Serial.print(blue);
  Serial.print(",");
  Serial.println(color);
  delay(150);
}
