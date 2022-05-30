public class Entity extends Asset {
  private int[] hitbox;
  private float xSpeed;
  private float ySpeed;
  private int lives;

  public Entity(String name, float x, float y, String img, int[] hits, float dx, float dy, int life) {
    super(name, x, y, img);
    hitbox = hits;
    xSpeed = dx;
    ySpeed = dy;
    lives = life;
  }

  public int getLives () {
    return lives;
  }

  public void move() {
  }

  public void damage(Entity other) {
  }
}
