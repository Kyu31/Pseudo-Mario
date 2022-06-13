public class Block extends Asset {
  Collectable contains;
  boolean isBreakable;
  boolean isSafe;

  Block(Collectable thing, boolean breaks, boolean safety, String n, float xcor, float ycor, float base, float length, int sets, String imagePrefix, int frames) { 
    super(n, xcor, ycor, base, length, sets, imagePrefix, frames);
    contains = thing;
    isBreakable = breaks;
    isSafe = safety;
  }

  public void event(Level lvl, Player player) {
  }
}
