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
  size(800, 400);
  //startTimer = new Timer(160);
  isStartMenuOn = true;
  Left = false;
  Right = false;
  Up = false;
  Down = false;
  Shift = false;
  levels = new ArrayList<Level>();
  
  for (int i = -3; i <= 3; i++) {
    for (int a = 0; a < 2; a++) {
      map.add(new Block("nothing", false, "block", width/2 + (i * 120), height/2 + 80 + (a * 120), "Textures/block.png"));
    }
  }
  //map.add(new Block("nothing", false, "block", width/2 - 128, height/2 + 80, "Textures/block.png"));


  player = new Player(width/2, height/2);
  //ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  Level lvl1 = new Level(map, player/*, enemies*/);
  levels.add(lvl1);
}

void draw() {
  background(95, 200, 245);
  imageMode(CENTER);
  
  for (Block b : map) {
    b.display();
  }

  player.move();
  player.display();
  text("Coords: " + player.x + ", " + player.y, 20, 20);
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
