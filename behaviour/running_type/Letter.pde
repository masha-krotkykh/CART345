// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// A class to describe a single Letter
class Letter {
  char letter;
  // The object knows its original "home" location
  float homex,homey;
  // As well as its current location
  float x,y;
  float a;
  int r = 255;
  int g = 255;
  int b = 255;
  // And an angle of rotation
  float theta;

  Letter (float x_, float y_, char letter_, int a_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_; 
    a = a_;
  }
  
  void update() {
    homex = homex - 5;
  }

  // Display the letter
  void display() {
    fill(r,g,b,a);
    textAlign(LEFT);
    // User translate and rotate to draw the letter
    pushMatrix();
    translate(x,y);
    rotate(theta);
    text(letter,0,0);
    popMatrix();
  }

  // Move the letter randomly
  void shake() {
    //x += random(-2,2);
    y += random(-6,6);
    a = random(0,200);
    theta += random(-0.3,0.5);
  }

  // Return the letter home using lerp!
  void home() {
    x = lerp(x,homex,0.1);
    y = lerp(y,homey,0.05);
    theta = lerp(theta,0,0.1);
    a = lerp(a,255,0.01);
  }
}
