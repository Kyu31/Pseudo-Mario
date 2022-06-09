public class Castle extends Block {

  public Castle(Collectable contains, float xcor, float ycor) {
    super(contains, true, true, "castle", xcor, ycor, 5*sizeUnit, 5*sizeUnit, "castle");
    isCastle = true;
  }
}
