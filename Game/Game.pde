Player player;
//Timer startTimer;
ArrayList<Level> levels;
boolean Left;
boolean Right;
boolean Up;
boolean Down;
boolean Shift;
final int sizeUnit = 16;
Level lvl1;
Screen menu;

void setup () {
  size(800, 400);
  //startTimer = new Timer(160);
  Left = false;
  Right = false;
  Up = false;
  Down = false;
  Shift = false;
  menu = new Screen();
  menu.current = 0;

  levels = new ArrayList<Level>();

  Level lvl1 = new Level("Levels/BlockMap.txt");
  player = new Player(lvl1);
  levels.add(lvl1);
}

void draw() {
  Level currentlvl = levels.get(0);
  
  if (menu.current == 3) {
    background(95, 200, 245);
    imageMode(CENTER);
    currentlvl.display(player);
  } else {
    background(0, 0, 0);
    imageMode(CENTER);
    //menu.display(menu.current);
    menu.display();
    if ((mouseX <= 430) && (mouseX >= 350) && (mouseY <= 330) && (mouseY >= 300)) {
      if (menu.current == 0) {
        menu.current = 1;
      }
    } else {
      if (menu.current == 1) {
        menu.current = 0;
      }
    }
  }
}

//movement keys, powerups
void keyPressed () {
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      Left = true;
      break;
    case RIGHT:
      Right = true;
      break;
    case UP:
      Up = true;
      break;
    case DOWN:
      Down = true;
      break;
    case SHIFT:
      Shift = true;
      break;
    }
  }
}

void keyReleased () {
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      Left = false;
      break;
    case RIGHT:
      Right = false;
      break;
    case UP:
      Up = false;
      break;
    case DOWN:
      Down = false;
      break;
    case SHIFT:
      Shift = false;
      break;
    }
  }
}

//menu interactions
void mouseClicked () {
  if ((mouseX <= 450) && (mouseX >= 330) && (mouseY <= 350) && (mouseY >= 280)) {
    if (menu.current == 1) {
        menu.current = 2;
      }
  }
}
