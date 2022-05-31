public class Collectable extends Block {
  int value;
  
  Collectable(int vals, String thing, boolean breaks, String n, float xcor, float ycor, String img) {
    super(thing, breaks, n, xcor, ycor, img);
    value = vals;
  }
  
  //public void event(Player p) {
  //  p.collect(this);
   // this.shouldDisplay(false);
  //}
}
