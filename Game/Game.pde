Player player;
ArrayList<Block> map = new ArrayList<Block>();
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

void setup () {
  size(800, 400);
  //startTimer = new Timer(160);
  isStartMenuOn = true;
  Left = false;
  Right = false;
  Up = false;
  Down = false;
  Shift = false;

  levels = new ArrayList<Level>();

  Level lvl1 = new Level("Levels/BlockMap.txt");
  player = new Player(lvl1);
  levels.add(lvl1);
  
  for (int x = 8; x <= lvl1.end; x += 16) {
    lvl1.map.add(new Floor(x, height));
    lvl1.map.add(new Floor(x, height-16));
  }
  
  enemies.add(new Goomba(lvl1.end-sizeUnit, height-sizeUnit*2));
}

void draw() {
  Level currentlvl = levels.get(0);
  background(95, 200, 245);
  imageMode(CENTER);
  
  if ((player.accelerationX > 0) && (player.x >= width - 160) /*&& (lvl1.map.get(1).x + 5 * 16 >= 800)*/){
    for (Block b : map) {
      b.x -= (32) * player.accelerationX;
    }
  }
  if ((player.accelerationX < 0) && (player.x <= 160) && (lvl1.map.get(0).x - 32 <= -1)) {
    for (Block b : map) {
      b.x += (32) * -1 * player.accelerationX;
    }
  }

  currentlvl.display();
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
