public class Player extends Entity {
  int points;
  //Collectable carrying;
  boolean invincible;
  //Timer invinDuration;

  public Player(float x, float y) {
    super("Mario", x, y, "Textures/mario_idle.png", new int[]{10, 10}, 0, 0, 2);
    points = 0;
    invincible = false;
    //invinDuration = new Timer(??);
  }

  public boolean isOnfloor () {
    return false;
  }

  public boolean isNearEdge() {
    return false;
  }

  public void display() {
  }

  public void breaks(/*Block other*/) {
  }

  public void collect() {
  }
}
