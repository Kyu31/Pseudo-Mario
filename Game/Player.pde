public class Player extends Entity{
  float acceleration;
  float maxSpeed;
  //Collectable carrying;
  boolean invincible;
  //Timer invinDuration;
  
  public Player(float x, float y, float dx, float dy) {
    super("Mario", x, y, "Textures/mario_idle.png", new int[]{10, 10}, dx, dy, 2);
    acceleration = 2;
    maxSpeed = 10;
    invincible = false;
    //invinDuration = new Timer(??);
  }
  
  
}
