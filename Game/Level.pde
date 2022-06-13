public class Level {
  ArrayList<Block> map;
  ArrayList<Collectable> collectables;
  ArrayList<Asset> background;
  ArrayList<Enemy> enemies;
  float[] start;
  float end; 
  boolean cleared;
  String filename;

  public Level(ArrayList<Block> lvlmap, ArrayList<Collectable> collect, ArrayList<Asset> scenery, ArrayList<Enemy> enemies, float[] startCoords, float endBoundary) {
    map = lvlmap;
    collectables = collect;
    background = scenery;
    this.enemies = enemies;
    start = startCoords;
    end = endBoundary;
    cleared = false;
  }

  public Level(String f) {
    filename = f;
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
          collectables.add(new Coin(x, y - 3));
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

  public void display(Player player, Screen menu, Timer time) {
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
      if ((player.x + 3 >= collectables.get(c).x - 7) && (player.x - 3 <= collectables.get(c).x + 7) && (player.y >= collectables.get(c).y - 6) && (player.y <= collectables.get(c).y + 14)) {
        collectables.get(c).event(player);
        player.points += collectables.get(c).value;
        collectables.remove(c);
      }
    }
    for (Collectable c : collectables) {
      if (c.x+c.w/2 >= 0 && c.x-c.w/2 <= width) {
        c.display(0, 1);
      }
    }

    for (int e = enemies.size()-1; e >= 0; e--) {
      if ((player.x + 3 >= enemies.get(e).x - 7) && (player.x - 3 <= enemies.get(e).x + 7) && (player.y >= enemies.get(e).y - 16) && (player.y <= enemies.get(e).y - 8)) {
        enemies.remove(e);
        player.points += 50;
        e--;
        player.ySpeed = -12;
        player.friction = 1;
      } else if ((player.x + 3 >= enemies.get(e).x - 7) && (player.x - 3 <= enemies.get(e).x + 7) && (player.y + 16 >= enemies.get(e).y + 8) && (player.y - 16 <= enemies.get(e).y - 8)) {
        if (player.lives != 0) {
          player.y = 250;
          player.lives--;
        } else {
          menu.current = 7;
        }
      } else {
        enemies.get(e).move(this);
        enemies.get(e).hitBoundary(this);
        enemies.get(e).display(0, 2);
      }
    }

    if (!cleared) {
      player.hitBoundary(this);
      player.move(this);
      player.display();
      //text("Coords: " + (int)player.x + ", " + (int)player.y, 20, 20);
      text("Points: " + player.points, 150, 20);
      text(" Coins x " + player.numCoins, 265, 20);
      text(" Time : " + (startTimer.countdown / 60), 365, 20);
    }
    
    if (player.y >= 400) {
      menu.current = 7;
    }
    scroll();
  }

  public void scroll() {
    if ((player.accelerationX > 0) && (player.x >= 300) && (background.get(background.size() - 1).x + 32 >= 800)){
      for (Block b : map) {
        b.x -= (32) * player.accelerationX * 1.75;
      }
      for (Asset a : background) {
        a.x -= (32) * player.accelerationX * 1.75;
      }
      for (Collectable c : collectables) {
        c.x -= (32) * player.accelerationX * 1.75;
      }
      for (Enemy e : enemies) {
        e.x -= (32) * player.accelerationX * 1.75;
      }
    }
    if ((player.accelerationX < 0) && (player.x <= 400) && (background.get(0).x - 32 <= -1)) {
      for (Block b : map) {
        b.x += (32) * -1 * player.accelerationX * 1.75;
      }
      for (Asset a : background) {
        a.x += (32) * -1 * player.accelerationX * 1.75;
      }
      for (Collectable c : collectables) {
        c.x += (32) * -1 * player.accelerationX * 1.75;
      }
      for (Enemy e : enemies) {
        e.x += (32) * -1 * player.accelerationX * 1.75;
      }
    }
  }
}
