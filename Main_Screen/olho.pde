class ol {
  float x, y;
  int n;
  boolean collide = false;
  int sx, sy; // speed in x and y directions

  ol(int i) {
    x = random(0, width-100);
    y = random(height-80);
    n = i;
    sx = 3;
    sy = 5;
  }

  void display() {
    for (int i = 0; i < 4; i++) {
      tint(255);
      image(olhosl[n], x, y);
    }
  }

  void newCenter() {
    x = random(0, width-100);
    y = random(0, height-80);
  }

  void move() {
    x += sx;
    y += sy;
  }
}

class or {
  float y2, x2;
  int n;
  boolean collide = false;
  int sx, sy; // speed in x and y directions

  or(int i) {
    x2 = random(0, width-100);
    y2 = random(height-80);
    n = i;
    sx = 3;
    sy = 5;
  }

  void display() {
    for (int i = 0; i < 4; i++) {
      image(olhosr[n], x2, y2);
    }
  }

  void newCenter() {
    x2 = random(0, width-100);
    y2 = random(0, height-80);
  }

  void move() {
    x2 += sx;
    y2 += sy;
  }
}
