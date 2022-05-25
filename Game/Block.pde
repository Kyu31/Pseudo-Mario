public class Block extends Asset {
  String contains;
  boolean isBreakable;
  
  Block(String thing, boolean breaks, String n, float xcor, float ycor, PImage img, float[] hits) {
    super(n, xcor, ycor, img, hits);
    contains = thing;
    isBreakable = breaks;
  }
  
  public void event() {
    
  }
}
