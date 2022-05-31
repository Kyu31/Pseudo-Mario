public class Entity extends Asset {
  float xSpeed;
  float ySpeed;
  int lives;
  boolean isOnFloor;
  String sideColliding;

  public Entity(String name, float x, float y, String img, float dx, float dy, int life) {
    super(name, x, y, img);
    xSpeed = dx;
    ySpeed = dy;
    lives = life;
    isOnFloor = false;
    sideColliding = "none";
  }

  public void hitBoundary(Level lvl) {
    if (x < w/2) {
      x = w/2;
      xSpeed = 0;
    }
    if (x > lvl.end-w/2) {
      x = lvl.end-w/2;
      xSpeed = 0;
    }
    if (y > height-h/2) {
      isOnFloor = true;
      ySpeed = 0;
      y = height-h/2;
      lives = 0;
    }
    
    //for(Block block : lvl.map){
    //  sideColliding(block);
    //  if(sideColliding.equals("bottom") && ySpeed >= 0){
    //    isOnFloor = true;
    //    ySpeed = 0;
    //  }
    //  if(!sideColliding.equals("bottom") && ySpeed > 0){
    //    isOnFloor = false;
    //  }
    //}
  }

  public String sideColliding(Block other) {
    float dx = x - other.x;
    float dy = y - other.y;

    float maxXdist = w/2 + other.w/2;
    float maxYdist = h/2 + other.h/2;

    if (abs(dx) < maxXdist) {
      if (abs(dy) < maxYdist) {
        float overlapX = maxXdist - abs(dx);
        float overlapY = maxYdist - abs(dy);

        if (overlapX >= overlapY) {
          if (dy > 0) {
            y += overlapY;
            return "top";
          } else {
            y -= overlapY;
            return "bottom";
          }
        } else {
          if (dx > 0) {
            x += overlapX;
            return "left";
          } else {
            x -= overlapX;
            return "right";
          }
        }
      } else {
        return "none";
      }
    }
    return "none";
  }

  public void move() {
  }

  public void damage(Entity other) {
  }
}
