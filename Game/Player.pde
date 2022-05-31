public class Player extends Entity {
  int points;
  float accelerationX;
  float accelerationY;
  final float maxSpeed = 3;
  final float gravity = -0.2;
  //Collectable carrying;
  boolean invincible;
  //Timer invinDuration;

  public Player(float x, float y) {
    super("Mario", x, y, "Textures/Mario_idle.png", 0, 0, 2);
    w *= 0.8;
    h *= 0.8;
    points = 0;
    accelerationX = 0;
    accelerationY = 0;
    invincible = false;
    //invinDuration = new Timer(??);
  }

  public void move() {
    if (Left && !Right) {
      accelerationX = -0.2;
    }
    if (Right && !Left) {
      accelerationX = 0.2;
    }
    if (!Left && !Right) {
      accelerationX = 0;
    }

    if (Up && !Down) {
      accelerationY = -0.2;
    }
    if (Down && !Up) {
      accelerationY = 0.2;
    }
    if (!Up && !Down) {
      accelerationY = 0;
    }

    xSpeed += accelerationX;
    ySpeed += accelerationY;

    if (xSpeed > maxSpeed) {
      xSpeed = maxSpeed;
    }
    if (xSpeed < -maxSpeed) {
      xSpeed = -maxSpeed;
    }
    if (ySpeed > maxSpeed) {
      ySpeed = maxSpeed;
    }
    if (ySpeed < -maxSpeed) {
      ySpeed = -maxSpeed;
    }

    x += xSpeed;
    y += ySpeed;
  }

  public void display(){
    super.display();
  }

  public void breaks(Block other) {
  }

  public void collect(Block other) {
  }
}
