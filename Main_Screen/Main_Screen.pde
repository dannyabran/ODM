import processing.serial.*;

Serial myPort;
String val;
String value = "";
int input=0;

PFont font[];
PImage filter;
PImage[] olhosl = new PImage[4];
PImage[] olhosr = new PImage[4];
String[] lines;
int t=0;
int k = 0;
int red;
int green;
int blue;
int mode;
int frase;
boolean rgb = true;
boolean cooldown;
int time = 0;

frases[] f = new frases[5];

ol[] o = new ol[5];
or[] o2 = new or[5];

float x, y;
int sy=5, sx=3 ;

String fileDirection = "/Users/daniel/Documents/Mestrado/1º Ano/2º Semestre/ODM/Parte Eletronica/teste/";
String nome[];

int frameCount = 0;  // Variable to keep track of frame count

void setup() {
  size(650, 843);
  
  //Load fonts
  font = new PFont[] {
    loadFont("Bodoni0.vlw"),
    loadFont("Bodoni1.vlw"),
    loadFont("Bodoni2.vlw"),
    loadFont("Futura-Bold-150.vlw"),
    loadFont("Futura-Medium-150.vlw")
  };
  
  //Load of the frases shown
  

  filter = loadImage("filter.png");

  String portName = Serial.list()[1];

  myPort = new Serial(this, portName, 9600);


  for (int i = 0; i < 4; i++) {
    o[i] = new ol(i);
    o2[i] = new or(i);
    olhosl[i] = loadImage(fileDirection + "olhosl" + i + ".png");
    olhosr[i] = loadImage(fileDirection + "olhosr" + i + ".png");
  }

  for (int i = 0; i < 1; i++) {
    f[i] = new frases();
  }

  frameRate(30);  // Set frame rate to 30 frames per second
}

void draw() {
  background(255);
  
  lines = loadStrings("/Users/daniel/Documents/Mestrado/1º Ano/2º Semestre/ODM/ODM/Interacao_frases/output.txt");
  //Arduino
  if (myPort.available() > 0) {
    val = myPort.readStringUntil('\n');
    if (val != null) {
      String[] pieces = val.split(",");
      red = Integer.parseInt(pieces[0].trim());
      green = Integer.parseInt(pieces[1].trim());
      blue = Integer.parseInt(pieces[2].trim());
      mode = Integer.parseInt(pieces[3].trim());
      frase = Integer.parseInt(pieces[4].trim());
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

  //filter.resize(width, height);
  //tint(red, green, blue);
  //image(filter, 0, 0);

  // Increment k every 0.2 seconds
  frameCount++;
  if (frameCount % (30 * 0.2) == 0) {
    k = round(random(0,4));
  }
  
  //Change sentences
  if (cooldown) {
    time++;
    if (time == 60) {
      cooldown = false;
      time = 0;
    }
  } else {
    if (frase == 1) {
      t++;
      cooldown = true;
      if (t > 2)
        t = 0;
    }
  }


  for (int i = 0; i < 4; i++) {
    o[i].display();
    o2[i].display();
    o[i].move();
    o2[i].move();
    checkCollision(o[i], o2[i]);
    checkBorders(o[i]);
    checkBorders(o2[i]);
  }

  f[0].display();
}

//Collisions for the fotos
void checkCollision(ol obj1, or obj2) {
  float obj1Right = obj1.x + 100;
  float obj1Bottom = obj1.y + 80;
  float obj2Right = obj2.x2 + 100;
  float obj2Bottom = obj2.y2 + 80;

  if (obj1.x < obj2Right &&
    obj1Right > obj2.x2 &&
    obj1.y < obj2Bottom &&
    obj1Bottom > obj2.y2) {
    obj1.newCenter();
    obj2.newCenter();
  }
}

void checkSelfCollision(ol obj) {
  for (int i = 0; i < 4; i++) {
    if (obj != o[i]) { // Skip self-comparison
      float obj1Right = obj.x + 100;
      float obj1Bottom = obj.y + 80;
      float obj2Right = o[i].x + 100;
      float obj2Bottom = o[i].y + 80;

      if (obj.x < obj2Right &&
        obj1Right > o[i].x &&
        obj.y < obj2Bottom &&
        obj1Bottom > o[i].y) {
        obj.newCenter();
        o[i].newCenter();
      }
    }
  }
}

void checkSelfCollision(or obj) {
  for (int i = 0; i < 4; i++) {
    if (obj != o2[i]) { // Skip self-comparison
      float obj1Right = obj.x2 + 100;
      float obj1Bottom = obj.y2 + 80;
      float obj2Right = o2[i].x2 + 100;
      float obj2Bottom = o2[i].y2 + 80;

      if (obj.x2 < obj2Right &&
        obj1Right > o2[i].x2 &&
        obj.y2 < obj2Bottom &&
        obj1Bottom > o2[i].y2) {
        obj.newCenter();
        o2[i].newCenter();
      }
    }
  }
}

void checkBorders(ol obj) {
  if (obj.x + 100 > width || obj.x < 0) {
    obj.sx *= -1;
  }

  if (obj.y + 80 > height || obj.y < 0) {
    obj.sy *= -1;
  }
}

void checkBorders(or obj) {
  if (obj.x2 + 100 > width || obj.x2 < 0) {
    obj.sx *= -1;
  }

  if (obj.y2 + 80 > height || obj.y2 < 0) {
    obj.sy *= -1;
  }
}
