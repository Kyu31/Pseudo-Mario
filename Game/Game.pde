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

  Level lvl1 = new Level("Levels/lvl1.txt");
  Level lvl2 = new Level("Levels/lvl2.txt");
  Level lvl3 = new Level("Levels/lvl3.txt");
  player = new Player();
  levels.add(lvl1);
  levels.add(lvl2);
  levels.add(lvl3);
  
  //enemies.add(new Goomba(lvl1.end-sizeUnit, height-sizeUnit*2));
}

void draw() {
  System.out.println(menu.current);
  if ((menu.current == 3) || (menu.current == 5) || (menu.current == 7)) {
    background(95, 200, 245);
    imageMode(CENTER);
    int thisLevel = menu.current / 2 - 1;
    Level currentlvl = levels.get(thisLevel);
    currentlvl.display(player);
    if (player.x >= currentlvl.background.get(currentlvl.background.size() - 1).x) {
      player.x = 40;
      player.y = 300;
      menu.current++;
      System.out.println(menu.current);
    }
  }/* else if ((menu.current == 3) || (menu.current == 5)) {
    System.out.println("BRUH");
    System.out.println(menu.current);
    menu.current++;
    menu.display();
    if ((menu.current == 4) || (menu.current == 6)) {
      delay(2000);
    }
   */ else {
    background(0, 0, 0);
    imageMode(CENTER);
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
    if ((mouseX <= 800) && (mouseX >= 0) && (mouseY <= 400) && (mouseY >= 0)) {
      if (menu.current == 4) {
        menu.display();
        menu.current = 5;
      } else if (menu.current == 6) {
        menu.display();
        menu.current = 7;
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
