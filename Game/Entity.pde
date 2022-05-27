public class Entity extends Asset {
  int[] hitbox;
  float xSpeed;
  float ySpeed;
  float acceleration;
  final float maxSpeed = 10;
  final float gravity = -0.2;
  int lives;

  public Entity(String name, float x, float y, String img, int[] hits, float dx, float dy, int life) {
    super(name, x, y, img);
    hitbox = hits;
    xSpeed = dx;
    ySpeed = dy;
    acceleration = 0;
    lives = life;
  }

  public boolean isOverlapping(/*Block other*/) {
    return false;
  }

  public void move(String direction, Boolean isRunning) {
    switch(direction) {
    case "Left":
      
    case "Right":

    case "Up":

    case "Down":
      break;
    }
  }

  public void damage(Entity other) {
  }
}
