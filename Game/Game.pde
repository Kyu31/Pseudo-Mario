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
  menu.switchScreen("start");

  levels = new ArrayList<Level>();

  Level lvl1 = new Level("Levels/BlockMap.txt");
  player = new Player(lvl1);
  levels.add(lvl1);
  
  //enemies.add(new Goomba(lvl1.end-sizeUnit, height-sizeUnit*2));
}

void draw() {
  Level currentlvl = levels.get(0);
  
  if (menu.current == 3) {
    background(95, 200, 245);
    imageMode(CENTER);
    currentlvl.display();
  } else {
    background(0, 0, 0);
    imageMode(CENTER);
    //menu.display(menu.current);
    menu.display();
    System.out.println("x: " + mouseX + " y: " + mouseY);
    if ((mouseX <= 448) && (mouseX >= 352) && (mouseY <= 213.5) && (mouseY >= 187.5)) {
      menu.switchScreen("clickedStart");
    } //else {
      //menu.switchScreen("start");
    //}
    if (
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
  if (((mouseX <= 448) && (mouseX >= 352) && (mouseY <= 213.5) && (mouseY >= 187.5)) {
    menu.switchScreen("level");
  }
}
