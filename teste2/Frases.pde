class frases {
  float x = 5, y = 120;
  int j, i;
  float textWidth;
  float textAscent;

  frases() {
  }

  void display() {
    nome = split(lines[t], " "); //Split the frases into just words
    for (i = 0; i < nome.length; i++) {
      fill(0);
      textSize(80);
      textFont(font[k], 150); //Random of the fonts
      text(nome[i], x, y + 150 * i); //Display the words
    }
  }
}
