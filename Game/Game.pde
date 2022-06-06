Player player;
ArrayList<Block> map;
//Timer startTimer;
boolean isStartMenuOn;
ArrayList<Level> levels;
boolean Left;
boolean Right;
boolean Up;
boolean Down;
boolean Shift;

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
  map = new Map("BlockMap.txt").map;

  player = new Player(16*2+8, height-16*2);
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  Level lvl1 = new Level(map, player, enemies, new float[]{16*2+8, height-16*2}, 1600);
  levels.add(lvl1);
  
  for (int i = 0; i < lvl1.map.size(); i++) {
    System.out.println(lvl1.map.get(i));
    lvl1.map.remove(i);
    i -= 1;
  }

  for (int x = 8; x <= lvl1.end; x += 16) {
    lvl1.map.add(new Floor(x, height));
    lvl1.map.add(new Floor(x, height-16));
    if (x > width*0.25 && x < width*0.75) {
      lvl1.map.add(new Brick(null, x, height-16*2));
    }
    if (x > width*0.25+16 && x < width*0.75) {
      lvl1.map.add(new Brick(null, x, height-16*3));
    }
    if (x > width*0.25+16*2 && x < width*0.75) {
      lvl1.map.add(new Brick(null, x, height-16*4));
    }
    if (x > width*0.25+16*3 && x < width*0.75) {
      lvl1.map.add(new Brick(null, x, height-16*5));
    }
  }
}

void draw() {
  Level currentlvl = levels.get(0);
  
  background(95, 200, 245);
  image(loadImage("Textures/castle.png"), currentlvl.start[0], currentlvl.start[1]-16*2);
  imageMode(CENTER);

  for (Block b : currentlvl.map) {
    b.display(0, 1, 1);
    b.event(currentlvl);
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
