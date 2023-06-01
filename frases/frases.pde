import processing.serial.*;
/////
Serial myPort;
String val;
String value = "";
int input=0;
/////


String [] lines;
int t=0;
void setup() {
  size(500, 500);
  lines = loadStrings("data.txt");


  ///A
  String portName = Serial.list()[0];

  myPort = new Serial(this, portName, 9600);
  ///
}
void draw() {
  background(255);
  fill(0);
  text(lines[t], width/2, height/2);

  ///
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.readStringUntil('\n');
    try {
      input = Integer.valueOf(val.trim());
    }
    catch(Exception e) {
      ;
    }
    println(val); // read it and store it in vals!
  }
  ///
  t=input;
}
void keyPressed() {
  t++;
  if (t>2)
    t=0;
}
