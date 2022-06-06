public class Block extends Asset {
  Collectable contains;
  boolean isBreakable;
  boolean isSafe;

  Block(Collectable thing, boolean breaks, boolean safety, String n, float xcor, float ycor, String startImg) { 
    super(n, xcor, ycor, new ArrayList<PImage>(), startImg);
    contains = thing;
    isBreakable = breaks;
    isSafe = safety;
  }

  public void event(Level lvl) {
  }
}
