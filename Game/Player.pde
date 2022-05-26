public class Player extends Entity {
  private int points;
  private float accelerationX;
  private float accelerationY;
  private float maxSpeed;
  private float gravity;
  //private Collectable carrying;
  private boolean invincible;
  //private Timer invinDuration;

  public Player(float x, float y, float dx, float dy) {
    super("Mario", x, y, "Textures/mario_idle.png", new int[]{10, 10}, dx, dy, 2);
    points = 0;
    accelerationX = 0;
    accelerationY = 0;
    maxSpeed = 10;
    gravity = 0;
    invincible = false;
    //invinDuration = new Timer(??);
  }
  
  public int getPoints () {
    return points;
  }

  public void setPoints (int earned) {
  }

  public boolean isOnfloor () {
    return false;
  }

  public boolean isNearEdge() {
    return false;
  }
  
  public void move(){
    
  }
  
  public void display(){
    
  }
  
  public void breaks(/*Block other*/){
    
  }
  
  public void collect() {
    
  }
}
