import processing.serial.*;
/////
Serial myPort;
String val;
String value = "";
int input;
int red;
int green;
int blue;
String myString;
/////

int t=0;
void setup() {
  size(500, 500);

  ///A
  String portName = Serial.list()[1];

  myPort = new Serial(this, portName, 9600);
  ///
  
  
}
void draw() {
  background(255);
  fill(0);

  //mudar os maps para o processing
  
  ///
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.readStringUntil('\n');
    if (val != null) {
      String[] pieces = val.split(",");
      red = Integer.parseInt(pieces[0].trim());
      green = Integer.parseInt(pieces[1].trim());
      blue = Integer.parseInt(pieces[2].trim());
      myString = pieces[3];
    }
  }

  println("red " +red);
  println("green " +green);
  println("blue " +blue);
  println("color " +myString);

  if (myString == "RGB") {
    colorMode(RGB, 255, 255, 255);
  } else if (myString == "HSB") {
    colorMode(HSB, 360, 100, 100);
  }
  
  noStroke();
  fill(color(red, green, blue));
  rectMode(CENTER);
  rect(width/2, height/2, 100, 100);
}
