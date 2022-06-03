public class Block extends Asset {
  String contains;
  boolean isBreakable;
  boolean isSafe;

  Block(String thing, boolean breaks, boolean safety, String n, float xcor, float ycor, ArrayList<PImage> imgs, String startImg) { 
    super(n, xcor, ycor, imgs, startImg);
    contains = thing;
    isBreakable = breaks;
    isSafe = safety;
  }

  public void event() {
  }
}
