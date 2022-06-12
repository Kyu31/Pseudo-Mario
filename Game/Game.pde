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
<<<<<<< HEAD
=======
  levels.add(lvl2);
  levels.add(lvl3);
  
  //enemies.add(new Goomba(lvl1.end-sizeUnit, height-sizeUnit*2));
>>>>>>> 3e7702e4326adb05069062cdb8e54d620d1177f5
}

void draw() {
  if (menu.current == 3) {
    background(95, 200, 245);
    imageMode(CENTER);
    Level currentlvl = levels.get(0);
    currentlvl.display(player);
    System.out.println("playerX: " + player.x + " castle.x: " + currentlvl.background.get(currentlvl.background.size() - 1).x);
    if (player.x >= currentlvl.background.get(currentlvl.background.size() - 1).x) {
      System.out.println("YAYYYY");
      player.x = 40;
      player.y = 300;
      menu.current++;
      levels.remove(0);
    }
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
