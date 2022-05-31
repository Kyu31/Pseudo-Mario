public class Entity extends Asset {
  float xSpeed;
  float ySpeed;
  int lives;
  boolean isOnfloor;
  String sideFacing;

  public Entity(String name, float x, float y, String img, float dx, float dy, int life) {
    super(name, x, y, img);
    xSpeed = dx;
    ySpeed = dy;
    lives = life;
    isOnfloor = true;
    sideFacing = "Right";
  }
  
  public void hitBoundary(Level lvl) {
    if (x < w/2) {
      x = w/2;
      xSpeed = 0;
    }
    if (x > lvl.end-w/2) {
      x = lvl.end-w/2;
      xSpeed = 0;
    }
    if (y > height-h/2) {
      y = height-h/2;
      ySpeed = 0;
      lives = 0;
    }
  }

  public String sideColliding(/*Block other*/) {
    return "";
  }

  public void move() {
  }

  public void damage(Entity other) {
  }
}
