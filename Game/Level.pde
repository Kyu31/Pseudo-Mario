public class Level {
  ArrayList<Block> map;
  ArrayList<Collectable> collectables;
  ArrayList<Asset> background;
  ArrayList<Enemy> enemies;
  float[] start;
  float end; 
  boolean cleared;

  public Level(ArrayList<Block> lvlmap, ArrayList<Collectable> collect, ArrayList<Asset> scenery, ArrayList<Enemy> enemies, float[] startCoords, float endBoundary) {
    map = lvlmap;
    collectables = collect;
    background = scenery;
    this.enemies = enemies;
    start = startCoords;
    end = endBoundary;
    cleared = false;
  }

  public Level(String filename) {
    String[] lines = loadStrings(filename);
    int rows = lines.length;
    int cols = lines[0].length();
    start = new float[2];
    end = cols*sizeUnit;
    map = new ArrayList<Block>();
    collectables = new ArrayList<Collectable>();
    background = new ArrayList<Asset>();
    enemies = new ArrayList<Enemy>();
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        //background
        if (lines[r].charAt(c) == 'c') {
          background.add(new Castle(sizeUnit/2 + c*sizeUnit, height-(rows-1)*sizeUnit + r*sizeUnit));
        }
        //collectables

        //blocks
        if (lines[r].charAt(c) == 'b') {
          map.add(new Brick(null, sizeUnit/2 + c*sizeUnit, height-(rows-1)*sizeUnit + r*sizeUnit));
        }
        if (lines[r].charAt(c) == 'f') {
          map.add(new Floor(sizeUnit/2 + c*sizeUnit, height-(rows-1)*sizeUnit + r*sizeUnit));
        }
        //enemies

        if (lines[r].charAt(c) == 'p') {
          start[0] = sizeUnit/2 + c*sizeUnit;
          start[1] = height-(rows-1)*sizeUnit + r*sizeUnit;
        }
      }
    }
    cleared = false;
  }

  public void display() {
    for (Asset scenery : background) {
      scenery.display(0, 1);
    }
    
    for (Block b : map) {
      //if (b.x >= 0 && b.x <= 400) {
        b.display(0, 1);
      //}
      b.event(this, player);
    }
    
    for (Collectable c : collectables) {
      c.display(0, 1);
      c.event(this, player);
    }

    for (Enemy enemies : enemies) {
      enemies.hitBoundary(this);
      enemies.move();
      enemies.display(0, 2);
    }

    if (!cleared) {
      player.hitBoundary(this);
      player.move();
      player.display();
      text("Coords: " + player.x + ", " + player.y, 20, 20);
    }
    scroll();
  }

  public void scroll() {
    if ((player.accelerationX > 0) && (player.x >= 300) && (background.get(background.size() - 1).x + 32 >= 800)){
      for (Block b : map) {
        b.x -= (32) * player.accelerationX * 1.5;
      }
      for (Asset a : background) {
        a.x -= (32) * player.accelerationX * 1.5;
      }
    }
    if ((player.accelerationX < 0) && (player.x <= 400) && (background.get(0).x - 32 <= -1)) {
      for (Block b : map) {
        b.x += (32) * -1 * player.accelerationX * 1.5;
      }
      for (Asset a : background) {
        a.x += (32) * -1 * player.accelerationX * 1.5;
      }
    }
  }
}
