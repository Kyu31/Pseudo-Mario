public class Entity extends Asset {
  private float xSpeed;
  private float ySpeed;
  private int lives;

  public Entity(String name, float x, float y, PImage texture, float[] hitbox, float dx, float dy, int life) {
    super(name, x, y, texture, hitbox);
    xSpeed = dx;
    ySpeed = dy;
    lives = life;
  }

  public int getLives () {
    return lives;
  }

  public void move() {
  }

  public void death(Entity other) {
  }
}
