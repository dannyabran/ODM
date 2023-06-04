boolean saveFile = false;  // Flag to indicate if the file should be saved
String filename = "output.txt";  // Name of the output file
String message = "";  // Message to be written to the file
Button a, b, c;
int level = 0;
PImage paul;
PFont fala, question, button;

int currentIndex = 0; // Index of the current character being displayed
int typingSpeed = 50; // Speed of typing (in milliseconds)
int startTime; // Time when typing started

void setup() {
  size(1280, 720);

  fala = loadFont("CourierNewPS-BoldMT-100.vlw");
  question = loadFont("Futura-Bold-150.vlw");
  button = loadFont("Futura-Medium-100.vlw");
  paul = loadImage("paul.jpg");
  paul.resize(width, height);
  // Create a button
  a = new Button(width/2, height/2, 300, 80, "Art", color(255,0,0));
  b = new Button(width/2, height/2 + 100, 300, 80, "Everything", color(255,255,0));
  c = new Button(width/2, height/2 + 200, 300, 80, "Trying", color(255,0,255));
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
}

void mouseClicked() {
  // Check if the mouse is clicked within the button's boundaries
  if (a.onTop()) {
    // Set the saveFile flag to true
    saveFile = true;
    message = "Design can be Art";
  }
  
  if (b.onTop()) {
    // Set the saveFile flag to true
    saveFile = true;
    message = "Everything is Design";
  }
  
  if (c.onTop()) {
    // Set the saveFile flag to true
    saveFile = true;
    message = "Just try to be good";
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
    textFont(button);
    textSize(40);
    rectMode(CENTER);
    fill(cor);
    rect(x, y, width, height, 28);
    fill(0);
    textAlign(CENTER, CENTER);
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
