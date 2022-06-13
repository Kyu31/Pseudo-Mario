public class Collectable extends Asset {
  int value;

  Collectable(int vals, String n, float xcor, float ycor, float base, float length, int sets, String imagePrefix, int frames) {
    super(n, xcor, ycor, base, length, sets, imagePrefix, frames);
    value = vals;
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

  public boolean event(Player player) {
    player.points += value;
    return true;
  }
}
