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

void setup () {
  size(1200, 240);
  //startTimer = new Timer(160);
  isStartMenuOn = true;
  Left = false;
  Right = false;
  Up = false;
  Down = false;
  Shift = false;

  levels = new ArrayList<Level>();
  Map official = new Map("BlockMap.txt");
  map = official.map;
  int endIndex = official.cols;

  player = new Player(sizeUnit*2+sizeUnit/2, height-sizeUnit*2);
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  Level lvl1 = new Level(map, player, enemies, new float[]{sizeUnit*2+sizeUnit/2, height-sizeUnit*2}, endIndex * sizeUnit);
  levels.add(lvl1);
  
  enemies.add(new Goomba(lvl1.end-sizeUnit, height-sizeUnit*2));
}

void draw() {
  Level currentlvl = levels.get(0);
  background(95, 200, 245);
  imageMode(CENTER);

  for (Block b : currentlvl.map) {
    b.display(0, 1);
    b.event(currentlvl);
  }
  
  for (Enemy enemies : currentlvl.enemies){
    enemies.hitBoundary(levels.get(0));
    enemies.move();
    enemies.display(0, 2);
  }

  if (!currentlvl.cleared) {
    player.hitBoundary(levels.get(0));
    player.move();
    player.display();
    text("Coords: " + player.x + ", " + player.y, 20, 20);
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
