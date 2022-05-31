public class Collectable extends Block {
  int value;
  
  Collectable(int vals, String thing, boolean breaks, String n, float xcor, float ycor, PImage img, float[] hits) {
    super(thing, breaks, n, xcor, ycor, img, hits);
    value = vals;
  }
  
  public void event(Player p) {
    p.collect(this);
    this.setDisplay(false);
  }
}
