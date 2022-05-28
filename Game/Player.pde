public class Player extends Entity {
  int points;
  float acceleration;
  final float maxSpeed = 5;
  final float gravity = -0.2;
  //Collectable carrying;
  boolean invincible;
  //Timer invinDuration;

  public Player(float x, float y) {
    super("Mario", x, y, "Textures/Mario_idle.png", new int[]{10, 10}, 1.5, 2, 2);
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
    if (movement[Left]) {
      x -= xSpeed;
    } else if (movement[Right]) {
      x += xSpeed;
    } else if (movement[Down]) {
    }
  }

  public void display() {
    String prefix = "";
    if (lives == 1) {
      prefix = "small";
    }

    if (lives == 0) {
      texture = loadImage("Textures/Mario_death.png");
    } else if (movement[Left] || movement[Right]) {
      texture = loadImage("Textures/" + prefix + "Mario_walk.gif");
      if (movement[Up]) {
        texture = loadImage("Textures/" + prefix + "Mario_jump.png");
      }
    } else if (movement[Down] && lives > 1) {
      texture = loadImage("Textures/" + prefix + "Mario_duck.png");
    } else if (!(movement[Left] || movement[Right] || movement[Up] || movement[Down])) {
      texture = loadImage("Textures/" + prefix + "Mario_idle.png");
    }

    int scaleFactor = 1;
    pushMatrix();
    if (movement[isFacingLeft]) {
      scaleFactor = -1;
    }
    if (movement[Down] && lives > 1) {
      translate(0, 5);
    }
    if ((movement[Left] || movement[Right] || movement[Up]) && lives > 1) {
      translate(0, -5);
    }
    scale(scaleFactor, 1);
    image(texture, x * scaleFactor, y);
    popMatrix();
  }

  public void breaks(/*Block other*/) {
  }

  public void collect() {
  }
}
