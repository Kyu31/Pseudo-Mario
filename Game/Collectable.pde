public class Collectable extends Block {
  int value;

  Collectable(int vals, boolean breaks, String n, float xcor, float ycor, ArrayList<PImage> imgs, String startImg) {
    super("nothing", breaks, true, n, xcor, ycor, imgs, startImg);
    value = vals;
  }

  public void event(Player p) {
    p.collect(this);
    //this.setDisplay(false);
  }
}
