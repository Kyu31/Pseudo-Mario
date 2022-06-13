public class Player extends Entity {
  int points;
  float accelerationX;
  float accelerationY;
  final float maxSpeed = 5;
  float friction;
  float jump;
  String direction;
  //Collectable carrying;
  boolean invincible;
  //Timer invinDuration;
  int numCoins;

  public Player() {
    super("Mario", 40, 300, sizeUnit, 2*sizeUnit, "Mario_idleRight", 0, 0, 2);
    points = 0;
    accelerationX = 0;
    accelerationY = 0;
    friction = 0.85;
    jump = -9;
    direction = "Right";
    invincible = false;
    //invinDuration = new Timer(??);
    numCoins = 0;

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

  public void move(Level lvl) {
    hitBoundary(lvl);

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
    if (!Left && !Right) {
      accelerationX = 0;
    }
    if (Up && !Down && isOnFloor) {
      ySpeed = jump;
      isOnFloor = false;
      friction = 1;
    }
    if (Down && !Up) {
      accelerationX = 0;
      accelerationY = 0.2;
      friction = 0.85;
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
      } else if (xSpeed < - 1 * maxSpeed) {
        xSpeed = -1 * maxSpeed;
      }
    } else {
      if (xSpeed > maxSpeed/2) {
        xSpeed = maxSpeed/2;
      } else if (xSpeed < -1 * maxSpeed/2) {
        xSpeed = -1 * maxSpeed/2;
      }
    }

    if (ySpeed > 2*maxSpeed) {
      ySpeed = 2*maxSpeed;
    }
    if (ySpeed < 3*-maxSpeed) {
      ySpeed = 3*-maxSpeed;
    }

    if (!((x + xSpeed >= 800) || (x + xSpeed <= 0))) {
      x += xSpeed;
    }
    y += ySpeed;
  } 

  public void display() {
    switch(lives) {
    case 0:                                        //death
      super.display(22, 1);
      break;
    case 1:                                        //small
      w = sizeUnit;
      h = sizeUnit;
      if (direction.equals("Right")) {
        if (!isOnFloor) {      
          super.display(13, 1);                 //jump
        } else if (abs(accelerationX) > 0) {
          if (Shift) {
            super.display(14, 3, 3);               //run
          } else {
            super.display(14, 3, 5);               //walk
          }
        } else {
          super.display(12, 1);                 //idle
        }
      }
      if (direction.equals("Left")) {
        if (!isOnFloor) {
          super.display(18, 1);                 //jump
        } else if (abs(accelerationX) > 0) {
          if (Shift) {
            super.display(19, 3, 3);               //run
          } else {
            super.display(19, 3, 5);               //walk
          }
        } else {
          super.display(17, 1);                 //idle
        }
      }
      break;
    case 2:                                        //big
      //w = sizeUnit;
      //h = 2*sizeUnit;
      if (direction.equals("Right")) {
        if (!isOnFloor) {
          super.display(2, 1, 1);                  //jump
        } else if (Down) {
          super.display(1, 1);                //duck
        } else if (abs(accelerationX) > 0) {
          if (Shift) {
            super.display(3, 3, 3);                //run
          } else {
            super.display(3, 3, 5);                //walk
          }
        } else {
          super.display(0, 1);                //idle
        }
      }
      if (direction.equals("Left")) {
        if (!isOnFloor) {
          super.display(8, 1, 1);                  //jump
        } else if (Down) {
          //h = 11/16*sizeUnit;
          super.display(7, 1);                //duck
        } else if (abs(accelerationX) > 0) {
          if (Shift) {
            super.display(9, 3, 3);                //run
          } else {
            super.display(9, 3, 5);                //walk
          }
        } else {
          super.display(6, 1);                //idle
        }
      }
      break;
    }
  }

  public boolean isNearEdge(Level lvl) {
    return false;
  }

  public boolean damage(Enemy other) {
    if (this.sideColliding(other).equals("bottom")) {
      other.lives--;
      points += other.value;
      ySpeed = jump/2;
      isOnFloor = false;
      friction = 1;
      return true;
    } else {
      return false;
    }
  }
}
