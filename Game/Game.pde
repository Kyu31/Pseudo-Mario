Player player;
//Timer startTimer;
boolean isStartMenuOn;
ArrayList<Level> levels;
boolean[] movement;
final int Left = 0;
final int Right = 1;
final int Up = 2;
final int Down = 3;
final int Shift = 4;

void setup () {
  size(1000, 800);
  //startTimer = new Timer(160);
  isStartMenuOn = true;
  movement = new boolean[]{false, false, false, false, false};
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

  player.move();
  player.display();
  text("Coords: " + player.x + ", " + player.y, 20, 20);
}

//movement keys, powerups
void keyPressed () {
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      movement[Left] = true;
    case RIGHT:
      movement[Right] = true;
    case UP:
      movement[Up] = true;
    case DOWN:
      movement[Down] = true;
    case SHIFT:
      movement[Shift] = true;
      break;
    }
  }
}

void keyReleased () {
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      movement[Left] = false;
    case RIGHT:
      movement[Right] = false;
    case UP:
      movement[Up] = false;
    case DOWN:
      movement[Down] = false;
    case SHIFT:
      movement[Shift] = false;
      break;
    }
  }
}

//menu interactions
void mouseClicked () {
}
