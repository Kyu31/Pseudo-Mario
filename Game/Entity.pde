public class Entity extends Asset {
  float xSpeed;
  float ySpeed;
  float gravity = 0.5;
  int lives;
  boolean isOnFloor;
  String sideColliding;
  boolean debug = true;

  public Entity(String name, float x, float y, float base, float length, String startImg, float dx, float dy, int life) {
    super(name, x, y, base, length, new ArrayList<PImage>(), startImg);
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
      lives = 0;
    }
  }

  public String sideColliding(Asset other) {
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
            if (debug) {
              fill(0); //white
              rect(other.x-other.w/2, other.y-other.h/2, other.w, other.h);
            }
            return "top";
          } else {
            y -= overlapY;
            if (debug) {
              fill(255); //black
              rect(other.x-other.w/2, other.y-other.h/2, other.w, other.h);
            }
            return "bottom";
          }
        } else {
          if (dx == 0) {
            x += overlapX;
            if (debug) {
              fill(100); //light gray
              rect(other.x-other.w/2, other.y-other.h/2, other.w, other.h);
            }
            return "left";
          } else if (dx < 0) {
            x -= overlapX;
            if (debug) {
              fill(200); //dark gray
              rect(other.x-other.w/2, other.y-other.h/2, other.w, other.h);
            }
            return "right";
          }
        }
      } else {
        return "none";
      }
    }
    if (lives == 0) {
      return "none";
    }
    return "none";
  }

  public void move() {
  }

  public void damage(Entity other) {
  }
}
