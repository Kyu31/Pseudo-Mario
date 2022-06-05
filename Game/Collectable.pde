public class Collectable extends Asset {
  int value;
  
  Collectable(int vals, String n, float xcor, float ycor, ArrayList<PImage> imgs, String startImg) {
    super(n, xcor, ycor, imgs, startImg);
    value = vals;
  }

  public void event(Level lvl) {
    lvl.player.collect(this);
    //this.setDisplay(false);
  }
}
