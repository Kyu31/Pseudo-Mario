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

  /*testing Asset & Entity constructors & setTexture)
   Entity test = new Entity("t1", width/2, height/2, "Textures/mario_idle.png", new int[]{0, 0}, 2, 2, 1);
   image(test.getTexture(), test.getX(), test.getY());
   test.setTexture("Textures/mario_death.png");
   image(test.getTexture(), test.getX(), test.getY());
   */
}

//movement keys, powerups
void keyPressed () {
  if (key == CODED) {
    switch(keyCode) {
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
