Player player;
Timer startTimer;
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
  Left = false;
  Right = false;
  Up = false;
  Down = false;
  Shift = false;
  menu = new Screen();
  menu.current = 0;

  levels = new ArrayList<Level>();
  player = new Player();

  Level lvl1 = new Level("Levels/lvl1.txt");
  Level lvl2 = new Level("Levels/lvl2.txt");
  Level lvl3 = new Level("Levels/lvl3.txt");
  levels.add(lvl1);
  levels.add(lvl2);
  levels.add(lvl3);
  
  startTimer = new Timer();
  
  //enemies.add(new Goomba(lvl1.end-sizeUnit, height-sizeUnit*2));
}

void draw() {
  if ((menu.current == 3) || (menu.current == 4) || (menu.current == 5)) {
    background(95, 200, 245);
    imageMode(CENTER);
    int thisLevel = menu.current - 3;
    Level currentlvl = levels.get(thisLevel);
    if (!currentlvl.cleared) {
      if(startTimer.countdown > 0){
        startTimer.countdown --;
      }
      if (startTimer.countdown <= 0) {
        menu.current = 7;
      } else {
        currentlvl.display(player, menu, startTimer);
      }
    } else {
      startTimer.countdown = 3600;
    }
    if (player.x >= currentlvl.background.get(currentlvl.background.size() - 1).x) {
      currentlvl.cleared = true;
      player.x = 40;
      player.y = 300;
      menu.current++;
    }
  } else {
    background(0, 0, 0);
    imageMode(CENTER);
    menu.display();
    if ((menu.current == 6) || (menu.current == 7)) {
      fill(255, 255, 255);
      textSize(20);
      text(player.points, 160, 45);
      text(player.numCoins, 360, 45);
      text((startTimer.countdown / 60), 600, 45);
      textSize(1);
    }
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
