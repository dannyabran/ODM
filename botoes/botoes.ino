const int pinG = 11;
const int pinR = 10;
const int pinY = 9;

const int buttonG = 4;
const int buttonR = 3;
const int buttonY = 2;

int state = 0;

void setup() {
  Serial.begin(9600);

  pinMode(pinG, OUTPUT);
  pinMode(pinR, OUTPUT);
  pinMode(pinY, OUTPUT);

  pinMode(buttonG, INPUT);
  pinMode(buttonR, INPUT);
  pinMode(buttonY, INPUT);
}

void loop() {

  if (digitalRead(buttonG) == HIGH) {
    state = 0;
  } else if (digitalRead(buttonR) == HIGH) {
    state = 1;
  } else if (digitalRead(buttonY) == HIGH) {
    state = 2;
  }

  if (state == 0) {
    digitalWrite(pinG, HIGH);
    digitalWrite(pinR, LOW);
    digitalWrite(pinY, LOW);
  }

  if (state == 1) {
    digitalWrite(pinG, LOW);
    digitalWrite(pinR, HIGH);
    digitalWrite(pinY, LOW);
  }

  if (state == 2) {
    digitalWrite(pinG, LOW);
    digitalWrite(pinR, LOW);
    digitalWrite(pinY, HIGH);
  }

  Serial.println((String) String(state));
  delay(150);
  
}
