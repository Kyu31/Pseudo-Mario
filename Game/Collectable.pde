public class Collectable extends Asset {
  int value;
  int originalY;

  Collectable(int vals, String n, float xcor, float ycor, float base, float length, String startImg) {
    super(n, xcor, ycor, base, length, new ArrayList<PImage>(), startImg);
    value = vals;
    originalY = (int)y;
  }
  
  public void display() {
  }
  
  /*public void move() {
    int ySpeed = 1;
    if (y <= originalY) {
      ySpeed = -ySpeed;
    } else if (y >= originalY - 24) {
      ySpeed = -ySpeed;
    }

    y += ySpeed;
  }*/

  public void event(Level lvl, Player player) {
  }
}
