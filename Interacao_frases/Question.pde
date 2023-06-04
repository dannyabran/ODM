int colorStart, colorEnd;

void question(){
  background(255);
  colorMode(HSB, 360, 100, 100);
  
  // Define the start and end colors
  colorStart = color(0, 100, 100);  // Red
  colorEnd = color(240, 100, 100); // Blue
  
  float t = (float)frameCount / 1500.0;
  int currentColor = lerpColor(colorStart, colorEnd, t);
  loop();
  tint(currentColor);
  imageMode(CENTER);
  image(background, width/2+50, height/2);
  
  textFont(question);
  textSize(100);
  fill(0);
  text("What is ", 350, 100);
  textFont(bodoni);
  textSize(105);
  text("Design ", 350-40, 230);
  
  a.display();
  b.display();
  c.display();
  
}
