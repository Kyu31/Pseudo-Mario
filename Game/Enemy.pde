public class Enemy extends Entity {
  int value;
  double xSpeed;
  
  public Enemy(String n, float xcor, float ycor, float base, float length, String startImg, int points) {
    super(n, xcor, ycor, base, length, startImg, 0, 0, 1);
    value = points;
    xSpeed = 1.5;
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
}
