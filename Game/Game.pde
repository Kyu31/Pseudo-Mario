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

void setup () {
  size(1000, 500);
  //startTimer = new Timer(160);
  isStartMenuOn = true;
  Left = false;
  Right = false;
  Up = false;
  Down = false;
  Shift = false;

  levels = new ArrayList<Level>();

  player = new Player(32*2+16, height-32*2);
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  Level lvl1 = new Level(map, player, enemies, new float[]{32*2+16, height-32*2}, width);
  levels.add(lvl1);  

  for (int x = 16; x <= lvl1.end+16; x += 32) {
    lvl1.map.add(new Floor(x, height));
    lvl1.map.add(new Floor(x, height-32));
    if (x > width*0.25 && x < width*0.75) {
      lvl1.map.add(new Brick(null, x, height-32*2));
    }
    if (x > width*0.25+32 && x < width*0.75) {
      lvl1.map.add(new Brick(null, x, height-32*3));
    }
    if (x > width*0.25+32*2 && x < width*0.75) {
      lvl1.map.add(new Brick(null, x, height-32*4));
    }
    if (x > width*0.25+32*3 && x < width*0.75) {
      lvl1.map.add(new Brick(null, x, height-32*5));
    }
  }
  
  enemies.add(new Goomba(lvl1.end-32, height-32*2));
}

void draw() {
  Level currentlvl = levels.get(0);
  
  background(95, 200, 245);
  image(loadImage("Textures/castle.png"), currentlvl.start[0], currentlvl.start[1]-32*2);
  imageMode(CENTER);

  for (Block b : currentlvl.map) {
    b.display(0, 1, 1);
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
