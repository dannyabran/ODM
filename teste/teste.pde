import processing.video.*;

Capture cam;

PImage img, cr, cl;

int imgcount=0;

float x = 100, y = 100;

int sy=5, sx=3 ;
void setup() {
  size(580, 843);

  img = loadImage("nowayout.png");

  String[] cameras = Capture.list();

  cam = new Capture(this, cameras[0]);
  cam.resize(1000, 1000);
  cam.start();
}

void draw() {
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

void keyPressed() {
  if (key == 'k') {
    cr.save("olhosr"+imgcount+".png");
    cl.save("olhosl"+imgcount+".png");
    imgcount+=1;
  }
}
