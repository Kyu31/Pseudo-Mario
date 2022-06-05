public class Flag extends Block {
  Flag(boolean breaks, String n, float xcor, float ycor, ArrayList<PImage> imgs, String startImg) {
    super("nothing", breaks, true, n, xcor, ycor, imgs, startImg);
  }

  public void event(Player p) {
    finished = true;
  }
}
