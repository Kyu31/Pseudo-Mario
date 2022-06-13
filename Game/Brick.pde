public class Brick extends Block {

  public Brick(Collectable contains, float xcor, float ycor) {
    super(contains, true, true, "brick", xcor, ycor, sizeUnit, sizeUnit, 1, "brick", 1);
  }
}
