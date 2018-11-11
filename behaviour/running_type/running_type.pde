// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Exercise 17-10: Create a sketch that starts with characters randomly 
// scattered (and rotated). Have them slowly move back toward their "home" 
// location. Use an object-oriented approach as seen in Example 17-6.

PFont f;
String message = "...tiny little thing... out before its time... godforsaken hole... no love... spared that... speechless all her days... practically speechless... even to herself... never out loud... but not completely... sometimes sudden urge... once or twice a year... always winter some strange reason... the long evenings... hours of darkness... sudden urge to... tell... then rush out stop the first she saw... nearest lavatory... start pouring it out... steady stream... mad stuff... half the vowels wrong... no one could follow... till she saw the stare she was getting... then die of shame... crawl back in... once or twice a year... always winter some strange reason... long hours of darkness... now this... this... quicker and quicker... the words... the brain... flickering away like mad... quick grab and on... nothing there... on somewhere else... try somewhere else... all the time something begging... something in her begging... begging it all to stop... unanswered... prayer unanswered... or unheard... too faint... so on... keep on... trying... not knowing what... what she was trying... what to try... whole body like gone... just the mouth... like maddened... so on... keep– ... what?.. the buzzing?.. yes... all the time the buzzing... dull roar like falls... in the skull... and the beam... poking around... painless... so far... ha!.. so far... all that... keep on... not knowing what... what she was– ... what?.. who?.. no!.. she!.. SHE!.. what she was trying... what to try... no matter... keep on... hit on it in the end... then back... God is love... tender mercies... new every morning... back in the field... April morning... face in the grass... nothing but the larks... pick it up–…";

// An array of Letter objects
Letter[] letters;

void setup() {
  size(1000, 200);
  // Load the font
  f = loadFont("FreePixel.vlw");
  textFont(f);

  // Create the array the same size as the String
  letters = new Letter[message.length()];
  // Initialize Letters at the correct x location
  int x = width - 50;
  for (int i = 0; i < message.length (); i++) {
    letters[i] = new Letter(x, height/2, message.charAt(i),255); 
    x += textWidth(message.charAt(i));
  }
}

void draw() { 
  background(0);
  for (int i = 0; i < letters.length; i++) {
   letters[i].update();
   // Display all letters
   letters[i].display();
    //if (letters[i].x + (textWidth(message.charAt(i))) > 0 && letters[i].x - (textWidth(message.charAt(i))) < width) {
      // If the mouse is pressed the letters shake
      // If not, they return to their original location
      if (mousePressed && letters[i].x + (textWidth(message.charAt(i))) > 0 && letters[i].x - (textWidth(message.charAt(i))) < width) {
        letters[i].shake();
      } else {
        letters[i].home();
      //}
    }
  }
}
