public class Entity extends Asset {
  int[] hitbox;
  float xSpeed;
  float ySpeed;
  int lives;

  public Entity(String name, float x, float y, String img, int[] hits, float dx, float dy, int life) {
    super(name, x, y, img);
    hitbox = hits;
    xSpeed = dx;
    ySpeed = dy;
    lives = life;
  }

  public boolean isOverlapping(/*Block other*/) {
    return false;
  }

  public void move() {
  }

  public void damage(Entity other) {
  }
}
