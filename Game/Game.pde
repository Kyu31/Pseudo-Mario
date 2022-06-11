Player player;
//Timer startTimer;
boolean isStartMenuOn;
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
  isStartMenuOn = true;
  Left = false;
  Right = false;
  Up = false;
  Down = false;
  Shift = false;
  menu = new Screen();
  menu.switchScreen("level");

  levels = new ArrayList<Level>();

  Level lvl1 = new Level("Levels/BlockMap.txt");
  player = new Player(lvl1);
  levels.add(lvl1);
  
  //enemies.add(new Goomba(lvl1.end-sizeUnit, height-sizeUnit*2));
}

void draw() {
  Level currentlvl = levels.get(0);
  background(95, 200, 245);
  imageMode(CENTER);
  
  if (menu.current == 1) {
    currentlvl.display();
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
}
