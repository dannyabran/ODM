void level1() {
  imageMode(CENTER);
  image(paul, width/2, height/2);
  
  noTint();
  String mess = "Now that you have experienced what I did, I have a question for you.";

  // Check if there are characters left to be displayed
  if (currentIndex < mess.length()) {
    // Calculate the elapsed time
    int elapsedTime = millis() - startTime;

    // Check if enough time has passed to type the next character
    if (elapsedTime > typingSpeed) {
      // Move to the next character
      currentIndex++;
      startTime = millis(); // Reset the start time
    }
  }

  fill(255);
  // Display the typed text
  String typedText = mess.substring(0, currentIndex);

  textAlign(CENTER, CENTER);
  textFont(fala);
  textSize(30);
  text(typedText, width/2, height-100);

  if (currentIndex == mess.length()) {
    textSize(15);
    text("Click to proceed", width/2, height-50);
  }
}
