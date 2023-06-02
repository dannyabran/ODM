class frases {
  float x, y;
  String sw;
  float textWidth;
  float textAscent;
  
  frases(float x_, float y_, String s){
    x = x_;
    y = y_;
    sw = s; 
    textWidth = textWidth(sw);
    textAscent = textAscent();
  }
  
  void display(){
    textSize(80);
    textFont(font[k], 150);
    text(sw, x, y);
  }
  
  float getMarginLeft() {
    return -textWidth / 2;
  }
  
  float getMarginRight() {
    return textWidth / 2;
  }
  
  float getHeight(){
    return textAscent;
  }
}
