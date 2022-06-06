public class Enemy extends Entity {
  int value;
  
  public Enemy(String n, float xcor, float ycor, String startImg, int points) {
    super(n, xcor, ycor, startImg, 0, 0, 1);
    value = points;
  }
  
}
