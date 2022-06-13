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
        float x = sizeUnit/2 + c*sizeUnit;
        float y = height-(rows-1)*sizeUnit + r*sizeUnit;
        //background
        if (lines[r].charAt(c) == 'c') {
          background.add(new Castle(x, y));
        }
        //collectables
        if (lines[r].charAt(c) == 'o') {
          collectables.add(new Coin(x, y));
        }

        //blocks
        if (lines[r].charAt(c) == 'b') {
          map.add(new Brick(null, x, y));
        }
        if (lines[r].charAt(c) == 'f') {
          map.add(new Floor(x, y));
        }
        //enemies
        if (lines[r].charAt(c) == 'g') {
          enemies.add(new Goomba(x, y));
        }

        if (lines[r].charAt(c) == 'p') {
          start[0] = x;
          start[1] = y;
        }
      }
    }
    cleared = false;
  }

  public void display(Player player) {
    for (Asset scenery : background) {
      scenery.display(0, 1);
    }

    for (Block b : map) {
      if (b.x+b.w/2 >= 0 && b.x-b.w/2 <= width) {
        b.display(0, 1);
      }
      b.event(this, player);
    }

    for (int c = collectables.size()-1; c >= 0; c--) {
      if (!player.sideColliding(collectables.get(c)).equals("none")) {
        collectables.get(c).event(player);
        collectables.remove(c);
      }
    }
    for (Collectable c : collectables) {
      c.display(0, 1);
    }

    for (int e = 0; e < enemies.size(); e++) {
      if ((player.x + 3 >= enemies.get(e).x - 7) && (player.x - 3 <= enemies.get(e).x + 7) && (player.y >= enemies.get(e).y - 16) && (player.y <= enemies.get(e).y - 8)) {
        enemies.remove(e);
        player.points += 50;
        e--;
        player.ySpeed = -12;
        player.friction = 1;
      } else {
        enemies.get(e).move();
        enemies.get(e).hitBoundary(this);
        enemies.get(e).display(0, 2);
      }
    }

    if (!cleared) {
      player.hitBoundary(this);
      player.move();
      player.display();
      //text("Coords: " + (int)player.x + ", " + (int)player.y, 20, 20);
      text("Points: " + player.points, 150, 20);
      text(" Coins x " + player.numCoins, 265, 20);
    }
    scroll();
  }

  public void scroll() {
    if ((player.xSpeed > 0) && (player.x >= width*0.75) && (background.get(background.size() - 1).x + background.get(background.size() - 1).w/2 >= width)) {
      for (Block b : map) {
        b.x -= sizeUnit*2 * player.accelerationX * 1.75;
      }
      for (Asset a : background) {
        a.x -= sizeUnit*2 * player.accelerationX * 1.75;
      }
      for (Collectable c : collectables) {
        c.x -= sizeUnit*2 * player.accelerationX * 1.75;
      }
      for (Enemy e : enemies) {
        e.x -= sizeUnit*2 * player.accelerationX * 1.75;
      }
    }
    if ((player.xSpeed < 0) && (player.x <= width*0.25) && (background.get(0).x - background.get(0).w/2 < 0)) {
      for (Block b : map) {
        b.x += sizeUnit*2 * -1 * player.accelerationX * 1.75;
      }
      for (Asset a : background) {
        a.x += sizeUnit*2 * -1 * player.accelerationX * 1.75;
      }
      for (Collectable c : collectables) {
        c.x += sizeUnit*2 * -1 * player.accelerationX * 1.75;
      }
      for (Enemy e : enemies) {
        e.x += sizeUnit*2 * -1 * player.accelerationX * 1.75;
      }
    }
  }
}
