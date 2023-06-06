PImage img, cr, cl;
int dist;

int t=0;
float x = 100, y = 100;
int imgcount=1;//       ALWAYS EQUILIZE IMAGE COUNT TO THE NUMBER OF IMAGES ON THE DISTANCE DETECTOR
int sy=5, sx=3 ;
void setup() {
  size(580, 843);

  img = loadImage("nowayout.png");

  cr = loadImage( "C:/Users/esrra/Desktop/distance_capture/olhosr.png");

  cl=  loadImage(  "C:/Users/esrra/Desktop/distance_capture/olhosl.png");
}

void draw() {


  cr = loadImage( "C:/Users/esrra/Desktop/distance_capture/olhosr.png");

  cl=  loadImage(  "C:/Users/esrra/Desktop/distance_capture/olhosl.png");
  filter(GRAY);
  //cr = get(200, 350, 100, 80);
  //cl = get(300, 350, 100, 80);
  
  image(cr, 200, 350);
  image(cl, 300, 350);
  image(img, 0, 0);

}
