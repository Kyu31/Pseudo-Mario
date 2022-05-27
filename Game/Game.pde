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

  player.display();
  text("Coords: " + player.x + ", " + player.y, 20, 20);
}

//movement keys, powerups
void keyPressed () {
  if (key == CODED) {
    switch(keyCode) {
    case SHIFT:
    case LEFT:
      player.move("Left");
    case RIGHT:
      player.move("Right");
    case UP:
      player.move("Up");
    case DOWN:
      player.move("Down");
      break;
    }
  }
}

//menu interactions
void mouseClicked () {
}
