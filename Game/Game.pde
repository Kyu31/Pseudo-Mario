Player player;
//Timer startTimer;
boolean isStartMenuOn;
ArrayList<Level> levels;

void setup () {
  size(1000, 800);
  //startTimer = new Timer(160);
  isStartMenuOn = true;
  levels = new ArrayList<Level>();

  //ArrayList<Block> map = new ArrayList<Block>();
  player = new Player(width/2, height/2);
  //ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  Level lvl1 = new Level(/*map,*/ player/*, enemies*/);
  levels.add(lvl1);
}

void draw() {
  background(95, 200, 245);
  imageMode(CENTER);

  image(player.texture, player.x, player.y);
}

//movement keys, powerups
void keyPressed () {
  Boolean isRunning = false;
  if (key == CODED) {
    switch(keyCode) {
    case SHIFT:
      isRunning = true;
    case LEFT:
      player.move("Left", isRunning);
    case RIGHT:
      player.move("Right", isRunning);
    case UP:
      player.move("Up", isRunning);
    case DOWN:
      player.move("Down", isRunning);
      break;
    }
  }
}

//menu interactions
void mouseClicked () {
}
