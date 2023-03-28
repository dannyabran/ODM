PImage[] olhosl = new PImage[2];
PImage[] olhosr = new PImage[2];

olhos[] o = new olhos[4];

float x, y;
int sy=5, sx=3 ;

String fileDirection = "/Users/daniel/Documents/Mestrado/1º Ano/2º Semestre/ODM/teste/";
void setup() {
  size(580, 843);
  
  for(int i = 0; i < 4; i++)
    o[i] = new olhos(random(0,width-50), random(0,height-80), random(width-50), random(height-80));

  for (int i= 0; i < 2; i++) {
    olhosl[i] = loadImage(fileDirection+"olhosl"+i+".png");
  }

  for (int i= 0; i < 2; i++) {

    olhosr[i] = loadImage(fileDirection+"olhosr"+i+".png");
  }
}

void draw() {
  background(255);


  //x+=sx;
  //y+=sy;
  //if ( y + 80 > height || y< 0)
  //  sy*=-1;
  //if ( x + 100 > width || x< 0)
  //  sx*=-1;
  for(int i = 0; i < 4; i++)
    o[i].display();
}

class olhos {
  float x, y, y2, x2;

  olhos(float x_, float y_, float x2_, float y2_) {
    x= x_;
    y= y_;
    x2= x2_;
    y2= y2_;
  }

  void display() {
    for (int i= 0; i < 2; i++) {
      image(olhosl[i], x, y);
    }

    for (int i= 0; i < 2; i++) {
      image(olhosr[i], x2, y2);
    }
  }
}
