import processing.serial.*;
import processing.video.*;
Capture cam;
int imgcount=0;
PImage img, cr, cl;
float dist=0;
int maxS=290, minS=270;
int time=5;
int count=0;
int cdt=600;
boolean cooldown=false;
float r=0;
//ARDUINO
Serial myPort;
String val;
String value = "";
int sensorVal = 0;
boolean duino=false;

//
void setup() {
  size(500, 650);
  textAlign(CENTER);
  textSize(50);

  String[] cameras = Capture.list();

  cam = new Capture(this, cameras[0]);
  cam.resize(1000, 1000);
  cam.start();
  ///ARDUINO
  if (duino) {
    String portName = Serial.list()[0];
    myPort = new Serial(this, portName, 9600);
  }
  //
}
void draw() {
  //  /ARDUINO
  if (duino) {
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
    if (val!=null) {
      println("val="+val);
      dist = int(val.trim());
      println("dist="+dist);
    }
  }
  //
  //cam
  if (cam.available() == true) {
    cam.read();
  }
  imageMode(CENTER);

  image(cam, width/2, height/2, 1000, 500);
  filter(GRAY);
  cr = get(200, 350, 100, 80);
  cl = get(300, 350, 100, 80);
  //
  count++;
  if (count>60)
    count=0;


  background(#5EF5B4);

  if (!cooldown) {
    r=round(map(dist, 200, 1, 0, maxS*2));
    println(r);
    if (r < minS && r < maxS)
      text("come closer", width/2, 70);
    else if (r > minS &&r >maxS)
      text("step back", width/2, 70);

    if (r <maxS && r >minS) {
      if (count==0)
        time--;
      if (time>0) {
        text("dont move", width/2, 70);

        text(str(time), width/2, 70+50);
      } else {
        cooldown=true;
        capture();
      }
    } else
      time=5;
  } else {
    cdt--;
    text("turn around!", width/2, 70+50);
    if (cdt<0) {
      cdt=600;
      cooldown=false;
    }
  }
  fill(255);
  noStroke();
  ellipse(width/2, height/2, r, r);
  stroke(255);
  strokeWeight(10);
  noFill();
  ellipse(width/2, height/2, 280, 280);

  fill(0);
  noStroke();
  ellipse(width/2, height/2, map(time, 5, 0, 0, r), map(time, 5, 0, 0, r));
}
void capture() {
  cr.save("olhosr"+imgcount+".png");
  cl.save("olhosl"+imgcount+".png");
  imgcount+=1;
   cr.save("olhosr.png");
  cl.save("olhosl.png");
}
void keyPressed() {
  if (key=='+')
    dist++;
  if (key=='-')
    dist--;
}
