public class Player extends Entity {
  int points;
  float accelerationX;
  float accelerationY;
  final float maxSpeed = 5;
  float friction;
  float gravity;
  float jump;
  //Collectable carrying;
  boolean invincible;
  //Timer invinDuration;

  public Player(float x, float y) {
    super("Mario", x, y, "Textures/Mario_idle.png", 0, 0, 2);
    points = 0;
    accelerationX = 0;
    accelerationY = 0;
    friction = 0.9;
    gravity = 0.3;
    jump = -20;
    invincible = false;
    //invinDuration = new Timer(??);
  }

  public void move() {
    if (Left && !Right) {
      accelerationX = -0.05;
      friction = 1;
    }
    if (Right && !Left) {
      accelerationX = 0.05;
      friction = 1;
    }
    if (!Left && !Right) {
      accelerationX = 0;
    }
    if (Up && !Down && isOnFloor) {
      ySpeed = jump;
      isOnFloor = false;
      friction = 1;
    }
    if (Down && !Up) {
      accelerationY = 0.2;
      friction = 1;
    }
    if (!Up && !Down) {
      accelerationY = 0;
    }

    if (!(Left || Right || Up || Down)) {
      friction = 0.9;
      gravity = 0.3;
    }

    xSpeed += accelerationX;
    ySpeed += accelerationY;

    xSpeed *= friction;
    ySpeed *= friction;

    ySpeed += gravity;

    if (Shift) {
      if (xSpeed > maxSpeed) {
        xSpeed = maxSpeed;
      }
      if (xSpeed < -maxSpeed) {
        xSpeed = -maxSpeed;
      }
    } else {
      if (xSpeed > maxSpeed/2) {
        xSpeed = maxSpeed/2;
      }
      if (xSpeed < -maxSpeed/2) {
        xSpeed = -maxSpeed/2;
      }
    }

    if (ySpeed > 5 * maxSpeed) {
      ySpeed = maxSpeed;
    }
    if (ySpeed < -maxSpeed) {
      ySpeed = -maxSpeed;
    }

    x += xSpeed;
    y += ySpeed;
  }

  public void display() {
    if(Up){
     texture = loadImage("Textures/Mario_jump.png"); 
    }
    super.display();
  }

  public void breaks(Block other) {
  }

  public void collect(Block other) {
  }
}
