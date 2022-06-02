public class Collectable extends Block {
  int value;

  Collectable(int vals, String thing, boolean breaks, String n, float xcor, float ycor, String imgPrefix, int frames) {
    super(thing, breaks, n, xcor, ycor, imgPrefix, frames);
    value = vals;
  }

  public void event(Player p) {
    p.collect(this);
    //this.setDisplay(false);
  }
}
