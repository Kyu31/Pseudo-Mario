public class Block extends Asset {
  String contains;
  boolean isBreakable;

  Block(String thing, boolean breaks, String n, float xcor, float ycor, String imgPrefix, int frames) { 
    super(n, xcor, ycor, imgPrefix, frames);
    contains = thing;
    isBreakable = breaks;
  }

  public void event() {
  }
}
