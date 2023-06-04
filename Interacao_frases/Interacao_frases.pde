boolean saveFile = false;  // Flag to indicate if the file should be saved
String filename = "output.txt";  // Name of the output file
String message = "";  // Message to be written to the file
Button a, b, c;
int level = 0;
PImage paul, background;
PFont fala, question, button, bodoni;
boolean answered = false;
int currentIndex = 0; // Index of the current character being displayed
int typingSpeed = 50; // Speed of typing (in milliseconds)
int startTime; // Time when typing started

void setup() {
  size(1280, 720);

  fala = loadFont("CourierNewPS-BoldMT-100.vlw");
  question = loadFont("Futura-Bold-150.vlw");
  bodoni = loadFont("BodoniSvtyTwoITCTT-Bold-100.vlw");
  button = loadFont("Futura-Medium-100.vlw");
  background = loadImage("Horizontal.png");
  background.resize(width+100, height+100);
  paul = loadImage("paul.jpg");
  paul.resize(width, height);
  // Create a button
  a = new Button(300, height/2, 300, 80, "Art", #ef3a20);
  b = new Button(300, height/2 + 100, 300, 80, "Everything", #7da251);
  c = new Button(300, height/2 + 200, 300, 80, "Trying", #7d58a9);
  startTime = millis();
}

void draw() {
  if (level == 0) level1();
  if (level == 1) question();

  if (saveFile) {
    // Create a PrintWriter object to write to the file
    PrintWriter writer = createWriter(filename);

    // Write the message to the file
    writer.println(message);

    // Close the PrintWriter
    writer.close();

    println("File saved successfully!");

    // Reset the flags
    saveFile = false;
    message = "";
  }
  
  if(level == 1 && answered == true){
    level = 0;
    answered = false;
  }
}

void mouseClicked() {
  // Check if the mouse is clicked within the button's boundaries
  if (a.onTop()) {
    // Set the saveFile flag to true
    saveFile = true;
    message = "Design can be Art";
    answered = true;
  }
  
  if (b.onTop()) {
    // Set the saveFile flag to true
    saveFile = true;
    message = "Everything is Design";
    answered = true;
  }
  
  if (c.onTop()) {
    // Set the saveFile flag to true
    saveFile = true;
    message = "Just try to be good";
    answered = true;
  }
  
  if(level == 0)
    level = 1;
}

class Button {
  int x, y, width, height;
  String label;
  color cor;

  Button(int x, int y, int width, int height, String label, color c) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.label = label;
    this.cor = c;
  }

  void display() {
    noStroke();
    textFont(button);
    textSize(40);
    rectMode(CENTER);
    fill(cor, 200);
    rect(x, y, width, height, 5);
    textAlign(CENTER, CENTER);
    fill(0, 200);
    text(label, x-1, y+1);
    fill(255);
    text(label, x, y);
    
  }

  boolean onTop() {
    if (mouseX > this.x - this.width/2 && mouseX < x + this.width/2 && mouseY > this.y - this.height/2 && mouseY < this.y + this.height/2) {
      return true;
    } else {
      return false;
    }
  }
  
  void changeColor(color c2){
    cor = c2;
  }
}
