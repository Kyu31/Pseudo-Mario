public class Flag extends Block {
  Flag(boolean breaks, String n, float xcor, float ycor) {
    super(null, breaks, true, n, xcor, ycor, 1/8*sizeUnit, 10*sizeUnit, 1, "flag", 1);
  }

  public void event(Level lvl, Player player) {
    if (!player.sideColliding(this).equals("none")) {
      lvl.cleared = true;
    }
  }
}
