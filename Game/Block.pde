public class Block extends Asset {
  String contains;
  boolean isBreakable;
  
  Block(String thing, boolean breaks, String n, float xcor, float ycor, String img) { 
    super(n, xcor, ycor, img);
    contains = thing;
    isBreakable = breaks;
  }
  
  public void event() {
    
  }
}
