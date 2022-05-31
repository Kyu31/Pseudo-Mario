public class Player extends Entity {
  int points;
  float accelerationX;
  float accelerationY;
  final float maxSpeed = 5;
  float friction;
  final float gravity = -0.2;
  //Collectable carrying;
  boolean invincible;
  //Timer invinDuration;

  public Player(float x, float y) {
    super("Mario", x, y, "Textures/mario_idle.png", 0, 0, 2);
    w *= 0.8;
    h *= 0.8;
    points = 0;
    accelerationX = 0;
    accelerationY = 0;
    friction = 0.9;
    invincible = false;
    //invinDuration = new Timer(??);
  }

  public void move() {
    if (Left && !Right) {
      accelerationX = -0.2;
      friction = 1;
    }
    if (Right && !Left) {
      accelerationX = 0.2;
      friction = 1;
    }
    if (!Left && !Right) {
      accelerationX = 0;
    }

    if (Up && !Down) {
      accelerationY = -0.2;
      friction = 1;
    }
    if ((Down && !Up) && (y <= height/2)) {
      accelerationY = 0.2;
      friction = 1;
    }
    if (!Up && !Down) {
      accelerationY = 0;
    }
    
    if(!(Left || Right || Up || Down)){
      friction = 0.92;
    }

    xSpeed += accelerationX;
    ySpeed += accelerationY;
    
    xSpeed *= friction;
    ySpeed *= friction;

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
