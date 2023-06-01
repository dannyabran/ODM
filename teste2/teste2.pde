import processing.serial.*;
/////
Serial myPort;
String val;
String value = "";
int input=0;
/////
PFont font[];

PImage[] olhosl = new PImage[4];
PImage[] olhosr = new PImage[4];
String [] lines;
int t=0;
int k = 0;

frases[] f = new frases[5];

ol[] o = new ol[5];
or[] o2 = new or[5];

float x, y;
int sy=5, sx=3 ;

String fileDirection = "/Users/daniel/Documents/Mestrado/1º Ano/2º Semestre/ODM/Parte Eletronica/teste/";
String nome[];

void setup() {
  size(650, 843);

  font =  new PFont[]{
    loadFont("Bodoni0.vlw"),
    loadFont("Bodoni1.vlw"),
    loadFont("Bodoni2.vlw")
  };

  lines = loadStrings("/Users/daniel/Documents/Mestrado/1º Ano/2º Semestre/ODM/Parte Eletronica/frases/data.txt");

  String portName = Serial.list()[0];

  myPort = new Serial(this, portName, 9600);



  for (int i = 0; i < 4; i++) {
    o[i] = new ol(random(0, width-100), random(height-80), i);
    o2[i] = new or(random(0, width-100), random(height-80), i);
    olhosl[i] = loadImage(fileDirection+"olhosl"+i+".png");
    olhosr[i] = loadImage(fileDirection+"olhosr"+i+".png");
  }
}

void draw() {
  background(255);


  fill(0);

  frameRate(5);

  nome = split(lines[t], " ");

  for (int i = 0; i < nome.length; i++) {
    f[i] = new frases(5, 120 + 150 * i, nome[i]);
  }

  k++;
  if (k>2)
    k=0;


  for (int i = 0; i< nome.length; i++) {
    f[i].display();
  }

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
  // t=input;

  //x+=sx;
  //y+=sy;
  //if ( y + 80 > height  y< 0)
  //  sy*=-1;
  //if ( x + 100 > width  x< 0)
  //  sx*=-1;
  for (int i = 0; i < 4; i++) {
    // o[i].move();
    //o2[i].move();
    o[i].display();
    o2[i].display();
  }
}

void keyPressed() {
  if (key == 'c') {
    t++;
    if (t>2)
      t=0;
  }

  if (key == 'f') {
    k++;
    if (k>2)
      k=0;
  }
}
