/*
    +===========================================================+
    |                      STIMULUS PC                          |
    |                                                           |
    | This script creates an alternating Black-White visual     |
    | SSVEP stimulus with modular frequency. Default frequency  |
    | is 5hz. The code works by looping through 2 possible      |
    | background states, bgd1 and bgd2. Each can change color,  |
    | but only bgd1 can be Black and only bgd2 can be White.    |
    | Just in case we want to try SSVEP with color, this code   |
    | allows change in stimulus color. The following keystrokes |
    | control the script:                                       |
    |     • 'w' --> Increases frequency by 1 hz.                |
    |     • 's' --> Decreases frequency by 1 hz.                |
    |     • 'a' --> Changes color of the black background.      |
    |     • 'd' --> Changes color of the white background.      |
    |                                                           |
    +===========================================================+
    
*/

int hz = 5;
int[] black = {0, 0, 0}, white = {255, 255, 255};
int[] bgd1 = black, bgd2 = white, bgd;
int c1 = 0, c2 = 0;
int colors[][] = {{0, 104, 104}, {204, 0, 0}, {178, 255, 102}};
boolean on = true;
PFont f;

void setup() {
  fullScreen();
  f = createFont("Georgia", 12, true);
  textFont(f);
}

void draw() {
  // Select between alternating background colors
  on = !on;
  int ms = 1000/hz;
  if (on) {
    bgd = bgd1;
  } else {
    bgd = bgd2;
  }
  background(bgd[0], bgd[1], bgd[2]);
  
  // Display the frequency
  textSize(12);
  fill(255);
  text("Freq = " + hz + " hz", 10, height - 10);
  println(ms);
  
  // Frequency control
  delay(ms);
}

void keyPressed() {
  switch (key) {
    
    // These first cases control frequency of flashing stimuli
    case 'w':
      hz += 1;
      break;
    case 's':
      if (hz != 1) {
        hz -= 1;
      }
      break;
      
    // The following cases control color of flashing stimuli
    case 'a':
      c1 = ((c1 + 1) % 4);
      if (c1 == 3) {
        bgd1 = black;
      } else {
        bgd1 = colors[c1];
      }
      break;
    case 'd':
      c2 = ((c2 + 1) % 4);
      if (c2 == 3) {
        bgd2 = white;
      } else {
        bgd2 = colors[c2];
      }
      break;
  }
  return;
}