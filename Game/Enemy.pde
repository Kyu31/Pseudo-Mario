public class Enemy extends Entity {
  int value;
  
  public Enemy(String n, float xcor, float ycor, float base, float length, String startImg, int points) {
    super(n, xcor, ycor, base, length, startImg, 0, 0, 1);
    value = points;
  }
  
}
