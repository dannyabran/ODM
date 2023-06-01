class frases {
  float x, y;
  String sw;
  
  frases(float x_, float y_, String s){
    x = x_;
    y = y_;
    sw = s; 
  }
  
  void display(){
    textSize(80);
    textFont(font[k], 150);
    text(sw, x, y);
  }
}
