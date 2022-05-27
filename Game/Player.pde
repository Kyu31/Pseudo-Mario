public class Player extends Entity {
  int points;
  float acceleration;
  final float maxSpeed = 5;
  final float gravity = -0.2;
  //Collectable carrying;
  boolean invincible;
  //Timer invinDuration;

  public Player(float x, float y) {
    super("Mario", x, y, "Textures/mario_idle.png", new int[]{10, 10}, 1.5, 2, 2);
    points = 0;
    acceleration = 0;
    invincible = false;
    //invinDuration = new Timer(??);
  }

  public boolean isOnfloor () {
    return false;
  }

  public boolean isNearEdge() {
    return false;
  }

  public void move() {
    if(movement[0]){
      x -= xSpeed;
    }
    else if(movement[1]){
      x += xSpeed;
    }
  }
  
  public void display() {
   if(movement[0]){
      texture = loadImage("Textures/mario_walk.gif");
      pushMatrix();
      scale(-1, 1);
      image(texture, -x, y);
      popMatrix();
    }
    else if(movement[1]){
      texture = loadImage("Textures/mario_walk.gif");
      image(texture, x, y);
    }
    if(!movement[0] && !movement[1] && !movement[2] && !movement[3]){
      texture = loadImage("Textures/mario_idle.png");
      image(texture, x, y);
    }
  }

  public void breaks(/*Block other*/) {
  }

  public void collect() {
  }
}
