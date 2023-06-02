import processing.serial.*;

Serial myPort;
String val;
String value = "";
int input;
int red;
int green;
int blue;
int mode;
boolean rgb = true;

void setup() {
  size(500, 500);

  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw() {

  fill(0);

  if (myPort.available() > 0) {
    val = myPort.readStringUntil('\n');
    if (val != null) {
      String[] pieces = val.split(",");
      red = Integer.parseInt(pieces[0].trim());
      green = Integer.parseInt(pieces[1].trim());
      blue = Integer.parseInt(pieces[2].trim());
      mode = Integer.parseInt(pieces[3].trim());
    }
  }

  if (mode == 1) {
    if (rgb) { 
      colorMode(HSB);  // Change colorMode to HSB
      rgb = false;
    } else {
      colorMode(RGB);  // Change colorMode back to RGB
      rgb = true;
    }
  }

  println("red " +red);
  println("green " +green);
  println("blue " +blue);
  println("mode " +mode);

  background(red, green, blue);
}
