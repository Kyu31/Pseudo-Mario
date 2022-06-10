public class Block extends Asset {
  Collectable contains;
  boolean isBreakable;
  boolean isSafe;

  Block(Collectable thing, boolean breaks, boolean safety, String n, float xcor, float ycor, float base, float length, String startImg) { 
    super(n, xcor, ycor, base, length, new ArrayList<PImage>(), startImg);
    contains = thing;
    isBreakable = breaks;
    isSafe = safety;
  }

  public void event(Level lvl, Player player) {
  }
}
