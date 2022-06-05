public class Player extends Entity {
  int points;
  float accelerationX;
  float accelerationY;
  final float maxSpeed = 5;
  float friction;
  float gravity = 0.3;
  float jump;
  String direction;
  //Collectable carrying;
  boolean invincible;
  //Timer invinDuration;

  public Player(float x, float y) {
    //String name, float x, float y, ArrayList<PImage> imgs, float dx, float dy, int life
    super("Mario", x, y, new ArrayList<PImage>(), "Mario_idleRight", 0, 0, 2);
    points = 0;
    accelerationX = 0;
    accelerationY = 0;
    friction = 0.85;
    jump = -30;
    direction = "Right";
    invincible = false;
    //invinDuration = new Timer(??);

    //frames
    texture.addFrames("Mario_duckRight", 1);          //1
    texture.addFrames("Mario_jumpRight", 1);          //2
    texture.addFrames("Mario_walkRight", 3);          //3-5
    texture.addFrames("Mario_idleLeft", 1);           //6
    texture.addFrames("Mario_duckLeft", 1);           //7
    texture.addFrames("Mario_jumpLeft", 1);           //8
    texture.addFrames("Mario_walkLeft", 3);           //9-11
    texture.addFrames("smallMario_idleRight", 1);     //12
    texture.addFrames("smallMario_jumpRight", 1);     //13
    texture.addFrames("smallMario_walkRight", 3);     //14-16
    texture.addFrames("smallMario_idleLeft", 1);      //17
    texture.addFrames("smallMario_jumpLeft", 1);      //18
    texture.addFrames("smallMario_walkLeft", 3);      //19-21
    texture.addFrames("Mario_death", 1);              //22
  }

  public void hitBoundary(Level lvl) {
    super.hitBoundary(lvl);

    for (Block block : lvl.map) {
      sideColliding = sideColliding(block);
      if (sideColliding.equals("bottom") && ySpeed >= 0) {
        isOnFloor = true;
        ySpeed = 0;
      }
      if (sideColliding.equals("top") && ySpeed <= 0) {
        ySpeed = 0;
      }
      if (sideColliding.equals("right") && xSpeed >= 0) {
        xSpeed = 0;
      }
      if (sideColliding.equals("left") && xSpeed <= 0) {
        xSpeed = 0;
      }
      if (!sideColliding.equals("bottom") && ySpeed > 0) {
        isOnFloor = false;
      }
    }
  }

  public void move() {
    if (Left && !Right) {
      accelerationX = -0.05;
      friction = 1;
      direction = "Left";
    }
    if (Right && !Left) {
      accelerationX = 0.05;
      friction = 1;
      direction = "Right";
    }
    if (!Left && !Right || Left && Right) {
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
      friction = 0.85;
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

    if (ySpeed > 8 * maxSpeed) {
      ySpeed = maxSpeed;
    }
    if (ySpeed < -maxSpeed) {
      ySpeed = -maxSpeed;
    }

    if (y + ySpeed > height - 38) {
      System.out.println("triggered " + ySpeed);
      ySpeed = 0;
      xSpeed = 0;
    }

    x += xSpeed;
    y += ySpeed;
  }

  public void display() {
    switch(lives) {
    case 0:                                        //death
      super.display(22, 1, 1);
      break;
    case 1:                                        //small
      if (direction.equals("Right")) {
        if (!isOnFloor) {      
          super.display(13, 1, 1);                 //jump
        } else if (abs(xSpeed) > 0) {
          if (Shift) {
            super.display(14, 3, 3);               //run
          } else {
            super.display(14, 3, 5);               //walk
          }
        } else /*if (isOnFloor && !(Left || Right || Up))*/ {
          super.display(12, 1, 1);                 //idle
        }
      }
      if (direction.equals("Left")) {
        if (!isOnFloor) {
          super.display(18, 1, 1);                 //jump
        } else if (abs(xSpeed) > 0) {
          if (Shift) {
            super.display(19, 3, 3);               //run
          } else {
            super.display(19, 3, 5);               //walk
          }
        } else /*if (isOnFloor && !(Left || Right || Up))*/ {
          super.display(17, 1, 1);                 //idle
        }
      }
      break;
    case 2:                                        //big
      if (direction.equals("Right")) {
        if (!isOnFloor) {
          super.display(2, 1, 1);                  //jump
        } else if (abs(xSpeed) > 0) {
          if (Shift) {
            super.display(3, 3, 3);                //run
          } else {
            super.display(3, 3, 5);                //walk
          }
        } else if (Down) {
          super.display(1, 1, 1);                //duck
        } else {
          super.display(0, 1, 1);                //idle
        }
      }
      if (direction.equals("Left")) {
        if (!isOnFloor) {
          super.display(8, 1, 1);                  //jump
        } else if (abs(xSpeed) > 0) {
          if (Shift) {
            super.display(9, 3, 3);                //run
          } else {
            super.display(9, 3, 5);                //walk
          }
        } else if (Down) {
          super.display(7, 1, 1);                //duck
        } else {
          super.display(6, 1, 1);                //idle
        }
      }
      break;
    }
  }

  public void breaks(Block other) {
  }

  public void collect(Collectable other) {
  }
}
