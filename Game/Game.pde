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
final int isFacingLeft = 5;

void setup () {
  size(1000, 800);
  //startTimer = new Timer(160);
  isStartMenuOn = true;
  movement = new boolean[]{false, false, false, false, false, false};
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
  //line(0, player.y + player.texture.height/2, width, player.y + player.texture.height/2);
  text("Coords: " + player.x + ", " + player.y, 20, 20);
}

//movement keys, powerups
void keyPressed () {
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      movement[Left] = true;
      movement[isFacingLeft] = true;
    case RIGHT:
      movement[Right] = true;
      movement[isFacingLeft] = false;
    case UP:
      movement[Up] = true;
    case DOWN:
      movement[Down] = true;
    case SHIFT:
      movement[Shift] = true;
    }
  }
}

void keyReleased () {
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      movement[Left] = false;
      movement[isFacingLeft] = true;
    case RIGHT:
      movement[Right] = false;
      movement[isFacingLeft] = false;
    case UP:
      movement[Up] = false;
    case DOWN:
      movement[Down] = false;
    case SHIFT:
      movement[Shift] = false;
    }
  }
}

//menu interactions
void mouseClicked () {
}
