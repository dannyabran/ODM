class frases {
  float x = 5, y = 120;
  int j, i;
  float textWidth;
  float textAscent;

  frases() {
  }

  void display() {
    nome = split(lines[t], " ");
    for (i = 0; i < nome.length; i++) {
      fill(0);
      textSize(80);
      textFont(font[k], 150);
      text(nome[i], x, y + 150 * i);
      j = i;
     
    }
  }

  boolean inside(float px, float py) {
    if (px > x && px < x + textWidth(nome[j]) && py > y && py < y + textAscent())
      return true;
    else
      return false;
  }
  
  float gettextWidth(){
    return textWidth(nome[j]);
  }
}
