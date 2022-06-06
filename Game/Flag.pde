public class Flag extends Block {
  Flag(boolean breaks, String n, float xcor, float ycor, String startImg) {
    super(null, breaks, true, n, xcor, ycor, startImg);
  }

  public void event(Level lvl) {
    if (!lvl.player.sideColliding(this).equals("none")) {
      lvl.cleared = true;
    }
  }
}
