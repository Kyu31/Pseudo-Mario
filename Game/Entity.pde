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

  public String sideColliding(/*Block other*/) {
    return "";
  }

  public void move() {
  }

  public void damage(Entity other) {
  }
}
