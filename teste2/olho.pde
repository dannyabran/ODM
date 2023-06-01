class ol {
  float x, y;
  int n;
  boolean collide = false;

  ol(float x_, float y_, int i) {
    x= x_;
    y= y_;
    n=i;
  }

  void display() {
    for (int i= 0; i < 4; i++) {
      image(olhosl[n], x, y);
    }
  }

  void collide(float px, float py) {
    if (px > x && px < x + 100 && py > y && py < y + 80) {
      x = random(0, width-50);
      y = random(0, height-80);
    }
  }

  void move() {
    x+=sx;
    y+=sy;
    if ( y + 80 > height ||  y< 0)
      sy*=-1;
    if ( x + 100 > width || x< 0)
      sx*=-1;
  }
}

class or {
  float y2, x2;
  int n;
  boolean collide = false;

  or(float x2_, float y2_, int i) {
    x2= x2_;
    y2= y2_;
    n=i;
  }

  void display() {
    for (int i= 0; i < 4; i++) {
      image(olhosr[n], x2, y2);
    }
  }

  void collide(float px, float py) {
    if (px > x2 && px < x2 + 100 && py > y2 && py < y2 + 80) {
      x2 = random(0, width-50);
      y2 = random(0, height-80);
    }
  }
  
  void move() {
    x2+=sx;
    y2+=sy;
    if ( y2 + 80 > height ||  y2< 0)
      sy*=-1;
    if ( x2 + 100 > width || x2< 0)
      sx*=-1;
  }
}
