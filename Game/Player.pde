public class Player extends Entity {
  int points;
  float accelerationX;
  float accelerationY;
  final float maxSpeed = 5;
  float friction;
  float jumpForce;
  String direction;
  //Collectable carrying;
  boolean invincible;
  //Timer invinDuration;
  int numCoins;
  final int small = 8;
  final int death = 14;
  final int idle = 0;
  final int jump = 1;
  final int walk = 2;
  final int duck = 3;

  public Player() {
    super("Mario", 40, 300, sizeUnit, 2*sizeUnit, 15, "Mario_idleRight", 1, 0, 0, 1);
    points = 0;
    accelerationX = 0;
    accelerationY = 0;
    friction = 0.85;
    jumpForce = -9;
    direction = "Right";
    invincible = false;
    //invinDuration = new Timer(??);
    numCoins = 0;

    //frames
    texture[1] = new Animation("Mario_jumpRight", 1, sizeUnit, 2*sizeUnit);
    texture[2] = new Animation("Mario_walkRight", 3, sizeUnit, 2*sizeUnit);
    texture[3] = new Animation("Mario_duckRight", 1, sizeUnit, 2*sizeUnit);
    texture[4] = new Animation("Mario_idleLeft", 1, sizeUnit, 2*sizeUnit);
    texture[5] = new Animation("Mario_jumpLeft", 1, sizeUnit, 2*sizeUnit);
    texture[6] = new Animation("Mario_walkLeft", 3, sizeUnit, 2*sizeUnit);
    texture[7] = new Animation("Mario_duckLeft", 1, sizeUnit, 2*sizeUnit);
    texture[8] = new Animation("smallMario_idleRight", 1, sizeUnit, sizeUnit);
    texture[9] = new Animation("smallMario_jumpRight", 1, sizeUnit, sizeUnit);
    texture[10] = new Animation("smallMario_walkRight", 3, sizeUnit, sizeUnit);
    texture[11] = new Animation("smallMario_idleLeft", 1, sizeUnit, sizeUnit);
    texture[12] = new Animation("smallMario_jumpLeft", 1, sizeUnit, sizeUnit);
    texture[13] = new Animation("smallMario_walkLeft", 3, sizeUnit, sizeUnit);
    texture[14] = new Animation("Mario_death", 1, sizeUnit, sizeUnit);
  }

  public void hitBoundary(Level lvl) {
    super.hitBoundary(lvl);

    if (lives > 0) {
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
      ySpeed = jumpForce;
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
    int offset = 0;
    switch(lives) {
    case 0:                                              //death
      super.display(death);
      break;
    case 1:                                              //small
      offset += small;
      if (direction.equals("Right")) {
        if (!isOnFloor) {      
          super.display(offset+jump);                    //jump
        } else if (abs(accelerationX) > 0) {
          if (Shift) {
            super.display(offset+walk, 5);               //run
          } else {
            super.display(offset+walk, 7);               //walk
          }
        } else {
          super.display(offset+idle);                    //idle
        }
      }
      if (direction.equals("Left")) {
        offset += 3;
        if (!isOnFloor) {
          super.display(offset+jump);                    //jump
        } else if (abs(accelerationX) > 0) {
          if (Shift) {
            super.display(offset+walk, 5);               //run
          } else {
            super.display(offset+walk, 7);               //walk
          }
        } else {
          super.display(offset+idle);                    //idle
        }
      }
      break;
    case 2:                                              //big
      if (direction.equals("Right")) {
        if (!isOnFloor) {
          super.display(offset+jump);                    //jump
        } /*else if (Down) {
         super.display(offset+duck);                     //duck
         } */
        else if (abs(accelerationX) > 0) {
          if (Shift) {
            super.display(offset+walk, 3);               //run
          } else {
            super.display(offset+walk, 5);               //walk
          }
        } else {
          super.display(offset+idle);                    //idle
        }
      }
      if (direction.equals("Left")) {
        offset += 4;
        if (!isOnFloor) {
          super.display(offset+jump);                    //jump
        } /*else if (Down) {
         super.display(offset+duck);                     //duck
         } */
        else if (abs(accelerationX) > 0) {
          if (Shift) {
            super.display(offset+walk, 3);               //run
          } else {
            super.display(offset+walk, 5);               //walk
          }
        } else {
          super.display(offset+idle);                    //idle
        }
      }
      break;
    }
  }

  public boolean damage(Enemy other) {
    if (this.sideColliding(other).equals("bottom")) {
      other.lives--;
      points += other.value;
      ySpeed = jumpForce*0.75;
      isOnFloor = false;
      friction = 1;
      return true;
    } else {
      return false;
    }
  }
}
