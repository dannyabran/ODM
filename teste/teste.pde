import processing.video.*;
import processing.serial.*;
Capture cam;
boolean cooldown=false;
PImage img, cr, cl;
int dist;
int imgcount=0;
int t=0;
float x = 100, y = 100;

int sy=5, sx=3 ;
//ARDUINO
Serial myPort;
String val;
String value = "";
int sensorVal = 0;
//
void setup() {
  size(580, 843);

  img = loadImage("nowayout.png");

  String[] cameras = Capture.list();

  cam = new Capture(this, cameras[0]);
  cam.resize(1000, 1000);
  cam.start();
  ///ARDUINO
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  //
}

void draw() {
  //  /ARDUINO
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.readStringUntil('\n');
    try {
      sensorVal = Integer.valueOf(val.trim());
    }
    catch(Exception e) {
      ;
    }
    println(val); // read it and store it in vals!
  }

  if (cooldown) {
    t++;
    if (t==60*5) {
      cooldown=false;
      t=0;
    }
  }
  println("t="+t);
  if (val!=null) {
    println("val="+val);
    dist = int(val.trim());
    println("dist="+dist);
    if (dist > 10 && dist < 15) {
      if (!cooldown)
        capture();
      cooldown=true;
    }
  }

  //  /----
  if (cam.available() == true) {
    cam.read();
  }

  imageMode(CENTER);

  image(cam, width/2, height/2, 1000, 500);
  filter(GRAY);
  cr = get(200, 350, 100, 80);
  cl = get(300, 350, 100, 80);

  image(img, width/2, height/2);
  x+=sx;
  y+=sy;
  if ( y + 80 > height || y< 0)
    sy*=-1;
  if ( x + 200 > width || x< 0)
    sx*=-1;



  //imageMode(CORNER);
  //image(c, x, y);
}
void capture() {
  cr.save("olhosr"+imgcount+".png");
  cl.save("olhosl"+imgcount+".png");
  imgcount+=1;
}
void keyPressed() {
  if (key == 'k') {
    cr.save("olhosr"+imgcount+".png");
    cl.save("olhosl"+imgcount+".png");
    imgcount+=1;
  }
}
