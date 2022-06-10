public class Flag extends Block {
  Flag(boolean breaks, String n, float xcor, float ycor, String startImg) {
    super(null, breaks, true, n, xcor, ycor, 1/8*sizeUnit, 10*sizeUnit, startImg);
  }

  public void (Level lvl, Player player) {
    if (!player.sideColliding(this).equals("none")) {
      lvl.cleared = true;
    }
  }
}
