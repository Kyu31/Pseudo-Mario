public class Enemy extends Entity {
  int value;

  public Enemy(String n, float xcor, float ycor, float base, float length, int sets, String imagePrefix, int frames, int points) {
    super(n, xcor, ycor, base, length, sets, imagePrefix, frames, 0, 0, 1);
    value = points;
    xSpeed = 1;
  }

  /*public void move() {
   int original = (int)x;
   System.out.println("x: " + x + " test: " + (original - 3*16));
   if (x >= original - 3*16) {
   System.out.println("BRUHHHH");
   x -= 1;
   } else if (x <= original + 5*16) {
   System.out.println("AGGGGHHHH");
   x += 1;
   }
   System.out.println(x);
   }*/

  public boolean damage(Player other) {
    if (!(this.sideColliding(other).equals("none") || other.sideColliding(this).equals("bottom"))) {
      other.lives--;
      other.invincible = true;
      return true;
    } else {
      return false;
    }
  }
}
