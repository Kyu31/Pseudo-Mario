//Timer startTimer;
boolean isStartMenuOn;
ArrayList<Level> levels;

void setup () {
  size(1000, 800);
  background(95, 200, 245);
  //startTimer = new Timer(160);
  isStartMenuOn = true;
  levels = new ArrayList<Level>();
  
  //ArrayList<Block> map = new ArrayList<Block>();
  //player = p1;
  //ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  Level lvl1 = new Level(/*map, p1, enemies*/);
  levels.add(lvl1);
}

void draw() {
}

//movement keys, powerups
void keyPressed () {
}

//menu interactions
void mouseClicked () {
}
